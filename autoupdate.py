#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import os
import re
import sys


class Updator:
    def __init__(self):
        self.cmd_names = sorted([
            os.path.join(directory_path, file_name)
            for directory_path, _, file_names in os.walk('entries/')
            for file_name in file_names
            if file_name.endswith('.cmd') and file_name != 'index.cmd'
        ])

    def update_all(self):
        for cmd_name in self.cmd_names:
            Updator._update(cmd_name)

    @staticmethod
    def _update(cmd_name):
        with open(cmd_name, 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        Updator._check_jyutping_heuristic(cmd_name, old_cmd_content)
        tone_syllable_list = Updator._gather_tone_syllable_list(old_cmd_content)
        Updator._check_syllables(cmd_name, tone_syllable_list)
        toned_characters_from_tone = Updator._gather_toned_characters_from_tone(old_cmd_content, tone_syllable_list)

        new_cmd_content = old_cmd_content
        new_cmd_content = Updator._update_page_tones_navigation(new_cmd_content, tone_syllable_list)
        new_cmd_content = Updator._update_page_character_navigations(new_cmd_content, toned_characters_from_tone)

        if new_cmd_content == old_cmd_content:
            return

        with open(cmd_name, 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    @staticmethod
    def _check_jyutping_heuristic(cmd_name, cmd_content):
        bad_jyutping_runs = [
            run
            for run in re.findall(pattern=r'\b[a-z]+[1-9]\b', string=cmd_content, flags=re.VERBOSE)
            if Updator._is_bad_jyutping_heuristic(run)
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
    def _update_page_tones_navigation(cmd_content, tone_syllable_list):
        return re.sub(
            pattern=r'(?<=<## tones ##>\n).*?(?=<## /tones ##>\n)',
            repl=Updator._tones_navigation_cmd_content(tone_syllable_list),
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

    @staticmethod
    def _update_page_character_navigations(cmd_content, toned_characters_from_tone):
        for tone, toned_characters in toned_characters_from_tone.items():
            cmd_content = re.sub(
                pattern=fr'(?<=<## tone-{tone}-characters ##>\n).*?(?=<## /tone-{tone}-characters ##>\n)',
                repl=Updator._character_navigation_cmd_content(toned_characters),
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


class Page:
    def __init__(self, cmd_name):
        with open(cmd_name, 'r', encoding='utf-8') as cmd_file:
            cmd_content = cmd_file.read()

        self.cmd_name = cmd_name
        self.cmd_content = cmd_content


class Statistician:
    def __init__(self, indexer):
        pages = indexer.pages
        self.page_count = len(pages)
        self.wip_count = sum('work in progress' in page.cmd_content.lower() for page in pages)
        self.entry_count = sum(Statistician._count_entries(page.cmd_content, category='all') for page in pages)
        self.present_count = sum(Statistician._count_entries(page.cmd_content, category='present') for page in pages)
        self.added_count = sum(Statistician._count_entries(page.cmd_content, category='added') for page in pages)
        self.todo_count = sum(Statistician._count_todos(page.cmd_content) for page in pages)

    def print_statistics(self):
        print(f'Statistics:')
        print(f'- {self.page_count} pages')
        print(f'  - {self.wip_count}/{self.page_count} = {self.wip_count / self.page_count :.1%} work in progress')
        print(f'  - {self.page_count - self.wip_count}/{self.page_count} = {(self.page_count - self.wip_count) / self.page_count :.1%} done')
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
    updator = Updator()
    updator.update_all()

    indexer = Indexer(updator.cmd_names)

    statistician = Statistician(indexer)
    statistician.print_statistics()


if __name__ == '__main__':
    main()
