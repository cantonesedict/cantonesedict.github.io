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


def check_jyutping_heuristic(page_cmd_name, cmd_content):
    bad_jyutping_runs = [
        run
        for run in re.findall(pattern=r'\b[a-z]+[1-9]\b', string=cmd_content, flags=re.VERBOSE)
        if is_bad_jyutping_heuristic(run)
    ]
    if bad_jyutping_runs:
        print(
            f'Error in `{page_cmd_name}`: bad Jyutping in {bad_jyutping_runs}',
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


def check_gathered_syllables(page_cmd_name, tone_syllable_list):
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


def update_page_tones_navigation(cmd_content, tone_syllable_list):
    return re.sub(
        pattern=r'(?<=<## tones ##>\n).*?(?=<## /tones ##>\n)',
        repl=tones_navigation_cmd_content(tone_syllable_list),
        string=cmd_content,
        flags=re.DOTALL | re.MULTILINE,
    )


def update_page_character_navigations(cmd_content, toned_characters_from_tone):
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


def update_page(page_cmd_name):
    with open(page_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
        old_cmd_content = old_cmd_file.read()

    check_jyutping_heuristic(page_cmd_name, old_cmd_content)
    tone_syllable_list = gather_tone_syllable_list(old_cmd_content)
    check_gathered_syllables(page_cmd_name, tone_syllable_list)
    toned_characters_from_tone = gather_toned_characters_from_tone(old_cmd_content, tone_syllable_list)

    new_cmd_content = old_cmd_content
    new_cmd_content = update_page_tones_navigation(new_cmd_content, tone_syllable_list)
    new_cmd_content = update_page_character_navigations(new_cmd_content, toned_characters_from_tone)

    if new_cmd_content == old_cmd_content:
        return

    with open(page_cmd_name, 'w', encoding='utf-8') as new_cmd_file:
        new_cmd_file.write(new_cmd_content)


def update_pages(page_cmd_names):
    for page_cmd_name in page_cmd_names:
        update_page(page_cmd_name)


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


def gather_page_cmd_names():
    return sorted([
        os.path.join(directory_path, file_name)
        for directory_path, _, file_names in os.walk('entries/')
        for file_name in file_names
        if file_name.endswith('.cmd') and file_name != 'index.cmd'
    ])


def gather_page_cmd_contents(page_cmd_names):
    cmd_contents = []

    for page_cmd_name in page_cmd_names:
        with open(page_cmd_name, 'r', encoding='utf-8') as cmd_file:
            cmd_content = cmd_file.read()

        cmd_contents.append(cmd_content)

    return cmd_contents


def main():
    page_cmd_names = gather_page_cmd_names()
    update_pages(page_cmd_names)

    cmd_contents = gather_page_cmd_contents(page_cmd_names)
    page_count = len(page_cmd_names)
    wip_count = sum('work in progress' in cmd_content.lower() for cmd_content in cmd_contents)
    entry_count = sum(count_entries(cmd_content, category='all') for cmd_content in cmd_contents)
    present_count = sum(count_entries(cmd_content, category='present') for cmd_content in cmd_contents)
    added_count = sum(count_entries(cmd_content, category='added') for cmd_content in cmd_contents)

    print(f'Statistics:')
    print(f'- {page_count} pages')
    print(f'  - {wip_count}/{page_count} = {wip_count/page_count :.1%} work in progress')
    print(f'  - {page_count - wip_count}/{page_count} = {(page_count - wip_count)/page_count :.1%} done')
    print(f'- {entry_count} entries')
    print(f'  - {present_count}/{entry_count} = {present_count/entry_count :.1%} present')
    print(f'  - {added_count}/{entry_count} = {added_count/entry_count :.1%} added')


if __name__ == '__main__':
    main()
