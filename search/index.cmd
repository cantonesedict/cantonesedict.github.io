< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Search by character or code point
* %date-modified --> 2024-01-05
* %copyright-prior-years -->
* %meta-description --> search by Chinese character or by Unicode code point

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

||||{.modern .input-container}
--
<label for="search">__Search:__</label>
<input type="text" id="search" onkeyup="performSearch()" placeholder="(up to 16~chars / 1~code point)">
--
<noscript>
--
**JavaScript is required for search to work.**
--
</noscript>
--
For the raw JSON that is queried, see [`character-index.json`].
--
||||

[`character-index.json`]: character-index.json

u<````````
<script>
</script>
````````>

||||{.wide}
''{.modern}
|^
  //
    ; Character
    ; Code point
    ; Character entry links
|:
''
||||
