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
            CmdSource.lint_cjk_variation_selectors(content)
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
            pattern=r'\S*?(?P<character>[\uF900-\uFAFF\U0002F800-\U0002FA1F])\S*',
            string=content,
        ):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(f'compatibility ideograph `{character}` present in `{context}`')

    @staticmethod
    def lint_cjk_variation_selectors(content: str):
        if context_match := re.search(pattern=r'\S*(?P<character>.)[\uFE00-\uFE0F]\S*', string=content):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(f'variation selector present on `{character}` in `{context}`')


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
