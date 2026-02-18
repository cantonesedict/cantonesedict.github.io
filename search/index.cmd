< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Search by character or code point
* %date-modified --> 2026-02-18
* %copyright-prior-years --> 2024--
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
<input type="text" id="search" oninput="performSearch()" placeholder="(up to {SEARCH_MAX_CHAR_COUNT}~chars / 1~code point)" lang="zh-Hant">
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

let nbsp = String.fromCodePoint(0x00A0);

function appendCharacterWithComposition(targetElement, character, composition)
{
  let langSpanElement = document.createElement('span');
  langSpanElement.lang = 'zh-Hant';

  let textParentElement;
  if (composition === undefined)
  {
    textParentElement = langSpanElement;
  }
  else
  {
    let compositionElement = document.createElement('span');
    compositionElement.className = 'composition';
    compositionElement.title = composition;

    langSpanElement.appendChild(compositionElement);
    textParentElement = compositionElement;
  }

  textParentElement.appendChild(document.createTextNode(character));
  targetElement.appendChild(textParentElement);
}

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
    let codePoint = `U+${character.codePointAt(0).toString(16).toUpperCase()}`;

    let rowElement = tbodyElement.insertRow(-1);

    let characterCellElement = rowElement.insertCell(-1);
    appendCharacterWithComposition(characterCellElement, character, composition);

    let codePointCellElement = rowElement.insertCell(-1);
    codePointCellElement.appendChild(document.createTextNode(codePoint));

    let entriesCellElement = rowElement.insertCell(-1);

    if (jyutpingReadings.length > 1)
    {
      let openingBraceTextNode = document.createTextNode('{');
      entriesCellElement.appendChild(openingBraceTextNode);
    }

    for (const [readingIndex, jyutping] of jyutpingReadings.entries())
    {
      let syllable = jyutping.replace(/[1-6]/g, '');
      let tone = jyutping.replace(/[a-z]/g, '');

      let linkElement = document.createElement('a');
      linkElement.href = `/entries/${syllable}#${character}-${tone}`;
      entriesCellElement.appendChild(linkElement);

      appendCharacterWithComposition(linkElement, character, composition);

      let jyutpingTextNode = document.createTextNode(`${nbsp}${syllable}`);
      linkElement.appendChild(jyutpingTextNode);

      let toneSuperscriptElement = document.createElement('sup');
      toneSuperscriptElement.appendChild(document.createTextNode(tone));
      linkElement.appendChild(toneSuperscriptElement);

      if (readingIndex + 1 < jyutpingReadings.length)
      {
        let separatorTextNode = document.createTextNode(', ');
        entriesCellElement.appendChild(separatorTextNode);
      }
    }

    if (jyutpingReadings.length > 1)
    {
      let closingBraceTextNode = document.createTextNode('}');
      entriesCellElement.appendChild(closingBraceTextNode);
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
