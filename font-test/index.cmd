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
