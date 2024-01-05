< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of characters by radical
* %date-modified --> 2024-01-05
* %copyright-prior-years -->
* %meta-description --> index of characters by radical

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

RegexDictionaryReplacement: #.stroke-count-links
- queue_position: BEFORE #specified-links
* \[ (?P<stroke_count> [0-9]+ ) \]
    -->
  [\g<stroke_count>](\g<stroke_count>)

RegexDictionaryReplacement: #.radical-stroke-counts
- queue_position: BEFORE #specified-links
* (?P<radical> [⼀-⼅] ) --> " 1#\g<radical>"
* (?P<radical> [⼆-⼜] ) --> " 2#\g<radical>"
* (?P<radical> [⼝-⼻] ) --> " 3#\g<radical>"
* (?P<radical> [⼼-⽝] ) --> " 4#\g<radical>"
* (?P<radical> [⽞-⽴] ) --> " 5#\g<radical>"
* (?P<radical> [⽵-⾑] ) --> " 6#\g<radical>"
* (?P<radical> [⾒-⾥] ) --> " 7#\g<radical>"
* (?P<radical> [⾦-⾮] ) --> " 8#\g<radical>"
* (?P<radical> [⾯-⾹] ) --> " 9#\g<radical>"
* (?P<radical> [⾺-⿁] ) --> " 10#\g<radical>"
* (?P<radical> [⿂-⿇] ) --> " 11#\g<radical>"
* (?P<radical> [⿈-⿋] ) --> " 12#\g<radical>"
* (?P<radical> [⿌-⿏] ) --> " 13#\g<radical>"
* (?P<radical> [⿐⿑] )  --> " 14#\g<radical>"
* (?P<radical> [⿒] )    --> " 15#\g<radical>"
* (?P<radical> [⿓⿔] )  --> " 16#\g<radical>"
* (?P<radical> [⿕] )    --> " 17#\g<radical>"

RegexDictionaryReplacement: #.radical-links
- queue_position: BEFORE #specified-links
* (?P<stroke_count> [0-9]+ ) [#] (?P<radical> [⼀-⿕] )
    -->
  [\g<radical>](\g<stroke_count>#\g<radical>)

%%%

#{.modern} %title

<nav>
||||{.wide}
''{.modern}
|^
  //
    ; Strokes
    ; Radicals
|:
  //
    , [1]
    , ⼀⼁⼂⼃⼄⼅
  //
    , [2]
    , ⼆⼇⼈⼉⼊⼋⼌⼍⼎⼏⼐⼑⼒⼓⼔⼕⼖⼗⼘⼙⼚⼛⼜
  //
    , [3]
    , ⼝⼞⼟⼠⼡⼢⼣⼤⼥⼦⼧⼨⼩⼪⼫⼬⼭⼮⼯⼰⼱⼲⼳⼴⼵⼶⼷⼸⼹⼺⼻
  //
    , [4]
    , ⼼⼽⼾⼿⽀⽁⽂⽃⽄⽅⽆⽇⽈⽉⽊⽋⽌⽍⽎⽏⽐⽑⽒⽓⽔⽕⽖⽗⽘⽙⽚⽛⽜⽝
  //
    , [5]
    , ⽞⽟⽠⽡⽢⽣⽤⽥⽦⽧⽨⽩⽪⽫⽬⽭⽮⽯⽰⽱⽲⽳⽴
  //
    , [6]
    , ⽵⽶⽷⽸⽹⽺⽻⽼⽽⽾⽿⾀⾁⾂⾃⾄⾅⾆⾇⾈⾉⾊⾋⾌⾍⾎⾏⾐⾑
  //
    , [7]
    , ⾒⾓⾔⾕⾖⾗⾘⾙⾚⾛⾜⾝⾞⾟⾠⾡⾢⾣⾤⾥
  //
    , [8]
    , ⾦⾧⾨⾩⾪⾫⾬⾭⾮
  //
    , [9]
    , ⾯⾰⾱⾲⾳⾴⾵⾶⾷⾸⾹
  //
    , [10]
    , ⾺⾻⾼⾽⾾⾿⿀⿁
  //
    , [11]
    , ⿂⿃⿄⿅⿆⿇
  //
    , [12]
    , ⿈⿉⿊⿋
  //
    , [13]
    , ⿌⿍⿎⿏
  //
    , [14]
    , ⿐⿑
  //
    , [15]
    , ⿒
  //
    , [16]
    , ⿓⿔
  //
    , [17]
    , ⿕
''
||||
</nav>
