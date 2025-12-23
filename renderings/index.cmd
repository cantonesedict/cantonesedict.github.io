< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of literary renderings by Baxter notation
* %date-modified --> 2025-12-23
* %copyright-prior-years -->
* %meta-description --> searchable index of links to literary renderings by Baxter notation

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

ReplacementSequence: #.ensure-baxter
- queue_position: BEFORE #inline-code
- replacements: #.syntax.baxter

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
  //
    , `'ae`
    , [鴉](/entries/aa#rendering-鴉)
  //
    , `'aeX`
    , [啞](/entries/aa#rendering-啞)
  //
    , `'aeH`
    , [亞](/entries/aa#rendering-亞)
  //
    , `'aenH`
    , [晏](/entries/aan#rendering-晏)
  //
    , `'aenH`
    , [鷃](/entries/aan#rendering-鷃)
  //
    , `'aep`
    , [壓](/entries/aat#rendering-壓)
  //
    , `'aep`
    , [押](/entries/aat#rendering-押)
  //
    , `'aep`
    , [鴨](/entries/aap#rendering-鴨)
  //
    , `'aew`
    , [坳](/entries/aau#rendering-坳)
  //
    , `'aewX`
    , [拗](/entries/aau#rendering-拗)
  //
    , `'aewH`
    , [坳](/entries/aau#rendering-坳)
  //
    , `'aewk`
    , [幄](/entries/ak#rendering-幄)
  //
    , `'aewk`
    , [握](/entries/ak#rendering-握)
  //
    , `'aewk`
    , [渥](/entries/ak#rendering-渥)
  //
    , `'at`
    , [遏](/entries/aat#rendering-遏)
  //
    , `'at`
    , [閼](/entries/aat#rendering-閼)
  //
    , `'at`
    , [頞](/entries/aat#rendering-頞)
  //
    , `'eaX`
    , [矮](/entries/ai#rendering-矮)
  //
    , `'eaH`
    , [隘](/entries/aai#rendering-隘)
  //
    , `'eak`
    , [厄](/entries/ak#rendering-厄)
  //
    , `'eak`
    , [軛](/entries/aak#rendering-軛)
  //
    , `'eak`
    , [阨](/entries/ak#rendering-阨)
  //
    , `'eam`
    , [黯](/entries/am#rendering-黯)
  //
    , `'eamX`
    , [黯](/entries/am#rendering-黯)
  //
    , `'eang`
    , [罌](/entries/aang#rendering-罌)
  //
    , `'eang`
    , [鶯](/entries/ang#rendering-鶯)
  //
    , `'eat`
    , [揠](/entries/aat#rendering-揠)
  //
    , `'ej`
    , [翳](/entries/ai#rendering-翳)
  //
    , `'ejH`
    , [曀](/entries/ai#rendering-曀)
  //
    , `'ejH`
    , [縊](/entries/ai#rendering-縊)
  //
    , `'ejH`
    , [翳](/entries/ai#rendering-翳)
  //
    , `'jieH`
    , [縊](/entries/ai#rendering-縊)
  //
    , `'omH`
    , [暗](/entries/am#rendering-暗)
  //
    , `'omH`
    , [闇](/entries/am#rendering-闇)
  //
    , `'uw`
    , [區](/entries/au#rendering-區)
  //
    , `'uw`
    , [謳](/entries/au#rendering-謳)
  //
    , `'uwX`
    , [嘔](/entries/au#rendering-嘔)
  //
    , `'uwX`
    , [毆](/entries/au#rendering-毆)
  //
    , `'uwH`
    , [漚](/entries/au#rendering-漚)
  //
    , `dzam`
    , [慚](/entries/caam#rendering-慚)
  //
    , `dzan`
    , [殘](/entries/caan#rendering-殘)
  //
    , `dzok`
    , [賊](/entries/caak#rendering-賊)
  //
    , `dzom`
    , [蠶](/entries/caam#rendering-蠶)
  //
    , `dzraem`
    , [毚](/entries/caam#rendering-毚)
  //
    , `dzrea`
    , [柴](/entries/caai#rendering-柴)
  //
    , `dzreaj`
    , [儕](/entries/caai#rendering-儕)
  //
    , `dzreaj`
    , [豺](/entries/caai#rendering-豺)
  //
    , `dzreaj lang`
    , [豺狼](/entries/caai#rendering-豺狼)
  //
    , `dzream`
    , [毚](/entries/caam#rendering-毚)
  //
    , `dzream`
    , [讒](/entries/caam#rendering-讒)
  //
    , `dzreamH`
    , [儳~(flippant)](/entries/caam#rendering-儳-flippant)
  //
    , `homX domX`
    , [菡萏](/entries/aam#rendering-菡萏)
  //
    , `keat`
    , [恝](/entries/aat#rendering-恝)
  //
    , `sreanX`
    , [產](/entries/caan#rendering-產)
  //
    , `trhaejH`
    , [蠆](/entries/caai#rendering-蠆)
  //
    , `trhaek`
    , [坼](/entries/caak#rendering-坼)
  //
    , `trhaek`
    , [拆](/entries/caak#rendering-拆)
  //
    , `tshan`
    , [餐](/entries/caan#rendering-餐)
  //
    , `tshanH`
    , [粲](/entries/caan#rendering-粲)
  //
    , `tshit`
    , [七](/entries/cat#rendering-七)
  //
    , `tshom`
    , [參](/entries/caam#rendering-參)
  //
    , `tshom`
    , [驂](/entries/caam#rendering-驂)
  //
    , `tsrhae`
    , [差](/entries/caa#rendering-差)
  //
    , `tsrhaemH`
    , [儳~(jumbled)](/entries/caam#rendering-儳-jumbled)
  //
    , `tsrheaj`
    , [差](/entries/caai#rendering-差)
  //
    , `tsrheak`
    , [冊](/entries/caak#rendering-冊)
  //
    , `tsrheak`
    , [策](/entries/caak#rendering-策)
  //
    , `tsrhim tsrhje`
    , [參差](/entries/caam#rendering-參差)
  //
    , `tsrhwaejH`
    , [嘬](/entries/caai#rendering-嘬)
''
||||
<## /renderings-table ##>
