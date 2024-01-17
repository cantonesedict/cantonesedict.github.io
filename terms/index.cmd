< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of Cantonese terms by Jyutping
* %date-modified --> 2024-01-17
* %copyright-prior-years --> 2023--
* %meta-description --> searchable index of Cantonese terms by Jyutping

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

||||{.modern .input-container}
--
<label for="filter">__Filter for Jyutping/Term:__</label>
<input type="text" id="filter" onkeyup="applyFilter()" placeholder="(tones are ignored)">
--
<noscript>
--
**JavaScript is required for filter to work.**
--
</noscript>
||||

--{.modern}
See also: [Index of entry pages by Jyutping](/entries/).
--

u<``<script>
function normaliseString(str)
{
  return str.toLowerCase().trim().replace(/\s+/g, ' ');
}

function matchJyutping(filterString, jyutping)
{
  let tonelessJyutping = jyutping.replace(/[0-9-]/g, '');
  let tonelessFilterString = filterString.replace(/[0-9-]/g, '');
  return tonelessJyutping.indexOf(tonelessFilterString) > -1;
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
    let jyutping = normaliseString(cells[0].textContent);
    let term = normaliseString(cells[1].textContent);

    let isJyutpingMatch = matchJyutping(filterString, jyutping);
    let isTermMatch = matchTerm(filterString, term);
    rowElement.style.display = (isJyutpingMatch || isTermMatch) ? '' : 'none';
  }
}

window.onload = applyFilter;
</script>``>

<## terms-table ##>
||||{.wide}
''{.modern}
|^
  //
    ; Jyutping
    ; Entry link
