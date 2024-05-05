< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of Cantonese terms by Jyutping
* %date-modified --> 2024-05-05
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
    , aa3 ze2-1
    , [阿姐](/entries/ze#cantonese-阿姐)
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
    , caa4 zau2
    , [茶走](/entries/caa#cantonese-茶走)
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
    , caang1
    , [鐺](/entries/caang#cantonese-鐺)
  //
    , caang3
    , [𨅝](/entries/caang#cantonese-𨅝)
  //
    , caang3 toi4-2 goek3
    , [𨅝檯腳](/entries/caang#cantonese-𨅝檯腳)
  //
    , caang4
    , [𥋇](/entries/caang#cantonese-𥋇)
  //
    , caang4 ngaan5
    , [𥋇眼](/entries/caang#cantonese-𥋇眼)
  //
    , caap3 zong1 gaa3 wo6
    , [插贓嫁禍](/entries/caap#cantonese-插贓嫁禍)
  //
    , caat3 gaau1
    , [擦膠](/entries/caat#cantonese-擦膠)
  //
    , caat3 haai4
    , [擦鞋](/entries/caat#cantonese-擦鞋)
  //
    , caat3 zi2 gaau1
    , [擦紙膠](/entries/caat#cantonese-擦紙膠)
  //
    , caau2
    , [炒](/entries/caau#cantonese-炒)
  //
    , caau2 jau4-2
    , [炒魷](/entries/caau#cantonese-炒魷)
  //
    , caau2 jau4 jyu4-2
    , [炒魷魚](/entries/caau#cantonese-炒魷魚)
  //
    , caau3
    , [摷](/entries/caau#cantonese-摷)
  //
    , caau4
    , [巢](/entries/caau#cantonese-巢)
  //
    , cai4 cap1 cap1
    , [齊戢戢](/entries/cap#cantonese-齊戢戢)
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
    , cat6
    , [𨳍](/entries/cat#cantonese-𨳍)
  //
    , cau1
    , [抽](/entries/cau#cantonese-抽)
  //
    , cau1 hei3 sin3
    , [抽氣扇](/entries/cau#cantonese-抽氣扇)
  //
    , cau2 joeng6-2
    , [醜樣](/entries/cau#cantonese-醜樣)
  //
    , cau3
    , [湊](/entries/cau#cantonese-湊)
  //
    , cau4-2
    , [籌](/entries/cau#cantonese-籌)
  //
    , ce1
    , [唓](/entries/ce#cantonese-唓)
  //
    , ce2
    , [扯](/entries/ce#cantonese-扯)
  //
    , ce3 lou6-2
    , [斜路](/entries/ce#cantonese-斜路)
  //
    , ce5
    , [唓](/entries/ce#cantonese-唓)
  //
    , ci1
    , [黐](/entries/ci#cantonese-黐)
  //
    , ci1 fai3
    , [黐肺](/entries/ci#cantonese-黐肺)
  //
    , ci1 lei6 gan1
    , [黐脷根](/entries/ci#cantonese-黐脷根)
  //
    , ci1 maa1 gan1
    , [黐孖筋](/entries/ci#cantonese-黐孖筋)
  //
    , ci1 sin6
    , [黐線](/entries/ci#cantonese-黐線)
  //
    , ci5
    , [似](/entries/ci#cantonese-似)
  //
    , ci5 joeng6-2
    , [似樣](/entries/ci#cantonese-似樣)
  //
    , cin1 cau1
    , [韆鞦](/entries/cau#cantonese-韆鞦)
  //
    , coek3
    , [灼](/entries/coek#cantonese-灼)
  //
    , coeng3
    , [暢](/entries/coeng#cantonese-暢)
  //
    , coeng4-2
    , [腸](/entries/coeng#cantonese-腸)
  //
    , coeng4-2 fan2
    , [腸粉](/entries/coeng#cantonese-腸粉)
  //
    , coeng4 hei3
    , [長氣](/entries/coeng#cantonese-長氣)
  //
    , coeng4 meng6 ce3
    , [長命斜](/entries/ce#cantonese-長命斜)
  //
    , daa2 laang5 zan3
    , [打冷震](/entries/zan#cantonese-打冷震)
  //
    , daai6 ban6 zoeng6
    , [大笨象](/entries/zoeng#cantonese-大笨象)
  //
    , daai6 zan6 zoeng6
    , [大陣仗](/entries/zoeng#cantonese-大陣仗)
  //
    , faa1 zi2
    , [花紙](/entries/zi#cantonese-花紙)
  //
    , gaa1 ze2-1
    , [家姐](/entries/ze#cantonese-家姐)
  //
    , gaat6 zaat6
    , [曱甴](/entries/zaat#cantonese-曱甴)
  //
    , gaat6 zaat6-2
    , [曱甴](/entries/zaat#cantonese-曱甴)
  //
    , gaau1 zi2
    , [膠紙](/entries/zi#cantonese-膠紙)
  //
    , gai1 pei4 zi2
    , [雞皮紙](/entries/zi#cantonese-雞皮紙)
  //
    , gam3 zai6
    , [咁嚌](/entries/zai#cantonese-咁嚌)
  //
    , gau2 zaau2 tau4
    , [狗爪頭](/entries/zaau#cantonese-狗爪頭)
  //
    , goek3 zi2 gung1
    , [腳趾公](/entries/zi#cantonese-腳趾公)
  //
    , goek3 zi2 mei5-1
    , [腳趾尾](/entries/zi#cantonese-腳趾尾)
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
    , jaang3
    , [𨅝](/entries/caang#cantonese-𨅝)
  //
    , jaang3 toi4-2 goek3
    , [𨅝檯腳](/entries/caang#cantonese-𨅝檯腳)
  //
    , jat1 cau1 ji6 nang3
    , [一抽二褦](/entries/cau#cantonese-一抽二褦)
  //
    , jat1 zan6
    , [一陣~\(moment\)](/entries/zan#cantonese-一陣-moment)
  //
    , jat1 zan6
    , [一陣~\(later\)](/entries/zan#cantonese-一陣-later)
  //
    , jat1 zan6-2
    , [一陣~\(later\)](/entries/zan#cantonese-一陣-later)
  //
    , jat1 zan6 gaan1
    , [一陣間](/entries/zan#cantonese-一陣間)
  //
    , jau5 zaau2
    , [有找](/entries/zaau#cantonese-有找)
  //
    , jin1 caan2
    , [煙鏟](/entries/caan#cantonese-煙鏟)
  //
    , laa5 zaa2
    , [揦鮓](/entries/zaa#cantonese-揦鮓)
  //
    , laap6 zaap6
    , [垃雜](/entries/zaap#cantonese-垃雜)
  //
    , lou5 can3
    , [老襯](/entries/can#cantonese-老襯)
  //
    , lou5 cau1
    , [老抽](/entries/cau#cantonese-老抽)
  //
    , m4 seon3 ce4-2
    , [唔信邪](/entries/ce#cantonese-唔信邪)
  //
    , maa4 zoek3
    , [麻雀](/entries/zoek#cantonese-麻雀)
  //
    , maa4 zoek3-2
    , [麻雀](/entries/zoek#cantonese-麻雀)
  //
    , mei5-1 zi2
    , [尾指](/entries/zi#cantonese-尾指)
  //
    , mun4 caam5
    , [門棖](/entries/caam#cantonese-門棖)
  //
    , no6 mai5 ci4
    , [糯米糍](/entries/ci#cantonese-糯米糍)
  //
    , paa3 cau2
    , [怕醜](/entries/cau#cantonese-怕醜)
  //
    , saa1 can4
    , [沙塵](/entries/can#cantonese-沙塵)
  //
    , saam1 man4 zi6
    , [三文治](/entries/zi#cantonese-三文治)
  //
    , saang1 cau1
    , [生抽](/entries/cau#cantonese-生抽)
  //
    , sai1 ce4
    , [西斜](/entries/ce#cantonese-西斜)
  //
    , sai3 ze2
    , [細姐](/entries/ze#cantonese-細姐)
  //
    , sau2 zi2 gung1
    , [手指公](/entries/zi#cantonese-手指公)
  //
    , sau2 zi2 mei5-1
    , [手指尾](/entries/zi#cantonese-手指尾)
  //
    , sik6 zi2
    , [食指](/entries/zi#cantonese-食指)
  //
    , waa6 zaai1
    , [話齋](/entries/zaai#cantonese-話齋)
  //
    , za3
    , [咋](/entries/zaa#cantonese-咋)
  //
    , za4
    , [喳](/entries/zaa#cantonese-喳)
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
    , [咋](/entries/zaa#cantonese-咋)
  //
    , zaa3 dai3
    , [詐諦](/entries/zaa#cantonese-詐諦)
  //
    , zaa4
    , [喳](/entries/zaa#cantonese-喳)
  //
    , zaa6
    , [拃](/entries/zaa#cantonese-拃)
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
    , zaang1
    , [㬹](/entries/zaang#cantonese-㬹)
  //
    , zaang1
    , [爭](/entries/zang#cantonese-爭)
  //
    , zaang1 zoi6
    , [爭在](/entries/zang#cantonese-爭在)
  //
    , zaang6
    , [掙](/entries/zaang#cantonese-掙)
  //
    , zaap6
    , [鈒~\(noun\)](/entries/zaap#cantonese-鈒-noun)
  //
    , zaap6
    , [鈒~\(verb\)](/entries/zaap#cantonese-鈒-verb)
  //
    , zaap6
    , [雜](/entries/zaap#cantonese-雜)
  //
    , zaap6-2
    , [鈒~\(noun\)](/entries/zaap#cantonese-鈒-noun)
  //
    , zaat3 maa5
    , [扎馬](/entries/zaat#cantonese-扎馬)
  //
    , zaat3 seng2
    , [扎醒](/entries/zaat#cantonese-扎醒)
  //
    , zaat3 zaat3 tiu3
    , [扎扎跳](/entries/zaat#cantonese-扎扎跳)
  //
    , zaau2 sou3
    , [找數](/entries/zaau#cantonese-找數)
  //
    , zai1
    , [擠](/entries/zai#cantonese-擠)
  //
    , zai1 bik1
    , [擠迫](/entries/zai#cantonese-擠迫)
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
    , zap1
    , [執](/entries/zap#cantonese-執)
  //
    , zap1
    , [蓻](/entries/zap#cantonese-蓻)
  //
    , zap1 co3 zi6 nap1
    , [執錯字粒](/entries/zap#cantonese-執錯字粒)
  //
    , zap1 gwat1
    , [執骨](/entries/zap#cantonese-執骨)
  //
    , zap1 lap1
    , [執笠](/entries/zap#cantonese-執笠)
  //
    , zap1 maa1
    , [執媽](/entries/zap#cantonese-執媽)
  //
    , zap1 saang1
    , [執生](/entries/zap#cantonese-執生)
  //
    , zap1 syu1
    , [執輸](/entries/zap#cantonese-執輸)
  //
    , zap1 zai2
    , [執仔](/entries/zap#cantonese-執仔)
  //
    , zap1 zai2 po4-2
    , [執仔婆](/entries/zap#cantonese-執仔婆)
  //
    , zat1
    , [枳](/entries/zat#cantonese-枳)
  //
    , zat1
    , [質](/entries/zat#cantonese-質)
  //
    , zat6
    , [窒](/entries/zat#cantonese-窒)
  //
    , zat6 pou5
    , [姪婦](/entries/zat#cantonese-姪婦)
  //
    , zat6 zai2
    , [姪仔](/entries/zat#cantonese-姪仔)
  //
    , zau1
    , [揪](/entries/zau#cantonese-揪)
  //
    , zau1 san1 dou1 mou5 zoeng1 lei6
    , [周身刀冇張利](/entries/zau#cantonese-周身刀冇張利)
  //
    , zau1 si4
    , [周時](/entries/zau#cantonese-周時)
  //
    , zau2
    , [走](/entries/zau#cantonese-走)
  //
    , zau2 gai1
    , [走雞](/entries/zau#cantonese-走雞)
  //
    , zau2 heoi3
    , [走去](/entries/zau#cantonese-走去)
  //
    , zau2 jau4-2
    , [走油](/entries/zau#cantonese-走油)
  //
    , zau2 lat1
    , [走甩](/entries/zau#cantonese-走甩)
  //
    , zau2 lou6-2
    , [走路](/entries/zau#cantonese-走路)
  //
    , zau2 zaan2
    , [走趲](/entries/zaan#cantonese-走趲)
  //
    , zau6
    , [就](/entries/zau#cantonese-就)
  //
    , zau6 faai3
    , [就快](/entries/zau#cantonese-就快)
  //
    , zau6 gam2
    , [就噉](/entries/zau#cantonese-就噉)
  //
    , zau6 lai4
    , [就嚟](/entries/zau#cantonese-就嚟)
  //
    , ze1
    , [啫](/entries/ze#cantonese-啫)
  //
    , ze1
    , [遮](/entries/ze#cantonese-遮)
  //
    , ze1 lei2
    , [啫喱](/entries/ze#cantonese-啫喱)
  //
    , zek3 cau1
    , [隻抽](/entries/cau#cantonese-隻抽)
  //
    , zi1
    , [螆](/entries/zi#cantonese-螆)
  //
    , zi2 ji5
    , [指擬](/entries/zi#cantonese-指擬)
  //
    , zi3
    , [至](/entries/zi#cantonese-至)
  //
    , zi6
    , [治](/entries/zi#cantonese-治)
  //
    , zik6 cing4
    , [直程](/entries/zik#cantonese-直程)
  //
    , zik6 tau4
    , [直頭](/entries/zik#cantonese-直頭)
  //
    , zoek3
    , [着~\(wear\)](/entries/zoek#cantonese-着-wear)
  //
    , zoek3 guk6
    , [雀局](/entries/zoek#cantonese-雀局)
  //
    , zoek6
    , [着~\(on\)](/entries/zoek#cantonese-着-on)
  //
    , zuk1 zi6 sat1
    , [捉字蝨](/entries/zi#cantonese-捉字蝨)
  //
    , zyu1 coeng4 fan2
    , [豬腸粉](/entries/coeng#cantonese-豬腸粉)
''
||||
<## /terms-table ##>
