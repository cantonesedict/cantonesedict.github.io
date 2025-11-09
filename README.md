# cantonesedict.github.io

Work in progress for an annotated edition of 《英華分韻撮要》
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
./lint.py
cmd --all
html5validator --root .
```


[tonic]: https://archive.org/details/williams-a-tonic-dictionary-of-the-chinese-language-in-the-canton-dialect-1856/page/n2/mode/1up
[Samuel Wells Williams]: https://en.wikipedia.org/wiki/Samuel_Wells_Williams
[cmd]: https://conwaymd.github.io/
