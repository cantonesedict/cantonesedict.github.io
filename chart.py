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
    latest_entry_commit_hash = get_output('git log -1  --format=%H -- entries/*.html')
    commit_hashes_all = get_output(f'git log --format=%H {latest_entry_commit_hash}').splitlines()
    commit_hashes = commit_hashes_all[0 : -1 : len(commit_hashes_all) // sampling_size] + commit_hashes_all[-1:]

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

    svg_width_px = 1024

    plot_x_scale = 20
    plot_y_scale = 14

    plot_left_margin = 6
    plot_right_margin = 2
    plot_top_margin = 4
    plot_bottom_margin = 4

    plot_width = plot_left_margin + plot_x_scale + plot_right_margin
    plot_height = plot_top_margin + plot_y_scale + plot_bottom_margin
    plot_point_radius = plot_x_scale / 200
    plot_tick_length = plot_x_scale / 100

    min_unix_time = datetime(year=2023, month=7, day=1).timestamp()
    max_unix_time = datetime(year=2030, month=7, day=1).timestamp()
    min_entry_count = 0
    max_entry_count = 14000

    def x(unix_time: float) -> float:
        return plot_x_scale * (unix_time - min_unix_time) / (max_unix_time - min_unix_time)

    def y(entry_count: float) -> float:
        return plot_y_scale * (max_entry_count - entry_count) / (max_entry_count - min_entry_count)

    x_min = x(min_unix_time)
    x_max = x(max_unix_time)
    y_min = y(min_entry_count)
    y_max = y(max_entry_count)

    tick_years = range(2024, 2030 + 1)
    tick_entry_counts = range(2000, 14000, 2000)

    target_entry_count = 13000
    y_target = y(entry_count=target_entry_count)

    svg = '\n'.join([
        f'<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg viewBox="{-plot_left_margin} {-plot_top_margin} {plot_width} {plot_height}"'
        f' width="{svg_width_px}px"'
        f' xmlns="http://www.w3.org/2000/svg">',
        f'<style>',
        f'circle:hover {{fill: #cf1338}}',
        f'circle {{fill: black}}',
        f'line, polyline {{stroke: black; stroke-width: {1 / svg_width_px :.4%}}}'
        f'polyline {{stroke: #cf1338}}'
        f'line.target {{stroke: blue; stroke-dasharray: {10 / svg_width_px :.4%}}}',
        f'polyline {{fill: none}}'
        f'text {{font-family: sans-serif; font-size: 1px; text-anchor: middle}}',
        f'text.target {{fill: blue; font-size: 0.7px}}',
        f'text.tick {{font-size: 0.7px}}',
        f'text.title {{fill: #cf1338; font-size: 1.1px}}',
        f'</style>',
        # Title
        f'<text class="title" x="{(x_min + x_max) / 2 :.4f}" y="{y_max - plot_top_margin / 2 :.4f}"'
        f">Conway's Cantonese Dictionary: Progress</text>"
        # Horizontal axis
        f'<line x1="{x_min :.4f}" y1="{y_min :.4f}" x2="{x_max :.4f}" y2="{y_min :.4f}"/>',
        f'<text x="{(x_min + x_max) / 2 :.4f}" y="{y_min :.4f}" dy="3em">Time</text>',
        *[
            f'<line x1="{x_tick :.4f}" y1="{y_min :.4f}" x2="{x_tick :.4f}" y2="{y_min + plot_tick_length :.4f}"/>\n'
            f'<text class="tick" x="{x_tick :.4f}" y="{y_min + plot_tick_length :.4f}" dy="1.3em">{year}</text>'
            for year in tick_years
            if (
                x_tick := x(datetime(year, month=1, day=1).timestamp()),
            )
        ],
        # Vertical axis
        f'<line x1="{x_min :.4f}" y1="{y_min :.4f}" x2="{x_min :.4f}" y2="{y_max :.4f}"/>',
        f'<text x="{x_min :.4f}" y="{(y_min + y_max) / 2 :.4f}"'
        f' dy="-4em" transform="rotate(-90 {x_min :.4f} {(y_min + y_max) / 2 :.4f})">Entry Count</text>',
        *[
            f'<line x1="{x_min :.4f}" y1="{y_tick :.4f}" x2="{x_min - plot_tick_length :.4f}" y2="{y_tick :.4f}"/>\n'
            f'<text class="tick" x="{x_min - plot_tick_length :.4f}" y="{y_tick :.4f}"'
            f' dx="-2em" dy="0.33em">{entry_count}</text>'
            for entry_count in tick_entry_counts
            if (
                y_tick := y(entry_count),
            )
        ],
        # Target
        f'<line class="target" x1="{x_min :.4f}" y1="{y_target :.4f}" x2="{x_max :.4f}" y2="{y_target :.4f}"/>',
        f'<text class="target" x="{0.33 * x_min + 0.67 * x_max :.4f}" y="{y_target :.4f}"'
        f' dy="-0.5em">Approximate Target: {target_entry_count} entries</text>',
        # Point markers with tooltip
        *[
            f'<circle cx="{x(snapshot.unix_time) :.4f}"'
            f' cy="{y(snapshot.entry_count) :.4f}"'
            f' r="{plot_point_radius :.4f}">'
            f'<title>{snapshot.entry_count} entries @ {snapshot.timestamp}\n'
            f'(commit {snapshot.commit_hash})</title>'
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
