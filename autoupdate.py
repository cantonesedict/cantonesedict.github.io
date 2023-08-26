#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import os
import re
import sys


def is_bad_jyutping_heuristic(string):
    return (
        re.search(pattern=r'\b y', string=string, flags=re.VERBOSE)
        or re.search(pattern=r'[789]', string=string)
    )


def check_jyutping_heuristic(entry_cmd_name, cmd_content):
    bad_jyutping_runs = [
        run
        for run in [
            *re.findall(pattern=r'(?<= \[\[ ) [a-z] .*? (?= \]\] )', string=cmd_content, flags=re.VERBOSE),
            *re.findall(pattern=r'(?<= \( ) [a-z] .*? (?= \) )', string=cmd_content, flags=re.VERBOSE),
        ]
        if is_bad_jyutping_heuristic(run)
    ]
    if bad_jyutping_runs:
        print(
            f'Error in `{entry_cmd_name}`: bad Jyutping in {bad_jyutping_runs}',
            file=sys.stderr,
        )
        sys.exit(1)


def gather_tone_syllable_list(cmd_content):
    return re.findall(
        pattern=r'^ \#\# \{ \#(?P<tone> [1-6] ) .* \[\[ (?P<syllable> [a-z]+ )(?P=tone) .* \]\] $',
        string=cmd_content,
        flags=re.MULTILINE | re.VERBOSE,
    )


def gather_toned_characters_from_tone(cmd_content, tone_syllable_list):
    return {
        tone: [
            re.sub(
                pattern=r'[\[\]]',
                repl='',
                string=toned_character,
            )
            for toned_character in re.findall(
                pattern=fr'^ \#{{3}} [+]? [ ] (?P<toned_character> \[? \S \]? {tone} ) .* \[\[ {syllable}{tone} \]\] $',
                string=cmd_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
        ]
        for tone, syllable in tone_syllable_list
    }


def check_gathered_syllables(entry_cmd_name, tone_syllable_list):
    cmd_syllable = re.sub(
        pattern=r'entries/(?P<syllable>[a-z]+)\.cmd',
        repl=r'\g<syllable>',
        string=entry_cmd_name,
    )

    gathered_syllables = set(s for _, s in tone_syllable_list)
    if gathered_syllables and gathered_syllables != {cmd_syllable}:
        print(
            f'Error in `{entry_cmd_name}`: gathered_syllables {gathered_syllables} != `{{{cmd_syllable}}}`',
            file=sys.stderr,
        )
        sys.exit(1)


def update_entry_tones_navigation(cmd_content, tone_syllable_list):
    return re.sub(
        pattern=r'(?<=<## tones ##>\n).*?(?=<## /tones ##>\n)',
        repl=tones_navigation_cmd_content(tone_syllable_list),
        string=cmd_content,
        flags=re.DOTALL | re.MULTILINE,
    )


def update_entry_character_navigations(cmd_content, toned_characters_from_tone):
    for tone, toned_characters in toned_characters_from_tone.items():
        cmd_content = re.sub(
            pattern=fr'(?<=<## tone-{tone}-characters ##>\n).*?(?=<## /tone-{tone}-characters ##>\n)',
            repl=character_navigation_cmd_content(toned_characters),
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

    return cmd_content


def tones_navigation_cmd_content(tone_syllable_list):
    return '\n'.join([
        '<nav class="sideways">',
        '=={.modern}',
        *[f'- [{syllable}{tone}](#{tone})' for tone, syllable in tone_syllable_list],
        '==',
        '</nav>',
        '',
    ])


def character_navigation_cmd_content(toned_characters):
    return '\n'.join([
        '<nav class="sideways">',
        '=={.modern}',
        *[f'- ${toned_character}' for toned_character in toned_characters],
        '==',
        '</nav>',
        '',
    ])


def update_entry(entry_cmd_name):
    with open(entry_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
        old_cmd_content = old_cmd_file.read()

    check_jyutping_heuristic(entry_cmd_name, old_cmd_content)
    tone_syllable_list = gather_tone_syllable_list(old_cmd_content)
    check_gathered_syllables(entry_cmd_name, tone_syllable_list)
    toned_characters_from_tone = gather_toned_characters_from_tone(old_cmd_content, tone_syllable_list)

    new_cmd_content = old_cmd_content
    new_cmd_content = update_entry_tones_navigation(new_cmd_content, tone_syllable_list)
    new_cmd_content = update_entry_character_navigations(new_cmd_content, toned_characters_from_tone)

    if new_cmd_content == old_cmd_content:
        return

    with open(entry_cmd_name, 'w', encoding='utf-8') as new_cmd_file:
        new_cmd_file.write(new_cmd_content)


def update_entries(entry_cmd_names):
    for entry_cmd_name in entry_cmd_names:
        update_entry(entry_cmd_name)


def gather_entry_cmd_names():
    return sorted([
        os.path.join(directory_path, file_name)
        for directory_path, _, file_names in os.walk('entries/')
        for file_name in file_names
        if file_name.endswith('.cmd') and file_name != 'index.cmd'
    ])


def main():
    entry_cmd_names = gather_entry_cmd_names()
    update_entries(entry_cmd_names)


if __name__ == '__main__':
    main()
