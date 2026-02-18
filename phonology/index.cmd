< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Cantonese phonology
* %date-modified --> 2026-02-18
* %copyright-prior-years --> 2024--
* %meta-description --> Cantonese phonology

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%


#{.modern} %title

<nav class="sideways">
=={.modern}
- [Initials](#initials)
- [Finals](#finals)
- [Tones](#tones)
- [Pronunciation](#pronunciation)
==
</nav>

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
    ; Ex.
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
    , Strictly unvoiced, i.e. *not* to be pronounced [__b__ as in __b__ye].
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
    ; Ex.
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
    , Strictly unvoiced, i.e. *not* to be pronounced [__d__ as in __d__ye].
  //
    , 他
    , [tʰ]
    ,{#initial-t} t
    , [__t__ as in __t__ie], in Received Pronunciation
    , To be pronounced lightly and cleanly, with no dwell on the aspirate.
  //
    , 那
    , [n]
    ,{#initial-n} n
    , [__n__ as in __n__igh]
    , Often lazily replaced with initial l~[l].
  //
    , 啦
    , [l]
    ,{#initial-l} l
    , [__l__ as in __l__ie]
    ,
''
||||


###{#velar-glottal .modern} Velar and glottal (but not approximant)

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
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
    , Strictly unvoiced, i.e. *not* to be pronounced [__g__ as in __g__uy].
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
      Often lazily dropped, leaving a [null initial](#initial-null).
      For literary characters, initial ng~[ŋ] is the correct one
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
    , Strictly unvoiced, i.e. *not* to be pronounced [__Gw__ as in __Gw__en].
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
    ; Ex.
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


###{#null .modern} Null or null-like

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
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
      Often [initial ng~\[ŋ\]](#initial-ng) is prepended hypercorrectively
      (e.g. ngaap3 instead of aap3 for 鴨 "duck").
      For literary characters, the null initial is the correct one
      (as opposed to initial ng~[ŋ]) when the tone is dark (陰).
  //
    , 也
    , [j]
    ,{#initial-j} j
    , [__y__ as in __y__e]
    , Williams considers the initial to be null when the main vowel is [iː].
  //
    , 華
    , [w]
    ,{#initial-w} w
    , [__w__ as in __w__e]
    , Williams considers the initial to be null when the main vowel is [uː].
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
- [e](#final-e)
- [ei](#final-ei)
- [ek](#final-ek)
- [em](#final-em)
- [eng](#final-eng)
- [eoi](#final-eoi)
- [eon](#final-eon)
- [eot](#final-eot)
- [ep](#final-ep)
- [eu](#final-eu)
- [i](#final-i)
- [ik](#final-ik)
- [im](#final-im)
- [in](#final-in)
- [ing](#final-ing)
- [ip](#final-ip)
- [it](#final-it)
- [iu](#final-iu)
- [m](#final-m)
- [ng](#final-ng)
- [o](#final-o)
- [oe](#final-oe)
- [oek](#final-oek)
- [oeng](#final-oeng)
- [oi](#final-oi)
- [ok](#final-ok)
- [on](#final-on)
- [ong](#final-ong)
- [ot](#final-ot)
- [ou](#final-ou)
- [u](#final-u)
- [ui](#final-ui)
- [uk](#final-uk)
- [un](#final-un)
- [ung](#final-ung)
- [ut](#final-ut)
- [yu](#final-yu)
- [yun](#final-yun)
- [yut](#final-yut)
==
</nav>


###{#nucleus-aa .modern} Nucleus [aː]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
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
    ; Ex.
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
    , Also pronounced [om] in vernacular 噉 (gam2) and 咁 (gam3).
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


###{#nucleus-e .modern} Nucleus [ɛː, e]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 爹
    , [ɛː]
    ,{#final-e} e
    , [__e__ as in y__e__ah],
      in a general Australian accent, but slightly longer
    ,
  //
    , 地
    , [ei]
    ,{#final-ei} ei
    , [__ay__ as in b__ay__],
      in Received Pronunciation, but with shorter A and longer Y
    ,
  //
    , 掉
    , [ɛːu]
    ,{#final-eu} eu
    , [__e__ as in y__e__ah],
      in a general Australian accent,
      followed by [__u__ as in p__u__ll], in a general Australian accent
    , Only heard in vernacular readings,
      usually as a variation of [final iu~\[iːu\]](#final-iu).
  //
    , 舔
    , [ɛːm]
    ,{#final-em} em
    , [__em__ as in h__em__],
      in a general Australian accent, but longer
    , Only heard in vernacular readings,
      often as a variation of [final im~\[iːm\]](#final-im).
  //
    , 贏
    , [ɛːŋ]
    ,{#final-eng} eng
    , [__e__ as in y__e__ah],
      in a general Australian accent, but slightly longer,
      followed by [__ng__ as in si__ng__]
    ,
  //
    , 夾
    , [ɛːp̚]
    ,{#final-ep} ep
    , [__e__ as in y__e__ah],
      in a general Australian accent, but slightly longer,
      followed by [__p__ as in co__p__ter] with no audibly released P
    , Only heard in vernacular readings,
      often as a variation of [final ip~\[iːp̚\]](#final-ip).
  //
    , 尺
    , [ɛːk̚]
    ,{#final-ek} ek
    , [__e__ as in y__e__ah],
      in a general Australian accent, but slightly longer,
      followed by [__c__ as in do__c__tor] with no audibly released C
    ,
''
||||


###{#nucleus-i .modern} Nucleus [iː, e]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 而
    , [iː]
    ,{#final-i} i
    , [__ee__ as in b__ee__],
      in Received Pronunciation
    ,
  //
    , 堯
    , [iːu]
    ,{#final-iu} iu
    , [__ee__ as in b__ee__],
      in Received Pronunciation,
      followed by [__u__ as in p__u__ll], in a general Australian accent
    ,
  //
    , 嚴
    , [iːm]
    ,{#final-im} im
    , [__eem__ as in s__eem__],
      in Received Pronunciation
    ,
  //
    , 言
    , [iːn]
    ,{#final-in} in
    , [__een__ as in s__een__],
      in Received Pronunciation
    ,
  //
    , 形
    , [eŋ]
    ,{#final-ing} ing
    , halfway between [__i__ as in t__i__n] and [__e__ as in t__e__n],
      both in a general Australian accent,
      followed by [__ng__ as in si__ng__]
    ,
  //
    , 葉
    , [iːp̚]
    ,{#final-ip} ip
    , [__ee__ as in b__ee__],
      in Received Pronunciation,
      followed by [__p__ as in co__p__ter] with no audibly released P
    ,
  //
    , 熱
    , [iːt̚]
    ,{#final-it} it
    , [__ee__ as in b__ee__],
      in Received Pronunciation,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
  //
    , 亦
    , [ek̚]
    ,{#final-ik} ik
    , halfway between [__i__ as in t__i__n] and [__e__ as in t__e__n],
      both in a general Australian accent,
      followed by [__c__ as in do__c__tor] with no audibly released C
    ,
''
||||


###{#nucleus-o .modern} Nucleus [ɔː, o]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 歌
    , [ɔː]
    ,{#final-o} o
    , [__or__ as in n__or__],
      in a general Australian accent with strictly no R consonant
    ,
  //
    , 該
    , [ɔːy]
    ,{#final-oi} oi
    , [__or__ as in n__or__],
      in a general Australian accent with strictly no R consonant,
      followed by [__ü__ as in __ü__ber], in German
    , Also pronounced an unrounded coda, i.e. [ɔːi].
  //
    , 高
    , [ou]
    ,{#final-ou} ou
    , [__or__ as in n__or__],
      in a general Australian accent with strictly no R consonant,
      but much shorter,
      followed by [__u__ as in p__u__ll], in a general Australian accent
    ,
  //
    , 干
    , [ɔːn]
    ,{#final-on} on
    , [__orn__ as in h__orn__],
      in a general Australian accent with strictly no R consonant
    ,
  //
    , 江
    , [ɔːŋ]
    ,{#final-ong} ong
    , [__or__ as in n__or__],
      in a general Australian accent with strictly no R consonant,
      followed by [__ng__ as in si__ng__]
    , Sometimes pronounced with the vowel more open, i.e. [ɒːŋ].
  //
    , 葛
    , [ɔːt̚]
    ,{#final-ot} ot
    , [__or__ as in n__or__],
      in a general Australian accent with strictly no R consonant,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
  //
    , 各
    , [ɔːk̚]
    ,{#final-ok} ok
    , [__or__ as in n__or__],
      in a general Australian accent with strictly no R consonant,
      followed by [__c__ as in do__c__tor] with no audibly released C
    , Sometimes pronounced with the vowel more open, i.e. [ɒːk̚].
''
||||


###{#nucleus-u .modern} Nucleus [uː, o]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 呼
    , [uː]
    ,{#final-u} u
    , [__u__ as in p__u__ll],
      in a general Australian accent, but longer
    ,
  //
    , 灰
    , [uːy]
    ,{#final-ui} ui
    , [__u__ as in p__u__ll],
      in a general Australian accent, but longer,
      followed by [__ü__ as in __ü__ber], in German
    , Also pronounced an unrounded coda, i.e. [uːi].
  //
    , 歡
    , [uːn]
    ,{#final-un} un
    , [__u__ as in p__u__ll],
      in a general Australian accent, but longer,
      followed by [__n__ as in si__n__]
    ,
  //
    , 風
    , [oŋ]
    ,{#final-ung} ung
    , halfway between [__oo__ as in t__oo__k] and [__or__ as in n__or__],
      both in a general Australian accent with strictly no R consonant,
      followed by [__ng__ as in si__ng__]
    ,
  //
    , 闊
    , [uːt̚]
    ,{#final-ut} ut
    , [__u__ as in p__u__ll],
      in a general Australian accent, but longer,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
  //
    , 福
    , [ok̚]
    ,{#final-uk} uk
    , halfway between [__oo__ as in t__oo__k] and [__or__ as in n__or__],
      both in a general Australian accent with strictly no R consonant,
      followed by [__c__ as in do__c__tor] with no audibly released C
    ,
''
||||


###{#nucleus-oe .modern} Nucleus [œ]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 靴
    , [œː]
    ,{#final-oe} oe
    , [__ö__ as in H__ö__lle], in German
    ,
  //
    , 香
    , [œːŋ]
    ,{#final-oeng} oeng
    , [__ö__ as in H__ö__lle], in German,
      followed by [__ng__ as in si__ng__]
    ,
  //
    , 卻
    , [œːk̚]
    ,{#final-oek} oek
    , [__ö__ as in H__ö__lle], in German,
      followed by [__c__ as in do__c__tor] with no audibly released C
    ,
''
||||


###{#nucleus-eo .modern} Nucleus [ɵ]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 需
    , [ɵy]
    ,{#final-eoi} eoi
    , [__o__ as in butt__o__n],
      in a general Australian accent,
      followed by [__ü__ as in __ü__ber], in German
    ,
  //
    , 詢
    , [ɵn]
    ,{#final-eon} eon
    , [__o__ as in butt__o__n],
      in a general Australian accent,
      followed by [__n__ as in si__n__]
    ,
  //
    , 戌
    , [ɵt̚]
    ,{#final-eot} eot
    , [__o__ as in butt__o__n],
      in a general Australian accent,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
''
||||


###{#nucleus-yu .modern} Nucleus [yː]

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 遇
    , [yː]
    ,{#final-yu} yu
    , [__ü__ as in __ü__ber], in German
    ,
  //
    , 願
    , [yːn]
    ,{#final-yun} yun
    , [__ü__ as in __ü__ber], in German,
      followed by [__n__ as in si__n__]
    ,
  //
    , 月
    , [yːt̚]
    ,{#final-yut} yut
    , [__ü__ as in __ü__ber], in German,
      followed by [__t__ as in a__t__las] with no audibly released T
    ,
''
||||


###{#syllabic .modern} Syllabic consonants

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; IPA
    ; Jyutping
    ; Approximation
    ; Remarks
|:
  //
    , 唔
    , [m̩]
    ,{#final-m} m
    , [__m__ as in su__m__], but longer
    ,
  //
    , 吾
    , [ŋ̍]
    ,{#final-ng} ng
    , [__ng__ as in si__ng__], but longer
    , Often lazily replaced with syllabic m~[m̩].
''
||||


##{#tones .modern} Tones

###{#tone-diagram .modern} Diagram of tones

||{.image-container}
  ![Diagram showing the pitch contours of the nine tones of Cantonese.](tone-diagram.svg)
||

###{#tone-table .modern} Table of tones

||||{.wide}
''{.modern}
|^
  //
    ; Ex.
    ; #
    ; Tone
    ; IPA (numerals)
    ; Jyutping
    ; Remarks
|:
  //{#tone-1}
    , 婚
    , 1
    , 陰平 (dark-level)
    , [fɐn˥˥] (55)
    , fan1
    , In Canton (Guangzhou), there is apparently a distinction
      between high-level and high-falling.
      I have not made such a distinction here,
      both because I am unfamiliar with it
      and because I have a bias in favour of [fɐn˥˥] (55)
      (it is a level tone after all).
  //{#tone-2}
    , 粉
    , 2
    , 陰上 (dark-rising)
    , [fɐn˧˥] (35)
    , fan2
    , May start lower, i.e. [fɐn˨˥] (25).
  //{#tone-3}
    , 訓
    , 3
    , 陰去 (dark-departing)
    , [fɐn˧˧] (33)
    , fan3
    ,
  //{#tone-4}
    , 焚
    , 4
    , 陽平 (light-level)
    , [fɐn˩˩] (11)
    , fan4
    , Also pronounced slightly falling, i.e. [fɐn˨˩] (21),
      especially if the syllable is drawn-out
      (as in operatic or theatrical dialogue).
      I have a bias in favour of [fɐn˩˩] (11)
      (it is a level tone after all).
  //{#tone-5}
    , 奮
    , 5
    , 陽上 (light-rising)
    , [fɐn˨˧] (23)
    , fan5
    ,
  //{#tone-6}
    , 份
    , 6
    , 陽去 (light-departing)
    , [fɐn˨˨] (22)
    , fan6
    ,
  //{#tone-7}
    , 忽
    , 7
    , 高陰入 (higher-dark-entering)
    , [fɐt̚˥] \(5\)
    , fat1
    , Sometimes called 高入. The name 高陰入 is preferable
      as it preserves the qualifier 陰 "dark".
      Also see [note on entering tones](#entering-tones).
  //{#tone-8}
    ,
    , 8
    , 低陰入 (lower-dark-entering)
    , [fɐt̚˧] \(3\)
    , fat3
    , Sometimes called 中入. The name 低陰入 is preferable
      as it preserves the qualifier 陰 "dark".
      Also see [note on entering tones](#entering-tones).
  //{#tone-9}
    , 佛
    , 9
    , 陽入 (light-entering)
    , [fɐt̚˨] \(2\)
    , fat6
    , Sometimes called 低入. The name 陽入 is preferable
      as it preserves the qualifier 陽 "light".
      Also see [note on entering tones](#entering-tones).
''
||||

####{#entering-tones .modern} Note on entering tones

--{.modern}
Cantonese preserves the Middle Chinese correspondence
between the nasal codas [m], [n], [ŋ]
and the unreleased stops [p̚], [t̚], [k̚].
The Middle Chinese entering tone (入聲) is reflected in modern Cantonese
[tone~7 (高陰入)](#tone-7), [tone~8 (低陰入)](#tone-8), and [tone~9 (陽入)](#tone-9).
--
--{.modern}
Whilst entering tones are not tones in a strict phonetic sense,
with some authors casting them as tone~1, tone~3, and tone~6,
it is vital to maintain the distinction because:
--
++{.modern}
1. Some pronunciations in olden dictionaries can only be understood
   in terms of the nasal-stop correspondence
   (e.g. 登入聲 in the Kangxi entry for 德); and
2. Tone patterns in poetry (平仄) will be incorrect
   if tone~7 (高陰入) is cast as tone~1 (陰平).
++
--{.modern}
Unfortunately, Jyutping uses tone numbers 1, 3, 6 in place of 7, 8, 9.
I have reluctantly followed Jyutping with its numbering,
but have still used the names 高陰入, 低陰入, and 陽入
to preserve the distinction.
--

####{#tone-changes .modern} Note on tone changes

--{.modern}
Tone changes are a feature of vernacular Cantonese.
These are denoted in this dictionary by appending a hyphen and the new tone number
after the original tone number in the Jyutping romanisation.
--
--{.modern}
Examples of tone change include:
--
=={.modern}
- A change to rising-tone marking a word as a noun
  (rather than an adjective or verb),
  e.g. 畫 waa6-2, or 鑿 zok6-2.

- A change to rising-tone on the second character of a reduplication
  (where the reduplicated character is not tone~1),
  e.g. 慢慢 maan6 maan6-2, 婷婷 ting4 ting4-2, or 熱熱地 jit6 jit6-2 dei6-2.

- A change to high level-tone because it sounds better,
  e.g. 慢慢 maan6 maan6-1, 今晚 gam1 maan5-1, or 後尾 hau6-1 mei5-1.

- A change to low level-tone because it sounds better,
  e.g. 長沙灣 coeng4 saa1 waan1-4.

- Unique tone changes such as 輕輕 heng1-6 heng1.
==
--{.modern}
Such tone changes are *not* tone sandhi,
because they apply to specific words,
rather than indiscriminately to certain sequences of tones.
--


##{#pronunciation .modern} Note on pronunciation

--{.modern}
Whenever the topic of "correct" Cantonese pronunciation is discussed,
it is important to distinguish between two phenomena:
--
++{.modern}
1. __"Lazy pronunciation"__ (懶音).
   This is the replacement of certain sounds
   with more easily pronounceable substitutes.
   Examples include replacing initial n~[n] with l~[l], dropping initial ng~[ŋ],
   or replacing syllabic ng~[ŋ̍] with m~[m̩].
   Correcting "lazy pronunciation" is a largely uncontroversial topic.

2. __"Incorrect reading"__ (錯讀).
   This is the failure to know or apply the correct reading of a character,
   where "correct reading" is defined by some linguistic authority.
   For example, Richard Ho (何文匯) regards
   the common reading ming5 for 銘 (attested in Fan Wan) as incorrect,
   with ming4 the "correct reading" per 《廣韻》莫經切.
   Correcting allegedly "incorrect readings" is a highly controversial topic.
++
