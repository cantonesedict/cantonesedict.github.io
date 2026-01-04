< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of literary renderings by Baxter notation
* %date-modified --> 2026-01-04
* %copyright-prior-years --> 2025--
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
    , `draeng`
    , [棖](/entries/caang#rendering-棖)
  //
    , `dreang`
    , [橙](/entries/caang#rendering-橙)
  //
    , `drim`
    , [沉](/entries/cam#rendering-沉)
  //
    , `drin`
    , [塵](/entries/can#rendering-塵)
  //
    , `drin`
    , [陳](/entries/can#rendering-陳)
  //
    , `drinH`
    , [診](/entries/can#rendering-診)
  //
    , `drjo`
    , [除](/entries/ceoi#rendering-除)
  //
    , `drju`
    , [廚](/entries/ceoi#rendering-廚)
  //
    , `drjuw`
    , [幬](/entries/cau#rendering-幬)
  //
    , `drjuw`
    , [疇](/entries/cau#rendering-疇)
  //
    , `drjuw`
    , [稠](/entries/cau#rendering-稠)
  //
    , `drjuw`
    , [籌](/entries/cau#rendering-籌)
  //
    , `drjuw`
    , [綢](/entries/cau#rendering-綢)
  //
    , `drjuw`
    , [裯](/entries/cau#rendering-裯)
  //
    , `drjuw mjuw`
    , [綢繆](/entries/cau#rendering-綢繆)
  //
    , `drjuw sjek`
    , [疇昔](/entries/cau#rendering-疇昔)
  //
    , `dzam`
    , [慚](/entries/caam#rendering-慚)
  //
    , `dzan`
    , [殘](/entries/caan#rendering-殘)
  //
    , `dzej`
    , [懠](/entries/cai#rendering-懠)
  //
    , `dzej`
    , [齊](/entries/cai#rendering-齊)
  //
    , `dzejX`
    , [薺](/entries/cai#rendering-薺)
  //
    , `dzejH`
    , [懠](/entries/cai#rendering-懠)
  //
    , `dzim`
    , [鬵](/entries/cam#rendering-鬵)
  //
    , `dzin`
    , [螓](/entries/ceon#rendering-螓)
  //
    , `dzip`
    , [輯](/entries/cap#rendering-輯)
  //
    , `dzjem`
    , [鬵](/entries/cam#rendering-鬵)
  //
    , `dzjuw`
    , [遒](/entries/cau#rendering-遒)
  //
    , `dzjuw dzej`
    , [蝤蠐](/entries/cai#rendering-蝤蠐)
  //
    , `dzok`
    , [賊](/entries/caak#rendering-賊)
  //
    , `dzom`
    , [蠶](/entries/caam#rendering-蠶)
  //
    , `dzong`
    , [層](/entries/cang#rendering-層)
  //
    , `dzong`
    , [曾](/entries/cang#rendering-曾)
  //
    , `dzraem`
    , [毚](/entries/caam#rendering-毚)
  //
    , `dzraew`
    , [巢](/entries/caau#rendering-巢)
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
    , `dzwoj`
    , [崔](/entries/ceoi#rendering-崔)
  //
    , `dzwoj`
    , [摧](/entries/ceoi#rendering-摧)
  //
    , `dzyuw`
    , [酬](/entries/cau#rendering-酬)
  //
    , `homX domX`
    , [菡萏](/entries/aam#rendering-菡萏)
  //
    , `keat`
    , [恝](/entries/aat#rendering-恝)
  //
    , `khjuwX`
    , [糗](/entries/cau#rendering-糗)
  //
    , `sej`
    , [棲](/entries/cai#rendering-棲)
  //
    , `sreanX`
    , [產](/entries/caan#rendering-產)
  //
    , `srjwet`
    , [刷](/entries/caat#rendering-刷)
  //
    , `srwaet`
    , [刷](/entries/caat#rendering-刷)
  //
    , `syae`
    , [奢](/entries/ce#rendering-奢)
  //
    , `syinX`
    , [哂](/entries/can#rendering-哂)
  //
    , `syinX`
    , [矧](/entries/can#rendering-矧)
  //
    , `that`
    , [獺](/entries/caat#rendering-獺)
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
    , `trhaet`
    , [獺](/entries/caat#rendering-獺)
  //
    , `trhinH`
    , [疢](/entries/can#rendering-疢)
  //
    , `trhjuw`
    , [妯](/entries/cau#rendering-妯)
  //
    , `trhjuw`
    , [抽](/entries/cau#rendering-抽)
  //
    , `trhjuw`
    , [瘳](/entries/cau#rendering-瘳)
  //
    , `trhjuwX`
    , [丑](/entries/cau#rendering-丑)
  //
    , `trjenX`
    , [紾](/entries/can#rendering-紾)
  //
    , `tshan`
    , [餐](/entries/caan#rendering-餐)
  //
    , `tshanH`
    , [粲](/entries/caan#rendering-粲)
  //
    , `tshej`
    , [妻~(noun)](/entries/cai#rendering-妻-noun)
  //
    , `tshej`
    , [萋](/entries/cai#rendering-萋)
  //
    , `tshejH`
    , [妻~(verb)](/entries/cai#rendering-妻-verb)
  //
    , `tshejH`
    , [砌](/entries/cai#rendering-砌)
  //
    , `tshim`
    , [侵](/entries/cam#rendering-侵)
  //
    , `tshim`
    , [駸](/entries/cam#rendering-駸)
  //
    , `tshimX`
    , [寢](/entries/cam#rendering-寢)
  //
    , `tshin`
    , [親~(close)](/entries/can#rendering-親-close)
  //
    , `tshinH`
    , [親~(in-law)](/entries/can#rendering-親-in-law)
  //
    , `tship`
    , [咠](/entries/cap#rendering-咠)
  //
    , `tship`
    , [緝](/entries/cap#rendering-緝)
  //
    , `tship xi`
    , [緝熙](/entries/cap#rendering-緝熙)
  //
    , `tshit`
    , [七](/entries/cat#rendering-七)
  //
    , `tshit`
    , [漆](/entries/cat#rendering-漆)
  //
    , `tshjaeX`
    , [且](/entries/ce#rendering-且)
  //
    , `tshju`
    , [趨](/entries/ceoi#rendering-趨)
  //
    , `tshjuX`
    , [取](/entries/ceoi#rendering-取)
  //
    , `tshjuH`
    , [娶](/entries/ceoi#rendering-娶)
  //
    , `tshjuH`
    , [趣](/entries/ceoi#rendering-趣)
  //
    , `tshjuw`
    , [秋](/entries/cau#rendering-秋)
  //
    , `tshjuw`
    , [鶖](/entries/cau#rendering-鶖)
  //
    , `tshjwejH`
    , [毳](/entries/ceoi#rendering-毳)
  //
    , `tshjwejH`
    , [脆](/entries/ceoi#rendering-脆)
  //
    , `tshom`
    , [參](/entries/caam#rendering-參)
  //
    , `tshom`
    , [驂](/entries/caam#rendering-驂)
  //
    , `tshuwX`
    , [取](/entries/ceoi#rendering-取)
  //
    , `tshuwX maeX`
    , [趣馬](/entries/cau#rendering-趣馬)
  //
    , `tshwoj`
    , [催](/entries/ceoi#rendering-催)
  //
    , `tshwoj`
    , [縗](/entries/ceoi#rendering-縗)
  //
    , `tshwojX`
    , [漼](/entries/ceoi#rendering-漼)
  //
    , `tshwojH`
    , [啐](/entries/ceoi#rendering-啐)
  //
    , `tsip`
    , [咠](/entries/cap#rendering-咠)
  //
    , `tsjuw`
    , [遒](/entries/cau#rendering-遒)
  //
    , `tsrhae`
    , [差](/entries/caa#rendering-差)
  //
    , `tsrhaemH`
    , [儳~(jumbled)](/entries/caam#rendering-儳-jumbled)
  //
    , `tsrhaew`
    , [抄](/entries/caau#rendering-抄)
  //
    , `tsrhaewH`
    , [抄](/entries/caau#rendering-抄)
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
    , `tsrheap`
    , [扱](/entries/caap#rendering-扱)
  //
    , `tsrheap`
    , [插](/entries/caap#rendering-插)
  //
    , `tsrheat`
    , [察](/entries/caat#rendering-察)
  //
    , `tsrhik`
    , [測](/entries/cak#rendering-測)
  //
    , `tsrhim`
    , [駸](/entries/cam#rendering-駸)
  //
    , `tsrhim tsrhje`
    , [參差](/entries/caam#rendering-參差)
  //
    , `tsrhje`
    , [差](/entries/ci#rendering-差)
  //
    , `tsrhjwejH`
    , [毳](/entries/ceoi#rendering-毳)
  //
    , `tsrhwaejH`
    , [嘬](/entries/caai#rendering-嘬)
  //
    , `tsrip`
    , [戢](/entries/cap#rendering-戢)
  //
    , `tsrip`
    , [濈](/entries/cap#rendering-濈)
  //
    , `tsyhae`
    , [車](/entries/ce#rendering-車)
  //
    , `tsyhek`
    , [尺](/entries/cek#rendering-尺)
  //
    , `tsyhin`
    , [瞋](/entries/can#rendering-瞋)
  //
    , `tsyhuwX`
    , [醜](/entries/cau#rendering-醜)
  //
    , `tsyhuwH`
    , [臭](/entries/cau#rendering-臭)
  //
    , `tsyhwe`
    , [吹](/entries/ceoi#rendering-吹)
  //
    , `tsyhwijH`
    , [出~(transitive)](/entries/ceot#rendering-出-transitive)
  //
    , `tsyhwin`
    , [春](/entries/ceon#rendering-春)
  //
    , `tsyhwinX`
    , [蠢](/entries/ceon#rendering-蠢)
  //
    , `tsyhwit`
    , [出~(intransitive)](/entries/ceot#rendering-出-intransitive)
  //
    , `tsyin`
    , [畛](/entries/can#rendering-畛)
  //
    , `tsyinX`
    , [畛](/entries/can#rendering-畛)
  //
    , `tsyinX`
    , [紾](/entries/can#rendering-紾)
  //
    , `tsyinX`
    , [袗](/entries/can#rendering-袗)
  //
    , `tsyinX`
    , [診](/entries/can#rendering-診)
  //
    , `tsyinX`
    , [鬒](/entries/can#rendering-鬒)
  //
    , `tsyinH`
    , [袗](/entries/can#rendering-袗)
  //
    , `tsyweX`
    , [捶](/entries/ceoi#rendering-捶)
  //
    , `xjuwH`
    , [嗅](/entries/cau#rendering-嗅)
  //
    , `zim`
    , [尋](/entries/cam#rendering-尋)
  //
    , `zim`
    , [鬵](/entries/cam#rendering-鬵)
  //
    , `zjae`
    , [斜](/entries/ce#rendering-斜)
  //
    , `zjae`
    , [邪](/entries/ce#rendering-邪)
  //
    , `zjo`
    , [徐](/entries/ceoi#rendering-徐)
  //
    , `zjuw`
    , [囚](/entries/cau#rendering-囚)
  //
    , `zjwe`
    , [隨](/entries/ceoi#rendering-隨)
  //
    , `zwin`
    , [巡](/entries/ceon#rendering-巡)
  //
    , `zwin`
    , [循](/entries/ceon#rendering-循)
  //
    , `zwin`
    , [旬](/entries/ceon#rendering-旬)
  //
    , `zwin`
    , [紃](/entries/ceon#rendering-紃)
  //
    , `zwin syuwH`
    , [巡守](/entries/ceon#rendering-巡守)
  //
    , `zywin`
    , [紃](/entries/ceon#rendering-紃)
''
||||
<## /renderings-table ##>
