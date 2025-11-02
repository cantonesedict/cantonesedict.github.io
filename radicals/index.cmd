< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of characters by radical
* %date-modified --> 2025-11-02
* %copyright-prior-years --> 2024--
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
* (?P<radical> [⼀-⼅] ) --> 1#\g<radical>
* (?P<radical> [⼆-⼜] ) --> 2#\g<radical>
* (?P<radical> [⼝-⼻] ) --> 3#\g<radical>
* (?P<radical> [⼼-⽝] ) --> 4#\g<radical>
* (?P<radical> [⽞-⽴] ) --> 5#\g<radical>
* (?P<radical> [⽵-⾑] ) --> 6#\g<radical>
* (?P<radical> [⾒-⾥] ) --> 7#\g<radical>
* (?P<radical> [⾦-⾮] ) --> 8#\g<radical>
* (?P<radical> [⾯-⾹] ) --> 9#\g<radical>
* (?P<radical> [⾺-⿁] ) --> 10#\g<radical>
* (?P<radical> [⿂-⿇] ) --> 11#\g<radical>
* (?P<radical> [⿈-⿋] ) --> 12#\g<radical>
* (?P<radical> [⿌-⿏] ) --> 13#\g<radical>
* (?P<radical> [⿐⿑] )  --> 14#\g<radical>
* (?P<radical> [⿒] )    --> 15#\g<radical>
* (?P<radical> [⿓⿔] )  --> 16#\g<radical>
* (?P<radical> [⿕] )    --> 17#\g<radical>

RegexDictionaryReplacement: #.radical-links
- queue_position: BEFORE #specified-links
* (?P<stroke_count> [0-9]+ ) [#] (?P<radical> [⼀-⿕] )
    -->
  [\g<radical>](\g<stroke_count>#\g<radical>)

%%%

#{.modern} %title

--{.modern}
See also: [Search by character or code point](/search/).
--

||||{.wide}
''{.modern .radicals}
|^
  //
    ; Strokes
    ; Radicals
|:
  //
    , [1]
    ,
      <nav class="sideways">
      ==
      - ⼀
      - ⼁
      - ⼂
      - ⼃
      - ⼄
      - ⼅
      ==
      </nav>
  //
    , [2]
    ,
      <nav class="sideways">
      ==
      - ⼆
      - ⼇
      - ⼈
      - ⼉
      - ⼊
      - ⼋
      - ⼌
      - ⼍
      - ⼎
      - ⼏
      - ⼐
      - ⼑
      - ⼒
      - ⼓
      - ⼔
      - ⼕
      - ⼖
      - ⼗
      - ⼘
      - ⼙
      - ⼚
      - ⼛
      - ⼜
      ==
      </nav>
  //
    , [3]
    ,
      <nav class="sideways">
      ==
      - ⼝
      - ⼞
      - ⼟
      - ⼠
      - ⼡
      - ⼢
      - ⼣
      - ⼤
      - ⼥
      - ⼦
      - ⼧
      - ⼨
      - ⼩
      - ⼪
      - ⼫
      - ⼬
      - ⼭
      - ⼮
      - ⼯
      - ⼰
      - ⼱
      - ⼲
      - ⼳
      - ⼴
      - ⼵
      - ⼶
      - ⼷
      - ⼸
      - ⼹
      - ⼺
      - ⼻
      ==
      </nav>
  //
    , [4]
    ,
      <nav class="sideways">
      ==
      - ⼼
      - ⼽
      - ⼾
      - ⼿
      - ⽀
      - ⽁
      - ⽂
      - ⽃
      - ⽄
      - ⽅
      - ⽆
      - ⽇
      - ⽈
      - ⽉
      - ⽊
      - ⽋
      - ⽌
      - ⽍
      - ⽎
      - ⽏
      - ⽐
      - ⽑
      - ⽒
      - ⽓
      - ⽔
      - ⽕
      - ⽖
      - ⽗
      - ⽘
      - ⽙
      - ⽚
      - ⽛
      - ⽜
      - ⽝
      ==
      </nav>
  //
    , [5]
    ,
      <nav class="sideways">
      ==
      - ⽞
      - ⽟
      - ⽠
      - ⽡
      - ⽢
      - ⽣
      - ⽤
      - ⽥
      - ⽦
      - ⽧
      - ⽨
      - ⽩
      - ⽪
      - ⽫
      - ⽬
      - ⽭
      - ⽮
      - ⽯
      - ⽰
      - ⽱
      - ⽲
      - ⽳
      - ⽴
      ==
      </nav>
  //
    , [6]
    ,
      <nav class="sideways">
      ==
      - ⽵
      - ⽶
      - ⽷
      - ⽸
      - ⽹
      - ⽺
      - ⽻
      - ⽼
      - ⽽
      - ⽾
      - ⽿
      - ⾀
      - ⾁
      - ⾂
      - ⾃
      - ⾄
      - ⾅
      - ⾆
      - ⾇
      - ⾈
      - ⾉
      - ⾊
      - ⾋
      - ⾌
      - ⾍
      - ⾎
      - ⾏
      - ⾐
      - ⾑
      ==
      </nav>
  //
    , [7]
    ,
      <nav class="sideways">
      ==
      - ⾒
      - ⾓
      - ⾔
      - ⾕
      - ⾖
      - ⾗
      - ⾘
      - ⾙
      - ⾚
      - ⾛
      - ⾜
      - ⾝
      - ⾞
      - ⾟
      - ⾠
      - ⾡
      - ⾢
      - ⾣
      - ⾤
      - ⾥
      ==
      </nav>
  //
    , [8]
    ,
      <nav class="sideways">
      ==
      - ⾦
      - ⾧
      - ⾨
      - ⾩
      - ⾪
      - ⾫
      - ⾬
      - ⾭
      - ⾮
      ==
      </nav>
  //
    , [9]
    ,
      <nav class="sideways">
      ==
      - ⾯
      - ⾰
      - ⾱
      - ⾲
      - ⾳
      - ⾴
      - ⾵
      - ⾶
      - ⾷
      - ⾸
      - ⾹
      ==
      </nav>
  //
    , [10]
    ,
      <nav class="sideways">
      ==
      - ⾺
      - ⾻
      - ⾼
      - ⾽
      - ⾾
      - ⾿
      - ⿀
      - ⿁
      ==
      </nav>
  //
    , [11]
    ,
      <nav class="sideways">
      ==
      - ⿂
      - ⿃
      - ⿄
      - ⿅
      - ⿆
      - ⿇
      ==
      </nav>
  //
    , [12]
    ,
      <nav class="sideways">
      ==
      - ⿈
      - ⿉
      - ⿊
      - ⿋
      ==
      </nav>
  //
    , [13]
    ,
      <nav class="sideways">
      ==
      - ⿌
      - ⿍
      - ⿎
      - ⿏
      ==
      </nav>
  //
    , [14]
    ,
      <nav class="sideways">
      ==
      - ⿐
      - ⿑
      ==
      </nav>
  //
    , [15]
    ,
      <nav class="sideways">
      ==
      - ⿒
      ==
      </nav>
  //
    , [16]
    ,
      <nav class="sideways">
      ==
      - ⿓
      - ⿔
      ==
      </nav>
  //
    , [17]
    ,
      <nav class="sideways">
      ==
      - ⿕
      ==
      </nav>
''
||||
