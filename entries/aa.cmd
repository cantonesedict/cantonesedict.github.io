< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> aa
* %date-created --> 2023-xx-xx
* %date-modified --> 2023-xx-xx
- concluding_replacements: #.syntax.typography

%%%

# (A/) [[\C aa; \J aa]]

--
Words in _a_ [[\C a; \J a]] or _(a/)_ [[\C aa; \J aa]],
are often heard beginning with _ng_ [[\C ng; \J ng]],
as _ng(a/)_ [[\C ngaa; \J ngaa]],
_ngai_ [[\C ngai; \J ngai]],
_ngat_ [[\C ngat; \J ngat]].
--

##{#1} [[\C aa1; \J aa1]]

##{#2} [[\C aa2; \J aa2]]

##{#3} [[\C aa3; \J aa3]]
