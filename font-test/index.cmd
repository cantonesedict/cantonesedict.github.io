< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr
< /res/rules/links.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Font test page
* %date-modified --> 2023-07-28
* %copyright-prior-years -->

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

##{.modern} Ideographic tone marks: four tones

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
    ,{.font-test}
    ,{.font-test} 平〪
  //
    , U+302B
    , Classical marker for rising tone (上聲)
    ,{.font-test}
    ,{.font-test} 上〫
  //
    , U+302C
    , Classical marker for departing tone (去聲)
    ,{.font-test}
    ,{.font-test} 去〬
  //
    , U+302D
    , Classical marker for entering tone (入聲)
    ,{.font-test}
    ,{.font-test} 入〭
''
||||


##{.modern} Modifier letters: eight tones

--{.modern}
These modifier letters are *not* combining characters;
the markers for level (平) and rising (上) are placed manually on the left
whilst those for departing (去) and entering (入) are placed on the right.
--
--{.modern}
The modifier letters for the dark/feminine (陰) or upper tones
should appear like semi-circles.
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
    ,{.font-test}
    ,{.font-test} (1)陰
  //
    , U+A701
    , Modifier letter for light-level (陽平)
    ,{.font-test}
    ,{.font-test} (4)陽
  //
    , U+A702
    , Modifier letter for dark-rising (陰上)
    ,{.font-test}
    ,{.font-test} (2)飲
  //
    , U+A703
    , Modifier letter for light-rising (陽上)
    ,{.font-test}
    ,{.font-test} (5)癢
  //
    , U+A704
    , Modifier letter for dark-departing (陰去)
    ,{.font-test}
    ,{.font-test} 蔭(3)
  //
    , U+A705
    , Modifier letter for light-departing (陽去)
    ,{.font-test}
    ,{.font-test} 讓(6)
  //
    , U+A706
    , Modifier letter for dark-entering (陰入)
    ,{.font-test}
    ,{.font-test} 泣(7)
  //
    , U+A707
    , Modifier letter for light-entering (陽入)
    ,{.font-test}
    ,{.font-test} 藥(9)
''
||||
