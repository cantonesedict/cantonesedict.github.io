< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Search character entries
* %date-modified --> 2026-03-28
* %copyright-prior-years --> 2024--
* %meta-description --> search character entries

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

||||{.modern .input-container}
--
<label for="search">__Search:__</label>
<input type="text" id="search" oninput="performSearch()" placeholder="(Chinese or English)" lang="zh-Hant">
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

u<``<script>
let characterPromise = fetch('character-index.json').then(response => response.json());
let compositionPromise = fetch('composition-index.json').then(response => response.json());

let TYPE_CHARACTER_MATCH = 1;
let TYPE_JYUTPING_MATCH = 2;
let TYPE_TEXT_MATCH = 3;

let MAX_RESULT_COUNT = 20;

class Result
{
  constructor(character, jyutping, isCanonical, text, type, matches, score)
  {
    this.character = character;
    this.jyutping = jyutping;
    this.isCanonical = isCanonical;
    this.text = text;
    this.type = type;
    this.matches = matches;
    this.score = score;
  }

  isLessThan(other)
  {
    return (
      this.type - other.type
      || -(this.isCanonical - other.isCanonical)
      || -(this.score - other.score)
      || this.jyutping.localeCompare(other.jyutping)
      || this.character.localeCompare(other.character)
    );
  }
}

function normaliseString(str)
{
  return (
    str
    .toLowerCase()
    .trim()
    .replace(/[!"$&'()*,./:;<=>?@\[\\\]^_`{|}~]/g, '')
    .replace(/(?<!-)-(?![-0-9])/g, ' ')
    .replace(/\s+/g, ' ')
  );
}

function appendCharacterWithComposition(targetElement, character, composition, isCharacterMatch)
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

  if (isCharacterMatch)
  {
    let markedCharacterElement = document.createElement('mark');
    markedCharacterElement.appendChild(document.createTextNode(character));
    textParentElement.appendChild(markedCharacterElement);
  }
  else
  {
    textParentElement.appendChild(document.createTextNode(character));
  }

  targetElement.appendChild(textParentElement);
}

function appendJyutping(targetElement, syllable, tone, isJyutpingMatch)
{
  targetElement.appendChild(document.createTextNode(' '));  // U+00A0 NO-BREAK SPACE

  let jyutpingParentElement;
  if (isJyutpingMatch)
  {
    jyutpingParentElement = document.createElement('mark');
    targetElement.appendChild(jyutpingParentElement);
  }
  else
  {
    jyutpingParentElement = targetElement;
  }

  jyutpingParentElement.appendChild(document.createTextNode(syllable));

  let toneSuperscriptElement = document.createElement('sup');
  toneSuperscriptElement.appendChild(document.createTextNode(tone));
  jyutpingParentElement.appendChild(toneSuperscriptElement);
}

function appendText(targetElement, text)
{
  let codeElement = document.createElement('code');
  codeElement.appendChild(document.createTextNode(text));
  targetElement.appendChild(codeElement);
}

async function performSearch()
{
  let characterJson = await characterPromise;
  let compositionJson = await compositionPromise;

  let searchElement = document.getElementById('search');
  let searchString = normaliseString(searchElement.value);
  let searchCharacter = /^[㐀-鿿豈-龎𠀀-𳑿]$/u.test(searchString) ? searchString : '';
  let searchJyutping = /^[a-z]+[1-6]$/.test(searchString) ? searchString : '';
  let searchChineseRuns = [...new Set(searchString.match(/[㐀-鿿豈-龎𠀀-𳑿]+/gu))];
  let searchEnglishWords = [...new Set(searchString.replace(/[㐀-鿿豈-龎𠀀-𳑿]+/gu, ' ').match(/\S+/g))];

  let results = [];

  for (const [character, textFromJyutping] of Object.entries(characterJson))
  {
    for (const [jyutping, details] of Object.entries(textFromJyutping))
    {
      let isCanonical = details.isCanonical;
      let text = details.text;

      if (searchCharacter === character)
      {
        results.push(new Result(character, jyutping, isCanonical, text, TYPE_CHARACTER_MATCH, [], 1));
      }
      else if (searchJyutping === jyutping)
      {
        results.push(new Result(character, jyutping, isCanonical, text, TYPE_JYUTPING_MATCH, [], 1));
      }
      else
      {
        let elementIsMatch = str => normaliseString(text).includes(str);
        if (searchChineseRuns.every(elementIsMatch) && searchEnglishWords.every(elementIsMatch))
        {
          let matches = [...searchChineseRuns, ...searchEnglishWords];
          if (matches.length)
          {
            let scores = [
              ...[...searchChineseRuns].map(run => Math.tanh(run.length / 2) ** 2),
              ...[...searchEnglishWords].map(word => Math.tanh(word.length / 4) ** 4),
            ];
            let score = 1 - scores.reduce((q, p) => q * (1 - p), 1);
            results.push(new Result(character, jyutping, isCanonical, text, TYPE_TEXT_MATCH, matches, score));
          }
        }
      }
    }
  }

  results = results.sort((r1, r2) => r1.isLessThan(r2)).slice(0, MAX_RESULT_COUNT);

  let tbodyElement = document.getElementsByTagName('tbody')[0];
  tbodyElement.replaceChildren();

  for (const result of results)
  {
    let character = result.character;
    let jyutping = result.jyutping;
    let isCanonical = result.isCanonical;
    let text = result.text;
    let isCharacterMatch = result.type === TYPE_CHARACTER_MATCH;
    let isJyutpingMatch = result.type === TYPE_JYUTPING_MATCH;

    let composition = compositionJson[character];
    let syllable = jyutping.replace(/[1-6]/g, '');
    let tone = jyutping.replace(/[a-z]/g, '');

    let rowElement = tbodyElement.insertRow(-1);
    let linkCellElement = rowElement.insertCell(-1);
    let textCellElement = rowElement.insertCell(-1);

    let linkElement = document.createElement('a');
    linkElement.href = `/entries/${syllable}#${character}-${tone}`;
    appendCharacterWithComposition(linkElement, character, composition, isCharacterMatch);
    appendJyutping(linkElement, syllable, tone, isJyutpingMatch);

    if (!isCanonical)
    {
      linkCellElement.appendChild(document.createTextNode('('));
    }

    linkCellElement.appendChild(linkElement);

    if (!isCanonical)
    {
      linkCellElement.appendChild(document.createTextNode(')'));
    }

    appendText(textCellElement, text);
  }
}

window.onload = performSearch;
</script>``>

||||{.wide}
''{.modern}
|^
  //
    ; Character entry (link)
    ; Indexed entry text
|:
''
||||
