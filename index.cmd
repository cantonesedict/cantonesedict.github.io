< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Home
* %date-modified --> 2025-11-02
* %copyright-prior-years --> 2023--
* %modern-colour --> crimson
* %meta-description --> home page

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

RegexDictionaryReplacement: #.master-tonic-link
- queue_position: BEFORE #specified-links
* \[ m [.] (?P<page_slug> [n]? [0-9]+ ) \]
    -->
  [\g<page_slug>](https://archive.org/details/williams-a-tonic-dictionary-of-the-chinese-language-in-the-canton-dialect-1856/page/\g<page_slug>/mode/1up)

RegexDictionaryReplacement: #.subsidiary-tonic-link
- queue_position: BEFORE #specified-links
* \[ s [.] (?P<page_slug> [n]? [0-9]+ ) \]
    -->
  [\g<page_slug>](https://archive.org/details/tonicdictionaryo00will/page/\g<page_slug>/mode/1up)


%%%

#{.modern} Conway's Cantonese Dictionary

--{.modern}
**Work in progress:**
An annotated edition of 《英華分韻撮要》
[''A Tonic Dictionary of the Chinese Language in the Canton Dialect'' (1856)]<n2>
by [Samuel Wells Williams].
--

[Samuel Wells Williams]: https://en.wikipedia.org/wiki/Samuel_Wells_Williams


##{#contents .modern} Contents

<nav>
===={.modern}
- Front matter (1856)
  ==
  -{.williams} [《英華分韻撮要》](/title/chinese)
  -{.williams} [A Tonic Dictionary](/title/english)
  -{.williams} [Preface](/preface/)
  -{.williams} [Introduction](/intro/)
  ==

- Front matter (modern)
  ==
  - [Conway's preface](/conway/)
  - [Cantonese phonology](/phonology/)
  - [Font test page](/font-test/)
  ==

- Main matter
  ==
  - [__Index of entry pages by Jyutping__](/entries/)
  - [__Index of Cantonese terms by Jyutping__](/terms/)
  - [__Search by character or code point__](/search/)
  - [__Index of characters by radical__](/radicals/)
  ==
====
</nav>


##{#source .modern} Source

###{#master-tonic .modern} Master ''Tonic Dictionary''

--{.modern}
The version of ''Tonic Dictionary'' used as the master reference is
[`ark:/13960/s20jtk4f14j` at archive.org]<n2>,
sourced from [a Google Books scan][google] of
[83600-B held at <span lang="de">ÖNB Hauptabt. Heldenplatz</span>][onb].
--
--{.modern}
Note the special paging:
--
++{.modern}
1. Front matter (up to Page~xxxvi) is everything up to slug [m.n43].
1. Pages~1 through~8 are slugs [m.1] through [m.8].
1. Pages~9 through~40 are slugs [m.n52] through [m.n83].
1. Pages~9* through~40* are slugs [m.9] through [m.40].
1. Pages~41 onward are slugs [m.41] onward.
++

###{#subsidiary-tonic .modern} Subsidiary ''Tonic Dictionary''

--{.modern}
While it would have been more preferable to use
[`ark:/13960/t0ps1ph66` at archive.org][uiuc]
from the Library of the University of Illinois at Urbana-Champaign
(being both a higher-quality colour scan and not watermarked by Google),
that version has severe paging issues:
--
++{.modern}
1.
  Pages~xxxiv and~xxxv are missing
  (they should appear between slugs [s.n38] and [s.n39]).
1.
  Pages are duplicated:
  ==
  - Pages~14 through~40 appear twice:
    once at slugs [s.n53] through [s.n79],
    and again at slugs [s.n85] through [s.n111].
  - Pages~9* through~13* appear twice:
    once at slugs [s.n80] through [s.n84],
    and again at slugs [s.9] through [s.13].
  ==
  This appears to be an error on the part of the person (or persons)
  who scanned the book.
++

###{#other-references .modern} Other useful references

$${.modern}
; [《江湖尺牘分韻撮要合集》 (1838)][fan-wan],
  by 虞學圃 and 溫岐石.
  ,
  --
  An 1838 re-engraving (道光十八年重鐫)
  containing the Fan Wan 《分韻撮要》 in the lower half of its pages,
  as scanned by Trove (in collaboration with the National Library of Australia).
  --

; [''A Chinese Dictionary in the Cantonese Dialect'' (1877)][eitel-dict],
  by [Ernst Johann Eitel].
  ,
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
  - Including some characters from Fan Wan 《分韻撮要》 and Kangxi 《康熙字典》
    which Eitel felt indispensable.
  - Including readings and English translations of definitions from Kangxi.
  - Better distinguishing the register (Classical vs Colloquial vs Mixed)
    of the example phrases.
  - Supplying the Chinese characters that were not included
    in the example phrases.
  ==
  --
  See [Eitel's Introduction] for details.
  --

; [粵音資料集叢 (jyut.net)](https://jyut.net/), by 石見田.
  ,
  --
  A database of Cantonese readings from various dictionaries.
  --

; [漢語多功能字庫](https://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/),
  by the Research Centre for Humanities Computing at CUHK.
  ,
  --
  "Multi-function Chinese Character Database", including Cantonese readings.
  --

; [韻典網 (ytenx.org)](https://ytenx.org/), by BYVoid.
  ,
  --
  A database of the olden rime dictionaries (《廣韻》 etc.).
  --

; [說文解字 (shuowen.org)](https://www.shuowen.org/),
  by 'an art lover languishing as a programmer'
  ,
  --
  A database of 《說文解字》, including commentary by 段玉裁.
  --

; [Chinese Text Project Dictionary](https://ctext.org/dictionary.pl?if=en),
  by Donald Sturgeon.
  ,
  --
  Easy reference to radical+strokes, Unihan readings, 《廣韻》, and 《康熙字典》.
  --

; [Dictionary of Chinese Character Variants](https://dict.variants.moe.edu.tw/),
  by the Ministry of Education (ROC).
  ,
  --
  A comprehensive variant character dictionary, with convenient scans of
  olden character and rime dictionaries in the side bar.
  --

; [萌典 (moedict.tw)](https://www.moedict.tw/), by [Audrey Tang].
  ,
  --
  Taiwan g0v (gov-zero) dictionary.
  --
$$

[google]: https://books.google.com/books?id=X8JhunQfImoC
[onb]: https://search.onb.ac.at/permalink/f/128lc6g/ONB_alma21317554760003338
[uiuc]: https://archive.org/details/tonicdictionaryo00will/page/n6/mode/1up
[fan-wan]: https://nla.gov.au/nla.obj-56620342
[eitel-dict]: https://books.google.com/books?id=mh8TAAAAYAAJ
[Ernst Johann Eitel]: https://en.wikipedia.org/wiki/Ernst_Johann_Eitel
[Eitel's Introduction]: https://books.google.com/books?id=mh8TAAAAYAAJ&jtp=vii
[James Legge]: https://en.wikipedia.org/wiki/James_Legge
[Audrey Tang]: https://en.wikipedia.org/wiki/Audrey_Tang


##{#modernisation .modern} Modernisation

--{.modern}
This annotated edition of Williams' original is an ongoing solo effort by Conway,
consisting of:
--
++{.modern}
1. Transcribing its entries
   (<span class="williams">black serif text</span>)
   with bullet list formatting for readability;

1. Making (mostly corrective) edits in the form of
   deletions (<span class="williams">~~black serif struck~~</span>)
   and insertions (<span class="williams">``crimson serif underlined``</span>);

1. Normalising characters and readings
   to account for modern usage and conventions;

1. Associating entries with those in the original Fan Wan 《分韻撮要》;

1. Collating the entries by Jyutping
   (noting that there are phonological differences between
   the [Ts(')ing Dynasty Cantonese recorded by Williams](/intro/)
   and [modern Hong Kong Cantonese](/phonology/));

1. Under each Jyutping pronunciation,
   sorting the entries by radical, then residual strokes,
   then whether it is an extension ideograph, then code point;

1. Inserting Jyutping (%modern-colour sans-serif text)
   alongside the Williams romanisations;

1. Inserting characters (%modern-colour sans-serif text)
   if not already supplied alongside the Williams romanisations,
   where practicable;

1. Inserting commentary (%modern-colour sans-serif text);

1. Adding supplementary entries for some characters or senses
   that were not recorded by Williams.
++
--{.modern}
**No effort has been made to alter or censor the 1856 Williams text
for the sensitivities of 21st-century readers.**
--
