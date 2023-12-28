< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of vernacular terms by Jyutping
* %date-modified --> 2023-12-29
* %copyright-prior-years -->

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

||||{.wide}
''{.modern}
|^
  //
    ; Jyutping
    ; Term
    ; Entry link
|:
<## vernacular-table-body ##>
<## /vernacular-table-body ##>
''
||||
