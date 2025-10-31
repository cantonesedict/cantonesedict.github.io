# cantonesedict.github.io

Work in progress for a modern edition of 《英華分韻撮要》
[A Tonic Dictionary of the Chinese Language in the Canton Dialect (1856)][tonic]
by [Samuel Wells Williams].

Pages are written in [Conway-Markdown (CMD)][cmd].


## Workflow

Dependencies:

```bash
pipx install conwaymd
pipx install html5validator
```

Build:

```bash
./autoupdate.py
cmd --all
html5validator --root .
```

<!--

Heuristic checks:

```bash
grep -Pi '^ .*\[\[\$.[1-6]\]\]' entries/*cmd
grep -Pi '\[\[(here|see) ' entries/*cmd
grep -Pi '^ .*\b(Read|Used) ' entries/*cmd | grep -i '\$'
grep -Pi '\- (Reading|Alternative|Otherwise)' entries/*cmd
grep -P '(completeness|quot|Idiosyncratic)' entries/*cmd
grep -Pi '\[\[\*\*see' entries/*cmd
pcregrep -M '^C$\n  \+\+$' entries/*cmd
```

-->

<!--

TODO for merging branch `edits-with-ins-del`:

- Leave common readings unaltered
- Clean up `autoupdate.py`
- Update last modified 2025-XX-XX

-->


[tonic]: https://archive.org/details/williams-a-tonic-dictionary-of-the-chinese-language-in-the-canton-dialect-1856/page/n2/mode/1up
[Samuel Wells Williams]: https://en.wikipedia.org/wiki/Samuel_Wells_Williams
[cmd]: https://conwaymd.github.io/
