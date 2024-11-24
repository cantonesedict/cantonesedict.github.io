< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Cantonese phonology
* %date-modified --> 2024-11-24
* %copyright-prior-years -->
* %meta-description --> Cantonese phonology

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%


#{.modern} %title

--{.modern}
The Cantonese phonology by which this dictionary has been organised
is best described as modern (late 20th-century) Hong Kong Cantonese,
although there will be instances where usages
specific to Canton (Guangzhou) have been recorded,
either because they appeared in Williams (1856),
or because they are interesting in their own right.
--
--{.modern}
For the phonology of the Ts(')ing Dynasty Cantonese recorded by Williams,
see [Williams' introduction](/intro/).
--


##{#initials .modern} Initials

<nav class="sideways">
=={.modern}
- [(null)](#initial-null)
- [b](#initial-b)
- [c](#initial-c)
- [d](#initial-d)
- [f](#initial-f)
- [g](#initial-g)
- [gw](#initial-gw)
- [h](#initial-h)
- [j](#initial-j)
- [k](#initial-k)
- [kw](#initial-kw)
- [l](#initial-l)
- [m](#initial-m)
- [n](#initial-n)
- [ng](#initial-ng)
- [p](#initial-p)
- [s](#initial-s)
- [t](#initial-t)
- [w](#initial-w)
- [z](#initial-z)
==
</nav>


###{#labial .modern} Labial

||||{.wide}
''{.modern}
|^
  //
    ; 聲
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 巴
    , [p]
    ,{#initial-b} b
    , [__p__ as in s__p__y]
    , Strictly unvoiced, i.e. not to be pronounced [__b__ as in __b__ye].
  //
    , 怕
    , [pʰ]
    ,{#initial-p} p
    , [__p__ as in __p__ie]
    ,
  //
    , 媽
    , [m]
    ,{#initial-m} m
    , [__m__ as in __m__y]
    ,
  //
    , 花
    , [f]
    ,{#initial-f} f
    , [__f__ as in __f__ee]
    ,
''
||||


###{#dental-alveolar .modern} Dental/Alveolar (but not sibilant)

||||{.wide}
''{.modern}
|^
  //
    ; 聲
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 打
    , [t]
    ,{#initial-d} d
    , [__t__ as in s__t__y]
    , Strictly unvoiced, i.e. not to be pronounced [__d__ as in __d__ye].
  //
    , 他
    , [tʰ]
    ,{#initial-t} t
    , [__t__ as in __t__ie], in Received Pronunciation
    , To be pronounced crisply, with no dwell on the aspirate.
  //
    , 那
    , [n]
    ,{#initial-n} n
    , [__n__ as in __n__igh]
    , Often unlearnedly replaced with the initial l~[l].
  //
    , 啦
    , [l]
    ,{#initial-l} l
    , [__l__ as in __l__ie]
    ,
''
||||


###{#dental-alveolar .modern} Velar and glottal (but not approximant)

||||{.wide}
''{.modern}
|^
  //
    ; 聲
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 家
    , [k]
    ,{#initial-g} g
    , [__k__ as in s__k__y]
    , Strictly unvoiced, i.e. not to be pronounced [__g__ as in __g__uy].
      Also see [note on labialised initials](#labialised-initials).
  //
    , 卡
    , [kʰ]
    ,{#initial-k} k
    , [__k__ as in __k__ey]
    , See [note on labialised initials](#labialised-initials).
  //
    , 牙
    , [ŋ]
    ,{#initial-ng} ng
    , [__ng__ as in si__ng__er]
    ,
      Often unlearnedly dropped, leaving a [null initial](#initial-null).
      For literary characters, the initial ng~[ŋ] is the correct one
      (as opposed to the null initial) when the tone is light (陽).
  //
    , 蝦
    , [h]
    ,{#initial-h} h
    , [__h__ as in __h__e]
    ,
  //
    , 瓜
    , [kʷ]
    ,{#initial-gw} gw
    , [__qu__ as in s__qu__eeze]
    , Strictly unvoiced, i.e. not to be pronounced [__Gw__ as in __Gw__en].
      Also see [note on labialised initials](#labialised-initials).
  //
    , 誇
    , [kʷʰ]
    ,{#initial-kw} kw
    , [__qu__ as in __qu__een]
    , See [note on labialised initials](#labialised-initials).
''
||||

####{#labialised-initials .modern} Note on labialised initials

--{.modern}
For characters such as 官 where the main vowel is u~[uː], it is contested
whether the initial is unlabialised (gun~[kuːn]) or labialised (gwun~[kʷuːn]).
Whilst I personally sit in the labialised camp
(per romanisations such as Kwun Tong for 官塘 and Kwu Tung for 古洞),
I have followed standard Jyutping here and used the unlabialised initial.
--


###{#sibilant .modern} Sibilant

||||{.wide}
''{.modern}
|^
  //
    ; 聲
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 將
    , [ts]
    ,{#initial-z r=2} z
    , [__ts__ as in lis__ts__]
    ,{r=2} See [note on pre-merger initials](#pre-merger-initials).
  //
    , 張
    , [tɕ]
    , halfway between [__ts__ as in lis__ts__] and [__t__ as in s__t__upid],
      with the latter in a sufficiently broad Australian accent
      where the T is pronounced like [__ch__ as in __ch__ew]
  //
    , 槍
    , [tsʰ]
    ,{#initial-c r=2} c
    , [__ts__ as in hi__ts__]
    ,{r=2} See [note on pre-merger initials](#pre-merger-initials).
  //
    , 昌
    , [tɕʰ]
    , halfway between [__ts__ as in hi__ts__] and [__ch__ as in hit__ch__]
  //
    , 相
    , [s]
    ,{#initial-s r=2} s
    , [__s__ as in __s__igh]
    ,{r=2} See [note on pre-merger initials](#pre-merger-initials).
  //
    , 傷
    , [ɕ]
    , halfway between [__s__ as in __s__igh] and [__sh__ as in __sh__y]
''
||||

####{#pre-merger-initials .modern} Note on pre-merger initials

--{.modern}
As noted [in Williams' 1856 introduction](/intro/#initials-ch-ts):
--
""{.williams}
2,~20. The initials _ch_ and _ts_ are constantly confounded, and some
persons are absolutely unable to detect the difference, more frequently
calling the words under _ts_ as _ch_, than contrariwise.
All characters
with the sounds _tsz'_ and _ts(')z'_ are liable to be heard _ch(i/)_ and
_ch(')(i/)_, with a stronger breathing than those properly read _ch(i/)_ and
_ch(')(i/)_.
""

--{.modern}
[Moreover](/intro/#initials-sh-s):
--
""{.williams}
16,~17. The initial _sh_ is called _s_ along the coast;
in the districts of Hi(a/)ngsh(a/)n [[香山]], Sinning [[新寧]] and Sinngan [[新安]],
this obtains to a very great extent;
_shui_ 水, _sh(u:)_ 書, _shuk_ 熟, _sh(a/)ng shing_ 省城, &c. &c.,
being heard _sui_, _s(u:)_, _suk_, and _s(a/)ng sing_, as in the Ti(e/)chi(u/) [[潮州]] and Amoy [[廈門]]
dialects. The initial _sh_ is a complete shibboleth to the people of
those districts. West of Canton [[廣州]], many are found who change _sz'_
into _s(u:)_, and a large part of the words beginning with _s_ are changed
into _sh_ just the opposite of the usage at Macao [[澳門]].
""

--{.modern}
Indeed modern Cantonese has merged the pairs:
--
=={.modern}
- [ts] (Williams' _ts_) and [tɕ] (Williams' _ch_),
  both [Jyutping z](#initial-z);
- [tsʰ] (Williams' _ts(')_) and [tɕʰ] (Williams' _ch(')_),
  both [Jyutping c](#initial-c); and
- [s] (Williams' _s_) and [ɕ] (Williams' _sh_),
  both [Jyutping s](#initial-s).
==
--{.modern}
But it is not quite as simple as that.
In two decades of personal experience,
I have perceived a *tendency* for speakers to
consistently favour specific initials depending on the vowel afterward:
--
||||{.wide}
''{.modern}
|^
  //
    ; Vowel afterwards
    ;{c=3} Favoured post-merger initials
|:
  //
    , [aː], [ɐ], [ɛː], [e], [iː]
    , [ts]
    , [tsʰ]
    ,{r=2} [s]
  //
    , [ɔː], [o], [uː], [œ], [ɵ]
    ,{r=2} [tɕ]
    ,{r=2} [tɕʰ]
  //
    , [yː]
    , [ɕ]
''
||||
--{.modern}
For example, the modern speaker will prefer:
--
=={.modern}
- [sɛːk̚] over [ɕɛːk̚] for 石;
- [saːŋ tɕʰɔːy] over [ɕaːŋ tsʰɔːy] for 生菜.
==
--{.modern}
These subtleties are not captured by any modern romanisation scheme
that collapses the merged pairs (including Jyutping).
--


###{#sibilant .modern} Null or null-like

||||{.wide}
''{.modern}
|^
  //
    ; 聲
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 丫
    , (null)
    ,{#initial-null} (null)
    , (no consonant)
    , The null initial.
      Often the [initial ng~\[ŋ\]](#initial-ng) is prepended hypercorrectively
      (e.g. ngaap3 instead of aap3 for 鴨 "duck").
      For literary characters, the null initial is the correct one
      (as opposed to initial ng~[ŋ]) when the tone is dark (陰).
  //
    , 也
    , [j]
    ,{#initial-j} j
    , [__y__ as in __y__e]
    , Williams and some modern linguists take this to be a medial vowel [iː].
  //
    , 華
    , [w]
    ,{#initial-w} w
    , [__w__ as in __w__e]
    , Williams and some modern linguists take this to be a medial vowel [uː].
''
||||


##{#finals .modern} Finals

<nav class="sideways">
=={.modern}
- [a](#final-a)
- [aa](#final-aa)
- [aai](#final-aai)
- [aak](#final-aak)
- [aam](#final-aam)
- [aan](#final-aan)
- [aang](#final-aang)
- [aap](#final-aap)
- [aat](#final-aat)
- [aau](#final-aau)
- [ai](#final-ai)
- [ak](#final-ak)
- [am](#final-am)
- [an](#final-an)
- [ang](#final-ang)
- [ap](#final-ap)
- [at](#final-at)
- [au](#final-au)
==
</nav>


###{#nucleus-aa .modern} Nucleus [aː]

||||{.wide}
''{.modern}
|^
  //
    ; 韻
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 叉
    , [aː]
    ,{#final-aa} aa
    , [__ar__ as in c__ar__],
      in a general Australian accent with strictly no R consonant
    , Often shortened to [final a~\[ɐ\]](#final-a) for vernacular characters.
  //
    , 釵
    , [aːi]
    ,{#final-aai} aai
    , [__y__ as in m__y__],
      in Received Pronunciation
    ,
  //
    , 抄
    , [aːu]
    ,{#final-aau} aau
    , [__ow__ as in c__ow__],
      in Received Pronunciation
    ,
  //
    , 參
    , [aːm]
    ,{#final-aam} aam
    , [__arm__ as in ch__arm__],
      in a general Australian accent with strictly no R consonant
    ,
  //
    , 餐
    , [aːn]
    ,{#final-aan} aan
    , [__arn__ as in b__arn__],
      in a general Australian accent with strictly no R consonant
    ,
  //
    , 撐
    , [aːŋ]
    ,{#final-aang} aang
    , [__ar__ as in c__ar__],
      in a general Australian accent with strictly no R consonant,
      followed by [__ng__ as in si__ng__]
    ,
  //
    , 餐
    , [aːp̚]
    ,{#final-aap} aap
    , [__ar__ as in c__ar__],
      in a general Australian accent with strictly no R consonant,
      followed by [__p__ as in co__p__ter] with no audibly released P
    ,
  //
    , 察
    , [aːt̚]
    ,{#final-aat} aat
    , [__ar__ as in c__ar__],
      in a general Australian accent with strictly no R consonant,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
  //
    , 拆
    , [aːk̚]
    ,{#final-aak} aak
    , [__ar__ as in c__ar__],
      in a general Australian accent with strictly no R consonant,
      followed by [__c__ as in do__c__tor] with no audibly released C
    ,
''
||||


###{#nucleus-a .modern} Nucleus [ɐ]

||||{.wide}
''{.modern}
|^
  //
    ; 韻
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 喳
    , [ɐ]
    ,{#final-a} a
    , [__u__ as in c__u__t],
      in a general Australian accent
    , Only heard for vernacular characters
      as a shortened form of [final aa~\[aː\]](#final-aa).
  //
    , 仔
    , [ɐi]
    ,{#final-ai} ai
    , [__u__ as in c__u__t],
      in a general Australian accent,
      followed by [__ee__ as in b__ee__],
      in Received Pronunciation
    ,
  //
    , 走
    , [ɐu]
    ,{#final-au} au
    , [__u__ as in c__u__t],
      in a general Australian accent,
      followed by [__u__ as in p__u__ll],
      in a general Australian accent
    ,
  //
    , 針
    , [ɐm]
    ,{#final-am} am
    , [__um__ as in s__um__],
      in a general Australian accent,
    ,
  //
    , 真
    , [ɐn]
    ,{#final-an} an
    , [__un__ as in s__un__],
      in a general Australian accent,
    ,
  //
    , 增
    , [ɐŋ]
    ,{#final-ang} ang
    , [__ung__ as in s__ung__],
      in a general Australian accent,
    ,
  //
    , 汁
    , [ɐp̚]
    ,{#final-ap} ap
    , [__u__ as in c__u__t],
      in a general Australian accent,
      followed by [__p__ as in co__p__ter] with no audibly released P
    ,
  //
    , 疾
    , [ɐt̚]
    ,{#final-at} at
    , [__u__ as in c__u__t],
      in a general Australian accent,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
  //
    , 仄
    , [ɐk̚]
    ,{#final-ak} ak
    , [__u__ as in c__u__t],
      in a general Australian accent,
      followed by [__c__ as in do__c__tor] with no audibly released C
    ,
''
||||


##{#tones .modern} Tones
