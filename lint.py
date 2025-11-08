#!/usr/bin/env python3

"""
# lint.py

Lint all Conway-Markdown (CMD) source files, with automatic indexing.
"""

import os
import re
import sys
from collections import defaultdict
from typing import Iterable, Optional, TypeVar

T1 = TypeVar('T1')
T2 = TypeVar('T2')
T3 = TypeVar('T3')


CANTONESE_TONES_CHINESE = ['陰平', '陰上', '陰去', '陽平', '陽上', '陽去', '高陰入', '低陰入', '陽入']
CJK_UNIFIED_IDEOGRAPH_RADICALS = (
    '一丨丶丿乙亅'
    '二亠人儿入八冂冖冫几凵刀力勹匕匚匸十卜卩厂厶又'
    '口囗土士夂夊夕大女子宀寸小尢尸屮山巛工己巾干幺广廴廾弋弓彐彡彳'
    '心戈戶手支攴文斗斤方无日曰月木欠止歹殳毋比毛氏气水火爪父爻爿片牙牛犬'
    '玄玉瓜瓦甘生用田疋疒癶白皮皿目矛矢石示禸禾穴立'
    '竹米糸缶网羊羽老而耒耳聿肉臣自至臼舌舛舟艮色艸虍虫血行衣襾'
    '見角言谷豆豕豸貝赤走足身車辛辰辵邑酉釆里'
    '金長門阜隶隹雨靑非'
    '面革韋韭音頁風飛食首香'
    '馬骨高髟鬥鬯鬲鬼'
    '魚鳥鹵鹿麥麻'
    '黃黍黑黹'
    '黽鼎鼓鼠'
    '鼻齊'
    '齒'
    '龍龜'
    '龠'
)
KANGXI_RADICALS = ''.join(chr(code_point) for code_point in range(0x2F00, 0x2FD6))


class Utilities:
    @staticmethod
    def literal_replacement_pattern(content: str) -> str:
        return content.replace('\\', r'\\')

    @staticmethod
    def unicode_code_point(character: str) -> str:
        return f'U+{ord(character):X}'

    @staticmethod
    def collate_firsts_by_second(pairs: Iterable[tuple[T1, T2]]) -> dict[T2, list[T1]]:
        firsts_from_second: dict[T2, list[T1]] = defaultdict(list)

        for first, second in pairs:
            firsts_from_second[second].append(first)

        return dict(firsts_from_second)

    @staticmethod
    def collate_first_by_second_by_third(triples: Iterable[tuple[T1, T2, T3]]) -> dict[T3, dict[T2, T1]]:
        first_from_second_from_third: dict[T3, dict[T2, T1]] = defaultdict(dict)

        for first, second, third in triples:
            first_from_second_from_third[third][second] = first

        return dict(first_from_second_from_third)


class CmdIdioms:
    @staticmethod
    def parse_entry_items(content: str) -> dict[str, str]:
        return {
            key: content
            for match in re.finditer(
                pattern=r'^ (?P<key>\S+) \n (?P<content> (?: [ ].*\n )* )',
                string=content,
                flags=re.MULTILINE | re.VERBOSE,
            )
            if (
                key := match.group('key'),
                content := match.group('content'),
            )
        }

    @staticmethod
    def strip_compositions(content: str) -> str:
        return re.sub(
            pattern=r'\{ (?P<character> \S ) = \S+ \}',
            repl=r'\g<character>',
            string=content,
            flags=re.VERBOSE
        )

    @staticmethod
    def lint_see_also_link_order(see_also_links: list[str]):
        if see_also_links is None:
            return

        if see_also_links != sorted(see_also_links):
            raise LintException(f'see also links {see_also_links} not in sorted order')


class LintException(Exception):
    message: str

    def __init__(self, message: str):
        self.message = message


