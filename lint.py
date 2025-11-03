#!/usr/bin/env python3

"""
# lint.py

Lint all Conway-Markdown (CMD) source files, with some automatic correction.
"""

import os


class CmdSource:
    def __init__(self, file_name: str):
        with open(file_name, 'r', encoding='utf-8') as cmd_file:
            content = cmd_file.read()

        self.file_name = file_name
        self.content = content

    def __repr__(self):
        return f'CmdSource({self.file_name!r})'


class Gatherer:
    def __init__(self):
        cmd_file_names = [
            os.path.join(path, file_name)
            for path, _, file_names in os.walk(os.curdir)
            for file_name in file_names
            if file_name.endswith('.cmd')
        ]

        self.cmd_sources = [CmdSource(file_name) for file_name in sorted(cmd_file_names)]


def main():
    gatherer = Gatherer()
    print(gatherer.cmd_sources)


if __name__ == '__main__':
    main()
