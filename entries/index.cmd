< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr
< /res/rules/links.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Entries by Jyutping slug
* %date-modified --> 2023-07-22
* %copyright-prior-years -->

%%%

#{.modern} %title

<nav>
===={.modern}
- A
  ==
  - [`aa`]
  - [`ak`]
  ==
- Ng
  ==
  - [`ngaa`]
  ==
====
</nav>
