< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Home
* %date-modified --> 2023-11-14
* %copyright-prior-years -->
* %modern-colour --> crimson

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} Cantonese Dictionary

--{.modern}
A modern edition of 《英華分韻撮要》
[''A Tonic Dictionary of the Chinese Language in the Canton Dialect'' (1856)]<n2>
by [Samuel Wells Williams].
--

[Samuel Wells Williams]: https://en.wikipedia.org/wiki/Samuel_Wells_Williams


##{#contents .modern} Contents

<nav>
===={.modern}
- Front matter (1856)
  ==
  -{.williams} [\[Chinese Title Page\]](/title/chinese)
  -{.williams} [\[English Title Page\]](/title/english)
  -{.williams} [Preface.](/preface/)
  -{.williams} [Introduction.](/intro/)
  ==

- Front matter (modern)
  ==
  - [Font test page](/font-test/)
  ==

- Main matter
  ==
  - [__Index of entries by Jyutping__](/entries/)
  ==
====
</nav>


##{#source .modern} Source

###{.modern} Master ''Tonic Dictionary''

--{.modern}
The version of ''Tonic Dictionary'' used as the master reference is
[`ark:/13960/s20jtk4f14j` at archive.org]<n2>,
sourced from [a Google Books scan][google] of
[83600-B held at <span lang="de">ÖNB Hauptabt. Heldenplatz</span>][onb].
--

###{.modern} Subsidiary ''Tonic Dictionary''

--{.modern}
While it would have been more preferable to use
[`ark:/13960/t0ps1ph66` at archive.org][uiuc]
from the Library of the University of Illinois at Urbana-Champaign
(being both a higher-quality colour scan and not watermarked by Google),
that version has severe paging issues:
--
++{.modern}
1.
  Pages~xxxiv and~xxxv are missing (they should appear between [n38] and [n39]).
1.
  Pages are duplicated:
  ==
  - Pages~14 through~40 appear twice:
    once at [n53] through [n79], and again at [n85] through [n111].
  - Pages~9* through~13* appear twice:
    once at [n80] through [n84], and again at [9] through [13].
  ==
  It is unclear whether this is an error on the part of the book printer,
  the scanner, or both.
++

###{.modern} Other useful references

===={.modern}
- [''A Chinese Dictionary in the Cantonese Dialect'' (1877)][eitel-dict],
  by [Ernst Johann Eitel].
  --
  An expansion of Williams' ''Tonic Dictionary''.
  The goals of this expansion included:
  --
  ==
  - Utilising the newly available works
    by [James Legge] (on the Chinese Classics)
    to better document the literary language,
    which Eitel felt received insufficient attention
    compared to the Cantonese vernacular in Williams' original work.
  - Including some characters from 《分韻撮要》 and 《康熙字典》
    which Eitel felt indispensable.
  - Including readings and English translations of definitions from 《康熙字典》.
  - Better distinguishing the register (Classical vs Colloquial vs Mixed)
    of the example phrases.
  - Supplying the Chinese characters that were not included
    in the example phrases.
  ==
  --
  See [Eitel's Introduction] for details.
  --

- [韻典網 (ytenx.org)](https://ytenx.org/), by BYVoid.
  --
  A database of the olden rime dictionaries (《廣韻》 etc.).
  --

- [Chinese Text Project Dictionary](https://ctext.org/dictionary.pl?if=en),
  by Donald Sturgeon.
  --
  Easy reference to radical+strokes, Unihan readings, 《廣韻》, and 《康熙字典》.
  --

- [萌典 (moedict.tw)](https://www.moedict.tw/), by [Audrey Tang].
  --
  Taiwan g0v (gov-zero) dictionary.
  --
====

[google]: https://books.google.com/books?id=X8JhunQfImoC
[onb]: https://search.onb.ac.at/permalink/f/128lc6g/ONB_alma21317554760003338
[uiuc]: https://archive.org/details/tonicdictionaryo00will/page/n6/mode/1up
[n38]: https://archive.org/details/tonicdictionaryo00will/page/n38/mode/1up
[n39]: https://archive.org/details/tonicdictionaryo00will/page/n39/mode/1up
[n53]: https://archive.org/details/tonicdictionaryo00will/page/n53/mode/1up
[n79]: https://archive.org/details/tonicdictionaryo00will/page/n79/mode/1up
[n80]: https://archive.org/details/tonicdictionaryo00will/page/n80/mode/1up
[n84]: https://archive.org/details/tonicdictionaryo00will/page/n84/mode/1up
[n85]: https://archive.org/details/tonicdictionaryo00will/page/n85/mode/1up
[n111]: https://archive.org/details/tonicdictionaryo00will/page/n111/mode/1up
[9]: https://archive.org/details/tonicdictionaryo00will/page/9/mode/1up
[13]: https://archive.org/details/tonicdictionaryo00will/page/13/mode/1up
[eitel-dict]: https://books.google.com/books?id=mh8TAAAAYAAJ
[Ernst Johann Eitel]: https://en.wikipedia.org/wiki/Ernst_Johann_Eitel
[Eitel's Introduction]: https://books.google.com/books?id=mh8TAAAAYAAJ&jtp=vii
[James Legge]: https://en.wikipedia.org/wiki/James_Legge
[Audrey Tang]: https://en.wikipedia.org/wiki/Audrey_Tang


##{#modernisation .modern} Modernisation

--{.modern}
The modernisation here of Williams' original is an ongoing solo effort by Conway,
consisting of:
--
++{.modern}
1. Normalisation of characters and readings to account for modern usage;

1. Transcribing its entries
   (<span class="williams">black serif text</span>);

1. Making corrections to typos
   <span class="williams">[in square brackets]</span>;

1. Collating the entries by Jyutping
   (noting that there are phonological differences between
   the Ts(')ing Dynasty Cantonese recorded by Williams
   and modern Hong Kong Cantonese);

1. Under each Jyutping pronunciation,
   sorting the entries by radical+strokes, then Unicode code point;

1. Inserting Jyutping (__%modern-colour sans-serif text__)
   alongside the Williams romanisations;

1. Inserting characters (__%modern-colour sans-serif text__)
   if not already supplied alongside the Williams romanisations,
   where practicable (with assistance from Eitel's 1877 Dictionary);

1. Inserting commentary (__%modern-colour sans-serif text__)
   and cross-reference links (blue);

1. Adding entries for some characters that were not recorded by Williams.
++
--{.modern}
**No effort has been made to alter or censor the 1856 Williams text
for the sensitivities of 21st-century readers.**
--