class CmdSource:
    file_name: str
    content: str
    entry_page: Optional['EntryPage']

    def __init__(self, file_name: str):
        with open(file_name, 'r', encoding='utf-8') as cmd_file:
            content = cmd_file.read()

        try:
            CmdSource.lint_whitespace(content)
            CmdSource.lint_typography_quote(content)
            CmdSource.lint_cjk_compatibility_ideograph(content)
            CmdSource.lint_cjk_non_bmp_composition(content)
            CmdSource.lint_cjk_variation_selector(content)
            CmdSource.lint_insertion_context(content)
            CmdSource.lint_williams_entering_tone(content)
            CmdSource.lint_williams_left_tone_position(content)
            CmdSource.lint_williams_right_tone_position(content)
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
            print(f'Error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        if file_name.startswith('entries/') and not file_name.endswith('index.cmd'):
            entry_page = EntryPage(file_name, content)
        else:
            entry_page = None

        self.file_name = file_name
        self.content = content
        self.entry_page = entry_page

    def self_index(self):
        if self.entry_page is None:
            return

        self.entry_page.self_index()

    @staticmethod
    def lint_whitespace(content: str):
        if context_match := re.search(pattern=r'\S+\t\S+', string=content):
            context = context_match.group()
            raise LintException(f'tab character present in `{context}`')

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
    def lint_insertion_context(content: str):
        non_exempt_pattern = '|'.join([
            r'^ \# \{\.williams\} \s+ .*? \[\[ [a-z]+ \]\] $',  # page headings
            r'^ \#\# \{ \# [1-6] \s+ \.williams \} \s+ .*? \[\[ [a-z]+ [1-6] \s+ \S+ \]\] $',  # tone headings
            r'^ [#]{3} [+]? [ ] \S+ [1-6] [ ][|][ ] .*? [ ] \[\[ [a-z]+[1-6] \]\] $',  # character entry headings
            r'^ (?: WH | WV | W ) \n (?: [ ].*\n )*',  # Williams entry items
            r'''
                ^ (?P<block_delimiter> [-+='"|]{2,} ) \{ \.williams (?: \s .*? )? \} \n
                (?s: .*? ) \n
                (?P=block_delimiter) $
            ''',
            re.escape('[[Not present]]'),  # contextual non-insertions
        ])
        non_exempt_content = re.sub(
            pattern=non_exempt_pattern,
            repl='',
            string=content,
            flags=re.MULTILINE | re.VERBOSE,
        )

        if context_match := re.search(
            pattern=r'.* \[\[ (?s: .+? ) \]\] | <ins.*> .* ',
            string=non_exempt_content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            raise LintException(f'non-contextual insertion in `{context}`')

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
    def lint_williams_left_tone_position(content: str):
        if run_match := re.search(
            pattern=r'\S* (?<! _ ) \([1245]\) [_ ]',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams left-tone position in `{run}`')

    @staticmethod
    def lint_williams_right_tone_position(content: str):
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
    file_name: str
    content: str
    is_done: bool
    page_title: str
    page_heading: 'PageHeading'
    page_entry: 'PageEntry'
    tone_navigator: 'ToneNavigator'
    tone_headings: list['ToneHeading']
    character_navigators: list['CharacterNavigator']
    character_entries: list['CharacterEntry']

    def __init__(self, file_name: str, content: str):
        is_done = '(Work in progress)' not in content

        try:
            page_title = EntryPage.extract_page_title(content)
            page_heading = PageHeading(content, file_name, page_title)
            page_entry = PageEntry(content, page_heading.jyutping)
            tone_navigator = ToneNavigator(content)
            tone_headings = EntryPage.extract_tone_headings(content, page_heading.jyutping)
            character_navigators = EntryPage.extract_character_navigators(content)
            character_entries = EntryPage.extract_character_entries(content, page_heading.jyutping)

            EntryPage.lint_tone_heading_order(tone_headings)
            EntryPage.lint_character_entry_order(character_entries)

            EntryPage.lint_page_heading_against_page_entry(page_heading, page_entry)
            EntryPage.lint_page_heading_against_tone_headings(page_heading, tone_headings)
            EntryPage.lint_tone_headings_against_character_navigators(tone_headings, character_navigators)
            EntryPage.lint_tone_headings_against_character_entries(tone_headings, character_entries, is_done)
        except LintException as lint_exception:
            print(f'Error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        self.file_name = file_name
        self.content = content
        self.is_done = is_done
        self.page_title = page_title
        self.page_heading = page_heading
        self.page_entry = page_entry
        self.tone_navigator = tone_navigator
        self.tone_headings = tone_headings
        self.character_navigators = character_navigators
        self.character_entries = character_entries

    def self_index(self):
        updated_content = content = self.content
        updated_content = self._update_tone_navigator(updated_content)
        updated_content = self._update_character_navigators(updated_content)

        if updated_content == content:
            return

        with open(self.file_name, 'w') as cmd_file:
            cmd_file.write(updated_content)

        self.content = updated_content

    def _update_tone_navigator(self, content: str) -> str:
        if self.tone_navigator.content is None:
            return content

        tone_navigator_content_expected = '\n'.join([
            '<## tones ##>',
            '<nav class="sideways">',
            '=={.modern}',
            *[
                f'- [{tone_heading.jyutping}](#{tone_heading.tone_number})'
                for tone_heading in self.tone_headings
            ],
            '==',
            '</nav>',
            '<## /tones ##>',
        ])

        return content.replace(self.tone_navigator.content, tone_navigator_content_expected)

    def _update_character_navigators(self, content: str) -> str:
        updated_content = content

        character_entries_from_tone_number = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.tone_number)
            for character_entry in self.character_entries
        )

        for character_navigator in self.character_navigators:
            tone_number = character_navigator.tone_number
            character_navigator_content_expected = '\n'.join([
                f'<## tone-{tone_number}-characters ##>',
                '<nav class="sideways">',
                '=={.modern}',
                *[
                    f'- {character_entry.same_page_link()}'
                    for character_entry in character_entries_from_tone_number[tone_number]
                ],
                '==',
                '</nav>',
                f'<## /tone-{tone_number}-characters ##>',
            ])

            updated_content = updated_content.replace(character_navigator.content, character_navigator_content_expected)

        return updated_content

    @staticmethod
    def extract_page_title(page_content: str) -> str:
        if not (match := re.search(
            pattern=r'^\* %title --> (?P<title>[a-z]+)$',
            string=page_content,
            flags=re.MULTILINE,
        )):
            raise LintException('page title not found')

        return match.group('title')

    @staticmethod
    def extract_tone_headings(page_content: str, page_heading_jyutping: str) -> list['ToneHeading']:
        return [
            ToneHeading(content, tone_number, williams_run, jyutping, chinese, page_heading_jyutping)
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

    @staticmethod
    def extract_character_navigators(page_content: str) -> list['CharacterNavigator']:
        return [
            CharacterNavigator(content, tone_number)
            for match in re.finditer(
                pattern=r'<## tone-(?P<tone_number>[1-6])-characters ##>.*?<## /tone-(?P=tone_number)-characters ##>',
                string=page_content,
                flags=re.DOTALL | re.MULTILINE,
            )
            if (
                content := match.group(),
                tone_number := match.group('tone_number'),
            )
        ]

    @staticmethod
    def extract_character_entries(page_content: str, page_heading_jyutping: str) -> list['CharacterEntry']:
        return [
            CharacterEntry(heading_content, addition, character_run, tone_number, williams_run, jyutping, non_canonical,
                           entry_content, page_heading_jyutping)
            for match in re.finditer(
                pattern=r'''
                    ^ (?P<heading_content>
                        [#]{3} (?P<addition> [+]? ) [ ]
                        (?P<character_run> \S+ ) (?P<tone_number> [1-6] ) [ ][|][ ]
                        (?P<williams_run> .*? ) [ ] \[\[ (?P<jyutping> [a-z]+[1-6] ) \]\]
                    )
                    \n\n
                    ^ [$]{2} (?P<non_canonical> [.]? ) \n
                    (?P<entry_content> (?s: .+? ) )
                    ^ [$]{2} \n
                ''',
                string=page_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
            if (
                heading_content := match.group('heading_content'),
                addition := match.group('addition'),
                character_run := match.group('character_run'),
                tone_number := match.group('tone_number'),
                williams_run := match.group('williams_run'),
                jyutping := match.group('jyutping'),
                non_canonical := match.group('non_canonical'),
                entry_content := match.group('entry_content'),
            )
        ]

    @staticmethod
    def lint_tone_heading_order(tone_headings: list['ToneHeading']):
        tone_heading_numbers = [tone_heading.tone_number for tone_heading in tone_headings]
        if tone_heading_numbers != sorted(tone_heading_numbers):
            raise LintException(f'tone headings {tone_heading_numbers} not in sorted order')

    @staticmethod
    def lint_character_entry_order(character_entries: list['CharacterEntry']):
        characters = ''.join(character_entry.character for character_entry in character_entries)
        sorted_characters = ''.join(character_entry.character for character_entry in sorted(character_entries))
        if characters != sorted_characters:
            raise LintException(f'character entries {characters} not in sorted order (expected {sorted_characters})')

    @staticmethod
    def lint_page_heading_against_page_entry(page_heading: 'PageHeading', page_entry: 'PageEntry'):
        if page_entry.wh_williams_list is None:
            return

        if page_heading.williams_list != page_entry.wh_williams_list:
            raise LintException(
                f'inconsistent page heading Williams list {page_heading.williams_list} '
                f'vs page entry Williams list {page_entry.wh_williams_list}'
            )

    @staticmethod
    def lint_page_heading_against_tone_headings(page_heading: 'PageHeading', tone_headings: list['ToneHeading']):
        if not tone_headings:
            return

        page_heading_williams_set = set(page_heading.williams_list)
        tone_heading_williams_set = set(
            re.sub(pattern=r'\([1-9]\)', repl='', string=williams)
            for tone_heading in tone_headings
            for williams in tone_heading.williams_list
        )
        tone_heading_williams_set_supplemented = {*page_heading_williams_set, *tone_heading_williams_set}
        tone_heading_williams_set_redundant = set(
            f'``{williams}``'  # insertion is redundant if non-insertion is also present
            for williams in tone_heading_williams_set_supplemented
            if not re.fullmatch(pattern='``.+``', string=williams)
        )
        page_heading_williams_set_expected = (
            tone_heading_williams_set_supplemented  # need supplemented for WH implied headings
            .difference(tone_heading_williams_set_redundant)
        )

        if page_heading_williams_set != page_heading_williams_set_expected:
            raise LintException(
                f'inconsistent page heading Williams set {page_heading_williams_set} '
                f'vs tone heading Williams set {tone_heading_williams_set} + {page_heading_williams_set} '
                f'≡ {page_heading_williams_set_expected} (modulo redundant insertion)'
            )

    @staticmethod
    def lint_tone_headings_against_character_navigators(tone_headings: list['ToneHeading'],
                                                        character_navigators: list['CharacterNavigator']):
        tone_heading_tone_numbers = [
            tone_heading.tone_number
            for tone_heading in tone_headings
        ]
        character_navigator_tone_numbers = [
            character_navigator.tone_number
            for character_navigator in character_navigators
        ]

        if tone_heading_tone_numbers != character_navigator_tone_numbers:
            raise LintException(
                f'inconsistent tone heading tone numbers `{tone_heading_tone_numbers}` '
                f'vs character navigator tone numbers `{character_navigator_tone_numbers}`'
            )

    @staticmethod
    def lint_tone_headings_against_character_entries(tone_headings: list['ToneHeading'],
                                                     character_entries: list['CharacterEntry'], is_done: bool):
        if not is_done:
            return

        for tone_heading in tone_headings:
            tone_heading_williams_set = set(tone_heading.williams_list)
            character_entry_williams_set = set(
                (f'``{williams}``' if character_entry.is_added else williams).replace('^', '')
                for character_entry in character_entries
                if character_entry.tone_number == tone_heading.tone_number
                for williams in character_entry.williams_list
            )
            character_entry_williams_set_redundant = set(
                f'``{williams}``'  # insertion is redundant if non-insertion is also present
                for williams in character_entry_williams_set
                if not re.fullmatch(pattern='``.+``', string=williams)
            )
            tone_heading_williams_set_expected = (
                character_entry_williams_set
                .difference(character_entry_williams_set_redundant)
            )

            if tone_heading_williams_set != tone_heading_williams_set_expected:
                raise LintException(
                    f'inconsistent tone heading Williams set {tone_heading_williams_set} '
                    f'vs character entry Williams set {character_entry_williams_set} '
                    f'≡ {tone_heading_williams_set_expected} (modulo redundant insertion)'
                )


class PageHeading:
    content: str
    williams_list: list[str]
    jyutping: str

    def __init__(self, page_content: str, file_name: str, page_title: str):
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
            raise LintException(f'inconsistent page heading Jyutping `{jyutping}` vs file name `{file_name}`')

        if page_title != jyutping:
            raise LintException(f'inconsistent page heading Jyutping `{jyutping}` vs page title `{page_title}`')

        williams_list = [
            re.sub(pattern=r'[.]', repl='', string=williams)
            for williams in williams_run.split()
        ]

        self.content = content
        self.williams_list = williams_list
        self.jyutping = jyutping


class PageEntry:
    content_from_key: Optional[dict[str, str]]
    wh_williams_list: Optional[str]
    wp_williams_list: Optional[str]
    mp_jyutping_list: Optional[str]
    see_also_links: Optional[list[str]]

    def __init__(self, page_content: str, page_heading_jyutping: str):
        if match := re.search(
            pattern=r'<## /tones ##>\s+^\$\$\n(?P<content>.+?)^\$\$\n',
            string=page_content,
            flags=re.DOTALL | re.MULTILINE,
        ):
            content = match.group('content')
            content_from_key = CmdIdioms.parse_entry_items(content)

            PageEntry.lint_keys(content_from_key)

            wh_williams_list = PageEntry.extract_williams_heading_list(content_from_key['WH'])
            wp_williams_list = PageEntry.extract_williams_heading_list(content_from_key['WP'])
            mp_jyutping_list = PageEntry.extract_jyutping_heading_list(content_from_key['MP'])
            see_also_links = PageEntry.extract_see_also_links(content_from_key.get('S'))

            PageEntry.lint_williams_heading_lists(wh_williams_list, wp_williams_list)
            PageEntry.lint_page_heading_against_mp(page_heading_jyutping, mp_jyutping_list)
            CmdIdioms.lint_see_also_link_order(see_also_links)
        else:
            content_from_key = None
            wh_williams_list = None
            wp_williams_list = None
            mp_jyutping_list = None
            see_also_links = None

        self.content_from_key = content_from_key
        self.wh_williams_list = wh_williams_list
        self.wp_williams_list = wp_williams_list
        self.mp_jyutping_list = mp_jyutping_list
        self.see_also_links = see_also_links

    @staticmethod
    def lint_keys(content_from_key: dict[str, str]):
        keys = ''.join(f'{key} ' for key in content_from_key)
        pattern_readable = 'WH [WV] WP MP [C] [S] '
        pattern = re.sub(
            pattern=r'\[ (?P<optional_key> \S+ ) \] [ ]',
            repl=r'(?:\g<optional_key> )?',
            string=pattern_readable,
            flags=re.VERBOSE,
        )

        if not re.fullmatch(pattern=pattern, string=keys):
            raise LintException(f'page entry keys `{keys}` do not match pattern `{pattern_readable}`')

    @staticmethod
    def lint_williams_heading_lists(wh_williams_list: list[str], wp_williams_list: list[str]):
        if wh_williams_list != wp_williams_list:
            raise LintException(
                f'inconsistent WH Williams list `{wh_williams_list}` vs WP Williams list `{wp_williams_list}`'
            )

    @staticmethod
    def lint_page_heading_against_mp(page_heading_jyutping: str, mp_jyutping_list: list[str]):
        if not mp_jyutping_list:
            raise LintException('MP contains no Jyutping items')

        if (mp_jyutping_first := mp_jyutping_list[0]) != page_heading_jyutping:
            raise LintException(
                f'first MP jyutping item `{mp_jyutping_first}` is not page heading Jyutping `{page_heading_jyutping}`'
            )

    @staticmethod
    def extract_williams_heading_list(content: str) -> list[str]:
        return [
            williams_run.replace('.', '')
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<williams_run> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                williams_run := match.group('williams_run'),
            )
        ]

    @staticmethod
    def extract_jyutping_heading_list(content: str) -> list[str]:
        return [
            jyutping
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<jyutping> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                jyutping := match.group('jyutping'),
            )
        ]

    @staticmethod
    def extract_see_also_links(content: Optional[str]) -> Optional[list[str]]:
        if content is None:
            return None

        return [
            link
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<link> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                link := match.group('link'),
            )
        ]


class ToneNavigator:
    content: Optional[str]

    def __init__(self, page_content: str):
        if match := re.search(
            pattern=r'<## tones ##>.*?<## /tones ##>',
            string=page_content,
            flags=re.DOTALL,
        ):
            content = match.group()
        else:
            content = None

        self.content = content


class ToneHeading:
    content: str
    tone_number: str
    williams_list: list[str]
    jyutping: str
    chinese: str

    def __init__(self, content: str, tone_number: str, williams_run: str, jyutping: str, chinese: str,
                 page_heading_jyutping: str):
        if f'{page_heading_jyutping}{tone_number}' != jyutping:
            raise LintException(
                f'inconsistent page heading Jyutping `{page_heading_jyutping}` and tone number `{tone_number}` '
                f'vs Jyutping `{jyutping}` in tone heading `{content}`'
            )

        williams_tones = set(re.findall(pattern=r'\([1-9]\)', string=williams_run))

        if len(williams_tones) != 1:
            raise LintException(f'non-sole Williams tones `{williams_tones}` found in tone heading `{content}`')

        williams_tone = williams_tones.pop()
        williams_tone_number = re.sub(pattern='[()]', repl='', string=williams_tone)
        williams_tone_index = int(williams_tone_number) - 1

        if CANTONESE_TONES_CHINESE[williams_tone_index] != chinese:
            raise LintException(f'Williams tone `{williams_tone}` is not `{chinese}` in tone heading `{content}`')

        jyutping_is_entering = jyutping[-2] in 'ptk'
        jyutping_tone_number = jyutping[-1]
        jyutping_proper_tone_number = (
            jyutping_tone_number.translate(str.maketrans('136', '789')) if jyutping_is_entering
            else jyutping_tone_number
        )
        jyutping_tone_index = int(jyutping_proper_tone_number) - 1

        if CANTONESE_TONES_CHINESE[jyutping_tone_index] != chinese:
            raise LintException(f'Jyutping `{jyutping}` is not `{chinese}` in tone heading `{content}`')

        williams_list = [
            re.sub(pattern=r'[.^]', repl='', string=williams)
            for williams in williams_run.split()
        ]

        self.content = content
        self.tone_number = tone_number
        self.williams_list = williams_list
        self.jyutping = jyutping
        self.chinese = chinese


class CharacterNavigator:
    content: str
    tone_number: str

    def __init__(self, content: str, tone_number: str):
        self.content = content
        self.tone_number = tone_number


class CharacterEntry:
    heading_content: str
    is_canonical: bool
    is_added: bool
    character: str
    composition: Optional[str]
    tone_number: str
    williams_list: list[str]
    jyutping: str
    content_from_key: dict[str, str]
    radical_strokes_list: list['RadicalStrokes']
    unicode_code_point: str
    h_content: Optional[str]
    f_content: str
    w_content: str
    cantonese_entries: Optional[list['CantoneseEntry']]
    see_also_links: Optional[list[str]]

    def __init__(self, heading_content: str, addition: str, character_run: str, tone_number: str, williams_run: str,
                 jyutping: str, non_canonical: str, entry_content: str, page_heading_jyutping: str):
        is_canonical = not non_canonical
        is_added = bool(addition)

        reduced_character_run = re.sub(
            pattern=r'^ (?: ~~ .+? ~~ )? `` (?P<reduced_character_run> \S+ ) `` $',
            repl=r'\g<reduced_character_run>',
            string=character_run,
            flags=re.VERBOSE,
        )

        if composition_match := re.fullmatch(
            pattern=r'\{ (?P<character> \S ) = (?P<composition> \S+ ) \}',
            string=reduced_character_run,
            flags=re.VERBOSE,
        ):
            character = composition_match.group('character')
            composition = composition_match.group('composition')
        elif len(reduced_character_run) == 1:
            character = reduced_character_run
            composition = None
        else:
            raise LintException(
                f'invalid character run `{character_run}` in heading `{heading_content}`'
            )

        if f'{page_heading_jyutping}{tone_number}' != jyutping:
            raise LintException(
                f'inconsistent page heading Jyutping `{page_heading_jyutping}` and tone number `{tone_number}` '
                f'vs Jyutping `{jyutping}` in heading `{heading_content}`'
            )

        reduced_williams_run = re.sub(pattern='~~.+?~~', repl='', string=williams_run)
        williams_tones = set(re.findall(pattern=r'\([1-9]\)', string=reduced_williams_run))

        if len(williams_tones) != 1:
            raise LintException(
                f'non-sole Williams tones `{williams_tones}` found in heading `{heading_content}`'
            )

        williams_tone = williams_tones.pop()
        williams_tone_number = re.sub(pattern='[()]', repl='', string=williams_tone)

        jyutping_is_entering = jyutping[-2] in 'ptk'
        jyutping_proper_tone_number = (
            tone_number.translate(str.maketrans('136', '789')) if jyutping_is_entering
            else tone_number
        )

        if williams_tone_number != jyutping_proper_tone_number:
            raise LintException(f'inconsistent Williams tone `{williams_tone}` vs Jyutping `{jyutping}`')

        williams_list = reduced_williams_run.replace('_', '').split()

        content_from_key = CmdIdioms.parse_entry_items(entry_content)

        CharacterEntry.lint_keys(content_from_key, heading_content)

        radical_strokes_list = CharacterEntry.extract_radical_strokes_list(content_from_key['R'])
        unicode_code_point = CharacterEntry.extract_unicode_code_point(content_from_key['U'])
        h_content = content_from_key.get('H')
        f_content = content_from_key['F']
        w_content = content_from_key['W']
        cantonese_entries = CharacterEntry.extract_cantonese_entries(content_from_key.get('E'), page_heading_jyutping)
        see_also_links = CharacterEntry.extract_see_also_links(content_from_key.get('S'))

        CharacterEntry.lint_character_against_unicode_code_point(character, unicode_code_point)
        CharacterEntry.lint_williams_locator(w_content)
        CharacterEntry.lint_williams_ellipsis_item_punctuation(w_content)
        CharacterEntry.lint_williams_romanisation_punctuation(w_content)

        CharacterEntry.lint_cantonese_entry_order(cantonese_entries)
        CmdIdioms.lint_see_also_link_order(see_also_links)

        self.heading_content = heading_content
        self.is_canonical = is_canonical
        self.is_added = is_added
        self.character = character
        self.composition = composition
        self.tone_number = tone_number
        self.williams_list = williams_list
        self.jyutping = jyutping
        self.content_from_key = content_from_key
        self.radical_strokes_list = radical_strokes_list
        self.unicode_code_point = unicode_code_point
        self.h_content = h_content
        self.f_content = f_content
        self.w_content = w_content
        self.cantonese_entries = cantonese_entries
        self.see_also_links = see_also_links

    def __lt__(self, other):
        return self.sorting_rank() < other.sorting_rank()

    def __str__(self):
        return self.heading_content

    def sorting_rank(self) -> tuple:
        return (
            self.jyutping,
            self.radical_strokes_list[0].radical,
            self.radical_strokes_list[0].stroke_count,
            not (0x4E00 <= ord(self.character) <= 0x9FFF),  # whether character is an extension ideograph
            self.character,
        )

    def composed_character(self) -> str:
        if self.composition is None:
            return self.character

        return f'{{{self.character}={self.composition}}}'

    def same_page_link(self) -> str:
        return f'${self.composed_character()}{self.tone_number}'

    def universal_link(self) -> str:
        return f'${self.composed_character()}{self.jyutping}'

    @staticmethod
    def lint_keys(content_from_key: dict[str, str], heading_content: str):
        keys = ''.join(f'{key} ' for key in content_from_key)
        pattern_readable = 'R U [H] [A] [V] F W [C] [P] [E] [S] '
        pattern = re.sub(
            pattern=r'\[ (?P<optional_key> \S+ ) \] [ ]',
            repl=r'(?:\g<optional_key> )?',
            string=pattern_readable,
            flags=re.VERBOSE,
        )

        if not re.fullmatch(pattern=pattern, string=keys):
            raise LintException(
                f'character entry keys `{keys}` do not match pattern `{pattern_readable}` under `{heading_content}`'
            )

    @staticmethod
    def lint_character_against_unicode_code_point(character: str, unicode_code_point: str):
        if Utilities.unicode_code_point(character) != unicode_code_point:
            raise LintException(f'character `{character}` is not `{unicode_code_point}`')

    @staticmethod
    def lint_williams_locator(content: str):
        for match in re.finditer(
            pattern=r'^ [ ]+ [-][ ] \[\[ Page~\S+ [ ] (?P<headword_run> .*? ) \]\] $',
            string=content,
            flags=re.MULTILINE | re.VERBOSE,
        ):
            locator_run = match.group().strip()
            headword_run = match.group('headword_run')

            if not re.search(pattern=r'\([1-9]\)', string=headword_run):
                raise LintException(f'missing Williams tone in locator `{locator_run}`')

    @staticmethod
    def lint_williams_ellipsis_item_punctuation(content: str):
        ellipsis_item = '- [[...]]'
        ellipsis_item_pattern = re.escape(ellipsis_item)
        unpunctuated_ellipsis_item_pattern = f'^[ ]+{ellipsis_item_pattern}$'
        if re.search(pattern=unpunctuated_ellipsis_item_pattern, string=content, flags=re.MULTILINE):
            raise LintException(
                f'unpunctuated ellipsis item `{ellipsis_item}` '
                f'(suppress with caret after closing square brackets if legitimate)'
            )

    @staticmethod
    def lint_williams_romanisation_punctuation(content: str):
        if unwanted_comma_match := re.search(
            pattern=r'''
                _ \S[^_\n]*? (?: \([36789]\) | ' ) (?: ~~ \s* `` [^~\n]*? `` )? _  # Williams romanisation
                \s+
                \[\[ [^\[\n]+? \]\]  # supplied Jyutping
                (?: \s+ \[\[ .*? \]\] )?  # supplied Kangxi with punctuation
                ,  # unwanted comma
            ''',
            string=content,
            flags=re.VERBOSE,
        ):
            unwanted_comma_context = unwanted_comma_match.group()
            unwanted_comma_context_reduced = re.sub(pattern=r'\s+', repl=' ', string=unwanted_comma_context)
            raise LintException(
                f'comma after supplied Jyutping for Williams right-tone or nasal apostrophe '
                f'in `{unwanted_comma_context_reduced}` '
                f'(suppress with caret before comma if legitimate)'
            )

        if missing_comma_match := re.search(
            pattern=r'''
                _ \S[^_\n]*? \([1245]\) \S+ [^'`] (?: ~~ \s* `` [^~\n]*? `` )? _  # Williams romanisation
                \s+
                \[\[ [^,\n]+? \]\]  # supplied Jyutping
                (?! \s+ \[\[ .*? \]\] \S )  # supplied Kangxi with punctuation
                \s  # missing comma
            ''',
            string=content,
            flags=re.VERBOSE,
        ):
            missing_comma_context = missing_comma_match.group()
            missing_comma_context_reduced = re.sub(pattern=r'\s+', repl=' ', string=missing_comma_context.strip())
            raise LintException(
                f'missing comma after supplied Jyutping for Williams left-tone in `{missing_comma_context_reduced}` '
                f'(suppress with caret after closing square brackets if legitimate)'
            )

    @staticmethod
    def lint_cantonese_entry_order(cantonese_entries: Optional[list['CantoneseEntry']]):
        if cantonese_entries is None:
            return

        terms_readable = [
            f'{CmdIdioms.strip_compositions(cantonese_entry.term)} {cantonese_entry.jyutping_list[0]}'
            for cantonese_entry in cantonese_entries
        ]
        sorted_terms_readable = [
            f'{CmdIdioms.strip_compositions(cantonese_entry.term)} {cantonese_entry.jyutping_list[0]}'
            for cantonese_entry in sorted(cantonese_entries)
        ]
        if terms_readable != sorted_terms_readable:
            raise LintException(
                f'Cantonese entries {terms_readable} not in sorted order (expected {sorted_terms_readable})'
            )

    @staticmethod
    def extract_radical_strokes_list(content: str) -> list['RadicalStrokes']:
        return [
            RadicalStrokes(radical_strokes_run)
            for match in re.finditer(
                pattern=r'^ [ ]+ (?P<radical_strokes_run> .*? ) $',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                radical_strokes_run := match.group('radical_strokes_run'),
            )
        ]

    @staticmethod
    def extract_unicode_code_point(content: str) -> str:
        if not (match := re.fullmatch(
            pattern='U[+][0-9A-F]{4,5}',
            string=content.strip(),
        )):
            raise LintException(f'invalid Unicode code point `{content}`')

        return match.group()

    @staticmethod
    def extract_cantonese_entries(content: Optional[str], page_heading_jyutping: str
                                  ) -> Optional[list['CantoneseEntry']]:
        if content is None:
            return None

        return [
            CantoneseEntry(term, disambiguation_suffix, jyutping_content, page_heading_jyutping)
            for match in re.finditer(
                pattern=r'''
                    ^ [ ]+ [-][ ]
                    【 (?P<term> [^\s-]+ ) (?P<disambiguation_suffix> \S* ) 】
                    [ ] \( (?P<jyutping_content> .* ) \) : $
                ''',
                string=content,
                flags = re.MULTILINE | re.VERBOSE,
            )
            if (
                term := match.group('term'),
                disambiguation_suffix := match.group('disambiguation_suffix'),
                jyutping_content := match.group('jyutping_content'),
            )
        ]

    @staticmethod
    def extract_see_also_links(content: Optional[str]) -> Optional[list[str]]:
        if content is None:
            return None

        return [
            link
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<link> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                link := match.group('link'),
            )
        ]

