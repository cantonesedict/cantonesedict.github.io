< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Search by character or code point
* %date-modified --> 2024-01-06
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
let characterPromise = fetch('character-index.json').then(response => response.json());
let compositionPromise = fetch('composition-index.json').then(response => response.json());

async function performSearch()
{
  let characterJson = await characterPromise;
  let compositionJson = await compositionPromise;

  let searchElement = document.getElementById('search');
  searchElement.value = searchElement.value.replace(/\s/g, '');
  let searchString = searchElement.value.toUpperCase().trim();

  let searchCharacters;
  try
  {
    let codePointMatch = searchString.match(/(?<=^U?[+]?)[0-9A-F]{4,5}(?=$)/);
    searchCharacters = [String.fromCodePoint(parseInt(codePointMatch, 16))];
  }
  catch
  {
    searchCharacters = [...searchString].slice(0, {SEARCH_MAX_CHAR_COUNT});
  }

  let tbodyElement = document.getElementsByTagName('tbody')[0];
  tbodyElement.replaceChildren();

  let seenCharacters = new Set();
  for (const character of searchCharacters)
  {
    if (seenCharacters.has(character))
    {
      continue;
    }

    seenCharacters.add(character);

    let jyutpingReadings = characterJson[character];
    if (!Array.isArray(jyutpingReadings) || jyutpingReadings.length == 0)
    {
      continue;
    }

    let composition = compositionJson[character];
    let characterWithComposition =
            (composition === undefined)
              ? character
              : `${character} (${composition})`;
    let codePoint = `U+${character.codePointAt(0).toString(16).toUpperCase()}`;

    let rowElement = tbodyElement.insertRow(-1);

    let characterCellElement = rowElement.insertCell(-1);
    let characterTextNode = document.createTextNode(characterWithComposition);
    characterCellElement.appendChild(characterTextNode);

    let codePointCellElement = rowElement.insertCell(-1);
    let codePointTextNode = document.createTextNode(codePoint);
    codePointCellElement.appendChild(codePointTextNode);

    let entriesCellElement = rowElement.insertCell(-1);

    let entriesNavElement = document.createElement('nav');
    entriesNavElement.className = 'sideways';
    entriesCellElement.appendChild(entriesNavElement);

    let entriesListElement = document.createElement('ul');
    entriesNavElement.appendChild(entriesListElement);

    for (const jyutping of jyutpingReadings)
    {
      let nbsp = String.fromCodePoint(0x00A0);
      let syllable = jyutping.replace(/[1-6]/g, '');
      let tone = jyutping.replace(/[a-z]/g, '');

      let itemElement = document.createElement('li');
      entriesListElement.appendChild(itemElement);

      let linkElement = document.createElement('a');
      linkElement.href = `/entries/${syllable}#${tone}${character}`;
      itemElement.appendChild(linkElement);

      let characterSpanElement = document.createElement('span');
      characterSpanElement.lang = 'zh-Hant';
      characterSpanElement.appendChild(document.createTextNode(character));
      linkElement.appendChild(characterSpanElement);

      if (composition !== undefined)
      {
        linkElement.appendChild(document.createTextNode(`${nbsp}(`));

        let compositionSpanElement = document.createElement('span');
        compositionSpanElement.lang = 'zh-Hant';
        compositionSpanElement.appendChild(document.createTextNode(composition));
        linkElement.appendChild(compositionSpanElement);

        linkElement.appendChild(document.createTextNode(')'));
      }

      let jyutpingTextNode = document.createTextNode(`${nbsp}${jyutping}`);
      linkElement.appendChild(jyutpingTextNode);
    }
  }
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
