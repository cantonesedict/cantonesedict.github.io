< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of Cantonese terms by Jyutping
* %date-modified --> 2023-12-30
* %copyright-prior-years -->

OrdinaryDictionaryReplacement: #.no-black-serif-note
- queue_position: AFTER #.boilerplate.footer
* %black-serif-note -->

%%%

#{.modern} %title

||||{.modern .filter-container}
<label for="filter">Filter for Jyutping/Term:</label>
<input type="text" id="filter" onkeyup="applyFilter()" placeholder="(tones are ignored)">
<noscript>
||{.modern}
**JavaScript is required for filter to work.**
||
</noscript>
||||

u<````````
<script>
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
</script>
````````>

||||{.wide}
''{.modern}
|^
  //
    ; Jyutping
    ; Term
    ; Entry link
|:
<## cantonese-table-body ##>
  //
    , a1
    , 吖
    , [aa#cantonese-吖](aa#cantonese-吖)

  //
    , a1 maa3
    , 吖嘛
    , [aa#cantonese-吖嘛](aa#cantonese-吖嘛)

  //
    , a3
    , 啊
    , [aa#cantonese-啊-final](aa#cantonese-啊-final)

  //
    , a4
    , 呀
    , [aa#cantonese-呀](aa#cantonese-呀)

  //
    , aa1
    , 吖
    , [aa#cantonese-吖](aa#cantonese-吖)

  //
    , aa3
    , 啊
    , [aa#cantonese-啊-final](aa#cantonese-啊-final)

  //
    , aa3
    , 啊
    , [aa#cantonese-啊-list](aa#cantonese-啊-list)

  //
    , aa3 caa1
    , 阿差
    , [caa#cantonese-阿差](caa#cantonese-阿差)

  //
    , aai3
    , 嗌
    , [aai#cantonese-嗌](aai#cantonese-嗌)

  //
    , aak1
    , 呃
    , [aak#cantonese-呃](aak#cantonese-呃)

  //
    , aak3-2
    , 鈪
    , [aak#cantonese-鈪](aak#cantonese-鈪)

  //
    , aap3-2
    , 鴨
    , [aap#cantonese-鴨](aap#cantonese-鴨)

  //
    , aau2
    , 拗
    , [aau#cantonese-拗](aau#cantonese-拗)

  //
    , aau3
    , 詏
    , [aau#cantonese-詏](aau#cantonese-詏)

  //
    , ai1 ja4
    , 哎吔
    , [ai#cantonese-哎吔-pain](ai#cantonese-哎吔-pain)

  //
    , ai1 jaa1
    , 哎吔
    , [ai#cantonese-哎吔-indignation](ai#cantonese-哎吔-indignation)

  //
    , am2
    , 揞
    , [am#cantonese-揞](am#cantonese-揞)

  //
    , am3 syun3
    , 暗算
    , [am#cantonese-暗算](am#cantonese-暗算)

  //
    , ang2
    , 㾘
    , [ang#cantonese-㾘](ang#cantonese-㾘)

  //
    , ap1
    , 洽
    , [ap#cantonese-洽](ap#cantonese-洽)

  //
    , au3 nai4
    , 漚泥
    , [au#cantonese-漚泥](au#cantonese-漚泥)

  //
    , baau3 caak3
    , 爆坼
    , [caak#cantonese-爆坼](caak#cantonese-爆坼)

  //
    , bai3 ai3
    , 贔屭
    , [ai#cantonese-贔屭](ai#cantonese-贔屭)

  //
    , caa1
    , 叉
    , [caa#cantonese-叉](caa#cantonese-叉)

  //
    , caa1 siu1
    , 叉燒
    , [caa#cantonese-叉燒](caa#cantonese-叉燒)

  //
    , caa4
    , 搽
    , [caa#cantonese-搽-spread](caa#cantonese-搽-spread)

  //
    , caa5
    , 搽
    , [caa#cantonese-搽-smudge](caa#cantonese-搽-smudge)

  //
    , caa5 wo5
    , 搽𢰸
    , [caa#cantonese-搽𢰸](caa#cantonese-搽𢰸)

  //
    , caai1
    , 差
    , [caai#cantonese-差](caai#cantonese-差)

  //
    , cam1
    , 侵
    , [cam#cantonese-侵](cam#cantonese-侵)

  //
    , cam3
    , 讖
    , [cam#cantonese-讖](cam#cantonese-讖)

  //
    , cam4 jat6
    , 尋日
    , [cam#cantonese-尋日](cam#cantonese-尋日)

  //
    , gam3 zai6
    , 咁嚌
    , [zai#cantonese-咁嚌](zai#cantonese-咁嚌)

  //
    , hau6 mei5 zam2
    , 後尾枕
    , [zam#cantonese-後尾枕](zam#cantonese-後尾枕)

  //
    , waa6 zaai1
    , 話齋
    , [zaai#cantonese-話齋](zaai#cantonese-話齋)

  //
    , za4
    , 咋
    , [zaa#cantonese-咋-4](zaa#cantonese-咋-4)

  //
    , zaa1
    , 揸
    , [zaa#cantonese-揸](zaa#cantonese-揸)

  //
    , zaa1
    , 渣
    , [zaa#cantonese-渣](zaa#cantonese-渣)

  //
    , zaa2
    , 鮓
    , [zaa#cantonese-鮓](zaa#cantonese-鮓)

  //
    , zaa3
    , 咋
    , [zaa#cantonese-咋-3](zaa#cantonese-咋-3)

  //
    , zaa3 dai3
    , 詐諦
    , [zaa#cantonese-詐諦](zaa#cantonese-詐諦)

  //
    , zaai1
    , 齋
    , [zaai#cantonese-齋](zaai#cantonese-齋)

  //
    , zaak3
    , 矺
    , [zaak#cantonese-矺](zaak#cantonese-矺)

  //
    , zaak6
    , 矺
    , [zaak#cantonese-矺](zaak#cantonese-矺)

  //
    , zaam2
    , 䁪
    , [zaam#cantonese-䁪](zaam#cantonese-䁪)

  //
    , zai1
    , 擠
    , [zai#cantonese-擠](zai#cantonese-擠)

  //
    , zai2
    , 仔
    , [zai#cantonese-仔](zai#cantonese-仔)

  //
    , zai3
    , 掣
    , [zai#cantonese-掣](zai#cantonese-掣)

  //
    , zai6
    , 嚌
    , [zai#cantonese-嚌](zai#cantonese-嚌)

  //
    , zam1 caa4 dai6 seoi2
    , 斟茶遞水
    , [zam#cantonese-斟茶遞水](zam#cantonese-斟茶遞水)

  //
    , zam2 zyu6
    , 枕住
    , [zam#cantonese-枕住](zam#cantonese-枕住)

  //
    , zam3
    , 浸
    , [zam#cantonese-浸](zam#cantonese-浸)

  //
    , zam6
    , 𠹻
    , [zam#cantonese-𠹻](zam#cantonese-𠹻)

<## /cantonese-table-body ##>
''
||||
