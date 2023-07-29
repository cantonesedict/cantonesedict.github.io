< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr
< /res/rules/links.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Home
* %date-modified --> 2023-07-29
* %copyright-prior-years -->
* %modern-colour --> crimson

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} Cantonese Dictionary

--{.modern}
A modern edition of 《英華分韻撮要》
[''A Tonic Dictionary of the Chinese Language in the Canton Dialect''][tonic] (1856)
by [Samuel Wells Williams].
--

[Samuel Wells Williams]: https://en.wikipedia.org/wiki/Samuel_Wells_Williams


##{#modern .modern} Modernisation

--{.modern}
The version of ''Tonic Dictionary'' used as the base reference is
[`ark:/13960/t0ps1ph66` at archive.org][tonic],
which is a scan of the copy held at
the Library of the University of Illinois at Urbana-Champaign.
--
--{.modern}
Where there be missing pages or damage to the base reference version,
a secondary version is used a subsidiary reference,
namely [`ark:/13960/s20jtk4f14j` at archive.org][tonic2],
from a [scan by Google](https://books.google.com/books?id=X8JhunQfImoC).
--
--{.modern}
The modernisation is a ongoing solo effort by Conway, consisting of:
--
++{.modern}
1. Transcribing its entries <span class="williams">(black serif text)</span>;

1. Make corrections to typos <span class="williams">[in square brackets]</span>;

1. Collating the entries by Jyutping
   (noting that there are phonological differences between
   the Ts'ing Dynasty Cantonese recorded by Williams
   and modern Hong Kong Cantonese);

1. Under each Jyutping pronunciation, sorting the entries by Unicode code point;

1. Inserting Jyutping (%modern-colour sans-serif text)
   alongside the Williams romanisation of entries;

1. Inserting characters and Jyutping (%modern-colour sans-serif text)
   alongside the romanisation-only examples, where practicable;

1. Inserting remarks (%modern-colour sans-serif text)
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
