#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import os
import re


def gather_toned_syllables(cmd_content):
    return [
        match.group('syllable')
        for match in re.finditer(
            pattern=r'^\#\# \{ \#(?P<tone> [1-6] ) .* \[\[ (?P<syllable> [a-z]+(?P=tone) ) .* \]\]$',
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )
    ]


def update_entry(entry_cmd_name):
    with open(entry_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
        old_cmd_content = old_cmd_file.read()

    toned_syllables = gather_toned_syllables(old_cmd_content)
    if toned_syllables:
        print(toned_syllables)


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
