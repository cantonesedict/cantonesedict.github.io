< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of entries by Jyutping slug
* %date-modified --> 2023-08-06
* %copyright-prior-years -->

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

RegexDictionaryReplacement: #.incipit-navigation-links
- queue_position: BEFORE #specified-links
* \[ (?P<letter> [A-Z] ) \] --> [\g<letter>](#\g<letter>)

%%%

#{.modern} %title

<nav class="sideways">
=={.modern}
- [A]
- [B]
- [C]
- [D]
- [E]
- [F]
- [G]
- [H]
- [J]
- [K]
- [L]
- [M]
- [N]
- [O]
- [P]
- [S]
- [T]
- [U]
- [W]
- [Z]
==
</nav>


##{#A .modern} A

<nav>
==
- $aa
- $aai
- $aak
- $aam
- $aan
- $aang
- $aap
- $aat
- $aau
- $ai
- $ak
- $am
- $ang
- $ap
- $at
- $au
==
</nav>


##{#B .modern} B

<nav>
==
- $baa
- $baai
- $baak
- $baan
- $baang
- $baat
- $baau
- $bai
- $bak
- $bam
- $ban
- $bang
- $bat
- $bau
- $be
- $bei
- $beng
- $bik
- $bin
- $bing
- $bit
- $biu
- $bo
- $bok
- $bong
- $bou
- $bui
- $buk
- $bum
- $bun
- $bung
- $bup
- $but
==
</nav>


##{#C .modern} C

<nav>
==
- $caa
- $caai
- $caak
- $caam
- $caan
- $caang
- $caap
- $caat
- $caau
- $cai
- $cak
- $cam
- $can
- $cang
- $cap
- $cat
- $cau
- $ce
- $ceoi
- $ceon
- $ceot
- $ci
- $cik
- $cim
- $cin
- $cing
- $cip
- $cit
- $ciu
- $co
- $coe
- $coek
- $coeng
- $coi
- $cok
- $cong
- $cou
- $cuk
- $cung
- $cyu
- $cyun
- $cyut
==
</nav>


##{#D .modern} D

<nav>
==
- $daa
- $daai
- $daam
- $daan
- $daang
- $daap
- $daat
- $dai
- $dak
- $dam
- $dan
- $dang
- $dap
- $dat
- $dau
- $de
- $dei
- $dek
- $deng
- $deoi
- $deon
- $di
- $dik
- $dim
- $din
- $ding
- $dip
- $dit
- $diu
- $do
- $doe
- $doek
- $doeng
- $doi
- $dok
- $dong
- $dou
- $duk
- $dung
- $dyun
- $dyut
==
</nav>


##{#E .modern} E

<nav>
==
- $e
==
</nav>


##{#F .modern} F

<nav>
==
- $faa
- $faai
- $faak
- $faan
- $faat
- $fai
- $fan
- $fat
- $fau
- $fe
- $fei
- $fik
- $fing
- $fit
- $fo
- $fok
- $fong
- $fu
- $fui
- $fuk
- $fun
- $fung
- $fut
==
</nav>


##{#G .modern} G

<nav>
==
- $gaa
- $gaai
- $gaak
- $gaam
- $gaan
- $gaang
- $gaap
- $gaau
- $gai
- $gam
- $gan
- $gang
- $gap
- $gat
- $gau
- $ge
- $gei
- $geng
- $geoi
- $gik
- $gim
- $gin
- $ging
- $gip
- $git
- $giu
- $go
- $goe
- $goek
- $goeng
- $goi
- $gok
- $gon
- $gong
- $got
- $gou
- $gu
- $gui
- $guk
- $gum
- $gun
- $gung
- $gut
- $gwaa
- $gwaai
- $gwaak
- $gwaan
- $gwaang
- $gwaat
- $gwai
- $gwan
- $gwang
- $gwat
- $gwik
- $gwing
- $gwit
- $gwo
- $gwok
- $gwong
- $gyun
- $gyut
==
</nav>


##{#H .modern} H

<nav>
==
- $haa
- $haai
- $haak
- $haam
- $haan
- $haang
- $haap
- $haau
- $hai
- $hak
- $ham
- $han
- $hang
- $hap
- $hat
- $hau
- $he
- $hei
- $hek
- $heng
- $heoi
- $him
- $hin
- $hing
- $hip
- $hit
- $hiu
- $ho
- $hoe
- $hoeng
- $hoi
- $hok
- $hon
- $hong
- $hot
- $hou
- $huk
- $hung
- $hyun
- $hyut
==
</nav>


##{#J .modern} J

<nav>
==
- $jaa
- $jaak
- $jaang
- $jai
- $jam
- $jan
- $jap
- $jat
- $jau
- $je
- $jeoi
- $jeon
- $ji
- $jik
- $jim
- $jin
- $jing
- $jip
- $jit
- $jiu
- $joek
- $joeng
- $juk
- $jung
- $jyu
- $jyun
- $jyut
==
</nav>


##{#K .modern} K

<nav>
==
- $kaa
- $kaai
- $kaan
- $kaap
- $kaat
- $kaau
- $kai
- $kak
- $kam
- $kan
- $kang
- $kap
- $kat
- $kau
- $ke
- $kei
- $kek
- $keoi
- $kik
- $kim
- $kin
- $king
- $kit
- $kiu
- $koek
- $koeng
- $koi
- $kok
- $kong
- $ku
- $kui
- $kuk
- $kung
- $kut
- $kwaa
- $kwaang
- $kwai
- $kwan
- $kwik
- $kwok
- $kwong
- $kyun
- $kyut
==
</nav>


##{#L .modern} L

<nav>
==
- $laa
- $laai
- $laak
- $laam
- $laan
- $laang
- $laap
- $laat
- $laau
- $lai
- $lak
- $lam
- $lan
- $lang
- $lap
- $lat
- $lau
- $le
- $lei
- $lek
- $lem
- $leng
- $leoi
- $leon
- $leot
- $lik
- $lim
- $lin
- $ling
- $lip
- $lit
- $liu
- $lo
- $loe
- $loek
- $loeng
- $loi
- $lok
- $long
- $lou
- $luk
- $lung
- $lyun
- $lyut
==
</nav>


##{#M .modern} M

<nav>
==
- $m
- $maa
- $maai
- $maak
- $maan
- $maang
- $maat
- $maau
- $mai
- $mak
- $man
- $mang
- $mat
- $mau
- $me
- $mei
- $mek
- $meng
- $mik
- $min
- $ming
- $mit
- $miu
- $mo
- $mok
- $mong
- $mou
- $mui
- $muk
- $mun
- $mung
- $mut
==
</nav>


##{#N .modern} N

<nav>
==
- $naa
- $naai
- $naam
- $naan
- $naap
- $naat
- $naau
- $nai
- $nak
- $nam
- $nan
- $nang
- $nap
- $nat
- $nau
- $ne
- $nei
- $neng
- $neoi
- $neot
- $ng
- $ngaa
- $ngaai
- $ngaak
- $ngaam
- $ngaan
- $ngaang
- $ngaap
- $ngaat
- $ngaau
- $ngai
- $ngak
- $ngam
- $ngan
- $ngap
- $ngat
- $ngau
- $nge
- $ngi
- $ngit
- $ngo
- $ngoi
- $ngok
- $ngon
- $ngong
- $ngou
- $ni
- $nik
- $nim
- $nin
- $ning
- $nip
- $niu
- $no
- $noeng
- $noi
- $nok
- $nong
- $nou
- $nuk
- $nung
- $nyun
==
</nav>


##{#O .modern} O

<nav>
==
- $o
- $oi
- $ok
- $on
- $ong
- $ou
==
</nav>


##{#P .modern} P

<nav>
==
- $paa
- $paai
- $paak
- $paan
- $paang
- $paau
- $pai
- $pan
- $pang
- $pat
- $pau
- $pe
- $pei
- $pek
- $peng
- $pik
- $pin
- $ping
- $pit
- $piu
- $po
- $pok
- $pong
- $pou
- $pui
- $puk
- $pun
- $pung
- $put
==
</nav>


##{#S .modern} S

<nav>
==
- $saa
- $saai
- $saak
- $saam
- $saan
- $saang
- $saap
- $saat
- $saau
- $sai
- $sak
- $sam
- $san
- $sang
- $sap
- $sat
- $sau
- $se
- $sei
- $sek
- $seng
- $seoi
- $seon
- $seot
- $si
- $sik
- $sim
- $sin
- $sing
- $sip
- $sit
- $siu
- $so
- $soe
- $soek
- $soeng
- $sok
- $song
- $sou
- $suk
- $sung
- $syu
- $syun
- $syut
==
</nav>


##{#T .modern} T

<nav>
==
- $taa
- $taai
- $taam
- $taan
- $taap
- $taat
- $tai
- $tam
- $tan
- $tang
- $tap
- $tau
- $tek
- $teng
- $teoi
- $teon
- $tik
- $tim
- $tin
- $ting
- $tip
- $tit
- $tiu
- $to
- $toe
- $toi
- $tok
- $tong
- $tou
- $tuk
- $tung
- $tyun
- $tyut
==
</nav>


##{#U .modern} U

<nav>
==
- $uk
- $ung
==
</nav>


##{#W .modern} W

<nav>
==
- $waa
- $waai
- $waak
- $waan
- $waang
- $waat
- $wai
- $wan
- $wang
- $wat
- $wik
- $wing
- $wit
- $wo
- $wok
- $wong
- $wu
- $wui
- $wun
- $wut
==
</nav>


##{#Z .modern} Z

<nav>
==
- $zaa
- $zaai
- $zaak
- $zaam
- $zaan
- $zaang
- $zaap
- $zaat
- $zaau
- $zai
- $zak
- $zam
- $zan
- $zang
- $zap
- $zat
- $zau
- $ze
- $zeoi
- $zeon
- $zeot
- $zi
- $zik
- $zim
- $zin
- $zing
- $zip
- $zit
- $ziu
- $zo
- $zoek
- $zoeng
- $zoi
- $zok
- $zong
- $zou
- $zuk
- $zung
- $zyu
- $zyun
- $zyut
==
</nav>
