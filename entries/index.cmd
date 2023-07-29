< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr
< /res/rules/links.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of entries by Jyutping slug
* %date-modified --> 2023-07-29
* %copyright-prior-years -->

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

--{.modern}
Work in progress.
--

<nav>
===={.modern}
- A
  ==
  - [`aa`]
  - [`aai`]
  - [`ai`]
  - [`ak`]
  ==

- H
  ==
  - [`hei`]
  ==

- Ng
  ==
  - [`ngaa`]
  ==
====
</nav>
