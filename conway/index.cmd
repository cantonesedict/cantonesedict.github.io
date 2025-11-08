< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Conway's preface
* %date-modified --> 2025-11-08
* %copyright-prior-years -->
* %meta-description --> Conway's preface

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%


#{.modern} %title

--{.modern}
As a child of the late 1990s and early 2000s,
I did not grow up with access to a Cantonese dictionary
where I could look up characters by pronunciation;
nor did I have a Cantonese dictionary with English definitions.
All I had was a native dictionary, [《商務新字典》],
with characters arranged by radical.
This was fine for looking up the pronunciation of a given character,
but completely hopeless for finding the right character for a given pronunciation.
--
--{.modern}
Native Chinese dictionaries (Cantonese or otherwise) are,
for the most part, rather useless for self-guided learners.
They are written for people who already know how to read,
and who simply want to confirm their existing understanding.
In these dictionaries, explanations often self-reference the character being defined.
Young Conway did not find it helpful
that the definition of 將 "about to" began with 將要,
nor 窗 "window" with 窗戶.
--
--{.modern}
On the other hand, I do sympathise with writers of native Cantonese dictionaries,
as there are three types of reader competing for their attention:
--
++{.modern}
1. The classical scholar,
   who wants to know how to read olden texts aloud in Cantonese;
2. The vernacular learner,
   who wants to know how to write vernacular Cantonese; and
3. The pragmatic user,
   who wants to know how to write a somewhat formal version of vernacular Mandarin
   (commonly called "standard Chinese").
++
--{.modern}
Usually, the needs of the first two are neglected in favour of the third,
due to the political reality of what is considered "standard".
((Note that the relationship between Cantonese and the umbrella term of Chinese
is difficult to characterise.
On the one hand, it is folly to suggest that Cantonese is not Chinese:
it is clearly a descendant of the classical language,
and preserves many usages that Mandarin does not
(e.g. preferring 飲食 over 吃喝, 似 over 像, 今日 over 今天, etc.).
On the other hand, it is equally folly to suggest that
*every* aspect of Cantonese can be traced to the classics:
this is demonstrably false by way of the comparative method.
To argue that any variety of Chinese is somehow superior or inferior
as an inheritor of the classical language is, in my opinion, unmeaningful.))
--
--{.modern}
I have produced this dictionary for those neglected first two types of reader.
Specifically, this dictionary is for young Conway,
who had an interest in both vernacular Cantonese and in Classical Chinese,
but who very nearly gave up due to the lack of good learning resources
accessible to him in his childhood.
--
--{.modern}
Rather than write a new dictionary from scratch,
I have decided to leverage Williams' 1856 ''Tonic Dictionary''
for two reasons:
--
++{.modern}
1. It is an extremely high quality English record of the Cantonese vernacular; and
2. At the same time, it is very obvious where Williams has drawn upon the Kangxi Dictionary to document the classical language.
++
--{.modern}
The resulting ''<`Conway's Cantonese Dictionary`>'' is best described
as an annotated version of Williams' ''Tonic Dictionary''.
If you must refer to it in Chinese, then please call it 《英華分韻註》.
--
--{.modern}
It is my hope that this dictionary might help those
who have a basic command of spoken Cantonese,
but are unsure in the written language,
as young Conway very much was.
--
--{.modern}
This be the preface.
--
--{.modern .sign-off}
Conway
--
--{.modern .sign-off}
(To be dated on completion.)
--


[《商務新字典》]: https://web.archive.org/web/20210506141434/https://www.cp1897.com.hk/product_info.php?BookId=9620701402
