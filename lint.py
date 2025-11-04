#!/usr/bin/env python3

"""
# lint.py

Lint all Conway-Markdown (CMD) source files, with some automatic correction and indexing.
"""

import os
import re
import sys
from typing import Optional


class LintException(Exception):
    message: str

    def __init__(self, message: str):
        self.message = message


class CmdSource:
    file_name: str
    content: str
    entry_page: 'EntryPage'

    def __init__(self, file_name: str):
        with open(file_name, 'r', encoding='utf-8') as cmd_file:
            content = cmd_file.read()

        try:
            CmdSource.lint_typography_quote(content)
            CmdSource.lint_cjk_compatibility_ideograph(content)
            CmdSource.lint_cjk_non_bmp_composition(content)
            CmdSource.lint_cjk_variation_selector(content)
            CmdSource.lint_williams_entering_tone(content)
            CmdSource.lint_williams_left_tone(content)
            CmdSource.lint_williams_right_tone(content)
            CmdSource.lint_williams_initial_aspirate(content)
            CmdSource.lint_williams_tone_45_aspirate(content)
            CmdSource.lint_williams_tone_6_aspirate(content)
            CmdSource.lint_williams_diphthong(content)
            CmdSource.lint_williams_nasal_apostrophe(content)
            CmdSource.lint_williams_apical_apostrophe(content)
            CmdSource.lint_jyutping_entering_tone(content)
            CmdSource.lint_jyutping_yod(content)
            CmdSource.lint_romanisation_tone_consistency(content)
        except LintException as lint_exception:
            print(f'lint error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        self.file_name = file_name
        self.content = content
        self.entry_page = EntryPage(file_name, content)

    @staticmethod
    def lint_typography_quote(content: str):
        if context_match := re.search(
            pattern=r'\S* (?<! \^ ) (?P<quote>[‘’“”]) \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            quote = context_match.group('quote')
            raise LintException(f'non-straight quote `{quote}` present in `{context}`')

    @staticmethod
    def lint_cjk_compatibility_ideograph(content: str):
        if context_match := re.search(
            pattern=r'\S*? (?P<character> [\uF900-\uFAFF\U0002F800-\U0002FA1F] ) \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(f'compatibility ideograph `{character}` present in `{context}`')

    @staticmethod
    def lint_cjk_non_bmp_composition(content: str):
        non_exempt_content = re.sub(pattern=r'#cantonese-[⺀-〿㇀-㇣㐀-鿼豈-龎！-｠𠀀-𱍊]+', repl='', string=content)
        whitelist = '𠂉𠂢𠆢𠔿𠦄𠫓𡈼𤣩𥫗𦈢𦣝𦣞𦥑𧰼𧶠𧾷𩙿'
        if context_match := re.search(
            pattern=fr'\S* (?! [{whitelist}] ) (?P<character> [\U00020000-\U0003134A] ) (?! [=@^] ) \S*',
            string=non_exempt_content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(
                f'missing composition for non-BMP ideograph `{character}` in `{context}` '
                f'(suppress with at (in run) or caret (alone) after character if legitimate)'
            )

    @staticmethod
    def lint_cjk_variation_selector(content: str):
        if context_match := re.search(
            pattern=r'\S* (?P<character>.) [\uFE00-\uFE0F] \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(f'variation selector present on `{character}` in `{context}`')

    @staticmethod
    def lint_williams_entering_tone(content: str):
        if run_match := re.search(
            pattern=r'\S+ [ptk] \([1-6]\)',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams entering tone in `{run}`')

    @staticmethod
    def lint_williams_left_tone(content: str):
        if run_match := re.search(
            pattern=r'\S* (?<! _ ) \([1245]\) [_ ]',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams left-tone position in `{run}`')

    @staticmethod
    def lint_williams_right_tone(content: str):
        if run_match := re.search(
            pattern=r'[_ ] \([36789]\) (?! _ ) \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams right-tone position in `{run}`')

    @staticmethod
    def lint_williams_initial_aspirate(content: str):
        if run_match := re.search(
            pattern=r"\S* (?<! .p | .t | .k | kw | ts | ch | `` | .\^ ) \('\) \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams aspirate in `{run}` (suppress with caret before aspirate if legitimate)')

    @staticmethod
    def lint_williams_tone_45_aspirate(content: str):
        if run_match := re.search(
            pattern=r"\([45]\) (?: p | t(?!s) | k(?!w) | kw | ts | ch) (?! \('\) ) \S+",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(
                f'unaspirated Williams tone 4 or 5 in `{run}` '
                f'(suppress with caret before initial if legitimate)'
            )

    @staticmethod
    def lint_williams_tone_6_aspirate(content: str):
        if run_match := re.search(
            pattern=r"(?: p | t | k | kw | ts | ch) \('\) (?! \^ ) \S+ \(6\)",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(
                f'aspirated Williams tone 6 in `{run}` '
                f'(suppress with caret after aspirate if legitimate)'
            )

    @staticmethod
    def lint_williams_diphthong(content: str):
        if context_match := re.search(
            pattern=r"\S* (?P<diphthong> \(i/\)u | u\(i/\) ) \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            context = context_match.group()
            diphthong = context_match.group('diphthong')
            raise LintException(f'bad Williams diphthong `{diphthong}` present in `{context}`')

    @staticmethod
    def lint_williams_nasal_apostrophe(content: str):
        if run_match := re.search(
            pattern=r"(?: m | ng ) ' ",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(
                f'wrong-side Williams nasal apostrophe in `{run}` '
                f'(suppress with caret before apostrophe if legitimate)'
            )

    @staticmethod
    def lint_williams_apical_apostrophe(content: str):
        if run_match := re.search(
            pattern=r"\S* sz [^'`^] \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'missing Williams apical apostrophe in `{run}`')

    @staticmethod
    def lint_jyutping_entering_tone(content: str):
        if run_match := re.search(
            pattern=r'\b (?<! < ) [a-z]+ [789] \b',
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'unaliased entering tone number in Jyutping `{run}`')

    @staticmethod
    def lint_jyutping_yod(content: str):
        if run_match := re.search(
            pattern=r'\b y [a-z]* [1-6] \b',
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'misspelt yod in Jyutping `{run}`')

    @staticmethod
    def lint_romanisation_tone_consistency(content: str):
        for dual_romanisation_match in re.finditer(
            pattern=r'_ (?P<williams> \S [^_\n]*? \S ) _ \s+ (?: \[\[ | \( ) (?P<jyutping> .+? ) (?: \]\] | \) )',
            string=content,
            flags=re.VERBOSE,
        ):
            williams = dual_romanisation_match.group('williams')
            jyutping = dual_romanisation_match.group('jyutping')

            williams_tone_runs = re.findall(pattern=r'\([1-9]\)', string=williams)
            jyutping_tone_runs = re.findall(pattern='[1-6](?:-[1-6])?', string=jyutping)

            if not williams_tone_runs or not jyutping_tone_runs:
                continue

            if len(williams_tone_runs) == len(jyutping_tone_runs):
                if CmdSource.are_tones_consistent(williams_tone_runs, jyutping_tone_runs):
                    continue

                raise LintException(
                    f'inconsistent Williams tones {williams_tone_runs !r} vs Jyutping tones {jyutping_tone_runs} '
                    f'in `{williams}` vs `{jyutping}`'
                )

            reduced_williams = re.sub(pattern='~~.+?~~', repl='', string=williams)
            reduced_williams_tone_runs = re.findall(pattern=r'\([1-9]\)', string=reduced_williams)

            if len(reduced_williams_tone_runs) == len(jyutping_tone_runs):
                if CmdSource.are_tones_consistent(reduced_williams_tone_runs, jyutping_tone_runs):
                    continue

            raise LintException(
                f'inconsistent Williams tones {reduced_williams_tone_runs !r} vs Jyutping tones {jyutping_tone_runs} '
                f'in `{williams}` vs `{jyutping}`'
            )

    @staticmethod
    def are_tones_consistent(williams_tone_runs: list[str], jyutping_tone_runs: list[str]):
        return all(CmdSource.is_tone_consistent(w, j) for w, j in zip(williams_tone_runs, jyutping_tone_runs))

    @staticmethod
    def is_tone_consistent(williams_tone_run: str, jyutping_tone_run: str):
        williams_tone_number = re.sub(pattern='[()]', repl='', string=williams_tone_run)
        jyutping_tone_numbers = re.sub(pattern='-', repl='', string=jyutping_tone_run)
        return williams_tone_number.translate(str.maketrans('789', '136')) in jyutping_tone_numbers


class EntryPage:
    page_heading: Optional['PageHeading']
    tone_navigator: Optional['ToneNavigator']
    tone_headings: Optional[list['ToneHeading']]

    def __init__(self, file_name: str, content: str):
        if file_name.startswith('entries/') and not file_name.endswith('index.cmd'):
            try:
                page_heading = PageHeading(file_name, content)
                tone_navigator = ToneNavigator(content)
                tone_headings = EntryPage.extract_tone_headings(content)
                # TODO: character_navigators `<## tone-n-characters ##>`
                # TODO: character_entries `###` etc.
            except LintException as lint_exception:
                print(f'lint error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
                sys.exit(1)
        else:
            page_heading = None
            tone_navigator = None
            tone_headings = None
            pass  # TODO: etc.

        self.page_heading = page_heading
        self.tone_navigator = tone_navigator
        self.tone_headings = tone_headings

    @staticmethod
    def extract_tone_headings(page_content: str) -> list['ToneHeading']:
        return [
            ToneHeading(content, tone_number, williams_run, jyutping, chinese)
            for match in re.finditer(
                pattern=r'''
                    ^ \#\# \{ \# (?P<tone_number> [1-6] ) \s+ \.williams \}
                    \s+ (?P<williams_run> .*? )
                    \s* \[\[ (?P<jyutping> [a-z]+ [1-6] ) \s+ (?P<chinese> \S+ ) \]\] $
                ''',
                string=page_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
            if (
                content := match.group(),
                tone_number := match.group('tone_number'),
                williams_run := match.group('williams_run'),
                jyutping := match.group('jyutping'),
                chinese := match.group('chinese'),
            )
        ]


class PageHeading:
    content: str
    williams_list: list[str]
    jyutping: str

    def __init__(self, file_name: str, page_content: str):
        if not (match := re.search(
            pattern=r'^ \# \{\.williams\} \s+ (?P<williams_run> .*? ) \s* \[\[ (?P<jyutping> [a-z]+ ) \]\] $',
            string=page_content,
            flags=re.MULTILINE | re.VERBOSE,
        )):
            raise LintException('page heading `#{.williams} ...` not found')

        content = match.group()
        williams_run = match.group('williams_run')
        jyutping = match.group('jyutping')

        if file_name != f'entries/{jyutping}.cmd':
            raise LintException(f'page heading Jyutping `{jyutping}` is inconsistent with file name `{file_name}`')

        williams_list = [
            re.sub(pattern=r'[`.]', repl='', string=williams)
            for williams in williams_run.split()
        ]

        self.content = content
        self.williams_list = williams_list
        self.jyutping = jyutping


class ToneNavigator:
    content: Optional[str]

    def __init__(self, page_content: str):
        if match := re.search(
            pattern=r'<## tones ##>.*?<## /tones ##>',
            string=page_content,
            flags=re.DOTALL | re.MULTILINE,
        ):
            content = match.group()
        else:
            content = None

        self.content = content


class ToneHeading:
    def __init__(self, content: str, tone_number: str, williams_run: str, jyutping: str, chinese: str):
        williams_list = [
            re.sub(pattern=r'[`.]', repl='', string=williams)
            for williams in williams_run.split()
        ]

        self.content = content
        self.tone_number = tone_number
        self.williams_list = williams_list
        self.jyutping = jyutping
        self.chinese = chinese


class Parser:
    def __init__(self):
        cmd_file_names = [
            os.path.normpath(os.path.join(path, file_name)).replace('\\', '/')
            for path, _, file_names in os.walk(os.curdir)
            for file_name in file_names
            if file_name.endswith('.cmd')
        ]

        self.cmd_sources = [CmdSource(file_name) for file_name in sorted(cmd_file_names)]


def main():
    parser = Parser()


if __name__ == '__main__':
    main()
