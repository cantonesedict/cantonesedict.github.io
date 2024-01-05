#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import collections
import json
import os
import re
import sys


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
RADICAL_NORMALISATION_TABLE = str.maketrans(CJK_UNIFIED_IDEOGRAPH_RADICALS, KANGXI_RADICALS)


class Updater:
    def __init__(self):
        self.cmd_names = sorted([
            os.path.join(directory_path, file_name)
            for directory_path, _, file_names in os.walk('entries/')
            for file_name in file_names
            if file_name.endswith('.cmd') and file_name not in ['index.cmd', 'cantonese.cmd']
        ])

    def update_all(self):
        for cmd_name in self.cmd_names:
            Updater._update(cmd_name)

    @staticmethod
    def _update(cmd_name):
        with open(cmd_name, 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        Updater._check_jyutping_heuristic(cmd_name, old_cmd_content)
        tone_syllable_list = Updater._gather_tone_syllable_list(old_cmd_content)
        Updater._check_syllables(cmd_name, tone_syllable_list)
        toned_characters_from_tone = Updater._gather_toned_characters_from_tone(old_cmd_content, tone_syllable_list)

        new_cmd_content = old_cmd_content
        new_cmd_content = Updater._normalise_radicals(new_cmd_content)
        new_cmd_content = Updater._update_page_tones_navigation(new_cmd_content, tone_syllable_list)
        new_cmd_content = Updater._update_page_character_navigations(new_cmd_content, toned_characters_from_tone)

        if new_cmd_content == old_cmd_content:
            return

        with open(cmd_name, 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    @staticmethod
    def _check_jyutping_heuristic(cmd_name, cmd_content):
        bad_jyutping_runs = [
            run
            for run in re.findall(pattern=r'\b[a-z]+[1-9]\b', string=cmd_content, flags=re.VERBOSE)
            if Updater._is_bad_jyutping_heuristic(run)
        ]
        if bad_jyutping_runs:
            print(
                f'Error in `{cmd_name}`: bad Jyutping in {bad_jyutping_runs}',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _is_bad_jyutping_heuristic(string):
        return (
            re.search(pattern=r'\b y', string=string, flags=re.VERBOSE)
            or re.search(pattern=r'[789]', string=string)
        )

    @staticmethod
    def _gather_tone_syllable_list(cmd_content):
        return re.findall(
            pattern=r'^ \#\# \{ \#(?P<tone> [1-6] ) .* \[\[ (?P<syllable> [a-z]+ )(?P=tone) .* \]\] $',
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )

    @staticmethod
    def _check_syllables(cmd_name, tone_syllable_list):
        cmd_syllable = re.sub(
            pattern=r'entries/(?P<syllable>[a-z]+)\.cmd',
            repl=r'\g<syllable>',
            string=cmd_name,
        )

        gathered_syllables = set(s for _, s in tone_syllable_list)
        if gathered_syllables and gathered_syllables != {cmd_syllable}:
            print(
                f'Error in `{cmd_name}`: gathered_syllables {gathered_syllables} != `{{{cmd_syllable}}}`',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _gather_toned_characters_from_tone(cmd_content, tone_syllable_list):
        return {
            tone: [
                re.sub(
                    pattern=r'[\[\]]',
                    repl='',
                    string=toned_character,
                )
                for toned_character in re.findall(
                    pattern=fr'^ \#\#\# [+]? [ ] (?P<toned_character> \[?\S\]? {tone} ) .* \[\[{syllable}{tone}\]\] $',
                    string=cmd_content,
                    flags=re.MULTILINE | re.VERBOSE,
                )
            ]
            for tone, syllable in tone_syllable_list
        }

    @staticmethod
    def _normalise_radicals(cmd_content):
        return re.sub(
            pattern=r'^R\n  (?P<radical>\S) [+] (?P<residual_stroke_count>[0-9]+)$',
            repl=lambda match: match.group().translate(RADICAL_NORMALISATION_TABLE),
            string=cmd_content,
            flags=re.MULTILINE,
        )

    @staticmethod
    def _update_page_tones_navigation(cmd_content, tone_syllable_list):
        return re.sub(
            pattern=r'(?<=<## tones ##>\n).*?(?=<## /tones ##>\n)',
            repl=Updater._tones_navigation_cmd_content(tone_syllable_list),
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

    @staticmethod
    def _update_page_character_navigations(cmd_content, toned_characters_from_tone):
        for tone, toned_characters in toned_characters_from_tone.items():
            cmd_content = re.sub(
                pattern=fr'(?<=<## tone-{tone}-characters ##>\n).*?(?=<## /tone-{tone}-characters ##>\n)',
                repl=Updater._character_navigation_cmd_content(toned_characters),
                string=cmd_content,
                flags=re.DOTALL | re.MULTILINE,
            )

        return cmd_content

    @staticmethod
    def _tones_navigation_cmd_content(tone_syllable_list):
        return '\n'.join([
            '<nav class="sideways">',
            '=={.modern}',
            *[f'- [{syllable}{tone}](#{tone})' for tone, syllable in tone_syllable_list],
            '==',
            '</nav>',
            '',
        ])

    @staticmethod
    def _character_navigation_cmd_content(toned_characters):
        return '\n'.join([
            '<nav class="sideways">',
            '=={.modern}',
            *[f'- ${toned_character}' for toned_character in toned_characters],
            '==',
            '</nav>',
            '',
        ])


class Indexer:
    def __init__(self, cmd_names):
        self.pages = [
            Page(cmd_name)
            for cmd_name in cmd_names
        ]

        self.cantonese_entries = [
            entry
            for page in self.pages
            for entry in page.cantonese_entries
        ]
        self.split_cantonese_entries = sorted([
            split_entry
            for entry in self.cantonese_entries
            for split_entry in entry.split()
        ])

        self.character_entries = [
            entry
            for page in self.pages
            for entry in page.character_entries
        ]
        self.character_index_object = self._gather_character_index()
        self.radical_index_object = self._gather_radical_index()

        Indexer._check_cantonese_entries(self.cantonese_entries)

    def update_cantonese(self):
        with open('entries/cantonese.cmd', 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        new_cmd_content = self._update_cantonese_table_body(old_cmd_content)

        if new_cmd_content == old_cmd_content:
            return

        with open('entries/cantonese.cmd', 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    def write_character_index(self):
        raw_json = json.dumps(self.character_index_object, ensure_ascii=False, separators=(',', ':'))
        nice_json = raw_json.replace('],', '],\n') + '\n'  # newlines but only at the top level

        with open('entries/character-index.json', 'w', encoding='utf-8') as json_file:
            json_file.write(nice_json)

    def write_radical_index(self):
        raw_json = json.dumps(self.radical_index_object, ensure_ascii=False, separators=(',', ':'), sort_keys=True)
        nice_json = raw_json.replace('},', '},\n') + '\n'  # newlines but only at the top level

        with open('entries/radical-index.json', 'w', encoding='utf-8') as json_file:
            json_file.write(nice_json)

    def _gather_character_index(self):
        # {character: [jyutping, ...], ...}
        object_ = collections.defaultdict(list)
        for entry in self.character_entries:
            object_[entry.identify()].append(entry.jyutping)

        return object_

    def _gather_radical_index(self):
        # {radical: {residual_stroke_count: {character: [jyutping, ...]}}}
        object_ = collections.defaultdict(lambda: collections.defaultdict(lambda: collections.defaultdict(list)))
        for entry in self.character_entries:
            object_[entry.radical][entry.residual_stroke_count][entry.identify()].append(entry.jyutping)

        return object_

    def _update_cantonese_table_body(self, cmd_content):
        return re.sub(
            pattern=r'(?<=<## cantonese-table-body ##>\n).*?(?=<## /cantonese-table-body ##>\n)',
            repl=self._cantonese_table_body_cmd_content(),
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

    def _cantonese_table_body_cmd_content(self):
        return '\n'.join([
            *[
                '\n'.join([
                    f'  //',
                    f'    , {split_cantonese_entry.term_jyutping}',
                    f'    , {split_cantonese_entry.term}',
                    f'    , [{split_cantonese_entry.relative_url}]({split_cantonese_entry.relative_url})',
                    '',
                ])
                for split_cantonese_entry in self.split_cantonese_entries
            ],
            '',
        ])

    @staticmethod
    def _check_cantonese_entries(cantonese_entries):
        relative_urls = [
            cantonese_entry.relative_url
            for cantonese_entry in cantonese_entries
        ]

        duplicates = [
            item
            for item, count in collections.Counter(relative_urls).items()
            if count > 1
        ]
        if duplicates:
            print(
                f'Error: duplicate cantonese entry relative URLs {duplicates}',
                file=sys.stderr,
            )
            sys.exit(1)


class Page:
    def __init__(self, cmd_name):
        with open(cmd_name, 'r', encoding='utf-8') as cmd_file:
            cmd_content = cmd_file.read()

        self.jyutping = re.sub(pattern=r'entries/(?P<jyutping>[a-z]+)\.cmd', repl=r'\g<jyutping>', string=cmd_name)
        self.cmd_content = cmd_content
        self.cantonese_entries = [
            CantoneseEntry(
                match.group('term'),
                match.group('disambiguation'),
                match.group('term_jyutping'),
                self.jyutping,
            )
            for match in re.finditer(
                pattern=r'[-][ ]【(?P<term>[^\s-]+)(?P<disambiguation>[\S]*)】 \((?P<term_jyutping>.+?)\)',
                string=cmd_content,
            )
        ]
        self.character_entries = [
            CharacterEntry(
                match.group('character'),
                match.group('code_point'),
                match.group('radical'),
                int(match.group('residual_stroke_count')),
                match.group('jyutping'),
                match.group('composition'),
            )
            for match in re.finditer(
                pattern=(
                    r'^#{3}[+]?'
                    r'[ ]'
                    r'\[?(?P<character>\S)\]?.'
                    r'(?:[ ]\[\[(?P<composition>.+?)\]\])?'
                    r'[ ][|][ ]'
                    r'.*?'
                    r'\[\[(?P<jyutping>[a-z]+?[1-6])\]\]'
                    r'\n\n'
                    r'[$]{2}\n'
                    r'R\n'
                    r'[ ]{2}(?P<radical>\S)[ ][+][ ](?P<residual_stroke_count>[0-9]+)\n'
                    r'U\n'
                    r'[ ]{2}(?P<code_point>U[+][0-9A-F]{4,5})$'
                ),
                string=cmd_content,
                flags=re.MULTILINE,
            )
        ]


class CantoneseEntry:
    def __init__(self, term, disambiguation, term_jyutping, page_jyutping):
        self.term = term
        self.disambiguation = disambiguation
        self.term_jyutping = term_jyutping
        self.page_jyutping = page_jyutping
        self.relative_url = f'{page_jyutping}#cantonese-{term}{disambiguation}'

    def split(self):
        return (
            SplitCantoneseEntry(self.term, self.disambiguation, split_term_jyutping, self.page_jyutping)
            for split_term_jyutping in re.split(pattern=r'\s*,\s*', string=self.term_jyutping)
        )


class CharacterEntry:
    def __init__(self, character, code_point, radical, residual_stroke_count, jyutping, composition):
        if radical not in KANGXI_RADICALS:
            print(f'Error: radical {radical} is not in the Kangxi Radicals Unicode block', file=sys.stderr)
            sys.exit(1)

        code_point_int = int(code_point[2:], 16)
        if character != chr(code_point_int):
            print(f'Error: character {character} is not {code_point}', file=sys.stderr)
            sys.exit(1)

        if code_point_int > 0x1FFFF:
            if not composition:
                print(f'Error: missing composition for rare character {character} {code_point}', file=sys.stderr)
                sys.exit(1)
        else:
            if composition:
                print(f'Error: unnecessary composition for character {character} {code_point}', file=sys.stderr)
                sys.exit(1)

        self.character = character
        self.code_point = code_point
        self.radical = radical
        self.residual_stroke_count = residual_stroke_count
        self.jyutping = jyutping
        self.composition = composition

    def identify(self):
        return f'{self.character}{f" ({self.composition})" if self.composition else ""}'


class SplitCantoneseEntry(CantoneseEntry):
    def __lt__(self, other):
        return (self.term_jyutping, self.term) < (other.term_jyutping, other.term)


class Statistician:
    def __init__(self, indexer):
        pages = indexer.pages
        self.page_count = len(pages)
        self.wip_count = sum('work in progress' in page.cmd_content.lower() for page in pages)
        self.done_count = self.page_count - self.wip_count
        self.entry_count = sum(Statistician._count_entries(page.cmd_content, category='all') for page in pages)
        self.present_count = sum(Statistician._count_entries(page.cmd_content, category='present') for page in pages)
        self.added_count = sum(Statistician._count_entries(page.cmd_content, category='added') for page in pages)
        self.todo_count = sum(Statistician._count_todos(page.cmd_content) for page in pages)

        if self.entry_count != len(indexer.character_entries):
            print(
                f'entry_count ({self.entry_count}) ≠ len(character_entries) ({len(indexer.character_entries)})',
                file=sys.stderr,
            )
            sys.exit(1)

    def print_statistics(self):
        print(f'Statistics:')
        print(f'- {self.page_count} pages')
        print(f'  - {self.wip_count}/{self.page_count} = {self.wip_count / self.page_count :.1%} work in progress')
        print(f'  - {self.done_count}/{self.page_count} = {self.done_count / self.page_count :.1%} done')
        print(f'- {self.entry_count} entries')
        print(f'  - {self.present_count}/{self.entry_count} = {self.present_count / self.entry_count :.1%} present')
        print(f'  - {self.added_count}/{self.entry_count} = {self.added_count / self.entry_count :.1%} added')
        print(f'- {self.todo_count} todos')

    @staticmethod
    def _count_entries(cmd_content, category):
        if category == 'all':
            regex_pattern = r'^#{3}(?!#)'
        elif category == 'present':
            regex_pattern = r'^#{3}(?= )'
        elif category == 'added':
            regex_pattern = r'^#{3}(?=\+)'
        else:
            raise ValueError
    
        return len(re.findall(pattern=regex_pattern, string=cmd_content, flags=re.MULTILINE))

    @staticmethod
    def _count_todos(cmd_content):
        return len(re.findall(pattern='TODO', string=cmd_content))


def main():
    updater = Updater()
    updater.update_all()

    indexer = Indexer(updater.cmd_names)
    indexer.update_cantonese()
    indexer.write_character_index()
    indexer.write_radical_index()

    statistician = Statistician(indexer)
    statistician.print_statistics()


if __name__ == '__main__':
    main()
