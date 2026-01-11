< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of literary renderings by Baxter notation
* %date-modified --> 2026-01-11
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
    ; Term (link)
    ; Renderings
|:
  //
    , `'ae`
    , [鴉](/entries/aa#rendering-鴉)
    ,
      ==
      - (_noun-like_) crow, raven
      ==
  //
    , `'aeX`
    , [啞](/entries/aa#rendering-啞)
    ,
      ==
      - (_adjective-like_) dumb
      ==
  //
    , `'aeH`
    , [亞](/entries/aa#rendering-亞)
    ,
      ==
      - (_adjective-like_) second
      ==
  //
    , `'aenH`
    , [晏](/entries/aan#rendering-晏)
    ,
      ==
      - (_adjective-like_) clear, cloudless
      - (_adjective-like_) serene
      - (_adjective-like_) late
      ==
  //
    , `'aenH`
    , [鷃](/entries/aan#rendering-鷃)
    ,
      ==
      - (_noun-like_) quail
      ==
  //
    , `'aep`
    , [壓](/entries/aat#rendering-壓)
    ,
      ==
      - (_verb-like_) [to] press down, [to] suppress
      ==
  //
    , `'aep`
    , [押](/entries/aat#rendering-押)
    ,
      ==
      - (_verb-like_) [to] stamp, [to] seal
      ==
  //
    , `'aep`
    , [鴨](/entries/aap#rendering-鴨)
    ,
      ==
      - (_noun-like_) duck
      ==
  //
    , `'aew`
    , [坳](/entries/aau#rendering-坳)
    ,
      ==
      - (_noun-like_) depression, uneven-ground
      ==
  //
    , `'aewX`
    , [拗](/entries/aau#rendering-拗)
    ,
      ==
      - (_verb-like_) [to] snap
      ==
  //
    , `'aewH`
    , [坳](/entries/aau#rendering-坳)
    ,
      ==
      - (_noun-like_) depression, uneven-ground
      ==
  //
    , `'aewk`
    , [幄](/entries/ak#rendering-幄)
    ,
      ==
      - (_noun-like_) tent, canopy
      ==
  //
    , `'aewk`
    , [握](/entries/ak#rendering-握)
    ,
      ==
      - (_verb-like_) [to] grasp
      ==
  //
    , `'aewk`
    , [渥](/entries/ak#rendering-渥)
    ,
      ==
      - (_verb-like_) [to] moisten, [to] imbue
      ==
  //
    , `'at`
    , [遏](/entries/aat#rendering-遏)
    ,
      ==
      - (_verb-like_) [to] curb, [to] arrest
      ==
  //
    , `'at`
    , [閼](/entries/aat#rendering-閼)
    ,
      ==
      - (_verb-like_) [to] block
      ==
  //
    , `'at`
    , [頞](/entries/aat#rendering-頞)
    ,
      ==
      - (_noun-like_) nosebridge
      ==
  //
    , `'eaX`
    , [矮](/entries/ai#rendering-矮)
    ,
      ==
      - (_adjective-like_) short
      ==
  //
    , `'eaH`
    , [隘](/entries/aai#rendering-隘)
    ,
      ==
      - (_noun-like_) defile
      - (_adjective-like_) narrow
      ==
  //
    , `'eak`
    , [厄](/entries/ak#rendering-厄)
    ,
      ==
      - (_noun-like_) adversity, hardship
      ==
  //
    , `'eak`
    , [軛](/entries/aak#rendering-軛)
    ,
      ==
      - (_noun-like_) yoke
      ==
  //
    , `'eak`
    , [阨](/entries/ak#rendering-阨)
    ,
      ==
      - (_noun-like_) pass
      ==
  //
    , `'eam`
    , [黯](/entries/am#rendering-黯)
    ,
      ==
      - (_noun-like_) pitch-black
      - (_adjective-like_) dejected
      ==
  //
    , `'eamX`
    , [黯](/entries/am#rendering-黯)
    ,
      ==
      - (_noun-like_) pitch-black
      - (_adjective-like_) dejected
      ==
  //
    , `'eang`
    , [罌](/entries/aang#rendering-罌)
    ,
      ==
      - (_noun-like_) jar
      ==
  //
    , `'eang`
    , [鶯](/entries/ang#rendering-鶯)
    ,
      ==
      - (_noun-like_) oriole
      - (_adjective-like_) variegated
      ==
  //
    , `'eat`
    , [揠](/entries/aat#rendering-揠)
    ,
      ==
      - (_verb-like_) [to] pull up
      ==
  //
    , `'ej`
    , [翳](/entries/ai#rendering-翳)
    ,
      ==
      - (_noun-like_) screen
      - (_verb-like_) [to] screen, [to] cover (up)
      - (_noun-like_) fallen-tree
      ==
  //
    , `'ejH`
    , [曀](/entries/ai#rendering-曀)
    ,
      ==
      - (_adjective-like_) (windily) overcast
      - (_adjective-like_) obscured
      ==
  //
    , `'ejH`
    , [縊](/entries/ai#rendering-縊)
    ,
      ==
      - (_verb-like_) [to] hang, [to] strangle
      ==
  //
    , `'ejH`
    , [翳](/entries/ai#rendering-翳)
    ,
      ==
      - (_noun-like_) screen
      - (_verb-like_) [to] screen, [to] cover (up)
      - (_noun-like_) fallen-tree
      ==
  //
    , `'jieH`
    , [縊](/entries/ai#rendering-縊)
    ,
      ==
      - (_verb-like_) [to] hang, [to] strangle
      ==
  //
    , `'omH`
    , [暗](/entries/am#rendering-暗)
    ,
      ==
      - (_adjective-like_) dark, dim
      - (_adjective-like_) covert
      ==
  //
    , `'omH`
    , [闇](/entries/am#rendering-闇)
    ,
      ==
      - (_verb-like_) [to] shut away, [to] conceal
      - (_adjective-like_) gloomy, unenlightened
      ==
  //
    , `'uw`
    , [區](/entries/au#rendering-區)
    ,
      ==
      - (_noun-like_) urna
      - (_verb-like_) [to] conceal
      ==
  //
    , `'uw`
    , [謳](/entries/au#rendering-謳)
    ,
      ==
      - (_verb-like_) [to] sing
      ==
  //
    , `'uwX`
    , [嘔](/entries/au#rendering-嘔)
    ,
      ==
      - (_verb-like_) [to] vomit
      ==
  //
    , `'uwX`
    , [毆](/entries/au#rendering-毆)
    ,
      ==
      - (_verb-like_) [to] beat
      ==
  //
    , `'uwH`
    , [漚](/entries/au#rendering-漚)
    ,
      ==
      - (_verb-like_) [to] steep
      ==
  //
    , `draeng`
    , [棖](/entries/caang#rendering-棖)
    ,
      ==
      - (_noun-like_) door-post
      ==
  //
    , `dreang`
    , [橙](/entries/caang#rendering-橙)
    ,
      ==
      - (_noun-like_) orange-tree, orange
      ==
  //
    , `dri`
    , [持](/entries/ci#rendering-持)
    ,
      ==
      - (_verb-like_) [to] hold
      ==
  //
    , `drij`
    , [坻](/entries/ci#rendering-坻)
    ,
      ==
      - (_noun-like_) islet
      ==
  //
    , `drij`
    , [蚳](/entries/ci#rendering-蚳)
    ,
      ==
      - (_noun-like_) ant-egg
      ==
  //
    , `drij`
    , [遲](/entries/ci#rendering-遲)
    ,
      ==
      - (_adjective-like_) slow
      ==
  //
    , `drim`
    , [沉](/entries/cam#rendering-沉)
    ,
      ==
      - (_verb-like_) [to] sink
      ==
  //
    , `drin`
    , [塵](/entries/can#rendering-塵)
    ,
      ==
      - (_noun-like_) dust
      ==
  //
    , `drin`
    , [陳](/entries/can#rendering-陳)
    ,
      ==
      - (_verb-like_) [to] arrange, [to] display
      - (_verb-like_) [to] describe
      - (_adjective-like_) aged
      ==
  //
    , `drinH`
    , [診](/entries/can#rendering-診)
    ,
      ==
      - (_verb-like_) [to] examine
      ==
  //
    , `drje`
    , [池](/entries/ci#rendering-池)
    ,
      ==
      - (_noun-like_) pool
      ==
  //
    , `drje`
    , [篪](/entries/ci#rendering-篪)
    ,
      ==
      - (_noun-like_) flute
      ==
  //
    , `drje`
    , [褫](/entries/ci#rendering-褫)
    ,
      ==
      - (_verb-like_) [to] strip
      ==
  //
    , `drje`
    , [踟](/entries/ci#rendering-踟)
    ,
      ==
      - Used in [踟躕](/entries/ci#rendering-踟躕).
      ==
  //
    , `drje`
    , [馳](/entries/ci#rendering-馳)
    ,
      ==
      - (_verb-like_) [to] gallop, [to] speed
      ==
  //
    , `drje drju`
    , [踟躕](/entries/ci#rendering-踟躕)
    ,
      ==
      - (_verb-like_) [to] walk about hesitatingly
      ==
  //
    , `drjeX`
    , [杝](/entries/ci#rendering-杝)
    ,
      ==
      - (_verb-like_) [to] split with [the] grain
      ==
  //
    , `drjeX`
    , [褫](/entries/ci#rendering-褫)
    ,
      ==
      - (_verb-like_) [to] strip
      ==
  //
    , `drjo`
    , [除](/entries/ceoi#rendering-除)
    ,
      ==
      - (_verb-like_) [to] remove
      - (_verb-like_) [to] divide
      ==
  //
    , `drju`
    , [廚](/entries/ceoi#rendering-廚)
    ,
      ==
      - (_noun-like_) kitchen
      ==
  //
    , `drju`
    , [躕](/entries/ceoi#rendering-躕)
    ,
      ==
      - Used in [踟躕](/entries/ci#rendering-踟躕).
      ==
  //
    , `drjuw`
    , [幬](/entries/cau#rendering-幬)
    ,
      ==
      - (_noun-like_) drape
      ==
  //
    , `drjuw`
    , [疇](/entries/cau#rendering-疇)
    ,
      ==
      - (_noun-like_) farming-field, hemp-field
      - (_pronoun-like_) who
      - (_noun-like_) category
      - Used in [疇昔](/entries/cau#rendering-疇昔).
      ==
  //
    , `drjuw`
    , [稠](/entries/cau#rendering-稠)
    ,
      ==
      - (_adjective-like_) dense
      ==
  //
    , `drjuw`
    , [籌](/entries/cau#rendering-籌)
    ,
      ==
      - (_noun-like_) throwing-arrow
      - (_noun-like_) counting-stick
      - (_noun-like_) plan
      ==
  //
    , `drjuw`
    , [綢](/entries/cau#rendering-綢)
    ,
      ==
      - (_verb-like_) [to] wind
      - Used in [綢繆](/entries/cau#rendering-綢繆).
      ==
  //
    , `drjuw`
    , [裯](/entries/cau#rendering-裯)
    ,
      ==
      - (_noun-like_) bedsheet
      ==
  //
    , `drjuw mjuw`
    , [綢繆](/entries/cau#rendering-綢繆)
    ,
      ==
      - (_verb-like_) [to] wind [and] bind
      ==
  //
    , `drjuw sjek`
    , [疇昔](/entries/cau#rendering-疇昔)
    ,
      ==
      - (_noun-like_) former [day]
      ==
  //
    , `dzam`
    , [慚](/entries/caam#rendering-慚)
    ,
      ==
      - (_adjective-like_) ashamed
      ==
  //
    , `dzan`
    , [殘](/entries/caan#rendering-殘)
    ,
      ==
      - (_verb-like_) [to] hurt, [to] damage, [to] deteriorate
      - (_adjective-like_) cruel
      - (_adjective-like_) fragmentary
      ==
  //
    , `dzej`
    , [懠](/entries/cai#rendering-懠)
    ,
      ==
      - (_adjective-like_) wroth
      ==
  //
    , `dzej`
    , [臍](/entries/ci#rendering-臍)
    ,
      ==
      - (_noun-like_) navel
      ==
  //
    , `dzej`
    , [蠐](/entries/cai#rendering-蠐)
    ,
      ==
      - Used in [蝤蠐](/entries/cai#rendering-蝤蠐).
      ==
  //
    , `dzej`
    , [齊](/entries/cai#rendering-齊)
    ,
      ==
      - (_adjective-like_) equal, uniform
      - (_verb-like_) [to] equal, [to] uniform, (_met._) [to] put in order
      - (_adjective-like_) together, complete
      ==
  //
    , `dzejX`
    , [薺](/entries/cai#rendering-薺)
    ,
      ==
      - (_noun-like_) shepherd's-purse
      ==
  //
    , `dzejH`
    , [懠](/entries/cai#rendering-懠)
    ,
      ==
      - (_adjective-like_) wroth
      ==
  //
    , `dzi`
    , [慈](/entries/ci#rendering-慈)
    ,
      ==
      - (_noun-like_) affection, kindness, (_met._) mother
      ==
  //
    , `dzij`
    , [茨](/entries/ci#rendering-茨)
    ,
      ==
      - (_verb-like_) [to] thatch
      - (_noun-like_) puncture-vine
      ==
  //
    , `dzim`
    , [鬵](/entries/cam#rendering-鬵)
    ,
      ==
      - (_noun-like_) cauldron
      ==
  //
    , `dzin`
    , [螓](/entries/ceon#rendering-螓)
    ,
      ==
      - (_noun-like_) small-cicada
      ==
  //
    , `dzip`
    , [輯](/entries/cap#rendering-輯)
    ,
      ==
      - (_adjective-like_) concordant
      - (_verb-like_) [to] gather (up)
      - (_verb-like_) [to] compile
      ==
  //
    , `dzje`
    , [疵](/entries/ci#rendering-疵)
    ,
      ==
      - (_noun-like_) defect
      ==
  //
    , `dzjem`
    , [潛~(dive)](/entries/cim#rendering-潛-dive)
    ,
      ==
      - (_verb-like_) [to] dive
      ==
  //
    , `dzjem`
    , [潛~(hide)](/entries/cim#rendering-潛-hide)
    ,
      ==
      - (_verb-like_) [to] hide
      ==
  //
    , `dzjem`
    , [鬵](/entries/cam#rendering-鬵)
    ,
      ==
      - (_noun-like_) cauldron
      ==
  //
    , `dzjemH`
    , [潛~(hide)](/entries/cim#rendering-潛-hide)
    ,
      ==
      - (_verb-like_) [to] hide
      ==
  //
    , `dzjuw`
    , [遒](/entries/cau#rendering-遒)
    ,
      ==
      - (_verb-like_) [to] rally, [to] consolidate
      ==
  //
    , `dzjuw dzej`
    , [蝤蠐](/entries/cai#rendering-蝤蠐)
    ,
      ==
      - (_noun-like_) tree-grub
      ==
  //
    , `dzok`
    , [賊](/entries/caak#rendering-賊)
    ,
      ==
      - (_verb-like_) [to] injure
      - (_noun-like_) bandit, renegade
      ==
  //
    , `dzom`
    , [蠶](/entries/caam#rendering-蠶)
    ,
      ==
      - (_noun-like_) silkworm
      ==
  //
    , `dzong`
    , [層](/entries/cang#rendering-層)
    ,
      ==
      - (_noun-like_) storey
      ==
  //
    , `dzong`
    , [曾](/entries/cang#rendering-曾)
    ,
      ==
      - (_adverb-like_) once, ever
      - (_adverb-like_) astonishingly, (_met._) [and] yet, dare
      ==
  //
    , `dzraem`
    , [毚](/entries/caam#rendering-毚)
    ,
      ==
      - (_adjective-like_) wily
      ==
  //
    , `dzraew`
    , [巢](/entries/caau#rendering-巢)
    ,
      ==
      - (_noun-like_) nest
      ==
  //
    , `dzrea`
    , [柴](/entries/caai#rendering-柴)
    ,
      ==
      - (_noun-like_) brushwood, firewood
      ==
  //
    , `dzreaj`
    , [儕](/entries/caai#rendering-儕)
    ,
      ==
      - (_noun-like_) class, compeer
      ==
  //
    , `dzreaj`
    , [豺](/entries/caai#rendering-豺)
    ,
      ==
      - (_noun-like_) dhole
      - Used in [豺狼](/entries/caai#rendering-豺狼).
      ==
  //
    , `dzreaj lang`
    , [豺狼](/entries/caai#rendering-豺狼)
    ,
      ==
      - (_noun-like_) wolf
      ==
  //
    , `dzream`
    , [毚](/entries/caam#rendering-毚)
    ,
      ==
      - (_adjective-like_) wily
      ==
  //
    , `dzream`
    , [讒](/entries/caam#rendering-讒)
    ,
      ==
      - (_noun-like_) calumny
      ==
  //
    , `dzreamH`
    , [儳~(flippant)](/entries/caam#rendering-儳-flippant)
    ,
      ==
      - (_adjective-like_) flippant
      ==
  //
    , `dzriX`
    , [柿](/entries/ci#rendering-柿)
    ,
      ==
      - (_noun-like_) persimmon
      ==
  //
    , `dzwoj`
    , [崔](/entries/ceoi#rendering-崔)
    ,
      ==
      - (_adjective-like_) lofty, mountainous
      ==
  //
    , `dzwoj`
    , [摧](/entries/ceoi#rendering-摧)
    ,
      ==
      - (_verb-like_) [to] push
      - (_verb-like_) [to] break, [to] destroy
      ==
  //
    , `dzyuw`
    , [酬](/entries/cau#rendering-酬)
    ,
      ==
      - (_verb-like_) [to] toast
      - (_verb-like_) [to] repay
      ==
  //
    , `homX`
    , [菡](/entries/aam#rendering-菡)
    ,
      ==
      - Used in [菡萏](/entries/aam#rendering-菡萏).
      ==
  //
    , `homX domX`
    , [菡萏](/entries/aam#rendering-菡萏)
    ,
      ==
      - (_noun-like_) lotus flower
      ==
  //
    , `keat`
    , [恝](/entries/aat#rendering-恝)
    ,
      ==
      - (_adjective-like_) indifferent, sorrowless
      ==
  //
    , `khjuwX`
    , [糗](/entries/cau#rendering-糗)
    ,
      ==
      - (_noun-like_) parched-grain
      ==
  //
    , `sej`
    , [棲](/entries/cai#rendering-棲)
    ,
      ==
      - (_verb-like_) [to] roost
      ==
  //
    , `sjeH`
    , [賜](/entries/ci#rendering-賜)
    ,
      ==
      - (_verb-like_) [to] confer
      ==
  //
    , `sjem`
    , [憸](/entries/cim#rendering-憸)
    ,
      ==
      - (_adjective-like_) glib-tongued
      ==
  //
    , `sjem`
    , [纖](/entries/cim#rendering-纖)
    ,
      ==
      - (_adjective-like_) delicate
      - (_noun-like_) chequered-silk
      ==
  //
    , `sreamX`
    , [摻](/entries/caam#rendering-摻)
    ,
      ==
      - (_verb-like_) [to] take (hold)
      ==
  //
    , `sreanX`
    , [產](/entries/caan#rendering-產)
    ,
      ==
      - (_verb-like_) [to] produce, [to] bear
      - (_noun-like_) property
      ==
  //
    , `srjwet`
    , [刷](/entries/caat#rendering-刷)
    ,
      ==
      - (_verb-like_) [to] scrub
      ==
  //
    , `srwaet`
    , [刷](/entries/caat#rendering-刷)
    ,
      ==
      - (_verb-like_) [to] scrub
      ==
  //
    , `syae`
    , [奢](/entries/ce#rendering-奢)
    ,
      ==
      - (_adjective-like_) extravagant
      ==
  //
    , `syeX`
    , [弛](/entries/ci#rendering-弛)
    ,
      ==
      - (_verb-like_) [to] slacken
      ==
  //
    , `syeX`
    , [豕](/entries/ci#rendering-豕)
    ,
      ==
      - (_noun-like_) swine
      ==
  //
    , `syeH`
    , [啻](/entries/ci#rendering-啻)
    ,
      ==
      - (_adverb-like_) only, merely, (_met._) less than
      ==
  //
    , `syiX`
    , [始](/entries/ci#rendering-始)
    ,
      ==
      - (_noun-like_) beginning
      ==
  //
    , `syijX`
    , [矢](/entries/ci#rendering-矢)
    ,
      ==
      - (_noun-like_) arrow
      - (_verb-like_) [to] arrange
      - (_verb-like_) [to] swear
      ==
  //
    , `syinX`
    , [哂](/entries/can#rendering-哂)
    ,
      ==
      - (_verb-like_) [to] smile (at)
      ==
  //
    , `syinX`
    , [矧](/entries/can#rendering-矧)
    ,
      ==
      - (_conjunction-like_) moreover, let alone
      ==
  //
    , `that`
    , [獺](/entries/caat#rendering-獺)
    ,
      ==
      - (_noun-like_) otter
      ==
  //
    , `trhaejH`
    , [蠆](/entries/caai#rendering-蠆)
    ,
      ==
      - (_noun-like_) scorpion, sting
      ==
  //
    , `trhaek`
    , [坼](/entries/caak#rendering-坼)
    ,
      ==
      - (_verb-like_) [to] rive, [to] crack
      ==
  //
    , `trhaek`
    , [拆](/entries/caak#rendering-拆)
    ,
      ==
      - (_verb-like_) [to] dismantle, [to] open (up)
      ==
  //
    , `trhaet`
    , [獺](/entries/caat#rendering-獺)
    ,
      ==
      - (_noun-like_) otter
      ==
  //
    , `trhiX`
    , [恥](/entries/ci#rendering-恥)
    ,
      ==
      - (_noun-like_) shame
      ==
  //
    , `trhik`
    , [敕](/entries/cik#rendering-敕)
    ,
      ==
      - (_verb-like_) [to] caution
      - (_verb-like_) [to] command
      ==
  //
    , `trhik`
    , [飭](/entries/cik#rendering-飭)
    ,
      ==
      - (_verb-like_) [to] strengthen
      - (_verb-like_) [to] prepare, [to] arrange
      ==
  //
    , `trhinH`
    , [疢](/entries/can#rendering-疢)
    ,
      ==
      - (_noun-like_) fever, sickness
      ==
  //
    , `trhjeX`
    , [褫](/entries/ci#rendering-褫)
    ,
      ==
      - (_verb-like_) [to] strip
      ==
  //
    , `trhjemX`
    , [諂](/entries/cim#rendering-諂)
    ,
      ==
      - (_verb-like_) [to] flatter
      ==
  //
    , `trhjuw`
    , [妯](/entries/cau#rendering-妯)
    ,
      ==
      - (_verb-like_) [to] move
      ==
  //
    , `trhjuw`
    , [抽](/entries/cau#rendering-抽)
    ,
      ==
      - (_verb-like_) [to] pull out
      ==
  //
    , `trhjuw`
    , [瘳](/entries/cau#rendering-瘳)
    ,
      ==
      - (_verb-like_) [to] recuperate
      ==
  //
    , `trhjuwX`
    , [丑](/entries/cau#rendering-丑)
    ,
      ==
      - (_noun-like_) ox-sign
      ==
  //
    , `trjenX`
    , [紾](/entries/can#rendering-紾)
    ,
      ==
      - (_verb-like_) [to] twist
      ==
  //
    , `tsemH`
    , [僭](/entries/cim#rendering-僭)
    ,
      ==
      - (_verb-like_) [to] usurp
      - (_adjective-like_) erroneous
      ==
  //
    , `tshan`
    , [餐](/entries/caan#rendering-餐)
    ,
      ==
      - (_verb-like_) [to] swallow, [to] consume
      - (_noun-like_) meal
      ==
  //
    , `tshanH`
    , [粲](/entries/caan#rendering-粲)
    ,
      ==
      - (_noun-like_) polished-grain
      - (_adjective-like_) splendid, beaming
      ==
  //
    , `tshej`
    , [妻~(noun)](/entries/cai#rendering-妻-noun)
    ,
      ==
      - (_noun-like_) wife
      ==
  //
    , `tshej`
    , [萋](/entries/cai#rendering-萋)
    ,
      ==
      - (_adjective-like_) luxuriant
      ==
  //
    , `tshejH`
    , [妻~(verb)](/entries/cai#rendering-妻-verb)
    ,
      ==
      - (_verb-like_) [to] wive
      ==
  //
    , `tshejH`
    , [砌](/entries/cai#rendering-砌)
    ,
      ==
      - (_noun-like_) step
      - (_verb-like_) [to] assemble, [to] lay
      ==
  //
    , `tshek`
    , [戚](/entries/cik#rendering-戚)
    ,
      ==
      - (_noun-like_) battle-axe
      - (_adjective-like_) grieved, distressed, mournful
      - (_noun-like_) kin
      ==
  //
    , `tshijH`
    , [佽](/entries/ci#rendering-佽)
    ,
      ==
      - (_verb-like_) [to] help, [to] convenience
      ==
  //
    , `tshijH`
    , [次](/entries/ci#rendering-次)
    ,
      ==
      - (_adjective-like_) next, second
      - (_verb-like_) [to] come next
      - (_noun-like_) sequence
      - (_verb-like_) [to] camp, [to] lodge
      ==
  //
    , `tshim`
    , [侵](/entries/cam#rendering-侵)
    ,
      ==
      - (_verb-like_) [to] invade, [to] encroach
      ==
  //
    , `tshim`
    , [駸](/entries/cam#rendering-駸)
    ,
      ==
      - (_adjective-like_) galloping
      ==
  //
    , `tshimX`
    , [寢](/entries/cam#rendering-寢)
    ,
      ==
      - (_verb-like_) [to] sleep, [to] repose
      - (_noun-like_) chamber
      ==
  //
    , `tshin`
    , [親~(close)](/entries/can#rendering-親-close)
    ,
      ==
      - (_noun-like_) close [one], parent
      - (_verb-like_) [to] be close, [to] touch, (_met._) [to] love
      - (_adjective-like_) close, (_met._) [one's] own
      ==
  //
    , `tshinH`
    , [親~(in-law)](/entries/can#rendering-親-in-law)
    ,
      ==
      - (_adjective-like_) in-law
      ==
  //
    , `tship`
    , [咠](/entries/cap#rendering-咠)
    ,
      ==
      - (_verb-like_) [to] whisper
      ==
  //
    , `tship`
    , [緝](/entries/cap#rendering-緝)
    ,
      ==
      - (_verb-like_) [to] spin (thread), [to] hem
      - (_verb-like_) [to] continue
      - Used in [緝熙](/entries/cap#rendering-緝熙).
      ==
  //
    , `tship xi`
    , [緝熙](/entries/cap#rendering-緝熙)
    ,
      ==
      - (_adjective-like_) brilliant
      ==
  //
    , `tshit`
    , [七](/entries/cat#rendering-七)
    ,
      ==
      - (_noun-like_) seven
      - (_verb-like_) [to] septuple
      ==
  //
    , `tshit`
    , [漆](/entries/cat#rendering-漆)
    ,
      ==
      - (_noun-like_) varnish-tree, varnish
      ==
  //
    , `tshjaeX`
    , [且](/entries/ce#rendering-且)
    ,
      ==
      - (_conjunction-like_) and (also), moreover
      - (_determiner-like_) this
      - (_adverb-like_) for now
      - (_auxiliary-like_) shall, about to
      - (_adverb-like_) still
      - (_conjunction-like_) or
      ==
  //
    , `tshje`
    , [雌](/entries/ci#rendering-雌)
    ,
      ==
      - (_noun-like_) hen, female-bird
      - (_noun-like_) female
      ==
  //
    , `tshjeX`
    , [佌](/entries/ci#rendering-佌)
    ,
      ==
      - (_adjective-like_) small, petty
      ==
  //
    , `tshjeX`
    , [此](/entries/ci#rendering-此)
    ,
      ==
      - (_determiner-like_) this
      ==
  //
    , `tshjeX`
    , [泚](/entries/ci#rendering-泚)
    ,
      ==
      - (_adjective-like_) limpid
      - (_adjective-like_) perspiring
      ==
  //
    , `tshjeH`
    , [刺~(noun)](/entries/ci#rendering-刺-noun)
    ,
      ==
      - (_noun-like_) thorn
      ==
  //
    , `tshjeH`
    , [刺~(verb)](/entries/ci#rendering-刺-verb)
    ,
      ==
      - (_verb-like_) [to] pierce, [to] stab, (_met._) [to] slay, [to] assassinate, [to] castigate, [to] lampoon
      ==
  //
    , `tshjek`
    , [刺~(verb)](/entries/ci#rendering-刺-verb)
    ,
      ==
      - (_verb-like_) [to] pierce, [to] stab, (_met._) [to] slay, [to] assassinate, [to] castigate, [to] lampoon
      ==
  //
    , `tshjem`
    , [僉](/entries/cim#rendering-僉)
    ,
      ==
      - (_adjective-like_) all
      ==
  //
    , `tshjem`
    , [憸](/entries/cim#rendering-憸)
    ,
      ==
      - (_adjective-like_) glib-tongued
      ==
  //
    , `tshjemH`
    , [塹](/entries/cim#rendering-塹)
    ,
      ==
      - (_noun-like_) trench, moat
      ==
  //
    , `tshju`
    , [趨](/entries/ceoi#rendering-趨)
    ,
      ==
      - (_verb-like_) [to] haste [toward]
      ==
  //
    , `tshjuX`
    , [取](/entries/ceoi#rendering-取)
    ,
      ==
      - (_verb-like_) [to] take
      ==
  //
    , `tshjuH`
    , [娶](/entries/ceoi#rendering-娶)
    ,
      ==
      - (_verb-like_) [to] take [a wife]
      ==
  //
    , `tshjuH`
    , [趣](/entries/ceoi#rendering-趣)
    ,
      ==
      - (_verb-like_) [to] haste
      ==
  //
    , `tshjuw`
    , [秋](/entries/cau#rendering-秋)
    ,
      ==
      - (_noun-like_) autumn
      ==
  //
    , `tshjuw`
    , [鶖](/entries/cau#rendering-鶖)
    ,
      ==
      - (_noun-like_) marabou
      ==
  //
    , `tshjwejH`
    , [毳](/entries/ceoi#rendering-毳)
    ,
      ==
      - (_noun-like_) fine-hair
      ==
  //
    , `tshjwejH`
    , [脆](/entries/ceoi#rendering-脆)
    ,
      ==
      - (_adjective-like_) brittle
      ==
  //
    , `tshom`
    , [參](/entries/caam#rendering-參)
    ,
      ==
      - (_verb-like_) [to] form three, [to] partake (in)
      - (_verb-like_) [to] pay visit (unto)
      - (_verb-like_) [to] consult, [to] examine
      - (_verb-like_) [to] impeach
      - Used in [參差](/entries/caam#rendering-參差).
      ==
  //
    , `tshom`
    , [驂](/entries/caam#rendering-驂)
    ,
      ==
      - (_noun-like_) outside-horse
      ==
  //
    , `tshuwX`
    , [取](/entries/ceoi#rendering-取)
    ,
      ==
      - (_verb-like_) [to] take
      ==
  //
    , `tshuwX`
    , [趣](/entries/cau#rendering-趣)
    ,
      ==
      - Used in [趣馬](/entries/cau#rendering-趣馬).
      ==
  //
    , `tshuwX maeX`
    , [趣馬](/entries/cau#rendering-趣馬)
    ,
      ==
      - (_noun-like_) horse master
      ==
  //
    , `tshwoj`
    , [催](/entries/ceoi#rendering-催)
    ,
      ==
      - (_verb-like_) [to] press (upon)
      ==
  //
    , `tshwoj`
    , [縗](/entries/ceoi#rendering-縗)
    ,
      ==
      - (_noun-like_) mourning-clothes, sackcloth
      ==
  //
    , `tshwojX`
    , [漼](/entries/ceoi#rendering-漼)
    ,
      ==
      - (_adjective-like_) deep
      ==
  //
    , `tshwojH`
    , [啐](/entries/ceoi#rendering-啐)
    ,
      ==
      - (_verb-like_) [to] sip, [to] taste
      ==
  //
    , `tsiX`
    , [子](/entries/zi#rendering-子)
    ,
      ==
      - (_noun-like_) child, son, daughter
      - (_noun-like_) master, (_met._) thou
      - (_noun-like_) numerator
      - (_noun-like_) rat-sign
      - Used in [赤子](/entries/cik#rendering-赤子).
      ==
  //
    , `tsip`
    , [咠](/entries/cap#rendering-咠)
    ,
      ==
      - (_verb-like_) [to] whisper
      ==
  //
    , `tsjem`
    , [殲](/entries/cim#rendering-殲)
    ,
      ==
      - (_verb-like_) [to] annihilate
      ==
  //
    , `tsjuw`
    , [遒](/entries/cau#rendering-遒)
    ,
      ==
      - (_verb-like_) [to] rally, [to] consolidate
      ==
  //
    , `tsrhae`
    , [差](/entries/caa#rendering-差)
    ,
      ==
      - (_noun-like_) discrepancy, error
      ==
  //
    , `tsrhaemH`
    , [儳~(jumbled)](/entries/caam#rendering-儳-jumbled)
    ,
      ==
      - (_adjective-like_) jumbled
      ==
  //
    , `tsrhaew`
    , [抄](/entries/caau#rendering-抄)
    ,
      ==
      - (_verb-like_) [to] seize
      - (_verb-like_) [to] copy
      ==
  //
    , `tsrhaewH`
    , [抄](/entries/caau#rendering-抄)
    ,
      ==
      - (_verb-like_) [to] seize
      - (_verb-like_) [to] copy
      ==
  //
    , `tsrheaj`
    , [差](/entries/caai#rendering-差)
    ,
      ==
      - (_verb-like_) [to] send
      - (_noun-like_) messenger
      - (_verb-like_) [to] select
      ==
  //
    , `tsrheak`
    , [冊](/entries/caak#rendering-冊)
    ,
      ==
      - (_noun-like_) slip, register, book
      ==
  //
    , `tsrheak`
    , [策](/entries/caak#rendering-策)
    ,
      ==
      - (_noun-like_) slip
      - (_noun-like_) strategy, scheme
      - (_noun-like_) whip
      - (_noun-like_) yarrow-stalk
      ==
  //
    , `tsrheap`
    , [扱](/entries/caap#rendering-扱)
    ,
      ==
      - (_verb-like_) [to] collect
      - (_verb-like_) [to] tuck
      ==
  //
    , `tsrheap`
    , [插](/entries/caap#rendering-插)
    ,
      ==
      - (_verb-like_) [to] insert
      ==
  //
    , `tsrheat`
    , [察](/entries/caat#rendering-察)
    ,
      ==
      - (_verb-like_) [to] inspect
      ==
  //
    , `tsrhik`
    , [測](/entries/cak#rendering-測)
    ,
      ==
      - (_verb-like_) [to] fathom
      ==
  //
    , `tsrhim`
    , [駸](/entries/cam#rendering-駸)
    ,
      ==
      - (_adjective-like_) galloping
      ==
  //
    , `tsrhim tsrhje`
    , [參差](/entries/caam#rendering-參差)
    ,
      ==
      - (_adjective-like_) uneven
      ==
  //
    , `tsrhje`
    , [差](/entries/ci#rendering-差)
    ,
      ==
      - Used in [參差](/entries/caam#rendering-參差).
      ==
  //
    , `tsrhjwejH`
    , [毳](/entries/ceoi#rendering-毳)
    ,
      ==
      - (_noun-like_) fine-hair
      ==
  //
    , `tsrhwaejH`
    , [嘬](/entries/caai#rendering-嘬)
    ,
      ==
      - (_verb-like_) [to] gnaw
      ==
  //
    , `tsrip`
    , [戢](/entries/cap#rendering-戢)
    ,
      ==
      - (_verb-like_) [to] store (up), [to] gather (in), (_met._) [to] restrain, [to] check
      ==
  //
    , `tsrip`
    , [濈](/entries/cap#rendering-濈)
    ,
      ==
      - (_adjective-like_) huddled, accordant
      ==
  //
    , `tsyhae`
    , [車](/entries/ce#rendering-車)
    ,
      ==
      - (_noun-like_) car
      ==
  //
    , `tsyheX`
    , [侈](/entries/ci#rendering-侈)
    ,
      ==
      - (_adjective-like_) prodigal
      ==
  //
    , `tsyheX`
    , [哆](/entries/ci#rendering-哆)
    ,
      ==
      - (_adjective-like_) open-mouthed
      ==
  //
    , `tsyhek`
    , [尺](/entries/cek#rendering-尺)
    ,
      ==
      - (_noun-like_) ruler, rule
      ==
  //
    , `tsyhek`
    , [斥](/entries/cik#rendering-斥)
    ,
      ==
      - (_verb-like_) [to] reject
      - (_noun-like_) saline-earth
      ==
  //
    , `tsyhek`
    , [赤](/entries/cik#rendering-赤)
    ,
      ==
      - (_adjective-like_) red
      - (_adjective-like_) bare
      - Used in [赤子](/entries/cik#rendering-赤子).
      ==
  //
    , `tsyhek tsiX`
    , [赤子](/entries/cik#rendering-赤子)
    ,
      ==
      - (_noun-like_) babe
      ==
  //
    , `tsyhiX`
    , [齒](/entries/ci#rendering-齒)
    ,
      ==
      - (_noun-like_) front-tooth, tooth
      ==
  //
    , `tsyhiH`
    , [熾](/entries/ci#rendering-熾)
    ,
      ==
      - (_adjective-like_) blazing
      ==
  //
    , `tsyhiH`
    , [饎](/entries/ci#rendering-饎)
    ,
      ==
      - (_noun-like_) rice-offering, feast
      ==
  //
    , `tsyhij`
    , [鴟](/entries/ci#rendering-鴟)
    ,
      ==
      - (_noun-like_) owl
      - Used in [鴟鴞](/entries/ci#rendering-鴟鴞).
      ==
  //
    , `tsyhij hjew`
    , [鴟鴞](/entries/ci#rendering-鴟鴞)
    ,
      ==
      - (_noun-like_) owl
      ==
  //
    , `tsyhin`
    , [瞋](/entries/can#rendering-瞋)
    ,
      ==
      - (_verb-like_) [to] glare
      ==
  //
    , `tsyhit`
    , [叱](/entries/cik#rendering-叱)
    ,
      ==
      - (_verb-like_) [to] berate, [to] shout (at)
      ==
  //
    , `tsyhuwX`
    , [醜](/entries/cau#rendering-醜)
    ,
      ==
      - (_adjective-like_) ugly
      - (_verb-like_) [to] abhor
      - (_noun-like_) humiliation
      - (_noun-like_) sort, (_met_.) peers
      ==
  //
    , `tsyhuwH`
    , [臭](/entries/cau#rendering-臭)
    ,
      ==
      - (_noun-like_) smell
      ==
  //
    , `tsyhwe`
    , [吹](/entries/ceoi#rendering-吹)
    ,
      ==
      - (_verb-like_) [to] blow
      ==
  //
    , `tsyhwijH`
    , [出~(transitive)](/entries/ceot#rendering-出-transitive)
    ,
      ==
      - (_verb-like_) [to] bring out, [to] send forth
      - (_verb-like_) [to] supply
      ==
  //
    , `tsyhwin`
    , [春](/entries/ceon#rendering-春)
    ,
      ==
      - (_noun-like_) spring, springtime
      ==
  //
    , `tsyhwinX`
    , [蠢](/entries/ceon#rendering-蠢)
    ,
      ==
      - (_verb-like_) [to] wriggle, [to] stir
      - (_adjective-like_) insolent
      ==
  //
    , `tsyhwit`
    , [出~(intransitive)](/entries/ceot#rendering-出-intransitive)
    ,
      ==
      - (_verb-like_) [to] go out
      ==
  //
    , `tsyin`
    , [畛](/entries/can#rendering-畛)
    ,
      ==
      - (_noun-like_) interfield-path, (_met._) demarcation
      - (_verb-like_) [to] announce (unto)
      ==
  //
    , `tsyinX`
    , [畛](/entries/can#rendering-畛)
    ,
      ==
      - (_noun-like_) interfield-path, (_met._) demarcation
      - (_verb-like_) [to] announce (unto)
      ==
  //
    , `tsyinX`
    , [紾](/entries/can#rendering-紾)
    ,
      ==
      - (_verb-like_) [to] twist
      ==
  //
    , `tsyinX`
    , [袗](/entries/can#rendering-袗)
    ,
      ==
      - (_noun-like_) unlined-garment
      ==
  //
    , `tsyinX`
    , [診](/entries/can#rendering-診)
    ,
      ==
      - (_verb-like_) [to] examine
      ==
  //
    , `tsyinX`
    , [鬒](/entries/can#rendering-鬒)
    ,
      ==
      - (_noun-like_) bushy-hair, black-hair
      ==
  //
    , `tsyinH`
    , [袗](/entries/can#rendering-袗)
    ,
      ==
      - (_noun-like_) unlined-garment
      ==
  //
    , `tsyweX`
    , [捶](/entries/ceoi#rendering-捶)
    ,
      ==
      - (_verb-like_) [to] beat
      ==
  //
    , `xjuwH`
    , [嗅](/entries/cau#rendering-嗅)
    ,
      ==
      - (_verb-like_) [to] smell
      ==
  //
    , `zi`
    , [祠](/entries/ci#rendering-祠)
    ,
      ==
      - (_noun-like_) spring-sacrifice, sacrifice
      - (_noun-like_) ancestral-shrine
      ==
  //
    , `zi`
    , [詞](/entries/ci#rendering-詞)
    ,
      ==
      - (_noun-like_) phrase, expression
      ==
  //
    , `zi`
    , [辭](/entries/ci#rendering-辭)
    ,
      ==
      - (_noun-like_) statement
      - (_verb-like_) [to] decline
      - (_verb-like_) [to] take leave
      ==
  //
    , `ziX`
    , [似](/entries/ci#rendering-似)
    ,
      ==
      - (_verb-like_) [to] resemble
      - (_conjunction-like_) like
      ==
  //
    , `ziX`
    , [汜](/entries/ci#rendering-汜)
    ,
      ==
      - (_noun-like_) rejoining-water
      ==
  //
    , `zim`
    , [尋](/entries/cam#rendering-尋)
    ,
      ==
      - (_noun-like_) fathom
      ==
  //
    , `zim`
    , [鬵](/entries/cam#rendering-鬵)
    ,
      ==
      - (_noun-like_) cauldron
      ==
  //
    , `zjae`
    , [斜](/entries/ce#rendering-斜)
    ,
      ==
      - (_adjective-like_) slanted
      ==
  //
    , `zjae`
    , [邪](/entries/ce#rendering-邪)
    ,
      ==
      - (_adjective-like_) wicked
      ==
  //
    , `zjo`
    , [徐](/entries/ceoi#rendering-徐)
    ,
      ==
      - (_adverb-like_) slowly, gently
      - (_adjective-like_) composed, dignified
      ==
  //
    , `zjuw`
    , [囚](/entries/cau#rendering-囚)
    ,
      ==
      - (_verb-like_) [to] imprison
      - (_noun-like_) prisoner
      ==
  //
    , `zjwe`
    , [隨](/entries/ceoi#rendering-隨)
    ,
      ==
      - (_verb-like_) [to] follow, (_met._) ^according unto
      ==
  //
    , `zwin`
    , [巡](/entries/ceon#rendering-巡)
    ,
      ==
      - (_verb-like_) [to] patrol, [to] inspect
      - Used in [巡守](/entries/ceon#rendering-巡守).
      ==
  //
    , `zwin`
    , [循](/entries/ceon#rendering-循)
    ,
      ==
      - (_verb-like_) [to] go along, [to] comply
      - (_adjective-like_) orderly
      - (_verb-like_) [to] rub
      ==
  //
    , `zwin`
    , [旬](/entries/ceon#rendering-旬)
    ,
      ==
      - (_noun-like_) ten-days
      ==
  //
    , `zwin`
    , [紃](/entries/ceon#rendering-紃)
    ,
      ==
      - (_noun-like_) silk-cord
      ==
  //
    , `zwin syuwH`
    , [巡守](/entries/ceon#rendering-巡守)
    ,
      ==
      - (_verb-like_) [to] make tour of inspection
      ==
  //
    , `zywin`
    , [紃](/entries/ceon#rendering-紃)
    ,
      ==
      - (_noun-like_) silk-cord
      ==
''
||||
<## /renderings-table ##>