|:
  //
    , a1
    , [吖](/entries/aa#cantonese-吖)
  //
    , a1 maa3
    , [吖嘛](/entries/aa#cantonese-吖嘛)
  //
    , a3
    , [啊~\(final\)](/entries/aa#cantonese-啊-final)
  //
    , a4
    , [呀](/entries/aa#cantonese-呀)
  //
    , aa1
    , [吖](/entries/aa#cantonese-吖)
  //
    , aa3
    , [啊~\(final\)](/entries/aa#cantonese-啊-final)
  //
    , aa3
    , [啊~\(list\)](/entries/aa#cantonese-啊-list)
  //
    , aa3 caa1
    , [阿差](/entries/caa#cantonese-阿差)
  //
    , aa3 caan3
    , [阿燦](/entries/caan#cantonese-阿燦)
  //
    , aai3
    , [嗌](/entries/aai#cantonese-嗌)
  //
    , aak1
    , [呃](/entries/aak#cantonese-呃)
  //
    , aak3-2
    , [鈪](/entries/aak#cantonese-鈪)
  //
    , aan3
    , [晏](/entries/aan#cantonese-晏)
  //
    , aan3 zau3
    , [晏晝](/entries/aan#cantonese-晏晝)
  //
    , aang1
    , [罌](/entries/aang#cantonese-罌)
  //
    , aap3-2
    , [鴨](/entries/aap#cantonese-鴨)
  //
    , aau2
    , [拗](/entries/aau#cantonese-拗)
  //
    , aau3
    , [詏](/entries/aau#cantonese-詏)
  //
    , ai1 ja4
    , [哎吔~\(pain\)](/entries/ai#cantonese-哎吔-pain)
  //
    , ai1 jaa1
    , [哎吔~\(indignation\)](/entries/ai#cantonese-哎吔-indignation)
  //
    , am2
    , [揞](/entries/am#cantonese-揞)
  //
    , am3 syun3
    , [暗算](/entries/am#cantonese-暗算)
  //
    , ang2
    , [㾘](/entries/ang#cantonese-㾘)
  //
    , ap1
    , [洽](/entries/ap#cantonese-洽)
  //
    , au3 nai4
    , [漚泥](/entries/au#cantonese-漚泥)
  //
    , baau3 caak3
    , [爆坼](/entries/caak#cantonese-爆坼)
  //
    , bai3 ai3
    , [贔屭](/entries/ai#cantonese-贔屭)
  //
    , bong1 can3
    , [幫襯](/entries/can#cantonese-幫襯)
  //
    , caa1
    , [叉](/entries/caa#cantonese-叉)
  //
    , caa1 siu1
    , [叉燒](/entries/caa#cantonese-叉燒)
  //
    , caa4
    , [搽~\(spread\)](/entries/caa#cantonese-搽-spread)
  //
    , caa5
    , [搽~\(smudge\)](/entries/caa#cantonese-搽-smudge)
  //
    , caa5 wo5
    , [搽𢰸](/entries/caa#cantonese-搽𢰸)
  //
    , caai1
    , [差](/entries/caai#cantonese-差)
  //
    , caam5
    , [鏨](/entries/caam#cantonese-鏨)
  //
    , caan2
    , [剷](/entries/caan#cantonese-剷)
  //
    , cam1
    , [侵](/entries/cam#cantonese-侵)
  //
    , cam3
    , [讖](/entries/cam#cantonese-讖)
  //
    , cam4 jat6
    , [尋日](/entries/cam#cantonese-尋日)
  //
    , can1
    , [嚫](/entries/can#cantonese-嚫)
  //
    , can3
    , [襯](/entries/can#cantonese-襯)
  //
    , daa2 laang5 zan3
    , [打冷震](/entries/zan#cantonese-打冷震)
  //
    , gam3 zai6
    , [咁嚌](/entries/zai#cantonese-咁嚌)
  //
    , ham6 gaa1 caan2
    , [冚家剷](/entries/caan#cantonese-冚家剷)
  //
    , hat1 jan4 zang1
    , [乞人憎](/entries/zang#cantonese-乞人憎)
  //
    , hau6 mei5 zam2
    , [後尾枕](/entries/zam#cantonese-後尾枕)
  //
    , jat1 zan6
    , [一陣~\(moment\)](/entries/zan#cantonese-一陣-moment)
  //
    , jat1 zan6
    , [一陣~\(later\)](/entries/zan#cantonese-一陣-later)
  //
    , jat1 zan6 gaan1
    , [一陣間](/entries/zan#cantonese-一陣間)
  //
    , jat1 zan6-2
    , [一陣~\(later\)](/entries/zan#cantonese-一陣-later)
  //
    , jin1 caan2
    , [煙鏟](/entries/caan#cantonese-煙鏟)
  //
    , laa5 zaa2
    , [揦鮓](/entries/zaa#cantonese-揦鮓)
  //
    , lou5 can3
    , [老襯](/entries/can#cantonese-老襯)
  //
    , mun4 caam5
    , [門棖](/entries/caam#cantonese-門棖)
  //
    , waa6 zaai1
    , [話齋](/entries/zaai#cantonese-話齋)
  //
    , za3
    , [咋~\(3\)](/entries/zaa#cantonese-咋-3)
  //
    , za4
    , [咋~\(4\)](/entries/zaa#cantonese-咋-4)
  //
    , zaa1
    , [揸](/entries/zaa#cantonese-揸)
  //
    , zaa1
    , [渣](/entries/zaa#cantonese-渣)
  //
    , zaa2
    , [鮓](/entries/zaa#cantonese-鮓)
  //
    , zaa3
    , [咋~\(3\)](/entries/zaa#cantonese-咋-3)
  //
    , zaa3 dai3
    , [詐諦](/entries/zaa#cantonese-詐諦)
  //
    , zaa4
    , [咋~\(4\)](/entries/zaa#cantonese-咋-4)
  //
    , zaai1
    , [齋](/entries/zaai#cantonese-齋)
  //
    , zaak3
    , [矺](/entries/zaak#cantonese-矺)
  //
    , zaak6
    , [矺](/entries/zaak#cantonese-矺)
  //
    , zaam2
    , [䁪](/entries/zaam#cantonese-䁪)
  //
    , zaan2
    , [㜺](/entries/zaan#cantonese-㜺)
  //
    , zaan2
    , [盞](/entries/zaan#cantonese-盞)
  //
    , zaan2 gwai2
    , [㜺鬼](/entries/zaan#cantonese-㜺鬼)
  //
    , zai1
    , [擠](/entries/zai#cantonese-擠)
  //
    , zai2
    , [仔](/entries/zai#cantonese-仔)
  //
    , zai3
    , [掣](/entries/zai#cantonese-掣)
  //
    , zai6
    , [嚌](/entries/zai#cantonese-嚌)
  //
    , zai6
    , [滯](/entries/zai#cantonese-滯)
  //
    , zam1 baan2
    , [砧板](/entries/zam#cantonese-砧板)
  //
    , zam1 caa4 dai6 seoi2
    , [斟茶遞水](/entries/zam#cantonese-斟茶遞水)
  //
    , zam2 zyu6
    , [枕住](/entries/zam#cantonese-枕住)
  //
    , zam3
    , [浸](/entries/zam#cantonese-浸)
  //
    , zam6
    , [𠹻](/entries/zam#cantonese-𠹻)
  //
    , zan6 gaan1
    , [陣間](/entries/zan#cantonese-陣間)
  //
    , zau2 zaan2
    , [走趲](/entries/zaan#cantonese-走趲)
''
||||
<## /terms-table ##>
