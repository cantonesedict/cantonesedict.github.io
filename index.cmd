< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr
< /res/rules/links.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Home
* %date-modified --> 2023-07-22
* %copyright-prior-years -->

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
The version of ''Tonic Dictionary'' used as a base reference is
[ark:/13960/t0ps1ph66 at archive.org][tonic].
--
--{.modern}
Modernisation is a solo effort by Conway, consisting of:
--
++{.modern}
1. Transcribing its entries <span class="williams">(black serif text)</span>;

1. Collating the entries by Jyutping
   (noting that there are phonological differences between
   the Ts'ing Dynasty Cantonese recorded by Williams
   and modern Hong Kong Cantonese);

1. Under each Jyutping pronunciation, sorting the entries by Unicode code point;

1. Inserting characters and Jyutping (purple sans-serif text)
   in the romanisation-only examples, where practicable;

1. Inserting remarks (purple sans-serif text)
   and cross-reference links (blue);

1. Adding entries for some characters that were not recorded by Williams.
++
--{.modern}
No effort has been made to alter or censor the Williams text
for the sensitivities of 21st century readers.
--


##{#contents .modern} Contents

--{.modern}
Work in progress.
--

<nav>
===={.modern}
-{.williams} Preface [[TODO]]
-{.williams} Introduction [[TODO]]
- [Index of entries by Jyutping slug](/entries/)
====
</nav>
