#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import os
import re
import sys


def gather_tone_syllable_list(cmd_content):
    return re.findall(
        pattern=r'^ \#\# \{ \#(?P<tone> [1-6] ) .* \[\[ (?P<syllable> [a-z]+ )(?P=tone) .* \]\] $',
        string=cmd_content,
        flags=re.MULTILINE | re.VERBOSE,
    )


def gather_toned_characters_from_tone(cmd_content, tone_syllable_list):
    return {
        tone: re.findall(
            pattern=fr'^ \#{{3}} [+]? [ ] (?P<toned_character> \S {tone} ) .* \[\[ {syllable}{tone} \]\] $',
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )
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


def update_entry(entry_cmd_name):
    with open(entry_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
        old_cmd_content = old_cmd_file.read()

    tone_syllable_list = gather_tone_syllable_list(old_cmd_content)
    check_gathered_syllables(entry_cmd_name, tone_syllable_list)
    toned_characters_from_tone = gather_toned_characters_from_tone(old_cmd_content, tone_syllable_list)
    if toned_characters_from_tone:
        print(toned_characters_from_tone)


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
