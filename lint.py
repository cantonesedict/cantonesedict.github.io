#!/usr/bin/env python3

"""
# lint.py

Lint all Conway-Markdown (CMD) source files, with some automatic correction.
"""

import os
import re
import sys


class LintException(Exception):
    def __init__(self, message: str):
        self.message = message


class CmdSource:
    def __init__(self, file_name: str):
        with open(file_name, 'r', encoding='utf-8') as cmd_file:
            content = cmd_file.read()

        try:
            CmdSource.lint_cjk_compatibility_ideograph(content)
            CmdSource.lint_cjk_variation_selector(content)
            CmdSource.lint_typography_quote(content)
            CmdSource.lint_williams_entering_tone(content)
            CmdSource.lint_williams_left_tone(content)
            CmdSource.lint_williams_right_tone(content)
            CmdSource.lint_williams_initial_aspirate(content)
            CmdSource.lint_williams_tone_45_aspirate(content)
            CmdSource.lint_williams_tone_6_aspirate(content)
            CmdSource.lint_williams_diphthong(content)
            CmdSource.lint_williams_nasal_apostrophe(content)
            CmdSource.lint_williams_apical_apostrophe(content)
            # TODO: other linting checks
        except LintException as lint_exception:
            print(f'lint error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        self.file_name = file_name
        self.content = content
        self.entry_page = EntryPage(file_name, content)

    def __repr__(self):
        return f'CmdSource({self.file_name!r})'

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


class EntryPage:
    def __init__(self, file_name: str, content: str):
        if file_name.startswith('entries/'):
            pass  # TODO: do entry extraction
        else:
            pass  # TODO: do nothing


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
