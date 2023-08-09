#!/usr/bin/env python3

"""
# autoupdate.py

Automatically update CMD files.
"""

import os


def gather_entry_cmd_names():
    return sorted([
        os.path.join(directory_path, file_name)
        for directory_path, _, file_names in os.walk('entries/')
        for file_name in file_names
        if file_name.endswith('.cmd') and file_name != 'index.cmd'
    ])


def main():
    entry_cmd_names = gather_entry_cmd_names()


if __name__ == '__main__':
    main()
