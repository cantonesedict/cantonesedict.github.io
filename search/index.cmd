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

OrdinaryDictionaryReplacement: #.search-maximum-character-count
- queue_position: BEFORE #literals
* {SEARCH_MAX_CHAR_COUNT} --> 16

%%%

#{.modern} %title

||||{.modern .input-container}
--
<label for="search">__Search:__</label>
<input type="text" id="search" onkeyup="performSearch()" placeholder="(up to {SEARCH_MAX_CHAR_COUNT}~chars / 1~code point)">
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

--{.modern}
See also: [Index of characters by radical](/radicals/).
--

u<``<script>
let promise = fetch('character-index.json').then(response => response.json());

async function performSearch()
{
  let json = await promise;

  let searchElement = document.getElementById('search');
  let searchString = searchElement.value.toUpperCase().trim();

  let searchCharacters;
  try
  {
    let codePointMatch = searchString.match(/(?<=^U?[+]?)[0-9A-F]{4,5}(?=$)/);
    searchCharacters = [String.fromCodePoint(parseInt(codePointMatch, 16))];
  }
  catch
  {
    searchCharacters = [...searchString.substring(0, {SEARCH_MAX_CHAR_COUNT})];
  }

  console.log(searchCharacters); // TODO
}

window.onload = performSearch;
</script>``>

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
