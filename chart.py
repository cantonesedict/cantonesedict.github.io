#!/usr/bin/env python3

"""
# chart.py

Chart the progress of this dictionary. Somewhat slow.
"""

import subprocess
import sys


class Snapshot:
    commit_hash: str
    timestamp: str
    unix_time: int
    entry_count: int

    def __init__(self, commit_hash: str, timestamp: str, unix_time: int, entry_count: int):
        self.commit_hash = commit_hash
        self.timestamp = timestamp
        self.unix_time = unix_time
        self.entry_count = entry_count


def print_progress_bar(item_number: int, item_count: int, bar_length):
    item_count_length = len(str(item_count))
    prefix = f'[Progress: {item_number :>{item_count_length}}/{item_count}] '

    try:
        done_length = bar_length * item_number // item_count
    except ZeroDivisionError:
        done_length = bar_length

    print(
        f'{prefix}[{"#" * done_length}{"." * (bar_length - done_length)}]',
        end='\r',
        file=sys.stdout,
        flush=True,
    )


def progress_bar(items: list, bar_length: int = 32):
    item_count = len(items)

    for item_number, item in enumerate(items, start=1):
        print_progress_bar(item_number, item_count, bar_length)
        yield item
    else:
        print_progress_bar(item_count, item_count, bar_length)

    print('', file=sys.stdout, flush=True)


def get_output(command: str) -> str:
    return subprocess.check_output(command, shell=True).decode()


def main():
    sampling_size = 50
    commit_hashes_all = get_output('git log --format=%H').splitlines()
    commit_hashes = commit_hashes_all[:: len(commit_hashes_all) // sampling_size]

    snapshots = [
        Snapshot(commit_hash, timestamp, unix_time, entry_count)
        for commit_hash in progress_bar(commit_hashes)
        if (
            file_names := get_output(f'git ls-tree -r --name-only {commit_hash} -- entries/*.html').splitlines(),
            timestamp := get_output(f'git show -s --format=%ai {commit_hash}').strip(),
            unix_time := int(get_output(f'git show -s --format=%at {commit_hash}')),
            entry_count_output := get_output(' '.join([
                'git show',
                *[f'{commit_hash}:{file_name}' for file_name in file_names],
                '| grep "^<h3" | wc -l',
            ])),
            entry_count := sum(int(line) for line in entry_count_output.splitlines()),
        )
    ]

    # for s in snapshots:
    #     print(s.timestamp, s.unix_time, s.entry_count)


if __name__ == '__main__':
    main()