class RadicalStrokes:
    radical: str
    stroke_count: int

    def __init__(self, radical_strokes_run: str):
        if not (match := re.fullmatch(
            pattern=r'(?P<radical> \S ) [ ][+][ ] (?P<stroke_count> [0-9]+ )',
            string=radical_strokes_run,
            flags=re.VERBOSE,
        )):
            raise LintException(f'invalid radical strokes run `{radical_strokes_run}`')

        radical = match.group('radical')
        stroke_count = int(match.group('stroke_count'))

        if radical not in KANGXI_RADICALS:
            if radical in CJK_UNIFIED_IDEOGRAPH_RADICALS:
                translation_table = str.maketrans(CJK_UNIFIED_IDEOGRAPH_RADICALS, KANGXI_RADICALS)
                expected_radical = radical.translate(translation_table)
                suggestion = f' (did you mean {Utilities.unicode_code_point(expected_radical)} `{expected_radical}`?)'
            else:
                suggestion = ''

            raise LintException(f'invalid radical `{radical}`{suggestion}')

        self.radical = radical
        self.stroke_count = stroke_count

    def __eq__(self, other: 'RadicalStrokes'):
        return self.identity() == other.identity()

    def __hash__(self):
        return hash(self.identity())

    def __str__(self):
        return f'{self.radical} + {self.stroke_count}'

    def identity(self):
        return self.radical, self.stroke_count


