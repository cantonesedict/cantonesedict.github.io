< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Page not found
* %date-modified --> 2025-11-02
* %copyright-prior-years --> "2023, "

RegexDictionaryReplacement: #.no-meta-author-and-description
- queue_position: AFTER #.boilerplate.properties-override
* <meta [ ] name="(author|description)" .* -->

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} 404: Page not found

--{.modern}
**The requested page was not found.**
--
--{.modern}
[Return to the home page.](/)
--
