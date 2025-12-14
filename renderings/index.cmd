< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of literary renderings by Baxter notation
* %date-modified --> 2025-12-14
* %copyright-prior-years -->
* %meta-description --> searchable index of links to literary renderings by Baxter notation

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

||||{.modern .input-container}
--
<label for="filter">__Filter for Baxter/Term:__</label>
<input type="text" id="filter" oninput="applyFilter()" placeholder="(tones are ignored)" lang="zh-Hant">
--
<noscript>
--
**JavaScript is required for filter to work.**
--
</noscript>
||||

u<``<script>
function normaliseString(str)
{
  return str.toLowerCase().trim().replace(/\s+/g, ' ');
}

function matchBaxter(filterString, baxter)
{
  let tonelessBaxter = baxter.replace(/[XH]\b/gi, '');
  let tonelessFilterString = filterString.replace(/[XH]\b/gi, '');
  return tonelessBaxter.indexOf(tonelessFilterString) > -1;
}

function matchTerm(filterString, term)
{
  return term.indexOf(filterString) > -1;
}

function applyFilter()
{
  let filterElement = document.getElementById('filter');
  let filterString = normaliseString(filterElement.value);

  for (const rowElement of document.querySelectorAll('tbody tr'))
  {
    let cells = rowElement.getElementsByTagName('td');
    let baxter = normaliseString(cells[0].textContent);
    let term = normaliseString(cells[1].textContent);

    let isBaxterMatch = matchBaxter(filterString, baxter);
    let isTermMatch = matchTerm(filterString, term);
    rowElement.style.display = (isBaxterMatch || isTermMatch) ? '' : 'none';
  }
}

window.onload = applyFilter;
</script>``>

<## renderings-table ##>
||||{.wide}
''{.modern}
|^
  //
    ; Baxter notation
    ; Entry link
|:
''
||||
<## /renderings-table ##>
