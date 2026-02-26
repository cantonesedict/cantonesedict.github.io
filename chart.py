#!/usr/bin/env python3

"""
# chart.py

[WARNING: VERY SLOW] Chart the progress of this dictionary.
"""

import subprocess
import sys
from collections import defaultdict


class Snapshot:
    commit_hash: str
    file_name: str
    timestamp: str
    unix_time: int
    entry_count: int

    def __init__(self, commit_hash: str, file_name: str, timestamp: str, unix_time: int, entry_count: int):
        self.commit_hash = commit_hash
        self.file_name = file_name
        self.timestamp = timestamp
        self.unix_time = unix_time
        self.entry_count = entry_count


def aggregate_by_commit(snapshots: list['Snapshot']) -> list['Snapshot']:
    snapshots_from_commit_hash: dict[str, list['Snapshot']] = defaultdict(list)

    for snapshot in snapshots:
        snapshots_from_commit_hash[snapshot.commit_hash].append(snapshot)

    return [
        Snapshot(first_snapshot.commit_hash, first_snapshot.file_name,
                 first_snapshot.timestamp, first_snapshot.unix_time,
                 entry_count=total_entry_count)
        for aggregated_snapshots in snapshots_from_commit_hash.values()
        if (
            first_snapshot := aggregated_snapshots[0],
            total_entry_count := sum(s.entry_count for s in aggregated_snapshots),
        )
    ]



def print_progress_bar(item_number: int, item_count: int, bar_length: int, prefix: str):
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


def progress_bar(items: list, bar_length: int, prefix: str = 'Progress: '):
    item_count = len(items)

    for item_number, item in enumerate(items, start=1):
        print_progress_bar(item_number, item_count, bar_length, prefix)
        yield item
    else:
        print_progress_bar(item_count, item_count, bar_length, prefix)

    print('', file=sys.stdout, flush=True)


def get_output(command: str) -> str:
    return subprocess.check_output(command, shell=True).decode()


def main():
    sampling_size = 100
    commit_hashes_all = get_output('git log --format=%H').splitlines()
    commit_hashes = commit_hashes_all[:: len(commit_hashes_all) // sampling_size]
    commit_hash_count = len(commit_hashes)

    snapshots = aggregate_by_commit([
        Snapshot(commit_hash, file_name, timestamp, unix_time, entry_count)
        for commit_number, commit_hash in enumerate(commit_hashes, start=1)
        for file_name in progress_bar(
            get_output(f'git ls-tree -r --name-only {commit_hash} -- entries/*.html').splitlines(),
            bar_length=24,
            prefix=f'[Counting entries for commit {commit_number}/{commit_hash_count}]: '
        )
        if (
            timestamp := get_output(f'git show -s --format=%ai {commit_hash}').strip(),
            unix_time := int(get_output(f'git show -s --format=%at {commit_hash}')),
            entry_count := int(get_output(f'git show {commit_hash}:{file_name} | grep "^<h3" | wc -l')),
        )
    ])

    # for s in snapshots:
    #     print(s.timestamp, s.unix_time, s.entry_count)


if __name__ == '__main__':
    main()
