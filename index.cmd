< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr
< /res/rules/links.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Home
* %date-modified --> 2023-08-01
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


##{#source .modern} Source

--{.modern}
The version of ''Tonic Dictionary'' used as the master reference is
[`ark:/13960/s20jtk4f14j` at archive.org]<n2>,
sourced from [a Google Books scan][google] of
[83600-B held at <span lang="de">ÖNB Hauptabt. Heldenplatz</span>][onb].
--
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


##{#modernisation .modern} Modernisation

--{.modern}
The modernisation is a ongoing solo effort by Conway, consisting of:
--
++{.modern}
1. Transcribing its entries,
   which appear here as <span class="williams">black serif text</span>;

1. Making corrections to typos,
   which appear <span class="williams">[in square brackets]</span>;

1. Collating the entries by Jyutping
   (noting that there are phonological differences between
   the Ts'ing Dynasty Cantonese recorded by Williams
   and modern Hong Kong Cantonese);

1. Under each Jyutping pronunciation, sorting the entries by Unicode code point;

1. Inserting Jyutping (%modern-colour sans-serif text)
   alongside the Williams romanisations;

1. Inserting characters (%modern-colour sans-serif text)
   if not already supplied alongside the Williams romanisations,
   where practicable;

1. Inserting commentary (%modern-colour sans-serif text)
   and cross-reference links (blue);

1. Adding entries for some characters that were not recorded by Williams.
++
--{.modern}
**No effort has been made to alter or censor the Williams text
for the sensitivities of 21st-century readers.**
--


##{#contents .modern} Contents

<nav>
===={.modern}
- Front matter (1856)
  ==
  -{.williams} [\[English Title Page\]](/title/english)
  -{.williams} [Preface.](/preface/)
  -{.williams} [\[Chinese Title Page\]](/title/chinese)
  -{.williams} [Introduction.](/intro/)
  ==

- Front matter (modern)
  ==
  - [Font test page](/font-test/)
  ==

- Main matter
  ==
  - [Index of entries by Jyutping slug](/entries/)
  ==
====
</nav>
