#!/usr/bin/env python3

"""
# chart.py

Chart the progress of this dictionary. Somewhat slow.
"""

import subprocess
import sys
from datetime import datetime


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

    plot_width = 480
    plot_x_scale = 20
    plot_y_scale = 14
    plot_point_radius = plot_x_scale / 300

    min_unix_time = datetime(year=2023, month=7, day=1).timestamp()
    max_unix_time = datetime(year=2030, month=7, day=1).timestamp()
    min_entry_count = 0
    max_entry_count = 13000

    def x(unix_time: int) -> float:
        return plot_x_scale * (unix_time - min_unix_time) / (max_unix_time - min_unix_time)

    def y(entry_count: int) -> float:
        return -plot_y_scale * (entry_count - min_entry_count) / (max_entry_count - min_entry_count)

    svg = '\n'.join([
        f'<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg viewBox="{-5} {-2 - plot_y_scale} {plot_x_scale + 3} {plot_y_scale + 10}"'
        f' width="{plot_width}px"'
        f' xmlns="http://www.w3.org/2000/svg">',
        f'<style>',
        f'circle {{fill: red}}',
        f'line, polyline {{stroke: black; stroke-width: {1 / plot_width:.4%}}}'
        f'polyline {{fill: none}}'
        f'text {{font-family: sans-serif; font-size: 1px; text-anchor: middle}}',
        f'</style>',
        # Horizontal axis
        f'<line x1="0" y1="0" x2="{plot_x_scale :.4f}" y2="0"/>',
        f'<text x="{plot_x_scale / 2 :.4f}" y="0" dy="2.5em">Date</text>',
        # Vertical axis
        f'<line x1="0" y1="0" x2="0" y2="-{plot_y_scale :.4f}"/>',
        f'<text x="0" y="-{plot_y_scale / 2 :.4f}"'
        f' dy="-2.5em"'
        f' transform="rotate(-90 0 -{plot_y_scale / 2 :.4f})">'
        f'Entry Count</text>',
        # Point markers with tooltip
        *[
            f'<circle cx="{x(snapshot.unix_time) :.4f}"'
            f' cy="{y(snapshot.entry_count) :.4f}"'
            f' r="{plot_point_radius :.4f}">'
            f'<title>commit {snapshot.commit_hash}\n'
            f'{snapshot.timestamp}\n'
            f'{snapshot.entry_count} entries</title>'
            f'</circle>'
            for snapshot in snapshots
        ],
        # Polyline
        f'''<polyline points="{
            ' '.join([
                f'{x(snapshot.unix_time) :.4f},{y(snapshot.entry_count) :.4f}'
                for snapshot in snapshots
            ])
        }"/>''',
        f'</svg>',
        f'',
    ])

    with open('progress.svg', 'w', encoding='utf-8') as svg_file:
        svg_file.write(svg)


if __name__ == '__main__':
    main()