class CantoneseEntry:
    term: str
    disambiguation_suffix: str
    jyutping_list: list[str]
    page_heading_jyutping: str

    def __init__(self, term: str, disambiguation_suffix: str, jyutping_content: str, page_heading_jyutping: str):
        self.term = term
        self.disambiguation_suffix = disambiguation_suffix
        self.jyutping_list = jyutping_content.split(sep=', ')
        self.page_heading_jyutping = page_heading_jyutping

    def __lt__(self, other):
        return self.sorting_rank() < other.sorting_rank()

    def sorting_rank(self) -> tuple:
        return (
            self.jyutping_list,
            self.jyutping_list[0].split(),
            CmdIdioms.strip_compositions(self.term),
        )


class Executor:
    cmd_sources: list['CmdSource']
    entry_pages: list['EntryPage']

    def __init__(self):
        cmd_file_names = [
            os.path.normpath(os.path.join(path, file_name)).replace('\\', '/')
            for path, _, file_names in os.walk(os.curdir)
            for file_name in file_names
            if file_name.endswith('.cmd')
        ]

        cmd_sources = [CmdSource(file_name) for file_name in sorted(cmd_file_names)]
        entry_pages = [
            entry_page
            for cmd_source in cmd_sources
            if (entry_page := cmd_source.entry_page) is not None
        ]
        character_entries = [
            character_entry
            for entry_page in entry_pages
            for character_entry in entry_page.character_entries
        ]

        try:
            Executor.lint_page_entry_see_also_reciprocation(entry_pages)
            Executor.lint_character_entry_invariants(character_entries)
            Executor.lint_character_entry_see_also_reciprocation(character_entries)
        except LintException as lint_exception:
            print(f'Error: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        self.cmd_sources = cmd_sources
        self.entry_pages = entry_pages

    def self_index(self):
        for cmd_source in self.cmd_sources:
            cmd_source.self_index()

    def cross_index(self):
        self._index_entries()  # entry pages by Jyutping
        # TODO: self.index_terms()  # Cantonese terms by Jyutping
        # TODO: self.index_search()  # characters and compositions
        # TODO: self.index_radicals()  # characters by radical

    def _index_entries(self):
        entry_pages_from_incipit = Utilities.collate_firsts_by_second(
            (entry_page, entry_page.page_title[0])
            for entry_page in self.entry_pages
        )

        with open('entries/index.cmd', 'r', encoding='utf-8') as read_file:
            updated_content = content = read_file.read()

        updated_content = self._update_incipit_navigator(updated_content, entry_pages_from_incipit)
        updated_content = self._update_entry_links(updated_content, entry_pages_from_incipit)

        if updated_content == content:
            return

        with open('entries/index.cmd', 'w', encoding='utf-8') as write_file:
            write_file.write(updated_content)

    @staticmethod
    def _update_incipit_navigator(content: str, entry_pages_from_incipit: dict[str, list['EntryPage']]):
        incipit_navigator_content_expected = '\n'.join([
            '<## incipits ##>',
            '<nav class="sideways">',
            '=={.modern}',
            *[
                f'- [{incipit_upper}](#{incipit_upper})'
                for incipit in entry_pages_from_incipit
                if (
                    incipit_upper := incipit.upper(),
                )
             ],
            '==',
            '</nav>',
            '<## /incipits ##>',
        ])

        return re.sub(
            pattern=r'<## incipits ##>.*?<## /incipits ##>',
            string=content,
            repl=Utilities.literal_replacement_pattern(incipit_navigator_content_expected),
            flags=re.DOTALL,
        )

    @staticmethod
    def lint_page_entry_see_also_reciprocation(entry_pages: list['EntryPage']):
        entry_page_from_jyutping = {
            entry_page.page_title: entry_page
            for entry_page in entry_pages
        }

        for entry_page in entry_pages:
            jyutping = entry_page.page_title

            if (see_also_links := entry_page.page_entry.see_also_links) is None:
                continue

            for see_also_link in see_also_links:
                other_jyutping = see_also_link.replace('$', '')

                if (other_entry_page := entry_page_from_jyutping.get(other_jyutping)) is None:
                    continue

                if not other_entry_page.is_done:
                    continue

                other_see_also_links = other_entry_page.page_entry.see_also_links
                if other_see_also_links is None or f'${jyutping}' not in other_see_also_links:
                    raise LintException(f'missing see also link `${jyutping}` under page entry for `{other_jyutping}`')

    @staticmethod
    def lint_character_entry_invariants(character_entries: list['CharacterEntry']):
        character_entries_from_character = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.character)
            for character_entry in character_entries
        )

        for character, character_entries in character_entries_from_character.items():
            Executor.lint_character_entry_r_consistency(character, character_entries)
            Executor.lint_character_entry_h_consistency(character, character_entries)

    @staticmethod
    def lint_character_entry_r_consistency(character: str, character_entries: list['CharacterEntry']):
        character_entries_from_radical_strokes_values = Utilities.collate_firsts_by_second(
            (character_entry, tuple(character_entry.radical_strokes_list))
            for character_entry in character_entries
        )

        if len(character_entries_from_radical_strokes_values) > 1:
            collation_readable = {
                tuple(str(radical_strokes) for radical_strokes in radical_strokes_values):
                    [str(character_entry) for character_entry in character_entries]
                for radical_strokes_values, character_entries in character_entries_from_radical_strokes_values.items()
            }
            raise LintException(f'inconsistent R content for character `{character}`: {collation_readable}')

    @staticmethod
    def lint_character_entry_h_consistency(character: str, character_entries: list['CharacterEntry']):
        character_entries_from_h_content = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.h_content)
            for character_entry in character_entries
        )

        if len(character_entries_from_h_content) > 1:
            collation_readable = {
                h_content: [str(character_entry) for character_entry in character_entries]
                for h_content, character_entries in character_entries_from_h_content.items()
            }
            raise LintException(f'inconsistent H content for character `{character}`: {collation_readable}')

    @staticmethod
    def lint_character_entry_see_also_reciprocation(character_entries: list['CharacterEntry']):
        character_entry_from_jyutping_from_character = Utilities.collate_first_by_second_by_third(
            (character_entry, character_entry.jyutping, character_entry.character)
            for character_entry in character_entries
        )

        for character_entry in character_entries:
            character = character_entry.character

            if (see_also_links := character_entry.see_also_links) is None:
                continue

            for see_also_link in see_also_links:
                if not (other_link_match := re.fullmatch(
                    pattern=r'\$ (?P<other_character_content> \S+? ) (?P<other_jyutping> [a-z]+[1-6] )',
                    string=see_also_link,
                    flags=re.VERBOSE,
                )):
                    raise LintException(f'bad see also link `{see_also_link}` under `{character_entry}`')

                other_character_content = other_link_match.group('other_character_content')
                other_jyutping = other_link_match.group('other_jyutping')

                other_character = CmdIdioms.strip_compositions(other_character_content)
                if character != other_character:
                    raise LintException(
                        f'wrong character `{other_character}` in see also link `{see_also_link}` '
                        f'under `{character_entry}`'
                    )

                try:
                    other_character_entry = character_entry_from_jyutping_from_character[character][other_jyutping]
                except KeyError:
                    continue

                other_see_also_links = other_character_entry.see_also_links
                if other_see_also_links is None or character_entry.universal_link() not in other_see_also_links:
                    raise LintException(
                        f'missing see also link `{character_entry.universal_link()}` '
                        f'under character entry for `{other_character} {other_jyutping}`'
                    )

    @staticmethod
    def _update_entry_links(content: str, entry_pages_from_incipit: dict[str, list['EntryPage']]):
        entry_links_content_expected = '\n'.join([
            '<## entries ##>',
            *[
                '\n'.join([
                    '',
                    f'##{{#{incipit_upper} .modern}} {incipit_upper}',
                    '',
                    '<nav>',
                    '=={.modern}',
                    *[
                        '\n'.join([
                            f'- {link}{parenthetical}'
                            for entry_page in entry_pages
                            if (
                                link := f'${entry_page.page_title}',
                                parenthetical := '' if entry_page.is_done else ' (work in progress)',
                            )
                        ])
                    ],
                    '==',
                    '</nav>',
                    '',
                ])
                for incipit, entry_pages in entry_pages_from_incipit.items()
                if (
                    incipit_upper := incipit.upper(),
                )
            ],
            '<## /entries ##>',
        ])

        return re.sub(
            pattern=r'<## entries ##>.*?<## /entries ##>',
            string=content,
            repl=Utilities.literal_replacement_pattern(entry_links_content_expected),
            flags=re.DOTALL,
        )


def main():
    executor = Executor()
    executor.self_index()
    executor.cross_index()


if __name__ == '__main__':
    main()
