#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import os
import re
import sys


class PageUpdator:
    @staticmethod
    def gather_page_cmd_names():
        return sorted([
            os.path.join(directory_path, file_name)
            for directory_path, _, file_names in os.walk('entries/')
            for file_name in file_names
            if file_name.endswith('.cmd') and file_name != 'index.cmd'
        ])

    @staticmethod
    def update_all(page_cmd_names):
        for page_cmd_name in page_cmd_names:
            PageUpdator._update(page_cmd_name)

    @staticmethod
    def _update(page_cmd_name):
        with open(page_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        PageUpdator._check_jyutping_heuristic(page_cmd_name, old_cmd_content)
        tone_syllable_list = PageUpdator._gather_tone_syllable_list(old_cmd_content)
        PageUpdator._check_syllables(page_cmd_name, tone_syllable_list)
        toned_characters_from_tone = PageUpdator._gather_toned_characters_from_tone(old_cmd_content, tone_syllable_list)

        new_cmd_content = old_cmd_content
        new_cmd_content = PageUpdator._update_page_tones_navigation(new_cmd_content, tone_syllable_list)
        new_cmd_content = PageUpdator._update_page_character_navigations(new_cmd_content, toned_characters_from_tone)

        if new_cmd_content == old_cmd_content:
            return

        with open(page_cmd_name, 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    @staticmethod
    def _check_jyutping_heuristic(page_cmd_name, cmd_content):
        bad_jyutping_runs = [
            run
            for run in re.findall(pattern=r'\b[a-z]+[1-9]\b', string=cmd_content, flags=re.VERBOSE)
            if PageUpdator._is_bad_jyutping_heuristic(run)
        ]
        if bad_jyutping_runs:
            print(
                f'Error in `{page_cmd_name}`: bad Jyutping in {bad_jyutping_runs}',
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
    def _check_syllables(page_cmd_name, tone_syllable_list):
        cmd_syllable = re.sub(
            pattern=r'entries/(?P<syllable>[a-z]+)\.cmd',
            repl=r'\g<syllable>',
            string=page_cmd_name,
        )

        gathered_syllables = set(s for _, s in tone_syllable_list)
        if gathered_syllables and gathered_syllables != {cmd_syllable}:
            print(
                f'Error in `{page_cmd_name}`: gathered_syllables {gathered_syllables} != `{{{cmd_syllable}}}`',
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
            repl=PageUpdator._tones_navigation_cmd_content(tone_syllable_list),
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

    @staticmethod
    def _update_page_character_navigations(cmd_content, toned_characters_from_tone):
        for tone, toned_characters in toned_characters_from_tone.items():
            cmd_content = re.sub(
                pattern=fr'(?<=<## tone-{tone}-characters ##>\n).*?(?=<## /tone-{tone}-characters ##>\n)',
                repl=PageUpdator._character_navigation_cmd_content(toned_characters),
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


def count_entries(cmd_content, category):
    if category == 'all':
        regex_pattern = r'^#{3}(?!#)'
    elif category == 'present':
        regex_pattern = r'^#{3}(?= )'
    elif category == 'added':
        regex_pattern = r'^#{3}(?=\+)'
    else:
        raise ValueError

    return len(re.findall(pattern=regex_pattern, string=cmd_content, flags=re.MULTILINE))


def count_todos(cmd_content):
    return len(re.findall(pattern='TODO', string=cmd_content))


def gather_page_cmd_content(page_cmd_names):
    cmd_content_from_name = {}

    for page_cmd_name in page_cmd_names:
        with open(page_cmd_name, 'r', encoding='utf-8') as cmd_file:
            cmd_content = cmd_file.read()

        cmd_content_from_name[page_cmd_name] = cmd_content

    return cmd_content_from_name


def main():
    page_cmd_names = PageUpdator.gather_page_cmd_names()
    PageUpdator.update_all(page_cmd_names)

    cmd_content_from_name = gather_page_cmd_content(page_cmd_names)
    page_count = len(page_cmd_names)
    wip_count = sum('work in progress' in cmd_content.lower() for cmd_content in cmd_content_from_name.values())
    entry_count = sum(count_entries(cmd_content, category='all') for cmd_content in cmd_content_from_name.values())
    present_count = sum(count_entries(cmd_content, category='present') for cmd_content in cmd_content_from_name.values())
    added_count = sum(count_entries(cmd_content, category='added') for cmd_content in cmd_content_from_name.values())
    todo_count = sum(count_todos(cmd_content) for cmd_content in cmd_content_from_name.values())

    print(f'Statistics:')
    print(f'- {page_count} pages')
    print(f'  - {wip_count}/{page_count} = {wip_count/page_count :.1%} work in progress')
    print(f'  - {page_count - wip_count}/{page_count} = {(page_count - wip_count)/page_count :.1%} done')
    print(f'- {entry_count} entries')
    print(f'  - {present_count}/{entry_count} = {present_count/entry_count :.1%} present')
    print(f'  - {added_count}/{entry_count} = {added_count/entry_count :.1%} added')
    print(f'- {todo_count} todos')


if __name__ == '__main__':
    main()
