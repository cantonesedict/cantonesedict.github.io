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
        self.entry_cmd_names = sorted([
            os.path.join(directory_path, file_name)
            for directory_path, _, file_names in os.walk('entries/')
            for file_name in file_names
            if file_name.endswith('.cmd') and file_name not in ['index.cmd']
        ])

    def update_all(self):
        for entry_cmd_name in self.entry_cmd_names:
            Updater._update(entry_cmd_name)

    @staticmethod
    def _update(entry_cmd_name):
        with open(entry_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        Updater._check_title(entry_cmd_name, old_cmd_content)
        Updater._check_williams_locator_heuristic(entry_cmd_name, old_cmd_content)
        Updater._check_ellipsis_item_punctuation(entry_cmd_name, old_cmd_content)
        Updater._check_typography_heuristic(entry_cmd_name, old_cmd_content)
        Updater._check_post_tone_commas_heuristic(entry_cmd_name, old_cmd_content)
        Updater._check_williams_romanisation_heuristic(entry_cmd_name, old_cmd_content)
        Updater._check_jyutping_romanisation_heuristic(entry_cmd_name, old_cmd_content)
        Updater._check_composition_heuristic(entry_cmd_name, old_cmd_content)
        Updater._check_insertion_context(entry_cmd_name, old_cmd_content)
        Updater._check_inadvertent_reference_definition(entry_cmd_name, old_cmd_content)

        tone_syllable_ct_list = Updater._gather_tone_syllable_ct_list(old_cmd_content)
        navigation_tones = Updater._gather_navigation_tones(old_cmd_content)
        toned_characters_from_tone = Updater._gather_toned_characters_from_tone(old_cmd_content, tone_syllable_ct_list)

        Updater._check_syllables(entry_cmd_name, tone_syllable_ct_list)
        Updater._check_tones(entry_cmd_name, tone_syllable_ct_list, navigation_tones)
        Updater._check_canto_tones(entry_cmd_name, tone_syllable_ct_list)

        williams_h1s = Updater._gather_williams_h1s(old_cmd_content)
        williams_h2s_from_tone = Updater._gather_williams_h2s_from_tone(old_cmd_content, navigation_tones)
        williams_h3s_from_tone = Updater._gather_williams_h3s_from_tone(old_cmd_content, navigation_tones)
        is_done = '(Work in progress)' not in old_cmd_content

        Updater._check_williams_h2_h3_consistency(entry_cmd_name, williams_h2s_from_tone, williams_h3s_from_tone)
        Updater._check_williams_h1_h2_consistency(entry_cmd_name, williams_h1s, williams_h2s_from_tone, is_done)

        new_cmd_content = old_cmd_content
        new_cmd_content = Updater._normalise_radicals(new_cmd_content)
        new_cmd_content = Updater._update_page_tones_navigation(new_cmd_content, tone_syllable_ct_list)
        new_cmd_content = Updater._update_page_character_navigations(new_cmd_content, toned_characters_from_tone)

        if new_cmd_content == old_cmd_content:
            return

        with open(entry_cmd_name, 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    @staticmethod
    def _check_title(entry_cmd_name, cmd_content):
        title_match = re.search(pattern=r'^\* %title --> (?P<title>[a-z]+)$', string=cmd_content, flags=re.MULTILINE)
        if not title_match:
            print(f'Error in `{entry_cmd_name}`: Title not found')
            sys.exit(1)

        title = title_match.group('title')
        cmd_syllable = re.sub(
            pattern=r'entries/(?P<syllable>[a-z]+)\.cmd',
            repl=r'\g<syllable>',
            string=entry_cmd_name,
        )

        if title != cmd_syllable:
            print(
                f'Error in `{entry_cmd_name}`: Title {title} does not match Jyutping syllable {cmd_syllable}',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_williams_locator_heuristic(entry_cmd_name, cmd_content):
        bad_locator_item_runs = [
            run
            for run in re.findall(pattern=r'- \[\[Page~.*', string=cmd_content, flags=re.MULTILINE)
            if not re.search(pattern=r'\([1-9]\)', string=run)
        ]
        if bad_locator_item_runs:
            print(
                f'Error in `{entry_cmd_name}`: Williams locator items {bad_locator_item_runs} without tone symbol',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_ellipsis_item_punctuation(entry_cmd_name, cmd_content):
        bad_ellipsis_item_match = re.search(pattern=r'- \[\[\.\.\.\]\]$', string=cmd_content, flags=re.MULTILINE)
        if bad_ellipsis_item_match:
            print(
                f'Error in `{entry_cmd_name}`: ellipsis item without punctuation '
                f'(suppress error with caret if missing punctuation is legitimate)',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_typography_heuristic(entry_cmd_name, cmd_content):
        bad_quotes_context_match = re.search(pattern=r'\S*[‘’“”]\S*', string=cmd_content)
        if bad_quotes_context_match:
            bad_quotes_context = bad_quotes_context_match.group()
            print(
                f'Error in `{entry_cmd_name}`: non-straight quotation present in `{bad_quotes_context}`',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_post_tone_commas_heuristic(entry_cmd_name, cmd_content):
        extraneous_context_match = re.search(
            pattern=r"_ [^_\n]+? (?: \([36789]\) | ' ) _ \s* (?: \( | \[\[ ) .+? (?: \) | \]\] ) ,",
            string=cmd_content,
            flags=re.VERBOSE,
        )
        if extraneous_context_match:
            extraneous_context = re.sub(pattern=r'[\s]+', repl=' ', string=extraneous_context_match.group())
            print(
                f'Error in `{entry_cmd_name}`: extraneous post-tone comma in `{extraneous_context}` '
                f'(suppress error with caret if comma is legitimate)',
                file=sys.stderr,
            )
            sys.exit(1)

        missing_context_match = re.search(
            pattern=r"_ [^_\n]+? \([1245]\)\S+[^'] _ \s* (?: \( | \[\[ ) .+? (?: \) | \]\] ) $",
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )
        if missing_context_match:
            missing_context = re.sub(pattern=r'[\s]+', repl=' ', string=missing_context_match.group())
            print(
                f'Error in `{entry_cmd_name}`: missing post-tone comma in `{missing_context}` '
                f'(suppress error with caret if missing comma is legitimate)',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_williams_romanisation_heuristic(entry_cmd_name, cmd_content):
        bad_williams_entering_runs = re.findall(pattern=r'\S+[ptk]\([1-6]\)', string=cmd_content)
        if bad_williams_entering_runs:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams entering tone in {bad_williams_entering_runs}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_left_tone_runs = re.findall(
            pattern=r'_ [^_\n]+? \([1245]\)[_ ]',
            string=cmd_content,
            flags=re.VERBOSE,
        )
        if bad_williams_left_tone_runs:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams left-tone position in {bad_williams_left_tone_runs}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_right_tone_runs = re.findall(
            pattern=r'[_ ]\([36789]\) [^_\n]+?_',
            string=cmd_content,
            flags=re.VERBOSE,
        )
        if bad_williams_right_tone_runs:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams right-tone position in {bad_williams_right_tone_runs}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_aspirate_runs = re.findall(
            pattern=r"\S+ (?<! .p | .t | .k | kw | ts | ch ) \( ' \) \S+ ",
            string=cmd_content,
            flags=re.IGNORECASE | re.VERBOSE,
        )
        if bad_williams_aspirate_runs:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams aspirate in {bad_williams_aspirate_runs}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_diphthong_runs = re.findall(
            pattern=r'\S+ (?: \(i/\)u | u\(i/\) ) \S+',
            string=cmd_content,
            flags=re.IGNORECASE | re.VERBOSE,
        )
        if bad_williams_diphthong_runs:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams diphthong in {bad_williams_diphthong_runs}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_nasal_apostrophe = re.findall(
            pattern="(?: m | ng ) ' ",
            string=cmd_content,
            flags=re.IGNORECASE | re.VERBOSE,
        )
        if bad_williams_nasal_apostrophe:
            print(
                f'Error in `{entry_cmd_name}`: wrong-side Williams nasal apostrophe in {bad_williams_nasal_apostrophe}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_apical_apostrophe = re.findall(
            pattern=r"\S+ sz [^'] \S+",
            string=cmd_content,
            flags=re.IGNORECASE | re.VERBOSE,
        )
        if bad_williams_apical_apostrophe:
            print(
                f'Error in `{entry_cmd_name}`: missing Williams apical apostrophe in {bad_williams_apical_apostrophe}',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_unaspirated_tone_45 = re.findall(
            pattern=r"\([45]\) (?: p | t(?!s) | k(?!w) | kw | ts | ch) (?! \( ' \) ) \S+",
            string=cmd_content,
            flags=re.IGNORECASE | re.VERBOSE,
        )
        if bad_williams_unaspirated_tone_45:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams unaspirated tone 4 or 5 {bad_williams_unaspirated_tone_45} '
                f'(suppress error with caret if unaspiration is legitimate)',
                file=sys.stderr,
            )
            sys.exit(1)

        bad_williams_aspirated_tone_6 = re.findall(
            pattern=r"(?: p | t | k | kw | ts | ch) \( ' \) (?! \^ ) \S+ \(6\)",
            string=cmd_content,
            flags=re.IGNORECASE | re.VERBOSE,
        )
        if bad_williams_aspirated_tone_6:
            print(
                f'Error in `{entry_cmd_name}`: bad Williams aspirated tone 6 {bad_williams_aspirated_tone_6} '
                f'(suppress error with caret if aspiration is legitimate)',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_jyutping_romanisation_heuristic(entry_cmd_name, cmd_content):
        bad_jyutping_runs = [
            run
            for run in re.findall(pattern=r'\b[a-z]+[1-9]\b', string=cmd_content)
            if Updater._is_bad_jyutping_heuristic(run)
        ]
        if bad_jyutping_runs:
            print(
                f'Error in `{entry_cmd_name}`: bad Jyutping in {bad_jyutping_runs}',
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
    def _check_composition_heuristic(entry_cmd_name, cmd_content):
        whitelisted_characters = ''.join([
            '𠂉',
            '𠆢',
            '𠫓',
            '𡈼',
            '𤣩',
            '𥫗',
            '𦈢',
            '𦣝',
            '𦣞',
            '𦥑',
            '𧶠',
            '𧾷',
        ])
        unexpanded_characters = re.findall(
            pattern=f'(?![{whitelisted_characters}])[𠀀-𱍊](?![=@^])',
            string=cmd_content,
        )
        if unexpanded_characters:
            print(
                f'Error in `{entry_cmd_name}`: missing composition for extension characters {unexpanded_characters} '
                f'(suppress error with at (in run) or caret (alone) if omission is legitimate)',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_insertion_context(entry_cmd_name, cmd_content):
        nonexempt_cmd_content = re.sub(
            pattern=r'''
                ^ \# \{ \.williams \} .*
                    |
                ^ \#\# \{ \#[1-6] [ ] \.williams \} .*
                    |
                ^ \#\#\# [ ] .*
                    |
                ^ (WH | WV | F | W) \n (?: [ ]{2} .* \n )+
                    |
                ^ \-\- \{ \.williams \} \n [\s\S]*? \n \-\- \n
            ''',
            repl='',
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )
        non_contextual_insertion_contexts = re.findall(
            pattern=r'.* \[\[ [\s\S]*? \]\] | <ins.*> .*',
            string=nonexempt_cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )
        if non_contextual_insertion_contexts:
            print(
                f'Error in `{entry_cmd_name}`: non-contextual insertions {non_contextual_insertion_contexts}',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_inadvertent_reference_definition(entry_cmd_name, cmd_content):
        inadvertent_runs = re.findall(
            pattern=r'[^\S\n]+ \[ [\s]* [^\]]*? [\s]* \] [:] [\S]+ $',
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )
        if inadvertent_runs:
            print(
                f'Error in `{entry_cmd_name}`: inadvertent reference definitions {inadvertent_runs}'
                f'(insert caret between closing square bracket and colon)',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _gather_tone_syllable_ct_list(cmd_content):
        return re.findall(
            pattern=r'''
                ^ \#\# \{ \#(?P<tone> [1-6] ) .*
                (?: \( | \[\[ )
                (?P<syllable> [a-z]+ )(?P=tone) [ ] (?P<canto_tone> \S+ )
                (?: \) | \]\] )
                (?: \^ )? $
            ''',
            string=cmd_content,
            flags=re.MULTILINE | re.VERBOSE,
        )

    @staticmethod
    def _gather_navigation_tones(cmd_content):
        return re.findall(
            pattern=r'<## tone-(?P<tone>[1-6])-characters ##>',
            string=cmd_content,
        )

    @staticmethod
    def _check_syllables(entry_cmd_name, tone_syllable_ct_list):
        cmd_syllable = re.sub(
            pattern=r'entries/(?P<syllable>[a-z]+)\.cmd',
            repl=r'\g<syllable>',
            string=entry_cmd_name,
        )

        gathered_syllables = set(syllable for _, syllable, _ in tone_syllable_ct_list)
        if gathered_syllables and gathered_syllables != {cmd_syllable}:
            print(
                f'Error in `{entry_cmd_name}`: gathered_syllables {gathered_syllables} ≠ `{{{cmd_syllable}}}`',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _check_canto_tones(entry_cmd_name, tone_syllable_ct_list):
        for tone, syllable, canto_tone in tone_syllable_ct_list:
            is_entering = syllable[-1] in 'ptk'
            if (tone, is_entering, canto_tone) not in [
                ('1', False, '陰平'),
                ('2', False, '陰上'),
                ('3', False, '陰去'),
                ('4', False, '陽平'),
                ('5', False, '陽上'),
                ('6', False, '陽去'),
                ('1', True, '高陰入'),
                ('3', True, '低陰入'),
                ('6', True, '陽入'),
            ]:
                print(
                    f'Error in `{entry_cmd_name}`: {syllable}{tone} does not have Cantonese tone {canto_tone}',
                    file=sys.stderr,
                )
                sys.exit(1)

    @staticmethod
    def _check_tones(entry_cmd_name, tone_syllable_ct_list, navigation_tones):
        syllable_tones = [tone for tone, _, _ in tone_syllable_ct_list]
        if syllable_tones != navigation_tones:
            print(
                f'Error in `{entry_cmd_name}`: syllable tones {syllable_tones} ≠ navigation tones {navigation_tones}',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _gather_toned_characters_from_tone(cmd_content, tone_syllable_ct_list):
        return {
            tone: [
                match.expand(fr'\g<character>{tone}')
                for match in re.finditer(
                    pattern=(
                        fr'^ \#\#\# [+]? [ ] \[? (?P<character> \S+? ) \]? {tone}'
                        fr'[ ][|][ ]'
                        fr'.*?'
                        fr'(?: \( | \[\[ ) {syllable}{tone} (?: \) | \]\] )'
                        fr'(?: \^ )? $'
                    ),
                    string=cmd_content,
                    flags=re.MULTILINE | re.VERBOSE,
                )
            ]
            for tone, syllable, _ in tone_syllable_ct_list
        }

    @staticmethod
    def _gather_williams_h1s(cmd_content):
        return Updater.extract_williams_hs(
            re.search(
                pattern=r'^ \# \{.*?\} [ ] (?P<h1s_raw> .*? ) [ ]? (?: \( | \[\[ ) [a-z]+ (?: \) | \]\] ) $',
                string=cmd_content,
                flags=re.MULTILINE | re.VERBOSE,
            ).group('h1s_raw')
        )

    @staticmethod
    def _gather_williams_h2s_from_tone(cmd_content, navigation_tones):
        return {
            tone: Updater.extract_williams_hs(
                re.search(
                    pattern=fr'''
                        ^ \#\# \{{\#{tone} .*? \}}
                        [ ] (?P<h2s_raw> .*? ) [ ]?
                        (?: \( | \[\[ ) [a-z]+{tone} [ ] \S+ (?: \) | \]\] ) $
                    ''',
                    string=cmd_content,
                    flags=re.MULTILINE | re.VERBOSE,
                ).group('h2s_raw')
            )
            for tone in navigation_tones
        }

    @staticmethod
    def _gather_williams_h3s_from_tone(cmd_content, navigation_tones):
        return {
            tone: [
                williams_h3
                for h3s_raw in re.findall(
                    pattern=fr'''
                        ^ \#\#\# .*? \|
                         [ ] (?P<h3s_raw> .*? ) [ ]?
                          (?: \( | \[\[ ) [a-z]+{tone} (?: \) | \]\] ) $
                    ''',
                    string=cmd_content,
                    flags=re.MULTILINE | re.VERBOSE,
                )
                for williams_h3 in Updater.extract_williams_hs(h3s_raw)
            ]
            for tone in navigation_tones
        }

    @staticmethod
    def extract_williams_hs(line):
        clean_line = re.sub(
            pattern=r'< [/]? ins .*? > | [._\[\]^] | \([1-9]\)',
            repl='',
            string=line,
            flags=re.VERBOSE,
        )
        return clean_line.split()

    @staticmethod
    def _check_williams_h2_h3_consistency(entry_cmd_name, williams_h2s_from_tone, williams_h3s_from_tone):
        for tone, tone_h2s in williams_h2s_from_tone.items():
            h2s = set(tone_h2s)
            h3s = set(williams_h3s_from_tone[tone])

            if not h3s.issubset(h2s):
                print(
                    f'Error in `{entry_cmd_name}` (tone {tone}): h3s {h3s} ⊈ h2s {h2s}',
                    file=sys.stderr,
                )
                sys.exit(1)

            if h3s != h2s:
                print(
                    f'Error in `{entry_cmd_name}` (tone {tone}): h3s {h3s} ≠ h2s {h2s}',
                    file=sys.stderr,
                )
                sys.exit(1)

    @staticmethod
    def _check_williams_h1_h2_consistency(entry_cmd_name, williams_h1s, williams_h2s_from_tone, is_done):
        h1s = set(williams_h1s)
        h2s = set(
            h2
            for tone_h2s in williams_h2s_from_tone.values()
            for h2 in tone_h2s
        )

        if not h2s.issubset(h1s):
            print(
                f'Error in `{entry_cmd_name}`: h2s {h2s} ⊈ h1s {h1s}',
                file=sys.stderr,
            )
            sys.exit(1)

        if is_done and h2s != h1s:
            print(
                f'Error in `{entry_cmd_name}`: h2s {h2s} ≠ h1s {h1s}',
                file=sys.stderr,
            )
            sys.exit(1)

    @staticmethod
    def _normalise_radicals(cmd_content):
        return re.sub(
            pattern=r'^R\n  \S [+] [0-9]+$',
            repl=lambda match: match.group().translate(RADICAL_NORMALISATION_TABLE),
            string=cmd_content,
            flags=re.MULTILINE,
        )

    @staticmethod
    def _update_page_tones_navigation(cmd_content, tone_syllable_ct_list):
        return re.sub(
            pattern=r'(?<=<## tones ##>\n).*?(?=<## /tones ##>\n)',
            repl=Updater._tones_navigation_cmd_content(tone_syllable_ct_list),
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
    def _tones_navigation_cmd_content(tone_syllable_ct_list):
        return '\n'.join([
            '<nav class="sideways">',
            '=={.modern}',
            *[f'- [{syllable}{tone}](#{tone})' for tone, syllable, _ in tone_syllable_ct_list],
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
    def __init__(self, entry_cmd_names):
        self.pages = [
            Page(entry_cmd_name)
            for entry_cmd_name in entry_cmd_names
        ]
        self.radix_cmd_names = sorted([
            os.path.join(directory_path, file_name)
            for directory_path, _, file_names in os.walk('radicals/')
            for file_name in file_names
            if file_name.endswith('.cmd') and file_name not in ['index.cmd']
        ])

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
        self.composition_index_object = self._gather_composition_index()

        Indexer._check_cantonese_entries(self.cantonese_entries)

    def update_terms(self):
        with open('terms/index.cmd', 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        new_cmd_content = self._update_terms_table(old_cmd_content)

        if new_cmd_content == old_cmd_content:
            return

        with open('terms/index.cmd', 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    def update_radix_all(self):
        for radix_cmd_name in self.radix_cmd_names:
            self._update_radix(radix_cmd_name)

    def write_character_index(self):
        raw_json = json.dumps(self.character_index_object, ensure_ascii=False, separators=(',', ':'))
        nice_json = raw_json.replace('],', '],\n') + '\n'  # newlines but only at the top level

        with open('search/character-index.json', 'w', encoding='utf-8') as json_file:
            json_file.write(nice_json)

    def write_radical_index(self):
        raw_json = json.dumps(self.radical_index_object, ensure_ascii=False, separators=(',', ':'), sort_keys=True)
        nice_json = raw_json.replace('},', '},\n') + '\n'  # newlines but only at the top level

        with open('radicals/radical-index.json', 'w', encoding='utf-8') as json_file:
            json_file.write(nice_json)

    def write_composition_index(self):
        raw_json = json.dumps(self.composition_index_object, ensure_ascii=False, separators=(',', ':'), sort_keys=True)
        nice_json = raw_json.replace(',', ',\n') + '\n'  # newlines but only at the top level

        with open('search/composition-index.json', 'w', encoding='utf-8') as json_file:
            json_file.write(nice_json)

    def _gather_character_index(self):
        # {character: [jyutping, ...], ...}
        object_ = collections.defaultdict(list)
        for entry in self.character_entries:
            object_[entry.character].append(entry.jyutping)

        return object_

    def _gather_radical_index(self):
        # {radical: {residual_stroke_count: {character: [jyutping, ...]}}, ...}
        object_ = collections.defaultdict(lambda: collections.defaultdict(lambda: collections.defaultdict(list)))
        for entry in self.character_entries:
            object_[entry.radical][entry.residual_stroke_count][entry.character].append(entry.jyutping)

        return object_

    def _gather_composition_index(self):
        compositions_from_character = collections.defaultdict(set)
        for entry in self.character_entries:
            compositions_from_character[entry.character].add(entry.composition)

        # {character: composition, ...}
        object_ = {}
        for character, compositions in compositions_from_character.items():
            if len(compositions) > 1:
                print(f'Error: character {character} has multiple compositions {compositions}', file=sys.stderr)
                sys.exit(1)

            composition = compositions.pop()
            if composition:
                object_[character] = composition

        return object_

    def _update_terms_table(self, cmd_content):
        return re.sub(
            pattern=r'(?<=<## terms-table ##>\n).*?(?=<## /terms-table ##>\n)',
            repl=self._terms_table_cmd_content(),
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

    def _terms_table_cmd_content(self):
        return '\n'.join([
            "||||{.wide}",
            "''{.modern}",
            "|^",
            "  //",
            "    ; Jyutping",
            "    ; Entry link",
            "|:",
            *[
                '\n'.join([
                    f'  //',
                    f'    , {split_cantonese_entry.term_jyutping}',
                    f'    , [{split_cantonese_entry.link_text}](/entries/{split_cantonese_entry.relative_url})',
                ])
                for split_cantonese_entry in self.split_cantonese_entries
            ],
            "''",
            "||||",
            '',
        ])

    def _update_radix(self, radix_cmd_name):
        with open(radix_cmd_name, 'r', encoding='utf-8') as old_cmd_file:
            old_cmd_content = old_cmd_file.read()

        new_cmd_content = self._update_radix_characters(old_cmd_content)

        if new_cmd_content == old_cmd_content:
            return

        with open(radix_cmd_name, 'w', encoding='utf-8') as new_cmd_file:
            new_cmd_file.write(new_cmd_content)

    def _update_radix_characters(self, cmd_content):
        cmd_content = re.sub(
            pattern=(
                r'(?<=<## radical-(?P<radical>\S)-characters ##>\n)'
                r'.*?'
                r'(?=<## /radical-(?P=radical)-characters ##>\n)'
            ),
            repl=self._radix_characters_cmd_content_replace,
            string=cmd_content,
            flags=re.DOTALL | re.MULTILINE,
        )

        return cmd_content

    def _radix_characters_cmd_content_replace(self, match):
        radical = match.group('radical')

        if radical not in self.radical_index_object:
            return match.group()

        c_from_c = self.composition_index_object  # {character: composition, ...}
        j_from_c_from_r = self.radical_index_object[radical]  # {residual: {character: [jyutping, ...]}, ...}

        return '\n'.join([
            "||||{.wide}",
            "''{.modern}",
            "|^",
            "  //",
            "    ; Residual strokes",
            "    ; Character entry links",
            "|:",
            *[
                '\n'.join([
                    f'  //',
                    f'    , {residual_stroke_count}',
                    f'    ,',
                    f'      <nav class="sideways">',
                    f'      ==',
                    *[
                        f'      - {Indexer._entry_links_cmd_content(character, jyutping_readings, c_from_c)}'
                        for character, jyutping_readings in j_from_c_from_r[residual_stroke_count].items()
                    ],
                    f'      ==',
                    f'      </nav>',
                ])
                for residual_stroke_count in sorted(j_from_c_from_r.keys())
            ],
            "''",
            "||||",
            "",
        ])

    @staticmethod
    def _entry_links_cmd_content(character, jyutping_readings, composition_from_character):
        composed_character = Indexer._composed_character(character, composition_from_character)
        entry_links_sequence = ', '.join(f'${composed_character}{jyutping}' for jyutping in jyutping_readings)

        if len(jyutping_readings) > 1:
            return '{' + entry_links_sequence + '}'
        else:
            return entry_links_sequence

    @staticmethod
    def _composed_character(character, composition_from_character):
        try:
            return '{' + f'{character}={composition_from_character[character]}' + '}'
        except KeyError:
            return character

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
    def __init__(self, entry_cmd_name):
        with open(entry_cmd_name, 'r', encoding='utf-8') as cmd_file:
            cmd_content = cmd_file.read()

        self.jyutping = re.sub(
            pattern=r'entries/(?P<jyutping>[a-z]+)\.cmd',
            repl=r'\g<jyutping>',
            string=entry_cmd_name
        )
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
                match.group('content'),
            )
            for match in re.finditer(
                pattern=(
                    r'^ [#]{3} [+]? '
                    r'[ ]'
                    r'\[? \{? (?P<character> \S ) [=]? (?P<composition> \S*? ) \}? \]? .'
                    r'[ ][|][ ]'
                    r'.*?'
                    r'(?: \( | \[\[ )'
                    r'(?P<jyutping> [a-z]+? [1-6] )'
                    r'(?: \) | \]\] )'
                    r'(?: \^ )?'
                    r'\n\n'
                    r'[$]{2} [.]? \n'
                    r'(?P<content>'
                    r'R \n'
                    r'[ ]{2} (?P<radical> \S ) [ ][+][ ] (?P<residual_stroke_count> [0-9]+ ) \n'
                    r'U \n'
                    r'[ ]{2} (?P<code_point> U[+][0-9A-F]{4,5} ) $'
                    r'[\s\S]*? \n'
                    r') [$]{2}'
                ),
                string=cmd_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
        ]

        characters = ''.join(character_entry.character for character_entry in self.character_entries)
        sorted_characters = ''.join(character_entry.character for character_entry in sorted(self.character_entries))
        if characters != sorted_characters:
            print(
                f'Error: character entries not in sorted order\n  ({characters})\n  ({sorted_characters})',
                file=sys.stderr,
            )
            sys.exit(1)


class CantoneseEntry:
    def __init__(self, term, disambiguation, term_jyutping, page_jyutping):
        parenthetical_disambiguation = (
            re.sub(pattern=r'-(?P<slug>.*)', repl=r'~\\(\g<slug>\\)', string=disambiguation)
            if disambiguation
            else ''
        )
        self.term = term
        self.disambiguation = disambiguation
        self.term_jyutping = term_jyutping
        self.page_jyutping = page_jyutping
        self.link_text = f'{term}{parenthetical_disambiguation}'
        self.relative_url = f'{page_jyutping}#cantonese-{self.clean_term()}{disambiguation}'

    def split(self):
        return (
            SplitCantoneseEntry(self.term, self.disambiguation, split_term_jyutping, self.page_jyutping)
            for split_term_jyutping in re.split(pattern=r'\s*,\s*', string=self.term_jyutping)
        )

    def clean_term(self):
        return re.sub(pattern=r'\{(?P<character>\S)=\S+\}', repl=r'\g<character>', string=self.term)


class CharacterEntry:
    def __init__(self, character, code_point, radical, residual_stroke_count, jyutping, composition, content):
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

        content_keys = ''.join(re.findall(pattern='^[A-Z]', string=content, flags=re.MULTILINE))
        canonical_keys_iter = iter('RUHAVFWCPES')
        if not all(content_key in canonical_keys_iter for content_key in content_keys):
            print(f'Error: bad content keys {content_keys} for character {character} {code_point}', file=sys.stderr)
            sys.exit(1)

        self.character = character
        self.code_point = code_point
        self.radical = radical
        self.residual_stroke_count = residual_stroke_count
        self.jyutping = jyutping
        self.composition = composition

    def __lt__(self, other):
        return self.rank() < other.rank()

    def rank(self):
        return self.jyutping, self.radical, self.residual_stroke_count, self.integer_code_point()

    def integer_code_point(self):
        return int(self.code_point[2:], 16)


class SplitCantoneseEntry(CantoneseEntry):
    def __lt__(self, other):
        return self.rank() < other.rank()

    def rank(self):
        return self.term_jyutping.split(), self.clean_term()


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

    indexer = Indexer(updater.entry_cmd_names)
    indexer.update_terms()
    indexer.update_radix_all()
    indexer.write_character_index()
    # indexer.write_radical_index()
    indexer.write_composition_index()

    statistician = Statistician(indexer)
    statistician.print_statistics()


if __name__ == '__main__':
    main()
