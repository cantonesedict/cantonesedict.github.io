< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Font test page
* %date-modified --> 2025-11-01
* %copyright-prior-years --> 2023--
* %meta-description --> Font test page for tone marks

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

<## Reference images taken at 200% zoom with <td> padding set at 2px etc. ##>


#{.modern} %title

##{#four-tones .modern} Ideographic tone marks: four tones

--{.modern}
These tone marks are combining characters,
and should appear as circles on one of the four corners of a character
(representing the four tones of Middle Chinese).
--

||||{.wide}
''{.modern}
|^
  //
    ; Code point
    ; Description
    ; Reference image
    ; Your browser
|:
  //
    , U+302A
    , Classical marker for level tone (平聲)
    ,{.font-test} ![Character with circle on bottom-left corner](平.png)
    ,{.font-test} 平〪
  //
    , U+302B
    , Classical marker for rising tone (上聲)
    ,{.font-test} ![Character with circle on top-left corner](上.png)
    ,{.font-test} 上〫
  //
    , U+302C
    , Classical marker for departing tone (去聲)
    ,{.font-test} ![Character with circle on top-right corner](去.png)
    ,{.font-test} 去〬
  //
    , U+302D
    , Classical marker for entering tone (入聲)
    ,{.font-test} ![Character with circle on bottom-right corner](入.png)
    ,{.font-test} 入〭
''
||||


##{#eight-tones .modern} Modifier letters: eight tones

--{.modern}
These modifier letters are *not* combining characters;
the markers for level (平) and rising (上) are placed manually on the left
whilst those for departing (去) and entering (入) are placed on the right.
--
--{.modern}
The modifier letters for the dark/feminine (陰) or upper tones
should appear like semicircles.
Those for the light/masculine (陽) or lower tones
should appear likewise but with an additional underline.
--

||||{.wide}
''{.modern}
|^
  //
    ; Code point
    ; Description
    ; Reference image
    ; Your browser
|:
  //
    , U+A700
    , Modifier letter for dark-level (陰平)
    ,{.font-test} ![Character with semicircle at bottom-left corner](陰平.png)
    ,{.font-test} (1)陰
  //
    , U+A701
    , Modifier letter for light-level (陽平)
    ,{.font-test} ![Character with underlined semicircle at bottom-left corner](陽平.png)
    ,{.font-test} (4)陽
  //
    , U+A702
    , Modifier letter for dark-rising (陰上)
    ,{.font-test} ![Character with semicircle at top-left corner](陰上.png)
    ,{.font-test} (2)飲
  //
    , U+A703
    , Modifier letter for light-rising (陽上)
    ,{.font-test} ![Character with underlined semicircle at top-left corner](陽上.png)
    ,{.font-test} (5)癢
  //
    , U+A704
    , Modifier letter for dark-departing (陰去)
    ,{.font-test} ![Character with semicircle at top-right corner](陰去.png)
    ,{.font-test} 蔭(3)
  //
    , U+A705
    , Modifier letter for light-departing (陽去)
    ,{.font-test} ![Character with underlined semicircle at top-right corner](陽去.png)
    ,{.font-test} 讓(6)
  //
    , U+A706
    , Modifier letter for dark-entering (陰入)
    ,{.font-test} ![Character with semicircle at bottom-right corner](陰入.png)
    ,{.font-test} 泣(7)
  //
    , U+A707
    , Modifier letter for light-entering (陽入)
    ,{.font-test} ![Character with underlined semicircle at bottom-right corner](陽入.png)
    ,{.font-test} 藥(9)
''
||||
