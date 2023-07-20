< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> aa
* %date-modified --> 2023-07-20
- concluding_replacements: #.syntax.typography

%%%

#{w} (A/) [[\C aa; \J aa]]

--{w}
Words in _a_ [[\C a; \J a]] or _(a/)_ [[\C aa; \J aa]],
are often heard beginning with _ng_ [[\C ng; \J ng]],
as _ng(a/)_ [[\C ngaa; \J ngaa]],
_ngai_ [[\C ngai; \J ngai]],
_ngat_ [[\C ngat; \J ngat]].
--


##{#1} [[\C aa1; \J aa1]]

###{#丫} 丫

###{#吖} 吖

###{#呀1} 呀

###{#鴉} 鴉


##{#2} [[\C aa2; \J aa2]]

###{#啞} 啞

###{#瘂} 瘂


##{#3} [[\C aa3; \J aa3]]

###{#亞} 亞

###{#呀3} 呀

###{#婭} 婭

###{#阿} 阿
