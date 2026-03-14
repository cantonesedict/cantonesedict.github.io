< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of literary renderings by Baxter notation
* %date-modified --> 2026-03-14
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
    , `'eat`
    , [軋](/entries/zaat#rendering-軋)
    ,
      ==
      - (_verb-like_) [to] crush
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
    , `'jit tshejH`
    , [一切](/entries/cai#rendering-一切)
    ,
      ==
      - (_noun-like_) everything
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
    , `baenX`
    , [反~(voiced)](/entries/faan#rendering-反-voiced)
    ,
      ==
      - (_adjective-like_) solemn, prudent
      ==
  //
    , `bj+j`
    , [痱](/entries/fei#rendering-痱)
    ,
      ==
      - (_noun-like_) stroke
      ==
  //
    , `bj+j`
    , [肥](/entries/fei#rendering-肥)
    ,
      ==
      - (_adjective-like_) fat
      - (_adjective-like_) fertile
      ==
  //
    , `bj+j`
    , [腓](/entries/fei#rendering-腓)
    ,
      ==
      - (_noun-like_) calf
      - (_verb-like_) [to] deteriorate
      - (_verb-like_) [to] protect, [to] cover
      ==
  //
    , `bj+jH`
    , [屝](/entries/fei#rendering-屝)
    ,
      ==
      - (_noun-like_) straw-sandal
      ==
  //
    , `bj+jH`
    , [蜚](/entries/fei#rendering-蜚)
    ,
      ==
      - (_noun-like_) stinking-pest
      ==
  //
    , `bj+jH`
    , [費~(voiced)](/entries/fai#rendering-費-voiced)
    ,
      ==
      - (_adjective-like_) general-use
      ==
  //
    , `bjojH`
    , [吠](/entries/fai#rendering-吠)
    ,
      ==
      - (_verb-like_) [to] bark
      ==
  //
    , `bjom`
    , [凡](/entries/faan#rendering-凡)
    ,
      ==
      - (_determiner-like_) all, every
      - (_preposition-like_) in total
      - (_adjective-like_) common
      ==
  //
    , `bjom`
    , [帆~(noun)](/entries/faan#rendering-帆-noun)
    ,
      ==
      - (_noun-like_) sail
      ==
  //
    , `bjomX`
    , [犯](/entries/faan#rendering-犯)
    ,
      ==
      - (_verb-like_) [to] offend (against)
      - (_verb-like_) [to] confront, [to] face
      - (_verb-like_) [to] go over
      ==
  //
    , `bjomX`
    , [範](/entries/faan#rendering-範)
    ,
      ==
      - (_noun-like_) mould
      ==
  //
    , `bjomX`
    , [范](/entries/faan#rendering-范)
    ,
      ==
      - (_noun-like_) bee
      ==
  //
    , `bjomH`
    , [帆~(verb)](/entries/faan#rendering-帆-verb)
    ,
      ==
      - (_verb-like_) [to] sail
      ==
  //
    , `bjon`
    , [墦](/entries/faan#rendering-墦)
    ,
      ==
      - (_noun-like_) grave
      ==
  //
    , `bjon`
    , [旛](/entries/faan#rendering-旛)
    ,
      ==
      - (_noun-like_) banner
      ==
  //
    , `bjon`
    , [煩](/entries/faan#rendering-煩)
    ,
      ==
      - (_verb-like_) [to] vex, [to] bother
      - (_adjective-like_) vexed, bothered
      - (_adjective-like_) vexatious, bothersome
      ==
  //
    , `bjon`
    , [燔](/entries/faan#rendering-燔)
    ,
      ==
      - (_verb-like_) [to] roast, [to] burn
      ==
  //
    , `bjon`
    , [繁](/entries/faan#rendering-繁)
    ,
      ==
      - (_adjective-like_) abundant, manifold
      ==
  //
    , `bjon`
    , [膰](/entries/faan#rendering-膰)
    ,
      ==
      - (_noun-like_) sacrificial-roast
      ==
  //
    , `bjon`
    , [蕃](/entries/faan#rendering-蕃)
    ,
      ==
      - (_adjective-like_) luxuriant, flourishing
      ==
  //
    , `bjon`
    , [蘩](/entries/faan#rendering-蘩)
    ,
      ==
      - (_noun-like_) hoary-mugwort
      ==
  //
    , `bjon`
    , [蹯](/entries/faan#rendering-蹯)
    ,
      ==
      - (_noun-like_) paw
      ==
  //
    , `bjonX`
    , [飯~(verb)](/entries/faan#rendering-飯-verb)
    ,
      ==
      - (_verb-like_) [to] eat, [to] feed
      ==
  //
    , `bjonH`
    , [飯~(noun)](/entries/faan#rendering-飯-noun)
    ,
      ==
      - (_noun-like_) cooked-rice, rice, meal
      ==
  //
    , `bjop`
    , [乏](/entries/fat#rendering-乏)
    ,
      ==
      - (_verb-like_) [to] lack
      - (_noun-like_) vacancy
      - (_verb-like_) [to] waste
      - (_noun-like_) safety-screen
      ==
  //
    , `bjot`
    , [伐](/entries/fat#rendering-伐)
    ,
      ==
      - (_verb-like_) [to] smite, [to] strike, [to] fell
      - (_verb-like_) [to] boast
      ==
  //
    , `bjot`
    , [瞂](/entries/fat#rendering-瞂)
    ,
      ==
      - (_noun-like_) shield
      ==
  //
    , `bjot`
    , [罰](/entries/fat#rendering-罰)
    ,
      ==
      - (_verb-like_) [to] punish
      - (_verb-like_) [to] fine
      ==
  //
    , `bjun`
    , [墳~(level)](/entries/fan#rendering-墳-level)
    ,
      ==
      - (_noun-like_) mound
      - (_noun-like_) embankment
      - (_adjective-like_) moundy, (_met._) large
      ==
  //
    , `bjun`
    , [幩](/entries/fan#rendering-幩)
    ,
      ==
      - (_noun-like_) bridle-ornament
      ==
  //
    , `bjun`
    , [枌](/entries/fan#rendering-枌)
    ,
      ==
      - (_noun-like_) white-elm
      ==
  //
    , `bjun`
    , [棼](/entries/fan#rendering-棼)
    ,
      ==
      - (_noun-like_) roof-beam
      - (_noun-like_) hemp-cloth
      ==
  //
    , `bjun`
    , [氛](/entries/fan#rendering-氛)
    ,
      ==
      - (_noun-like_) ambience
      ==
  //
    , `bjun`
    , [濆](/entries/fan#rendering-濆)
    ,
      ==
      - (_noun-like_) riverbank, bank
      ==
  //
    , `bjun`
    , [焚](/entries/fan#rendering-焚)
    ,
      ==
      - (_verb-like_) [to] burn
      ==
  //
    , `bjun`
    , [蕡](/entries/fan#rendering-蕡)
    ,
      ==
      - (_adjective-like_) fruitful
      - (_noun-like_) hemp-seed
      ==
  //
    , `bjun`
    , [賁](/entries/fan#rendering-賁)
    ,
      ==
      - (_adjective-like_) large
      ==
  //
    , `bjunX`
    , [墳~(rising)](/entries/fan#rendering-墳-rising)
    ,
      ==
      - (_adjective-like_) rich
      ==
  //
    , `bjunX`
    , [憤](/entries/fan#rendering-憤)
    ,
      ==
      - (_adjective-like_) disgruntled
      ==
  //
    , `bjunH`
    , [分~(departing)](/entries/fan#rendering-分-departing)
    ,
      ==
      - (_noun-like_) share, fraction
      - (_noun-like_) allotted [duty]
      ==
  //
    , `bjut`
    , [佛](/entries/fat#rendering-佛)
    ,
      ==
      - (_noun-like_) buddha
      ==
  //
    , `bjut`
    , [咈](/entries/fat#rendering-咈)
    ,
      ==
      - (_verb-like_) [to] oppose, [to] go against
      ==
  //
    , `bjut`
    , [拂~(voiced)](/entries/fat#rendering-拂-voiced)
    ,
      ==
      - (_verb-like_) [to] oppose, [to] turn aside
      ==
  //
    , `bjuw`
    , [浮](/entries/fau#rendering-浮)
    ,
      ==
      - (_verb-like_) [to] float
      - (_verb-like_) [to] penalise
      - (_adjective-like_) (_met._) heavy, strong
      ==
  //
    , `bjuw`
    , [罘](/entries/fau#rendering-罘)
    ,
      ==
      - (_noun-like_) rabbit-net
      ==
  //
    , `bjuw`
    , [芣](/entries/fau#rendering-芣)
    ,
      ==
      - Used in [芣苡](/entries/fau#rendering-芣苡).
      ==
  //
    , `bjuw`
    , [蜉](/entries/fau#rendering-蜉)
    ,
      ==
      - Used in [蜉蝣](/entries/fau#rendering-蜉蝣).
      ==
  //
    , `bjuw`
    , [阜](/entries/fau#rendering-阜)
    ,
      ==
      - (_noun-like_) great-mound
      - (_adjective-like_) great, large, abundant
      ==
  //
    , `bjuw yiX`
    , [芣苡](/entries/fau#rendering-芣苡)
    ,
      ==
      - (_noun-like_) plantain
      ==
  //
    , `bjuw yuw`
    , [蜉蝣](/entries/fau#rendering-蜉蝣)
    ,
      ==
      - (_noun-like_) up-wing fly
      ==
  //
    , `bjuwng`
    , [汎](/entries/faan#rendering-汎)
    ,
      ==
      - (_verb-like_) [to] float (about)
      ==
  //
    , `downg`
    , [爞](/entries/cung#rendering-爞)
    ,
      ==
      - (_adjective-like_) torrid
      ==
  //
    , `draek`
    , [宅](/entries/zaak#rendering-宅)
    ,
      ==
      - (_noun-like_) dwelling, settlement
      - (_verb-like_) [to] dwell, [to] settle
      ==
  //
    , `draek`
    , [擇](/entries/zaak#rendering-擇)
    ,
      ==
      - (_verb-like_) [to] select
      ==
  //
    , `draek`
    , [澤](/entries/zaak#rendering-澤)
    ,
      ==
      - (_noun-like_) pool, marsh
      - (_noun-like_) lustre
      - (_verb-like_) [to] moisten, [to] enrich
      - (_verb-like_) [to] wash
      - (_noun-like_) undergarment
      ==
  //
    , `draeng`
    , [棖](/entries/caang#rendering-棖)
    ,
      ==
      - (_noun-like_) door-post
      ==
  //
    , `dreaX`
    , [豸](/entries/zaai#rendering-豸)
    ,
      ==
      - (_noun-like_) unicorn
      ==
  //
    , `dreamX`
    , [湛](/entries/zaam#rendering-湛)
    ,
      ==
      - (_adjective-like_) heavy, thick
      - (_adjective-like_) deep
      ==
  //
    , `dreanH`
    , [綻](/entries/zaan#rendering-綻)
    ,
      ==
      - (_adjective-like_) rent
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
    , `drimX`
    , [朕](/entries/zam#rendering-朕)
    ,
      ==
      - (_noun-like_) I
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
    , `drinH`
    , [陣](/entries/zan#rendering-陣)
    ,
      ==
      - (_noun-like_) battle-array, (_met._) battlefield
      ==
  //
    , `dring`
    , [懲](/entries/cing#rendering-懲)
    ,
      ==
      - (_verb-like_) [to] chastise
      ==
  //
    , `dring`
    , [澄](/entries/cing#rendering-澄)
    ,
      ==
      - (_adjective-like_) clear
      ==
  //
    , `drip`
    , [蟄](/entries/zat#rendering-蟄)
    ,
      ==
      - (_noun-like_) hibernation
      - (_verb-like_) [to] cluster
      ==
  //
    , `drjang`
    , [場](/entries/coeng#rendering-場)
    ,
      ==
      - (_noun-like_) arena
      - (_noun-like_) field
      ==
  //
    , `drjang`
    , [腸](/entries/coeng#rendering-腸)
    ,
      ==
      - (_noun-like_) bowel
      ==
  //
    , `drjang`
    , [萇](/entries/coeng#rendering-萇)
    ,
      ==
      - Used in [萇楚](/entries/coeng#rendering-萇楚).
      ==
  //
    , `drjang`
    , [長~(level)](/entries/coeng#rendering-長-level)
    ,
      ==
      - (_adjective-like_) long, (_met._) everlasting
      ==
  //
    , `drjang tsrhjoX`
    , [萇楚](/entries/coeng#rendering-萇楚)
    ,
      ==
      - (_noun-like_) carambola
      ==
  //
    , `drjangH`
    , [長~(departing)](/entries/zoeng#rendering-長-departing)
    ,
      ==
      - (_adjective-like_) surplus
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
    , `drjejH`
    , [滯](/entries/zai#rendering-滯)
    ,
      ==
      - (_verb-like_) [to] congeal
      - (_verb-like_) [to] stagnate
      - (_adjective-like_) stagnant, (_met._) left-behind
      ==
  //
    , `drjen`
    , [廛](/entries/cin#rendering-廛)
    ,
      ==
      - (_noun-like_) farming-lot
      - (_noun-like_) shop
      ==
  //
    , `drjen`
    , [纏](/entries/cin#rendering-纏)
    ,
      ==
      - (_verb-like_) [to] twine
      ==
  //
    , `drjeng`
    , [程](/entries/cing#rendering-程)
    ,
      ==
      - (_noun-like_) measurement, measure
      - (_noun-like_) norm
      ==
  //
    , `drjeng`
    , [裎](/entries/cing#rendering-裎)
    ,
      ==
      - (_verb-like_) [to] nake
      ==
  //
    , `drjeng`
    , [酲](/entries/cing#rendering-酲)
    ,
      ==
      - (_adjective-like_) hungover, drunk-sick
      ==
  //
    , `drjet`
    , [徹](/entries/cit#rendering-徹)
    ,
      ==
      - (_verb-like_) [to] pervade
      - (_verb-like_) [to] remove, [to] withdraw
      - (_verb-like_) [to] regulate
      ==
  //
    , `drjet`
    , [撤](/entries/cit#rendering-撤)
    ,
      ==
      - (_verb-like_) [to] remove, [to] withdraw
      ==
  //
    , `drjet`
    , [轍](/entries/cit#rendering-轍)
    ,
      ==
      - (_noun-like_) wheel-rut, rut
      ==
  //
    , `drjew`
    , [朝](/entries/ciu#rendering-朝)
    ,
      ==
      - (_noun-like_) audience, (imperial) court
      - (_verb-like_) [to] attend audience, [to] attend court
      - (_noun-like_) dynasty
      ==
  //
    , `drjew`
    , [潮](/entries/ciu#rendering-潮)
    ,
      ==
      - (_noun-like_) (morning) tide
      ==
  //
    , `drjo`
    , [儲](/entries/cyu#rendering-儲)
    ,
      ==
      - (_verb-like_) [to] collect
      ==
  //
    , `drjo`
    , [宁](/entries/cyu#rendering-宁)
    ,
      ==
      - (_noun-like_) entrance-space
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
    , `drjoX`
    , [佇](/entries/cyu#rendering-佇)
    ,
      ==
      - (_verb-like_) [to] stand long
      ==
  //
    , `drjoX`
    , [宁](/entries/cyu#rendering-宁)
    ,
      ==
      - (_noun-like_) entrance-space
      ==
  //
    , `drjoX`
    , [杼](/entries/cyu#rendering-杼)
    ,
      ==
      - (_noun-like_) shuttle
      - (_adjective-like_) thin, tapered
      ==
  //
    , `drjoX`
    , [紵](/entries/cyu#rendering-紵)
    ,
      ==
      - (_noun-like_) ramie
      ==
  //
    , `drjoX`
    , [羜](/entries/cyu#rendering-羜)
    ,
      ==
      - (_noun-like_) five-month-lamb
      ==
  //
    , `drjowng`
    , [重~(level)](/entries/cung#rendering-重-level)
    ,
      ==
      - (_verb-like_) [to] repeat, [to] layer
      - (_adverb-like_) once more
      ==
  //
    , `drjowngX`
    , [重~(rising)](/entries/cung#rendering-重-rising)
    ,
      ==
      - (_adjective-like_) weighty, heavy
      - (_verb-like_) [to] weigh
      ==
  //
    , `drjowngH`
    , [重~(departing)](/entries/zung#rendering-重-departing)
    ,
      ==
      - (_adjective-like_) weighty
      - (_verb-like_) [to] weight, (_met._) [to] esteem
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
    , `drjuX`
    , [柱](/entries/cyu#rendering-柱)
    ,
      ==
      - (_noun-like_) pillar, post
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
    , `drjuwX`
    , [紂](/entries/zau#rendering-紂)
    ,
      ==
      - (_noun-like_) crupper
      ==
  //
    , `drjuwH`
    , [冑](/entries/zau#rendering-冑)
    ,
      ==
      - (_noun-like_) helm
      ==
  //
    , `drjuwH`
    , [宙](/entries/zau#rendering-宙)
    ,
      ==
      - (_noun-like_) time
      ==
  //
    , `drjuwH`
    , [胄](/entries/zau#rendering-胄)
    ,
      ==
      - (_adjective-like_) eldest
      - (_noun-like_) posterity
      ==
  //
    , `drjuwH`
    , [酎](/entries/zau#rendering-酎)
    ,
      ==
      - (_noun-like_) strong-drink
      ==
  //
    , `drjuwng`
    , [沖](/entries/cung#rendering-沖)
    ,
      ==
      - (_verb-like_) [to] soar
      - (_adjective-like_) childly
      - (_adjective-like_) hanging (down)
      - (_onomatopoeia_) crack
      ==
  //
    , `drjuwng`
    , [爞](/entries/cung#rendering-爞)
    ,
      ==
      - (_adjective-like_) torrid
      ==
  //
    , `drjuwng`
    , [盅](/entries/cung#rendering-盅)
    ,
      ==
      - (_adjective-like_) empty
      ==
  //
    , `drjuwng`
    , [蟲](/entries/cung#rendering-蟲)
    ,
      ==
      - (_noun-like_) insect, creature
      ==
  //
    , `drjweH`
    , [縋](/entries/zeoi#rendering-縋)
    ,
      ==
      - (_noun-like_) (hung) cord
      - (_verb-like_) [to] hang cord
      ==
  //
    , `drjwen`
    , [傳~(verb)](/entries/cyun#rendering-傳-verb)
    ,
      ==
      - (_verb-like_) [to] transmit
      - (_verb-like_) [to] summon
      ==
  //
    , `drwijH`
    , [墜](/entries/zeoi#rendering-墜)
    ,
      ==
      - (_verb-like_) [to] fall
      ==
  //
    , `duwng`
    , [罿](/entries/cung#rendering-罿)
    ,
      ==
      - (_noun-like_) bird-net
      ==
  //
    , `dza`
    , [瘥](/entries/co#rendering-瘥)
    ,
      ==
      - (_noun-like_) ailment, (_met._) plague
      ==
  //
    , `dzam`
    , [慚](/entries/caam#rendering-慚)
    ,
      ==
      - (_adjective-like_) ashamed
      ==
  //
    , `dzamH`
    , [暫](/entries/zaam#rendering-暫)
    ,
      ==
      - (_adverb-like_) momentarily
      - (_adverb-like_) suddenly
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
    , `dzanX`
    , [瓚](/entries/zaan#rendering-瓚)
    ,
      ==
      - (_noun-like_) libation-cup
      - (_noun-like_) impure-jade
      ==
  //
    , `dzang`
    , [藏](/entries/cong#rendering-藏)
    ,
      ==
      - (_verb-like_) [to] store (away)
      ==
  //
    , `dzaw`
    , [曹](/entries/cou#rendering-曹)
    ,
      ==
      - (_noun-like_) company, herd
      ==
  //
    , `dzaw`
    , [螬](/entries/cou#rendering-螬)
    ,
      ==
      - (_noun-like_) grub
      - Used in [蠐螬](/entries/cai#rendering-蠐螬).
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
      - Used in [蠐螬](/entries/cai#rendering-蠐螬), [蝤蠐](/entries/cai#rendering-蝤蠐).
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
    , `dzej dzaw`
    , [蠐螬](/entries/cai#rendering-蠐螬)
    ,
      ==
      - (_noun-like_) scarab grub
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
    , [劑~(departing)](/entries/zai#rendering-劑-departing)
    ,
      ==
      - (_verb-like_) [to] pare (even)
      ==
  //
    , `dzejH`
    , [嚌](/entries/zai#rendering-嚌)
    ,
      ==
      - (_verb-like_) [to] taste
      ==
  //
    , `dzejH`
    , [懠](/entries/cai#rendering-懠)
    ,
      ==
      - (_adjective-like_) wroth
      ==
  //
    , `dzejH`
    , [穧](/entries/zai#rendering-穧)
    ,
      ==
      - (_verb-like_) [to] reap
      ==
  //
    , `dzen`
    , [前](/entries/cin#rendering-前)
    ,
      ==
      - (_adjective-like_) fore, front
      - (_postposition-like_) before
      - (_adjective-like_) former
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
    , `dzinX`
    , [盡~(voiced)](/entries/zeon#rendering-盡-voiced)
    ,
      ==
      - (_verb-like_) [to] exhaust, [to] complete
      ==
  //
    , `dzing`
    , [繒](/entries/zang#rendering-繒)
    ,
      ==
      - (_noun-like_) silk
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
    , `dzip`
    , [集](/entries/zaap#rendering-集)
    ,
      ==
      - (_verb-like_) [to] perch (together)
      - (_verb-like_) [to] collect
      ==
  //
    , `dzit`
    , [疾](/entries/zat#rendering-疾)
    ,
      ==
      - (_noun-like_) sickness, malady
      - (_adverb-like_) hastily
      - (_verb-like_) [to] detest
      ==
  //
    , `dzit`
    , [蒺](/entries/zat#rendering-蒺)
    ,
      ==
      - Used in [蒺藜](/entries/zat#rendering-蒺藜).
      ==
  //
    , `dzit lej`
    , [蒺藜](/entries/zat#rendering-蒺藜)
    ,
      ==
      - caltrop
      ==
  //
    , `dzjang`
    , [戕](/entries/coeng#rendering-戕)
    ,
      ==
      - (_verb-like_) [to] kill, [to] brutalise
      ==
  //
    , `dzjang`
    , [牆](/entries/coeng#rendering-牆)
    ,
      ==
      - (_noun-like_) wall
      ==
  //
    , `dzje`
    , [疵](/entries/ci#rendering-疵)
    ,
      ==
      - (_noun-like_) defect
      ==
  //
    , `dzjek`
    , [瘠](/entries/zek#rendering-瘠)
    ,
      ==
      - (_adjective-like_) emaciated, (_met._) lean
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
    , `dzjen`
    , [錢](/entries/cin#rendering-錢)
    ,
      ==
      - (_noun-like_) coin
      ==
  //
    , `dzjenX`
    , [俴](/entries/cin#rendering-俴)
    ,
      ==
      - (_adjective-like_) shallow, (_met._) thin-[armoured]
      ==
  //
    , `dzjenX`
    , [踐](/entries/cin#rendering-踐)
    ,
      ==
      - (_verb-like_) [to] trample, [to] tread, (_met._) [to] realise, [to] fulfil
      ==
  //
    , `dzjeng`
    , [情](/entries/cing#rendering-情)
    ,
      ==
      - (_noun-like_) sentiment, (_met._) sense, nature
      - (_noun-like_) truth, circumstance
      ==
  //
    , `dzjep`
    , [寁](/entries/zaan#rendering-寁)
    ,
      ==
      - (_adverb-like_) hastily
      ==
  //
    , `dzjew`
    , [憔](/entries/ciu#rendering-憔)
    ,
      ==
      - Used in [憔悴](/entries/ciu#rendering-憔悴).
      ==
  //
    , `dzjew`
    , [樵](/entries/ciu#rendering-樵)
    ,
      ==
      - (_noun-like_) firewood
      - (_verb-like_) (_met._) [to] cut firewood, [to] burn firewood
      ==
  //
    , `dzjew`
    , [譙](/entries/ciu#rendering-譙)
    ,
      ==
      - (_noun-like_) turret
     - Used in [譙譙](/entries/ciu#rendering-譙譙).
      ==
  //
    , `dzjew dzjew`
    , [譙譙](/entries/ciu#rendering-譙譙)
    ,
      ==
      - (_adjective-like_) worn out
      ==
  //
    , `dzjew dzwijH`
    , [憔悴](/entries/ciu#rendering-憔悴)
    ,
      ==
      - (_adjective-like_) languishing
      ==
  //
    , `dzjewH`
    , [誚](/entries/ciu#rendering-誚)
    ,
      ==
      - (_verb-like_) [to] blame
      ==
  //
    , `dzjoX`
    , [沮~(rising)](/entries/zeoi#rendering-沮-rising)
    ,
      ==
      - (_verb-like_) [to] stop
      - (_verb-like_) [to] scare
      - (_verb-like_) [to] leak
      ==
  //
    , `dzjowng`
    , [從~(follow)](/entries/cung#rendering-從-follow)
    ,
      ==
      - (_verb-like_) [to] follow, [to] pursue
      - (_preposition-like_) from
      ==
  //
    , `dzjuX`
    , [聚](/entries/zeoi#rendering-聚)
    ,
      ==
      - (_verb-like_) [to] gather
      ==
  //
    , `dzjuH`
    , [聚](/entries/zeoi#rendering-聚)
    ,
      ==
      - (_verb-like_) [to] gather
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
      - (_noun-like_) tree grub
      ==
  //
    , `dzjuwX`
    , [愀](/entries/ciu#rendering-愀)
    ,
      ==
      - (_verb-like_) [to] change countenance
      ==
  //
    , `dzjuwH`
    , [就](/entries/zau#rendering-就)
    ,
      ==
      - (_verb-like_) [to] go unto, [to] proceed (unto)
      - (_verb-like_) [to] nigh
      - (_verb-like_) [to] assume
      - (_verb-like_) [to] accomplish
      - (_noun-like_) coil
      ==
  //
    , `dzjuwk`
    , [蹴~(voiced)](/entries/cuk#rendering-蹴-voiced)
    ,
      ==
      - (_adjective-like_) reverential
      ==
  //
    , `dzjwen`
    , [全](/entries/cyun#rendering-全)
    ,
      ==
      - (_adjective-like_) complete, whole
      ==
  //
    , `dzjwen`
    , [泉](/entries/cyun#rendering-泉)
    ,
      ==
      - (_noun-like_) spring, springwater
      ==
  //
    , `dzoj`
    , [才](/entries/coi#rendering-才)
    ,
      ==
      - (_noun-like_) talent, capability
      ==
  //
    , `dzoj`
    , [材](/entries/coi#rendering-材)
    ,
      ==
      - (_noun-like_) timber
      - (_noun-like_) material
      ==
  //
    , `dzoj`
    , [裁](/entries/coi#rendering-裁)
    ,
      ==
      - (_verb-like_) [to] cut, [to] tailor
      - (_verb-like_) [to] rule (on), [to] resolve
      ==
  //
    , `dzoj`
    , [財](/entries/coi#rendering-財)
    ,
      ==
      - (_noun-like_) wealth
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
    , [曾~(voiced)](/entries/cang#rendering-曾-voiced)
    ,
      ==
      - (_adverb-like_) once, ever
      - (_adverb-like_) astonishingly, (_met._) [and] yet, dare
      ==
  //
    , `dzongH`
    , [贈](/entries/zang#rendering-贈)
    ,
      ==
      - (_verb-like_) [to] gift
      ==
  //
    , `dzop`
    , [雜](/entries/zaap#rendering-雜)
    ,
      ==
      - (_adjective-like_) mingled
      ==
  //
    , `dzowng`
    , [潨](/entries/cung#rendering-潨)
    ,
      ==
      - (_noun-like_) confluence
      ==
  //
    , `dzrae`
    , [苴~(plant)](/entries/caa#rendering-苴-plant)
    ,
      ==
      - (_noun-like_) [floating] withered-plant
      ==
  //
    , `dzraeH`
    , [乍](/entries/zaa#rendering-乍)
    ,
      ==
      - (_adverb-like_) suddenly, unexpectedly
      ==
  //
    , `dzraeH`
    , [蜡~(voiced)](/entries/zaa#rendering-蜡-voiced)
    ,
      ==
      - (_noun-like_) winter-sacrifice
      ==
  //
    , `dzraem`
    , [毚](/entries/caam#rendering-毚)
    ,
      ==
      - (_adjective-like_) wily
      ==
  //
    , `dzraenH`
    , [棧](/entries/zaan#rendering-棧)
    ,
      ==
      - (_noun-like_) plank
      - (_adjective-like_) planked, (_met._) hearse
      - (_noun-like_) cote
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
    , `dzreak`
    , [嘖](/entries/zaak#rendering-嘖)
    ,
      ==
      - (_verb-like_) [to] cry out
      ==
  //
    , `dzreak`
    , [賾](/entries/zaak#rendering-賾)
    ,
      ==
      - (_adjective-like_) abstruse
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
    , `dzreanX`
    , [棧](/entries/zaan#rendering-棧)
    ,
      ==
      - (_noun-like_) plank
      - (_adjective-like_) planked, (_met._) hearse
      - (_noun-like_) cote
      ==
  //
    , `dzriX`
    , [柿](/entries/ci#rendering-柿)
    ,
      ==
      - (_noun-like_) persimmon
      ==
  //
    , `dzrjang`
    , [牀](/entries/cong#rendering-牀)
    ,
      ==
      - (_noun-like_) bed
      ==
  //
    , `dzrjenX`
    , [棧](/entries/zaan#rendering-棧)
    ,
      ==
      - (_noun-like_) plank
      - (_adjective-like_) planked, (_met._) hearse
      - (_noun-like_) cote
      ==
  //
    , `dzrjo`
    , [鋤](/entries/co#rendering-鋤)
    ,
      ==
      - (_noun-like_) hoe
      ==
  //
    , `dzrju`
    , [雛](/entries/co#rendering-雛)
    ,
      ==
      - (_noun-like_) chick
      ==
  //
    , `dzrjuwH`
    , [驟](/entries/zaau#rendering-驟)
    ,
      ==
      - (_adjective-like_) speedy
      ==
  //
    , `dzrjwenX`
    , [撰](/entries/zaan#rendering-撰)
    ,
      ==
      - (_noun-like_) law [of nature]
      - (_verb-like_) [to] take hold
      - (_verb-like_) [to] prepare, [to] make
      - (_verb-like_) [to] compose, [to] compile
      ==
  //
    , `dzrjwenX`
    , [譔](/entries/zaan#rendering-譔)
    ,
      ==
      - (_verb-like_) [to] panegyrise
      ==
  //
    , `dzrjwenH`
    , [譔](/entries/zaan#rendering-譔)
    ,
      ==
      - (_verb-like_) [to] panegyrise
      ==
  //
    , `dzrjwenH`
    , [饌](/entries/zaan#rendering-饌)
    ,
      ==
      - (_verb-like_) [to] consume
      - (_verb-like_) [to] serve (viands)
      - (_noun-like_) viand
      ==
  //
    , `dzrwaenX`
    , [撰](/entries/zaan#rendering-撰)
    ,
      ==
      - (_noun-like_) law [of nature]
      - (_verb-like_) [to] take hold
      - (_verb-like_) [to] prepare, [to] make
      - (_verb-like_) [to] compose, [to] compile
      ==
  //
    , `dzu`
    , [徂](/entries/cou#rendering-徂)
    ,
      ==
      - (_verb-like_) [to] go (unto)
      ==
  //
    , `dzu`
    , [殂](/entries/cou#rendering-殂)
    ,
      ==
      - (_verb-like_) [to] go [on], (_met._) [to] pass [away]
      ==
  //
    , `dzuwng`
    , [叢](/entries/cung#rendering-叢)
    ,
      ==
      - (_verb-like_) [to] collect
      - (_noun-like_) thicket
      ==
  //
    , `dzuwng`
    , [潨](/entries/cung#rendering-潨)
    ,
      ==
      - (_noun-like_) confluence
      ==
  //
    , `dzwaX`
    , [坐~(verb)](/entries/zo#rendering-坐-verb)
    ,
      ==
      - (_verb-like_) [to] sit
      ==
  //
    , `dzwaH`
    , [坐~(noun)](/entries/zo#rendering-坐-noun)
    ,
      ==
      - (_noun-like_) seat
      ==
  //
    , `dzwan`
    , [欑](/entries/cyun#rendering-欑)
    ,
      ==
      - (_noun-like_) pole-heap
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
    , `dzwojX`
    , [罪](/entries/zeoi#rendering-罪)
    ,
      ==
      - (_noun-like_) crime, offence
      ==
  //
    , `dzwon`
    , [存](/entries/cyun#rendering-存)
    ,
      ==
      - (_verb-like_) [to] exist, [to] be
      - (_verb-like_) [to] preserve
      ==
  //
    , `dzwon`
    , [蹲~(squat)](/entries/cyun#rendering-蹲-squat)
    ,
      ==
      - (_verb-like_) [to] squat
      ==
  //
    , `dzwonX`
    , [鱒](/entries/cyun#rendering-鱒)
    ,
      ==
      - (_noun-like_) redeye-carp
      ==
  //
    , `dzwonH`
    , [鱒](/entries/cyun#rendering-鱒)
    ,
      ==
      - (_noun-like_) redeye-carp
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
    , `dzywen`
    , [遄](/entries/cyun#rendering-遄)
    ,
      ==
      - (_adverb-like_) quickly
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
    , `khjwak`
    , [躩](/entries/fok#rendering-躩)
    ,
      ==
      - (_verb-like_) [to] step turning on the spot, [to] step quickly
      ==
  //
    , `khwa`
    , [科](/entries/fo#rendering-科)
    ,
      ==
      - (_noun-like_) degree, class, rank
      - (_noun-like_) ordinance
      - (_noun-like_) hole, hollow
      - (_verb-like_) [to] levy
      ==
  //
    , `khwaH`
    , [課](/entries/fo#rendering-課)
    ,
      ==
      - (_verb-like_) [to] assess
      - (_noun-like_) tax
      ==
  //
    , `khwaejH`
    , [快](/entries/faai#rendering-快)
    ,
      ==
      - (_adjective-like_) pleased
      ==
  //
    , `khweajH`
    , [塊](/entries/faai#rendering-塊)
    ,
      ==
      - (_noun-like_) clod
      ==
  //
    , `khwojH`
    , [塊](/entries/faai#rendering-塊)
    ,
      ==
      - (_noun-like_) clod
      ==
  //
    , `khwot`
    , [窟](/entries/fat#rendering-窟)
    ,
      ==
      - (_noun-like_) cave
      - (_noun-like_) hole
      ==
  //
    , `kjwak`
    , [攫](/entries/fok#rendering-攫)
    ,
      ==
      - (_verb-like_) [to] snatch
      ==
  //
    , `kjwak`
    , [矍](/entries/fok#rendering-矍)
    ,
      ==
      - (_verb-like_) [to] glance fearfully
      ==
  //
    , `kjwak`
    , [躩](/entries/fok#rendering-躩)
    ,
      ==
      - (_verb-like_) [to] step turning on the spot, [to] step quickly
      ==
  //
    , `pajH`
    , [芾~(departing)](/entries/fai#rendering-芾-departing)
    ,
      ==
      - (_adjective-like_) small
      - (_adjective-like_) luxuriant
      ==
  //
    , `phj+j`
    , [妃](/entries/fei#rendering-妃)
    ,
      ==
      - (_noun-like_) consort
      ==
  //
    , `phj+j`
    , [菲~(level)](/entries/fei#rendering-菲-level)
    ,
      ==
      - (_adjective-like_) fragrant
      - (_adjective-like_) luxuriant
      ==
  //
    , `phj+j`
    , [霏](/entries/fei#rendering-霏)
    ,
      ==
      - (_adjective-like_) heavy [falling]
      ==
  //
    , `phj+j`
    , [騑~(adjective)](/entries/fei#rendering-騑-adjective)
    ,
      ==
      - (_adjective-like_) walking (on), trotting (on)
      ==
  //
    , `phj+jX`
    , [悱](/entries/fei#rendering-悱)
    ,
      ==
      - (_adjective-like_) eager to express
      ==
  //
    , `phj+jX`
    , [斐](/entries/fei#rendering-斐)
    ,
      ==
      - (_adjective-like_) decorated, splendid
      ==
  //
    , `phj+jX`
    , [菲~(rising)](/entries/fei#rendering-菲-rising)
    ,
      ==
      - (_adjective-like_) scant
      ==
  //
    , `phj+jH`
    , [費~(unvoiced)](/entries/fai#rendering-費-unvoiced)
    ,
      ==
      - (_verb-like_) [to] squander
      ==
  //
    , `phjangX phjut`
    , [彷彿](/entries/fat#rendering-彷彿)
    ,
      ==
      - (_verb-like_) [to] seem (like), [to] appear like
      ==
  //
    , `phjojH`
    , [肺](/entries/fai#rendering-肺)
    ,
      ==
      - (_noun-like_) lung
      ==
  //
    , `phjomH`
    , [氾](/entries/faan#rendering-氾)
    ,
      ==
      - (_verb-like_) [to] flood
      ==
  //
    , `phjomH`
    , [汎](/entries/faan#rendering-汎)
    ,
      ==
      - (_verb-like_) [to] float (about)
      ==
  //
    , `phjon`
    , [反~(level)](/entries/faan#rendering-反-level)
    ,
      ==
      - (_verb-like_) [to] flip, [to] overturn
      - Used in [反切](/entries/faan#rendering-反切).
      ==
  //
    , `phjon`
    , [幡](/entries/faan#rendering-幡)
    ,
      ==
      - (_verb-like_) [to] flip
      - (_verb-like_) [to] flap (about)
      ==
  //
    , `phjon`
    , [旛](/entries/faan#rendering-旛)
    ,
      ==
      - (_noun-like_) banner
      ==
  //
    , `phjon`
    , [番](/entries/faan#rendering-番)
    ,
      ==
      - (_noun-like_) turn
      ==
  //
    , `phjon`
    , [轓](/entries/faan#rendering-轓)
    ,
      ==
      - (_noun-like_) chariot-cover
      ==
  //
    , `phjon tshet`
    , [反切](/entries/faan#rendering-反切)
    ,
      ==
      - (_noun-like_) back-dissection
      ==
  //
    , `phjun`
    , [帉](/entries/fan#rendering-帉)
    ,
      ==
      - (_noun-like_) wiping-cloth
      ==
  //
    , `phjun`
    , [氛](/entries/fan#rendering-氛)
    ,
      ==
      - (_noun-like_) ambience
      ==
  //
    , `phjun`
    , [紛](/entries/fan#rendering-紛)
    ,
      ==
      - (_adjective-like_) confused
      - (_adjective-like_) numbersome
      - (_noun-like_) lace-ribbon
      ==
  //
    , `phjun`
    , [芬](/entries/fan#rendering-芬)
    ,
      ==
      - (_adjective-like_) fragrant
      ==
  //
    , `phjun`
    , [雰](/entries/fan#rendering-雰)
    ,
      ==
      - (_adjective-like_) snowy
      ==
  //
    , `phjunX`
    , [忿](/entries/fan#rendering-忿)
    ,
      ==
      - (_verb-like_) [to] anger
      ==
  //
    , `phjunH`
    , [忿](/entries/fan#rendering-忿)
    ,
      ==
      - (_verb-like_) [to] anger
      ==
  //
    , `phjut`
    , [彿](/entries/fat#rendering-彿)
    ,
      ==
      - Used in [彷彿](/entries/fat#rendering-彷彿).
      ==
  //
    , `phjut`
    , [拂~(unvoiced)](/entries/fat#rendering-拂-unvoiced)
    ,
      ==
      - (_verb-like_) [to] glance
      - (_verb-like_) [to] brush (off), [to] wipe (off)
      ==
  //
    , `phjut`
    , [祓](/entries/fat#rendering-祓)
    ,
      ==
      - (_verb-like_) [to] remove, [to] purify
      ==
  //
    , `phjut`
    , [茀](/entries/fat#rendering-茀)
    ,
      ==
      - (_adjective-like_) flourishing, vigorous
      - (_noun-like_) screen
      - (_verb-like_) [to] clear (away)
      - (_noun-like_) fortuity
      ==
  //
    , `phjuw`
    , [紑](/entries/fau#rendering-紑)
    ,
      ==
      - (_adjective-like_) fresh, bright
      ==
  //
    , `phjuwX`
    , [紑](/entries/fau#rendering-紑)
    ,
      ==
      - (_adjective-like_) fresh, bright
      ==
  //
    , `pj+j`
    , [扉](/entries/fei#rendering-扉)
    ,
      ==
      - (_noun-like_) door-leaf
      ==
  //
    , `pj+j`
    , [誹](/entries/fei#rendering-誹)
    ,
      ==
      - (_verb-like_) [to] slander
      ==
  //
    , `pj+j`
    , [非](/entries/fei#rendering-非)
    ,
      ==
      - (_verb-like_) [to] be not
      - (_adverb-like_) not
      - (_adjective-like_) wrong
      - (_verb-like_) [to] repugn
      ==
  //
    , `pj+j`
    , [飛](/entries/fei#rendering-飛)
    ,
      ==
      - (_verb-like_) [to] fly
      ==
  //
    , `pj+j`
    , [騑~(noun)](/entries/fei#rendering-騑-noun)
    ,
      ==
      - (_noun-like_) outside-horse
      ==
  //
    , `pj+jX`
    , [匪](/entries/fei#rendering-匪)
    ,
      ==
      - (_adverb-like_) not
      ==
  //
    , `pj+jX`
    , [棐](/entries/fei#rendering-棐)
    ,
      ==
      - (_verb-like_) [to] assist
      ==
  //
    , `pj+jX`
    , [篚](/entries/fei#rendering-篚)
    ,
      ==
      - (_noun-like_) bamboo-basket
      ==
  //
    , `pj+jX`
    , [蜚](/entries/fei#rendering-蜚)
    ,
      ==
      - (_noun-like_) stinking-pest
      ==
  //
    , `pj+jH`
    , [沸~(departing)](/entries/fai#rendering-沸-departing)
    ,
      ==
      - (_verb-like_) [to] bubble
      ==
  //
    , `pj+jH`
    , [疿](/entries/fai#rendering-疿)
    ,
      ==
      - (_noun-like_) heat-rash
      ==
  //
    , `pj+jH`
    , [芾~(departing)](/entries/fai#rendering-芾-departing)
    ,
      ==
      - (_adjective-like_) small
      - (_adjective-like_) luxuriant
      ==
  //
    , `pj+jH`
    , [誹](/entries/fei#rendering-誹)
    ,
      ==
      - (_verb-like_) [to] slander
      ==
  //
    , `pjit pjut`
    , [觱沸](/entries/fai#rendering-觱沸)
    ,
      ==
      - (_verb-like_) [to] bubble
      ==
  //
    , `pjojH`
    , [廢](/entries/fai#rendering-廢)
    ,
      ==
      - (_verb-like_) [to] cast away, [to] abandon, [to] abolish
      - (_verb-like_) [to] waste
      - (_verb-like_) [to] fall
      ==
  //
    , `pjojH`
    , [祓](/entries/fat#rendering-祓)
    ,
      ==
      - (_verb-like_) [to] remove, [to] purify
      ==
  //
    , `pjon`
    , [藩](/entries/faan#rendering-藩)
    ,
      ==
      - (_noun-like_) fence
      - (_noun-like_) screen
      ==
  //
    , `pjon`
    , [轓](/entries/faan#rendering-轓)
    ,
      ==
      - (_noun-like_) chariot-cover
      ==
  //
    , `pjonX`
    , [反~(rising)](/entries/faan#rendering-反-rising)
    ,
      ==
      - (_verb-like_) [to] turn (over), [to] turn (back)
      - (_verb-like_) [to] revolt
      - (_adverb-like_) contrariwise
      ==
  //
    , `pjonX`
    , [返](/entries/faan#rendering-返)
    ,
      ==
      - (_verb-like_) [to] turn (back)
      ==
  //
    , `pjonH`
    , [販](/entries/faan#rendering-販)
    ,
      ==
      - (_verb-like_) [to] trade (in)
      - (_noun-like_) trader
      ==
  //
    , `pjop`
    , [法](/entries/faat#rendering-法)
    ,
      ==
      - (_noun-like_) law
      - (_noun-like_) emulate
      - (_noun-like_) method, fashion
      - (_noun-like_) divisor
      ==
  //
    , `pjot`
    , [發](/entries/faat#rendering-發)
    ,
      ==
      - (_verb-like_) [to] send forth
      - (_verb-like_) [to] start (up)
      - (_verb-like_) [to] go forth
      - (_verb-like_) [to] shew forth
      - (_adjective-like_) fierce
      ==
  //
    , `pjot`
    , [髮](/entries/faat#rendering-髮)
    ,
      ==
      - (_noun-like_) hair
      ==
  //
    , `pjun`
    , [分~(level)](/entries/fan#rendering-分-level)
    ,
      ==
      - (_verb-like_) [to] separate, [to] split, (_met._) [to] dispute
      - (_verb-like_) [to] distinguish
      - (_verb-like_) [to] share
      - (_noun-like_) tenth
      ==
  //
    , `pjunX`
    , [粉](/entries/fan#rendering-粉)
    ,
      ==
      - (_noun-like_) powder
      - (_noun-like_) rice-flour
      ==
  //
    , `pjunH`
    , [僨](/entries/fan#rendering-僨)
    ,
      ==
      - (_verb-like_) [to] fall (back), [to] ruin
      ==
  //
    , `pjunH`
    , [奮](/entries/fan#rendering-奮)
    ,
      ==
      - (_verb-like_) [to] spread [the] wings, [to] spread
      - (_verb-like_) [to] shake
      - (_verb-like_) [to] rouse, [to] start, [to] exert
      ==
  //
    , `pjunH`
    , [糞](/entries/fan#rendering-糞)
    ,
      ==
      - (_noun-like_) manure, muck
      - (_verb-like_) [to] sweep (away)
      ==
  //
    , `pjut`
    , [弗](/entries/fat#rendering-弗)
    ,
      ==
      - (_adverb-like_) not
      - (_adjective-like_) gusty
      ==
  //
    , `pjut`
    , [沸~(entering)](/entries/fai#rendering-沸-entering)
    ,
      ==
      - Used in [觱沸](/entries/fai#rendering-觱沸).
      ==
  //
    , `pjut`
    , [紱](/entries/fat#rendering-紱)
    ,
      ==
      - (_noun-like_) seal-ribbon
      ==
  //
    , `pjut`
    , [紼](/entries/fat#rendering-紼)
    ,
      ==
      - (_noun-like_) rope, coffin-rope
      ==
  //
    , `pjut`
    , [綍](/entries/fat#rendering-綍)
    ,
      ==
      - (_noun-like_) rope, coffin-rope
      ==
  //
    , `pjut`
    , [芾~(entering)](/entries/fat#rendering-芾-entering)
    ,
      ==
      - (_adjective-like_) flourishing
      - (_noun-like_) knee-cover
      ==
  //
    , `pjut`
    , [韍](/entries/fat#rendering-韍)
    ,
      ==
      - (_noun-like_) knee-cover
      ==
  //
    , `pjut`
    , [黻](/entries/fat#rendering-黻)
    ,
      ==
      - (_noun-like_) embroidered-emblem
      ==
  //
    , `pjut sjewH`
    , [不肖](/entries/ciu#rendering-不肖)
    ,
      ==
      - (_adjective-like_) unbecoming
      ==
  //
    , `pjuw`
    , [紑](/entries/fau#rendering-紑)
    ,
      ==
      - (_adjective-like_) fresh, bright
      ==
  //
    , `pjuwX`
    , [否](/entries/fau#rendering-否)
    ,
      ==
      - (_adverb-like_) nay
      - (_adverb-like_) not
      ==
  //
    , `pjuwX`
    , [缶](/entries/fau#rendering-缶)
    ,
      ==
      - (_noun-like_) earthenware
      ==
  //
    , `sa`
    , [傞](/entries/co#rendering-傞)
    ,
      ==
      - Used in [傞傞](/entries/co#rendering-傞傞).
      ==
  //
    , `sa sa`
    , [傞傞](/entries/co#rendering-傞傞)
    ,
      ==
      - (_adverb-like_) (dancing) drunkenly, on [and] on
      ==
  //
    , `sat`
    , [蔡](/entries/coi#rendering-蔡)
    ,
      ==
      - (_verb-like_) [to] banish, [to] put down
      ==
  //
    , `sawX`
    , [燥](/entries/cou#rendering-燥)
    ,
      ==
      - (_adjective-like_) parched
      ==
  //
    , `sawH`
    , [燥](/entries/cou#rendering-燥)
    ,
      ==
      - (_adjective-like_) parched
      ==
  //
    , `sawH`
    , [譟](/entries/cou#rendering-譟)
    ,
      ==
      - (_verb-like_) [to] clamour
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
    , `sjewH`
    , [肖](/entries/ciu#rendering-肖)
    ,
      ==
      - (_verb-like_) [to] resemble, (_met._) [to] emulate
      - Used in [不肖](/entries/ciu#rendering-不肖).
      ==
  //
    , `sojH`
    , [塞](/entries/coi#rendering-塞)
    ,
      ==
      - (_noun-like_) frontier
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
    , `suwk`
    , [樕](/entries/cuk#rendering-樕)
    ,
      ==
      - (_noun-like_) oak
      - (_noun-like_) shrub
      ==
  //
    , `suwk`
    , [蔌](/entries/cuk#rendering-蔌)
    ,
      ==
      - (_noun-like_) vegetable
      - (_adjective-like_) base, mean
      ==
  //
    , `suwk`
    , [速](/entries/cuk#rendering-速)
    ,
      ==
      - (_verb-like_) [to] invite
      - (_verb-like_) [to] impel
      - (_adjective-like_) speedy
      ==
  //
    , `suwk`
    , [遬](/entries/cuk#rendering-遬)
    ,
      ==
      - (_adjective-like_) reverent
      ==
  //
    , `suwk`
    , [餗](/entries/cuk#rendering-餗)
    ,
      ==
      - (_noun-like_) cauldron-stuff
      ==
  //
    , `swinH`
    , [峻](/entries/zeon#rendering-峻)
    ,
      ==
      - (_adjective-like_) lofty
      ==
  //
    , `swinH`
    , [浚](/entries/zeon#rendering-浚)
    ,
      ==
      - (_verb-like_) [to] scoop
      - (_adjective-like_) deep
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
    , `syet`
    , [設](/entries/cit#rendering-設)
    ,
      ==
      - (_verb-like_) [to] set
      - (_verb-like_) [to] establish
      - (_verb-like_) [to] suppose
      ==
  //
    , `syiX`
    , [始](/entries/ci#rendering-始)
    ,
      ==
      - (_noun-like_) beginning
      - (_adverb-like_) (_met._) first, just
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
    , `syowk`
    , [束](/entries/cuk#rendering-束)
    ,
      ==
      - (_verb-like_) [to] bundle, [to] bind
      ==
  //
    , `tet`
    , [窒](/entries/zat#rendering-窒)
    ,
      ==
      - (_verb-like_) [to] stop up
      ==
  //
    , `that`
    , [獺](/entries/caat#rendering-獺)
    ,
      ==
      - (_noun-like_) otter
      ==
  //
    , `traeH`
    , [吒](/entries/zaa#rendering-吒)
    ,
      ==
      - (_verb-like_) [to] sputter
      ==
  //
    , `traewH`
    , [罩](/entries/zaau#rendering-罩)
    ,
      ==
      - (_noun-like_) covering-trap
      ==
  //
    , `traewk`
    , [倬](/entries/coek#rendering-倬)
    ,
      ==
      - (_adjective-like_) grand, illustrious
      ==
  //
    , `traewk`
    , [卓](/entries/coek#rendering-卓)
    ,
      ==
      - (_adjective-like_) lofty
      - (_adverb-like_) aloft
      ==
  //
    , `treak`
    , [摘](/entries/zaak#rendering-摘)
    ,
      ==
      - (_verb-like_) [to] pluck
      ==
  //
    , `treak`
    , [謫](/entries/zaak#rendering-謫)
    ,
      ==
      - (_verb-like_) [to] blame
      - (_verb-like_) [to] punish, [to] disgrace
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
    , `trhjang`
    , [倀](/entries/coeng#rendering-倀)
    ,
      ==
      - (_adjective-like_) frenetic
      ==
  //
    , `trhjangH`
    , [暢](/entries/coeng#rendering-暢)
    ,
      ==
      - (_verb-like_) [to] permeate
      ==
  //
    , `trhjangH`
    , [韔](/entries/coeng#rendering-韔)
    ,
      ==
      - (_noun-like_) bow-case
      ==
  //
    , `trhjangH`
    , [鬯](/entries/coeng#rendering-鬯)
    ,
      ==
      - (_noun-like_) fragrant-wine
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
    , `trhjeng`
    , [檉](/entries/cing#rendering-檉)
    ,
      ==
      - (_noun-like_) tamarisk
      ==
  //
    , `trhjeng`
    , [赬](/entries/cing#rendering-赬)
    ,
      ==
      - (_adjective-like_) red
      ==
  //
    , `trhjengX`
    , [逞](/entries/cing#rendering-逞)
    ,
      ==
      - (_verb-like_) [to] let loose, [to] indulge
      ==
  //
    , `trhjet`
    , [徹](/entries/cit#rendering-徹)
    ,
      ==
      - (_verb-like_) [to] pervade
      - (_verb-like_) [to] remove, [to] withdraw
      - (_verb-like_) [to] regulate
      ==
  //
    , `trhjet`
    , [撤](/entries/cit#rendering-撤)
    ,
      ==
      - (_verb-like_) [to] remove, [to] withdraw
      ==
  //
    , `trhjew`
    , [超](/entries/ciu#rendering-超)
    ,
      ==
      - (_verb-like_) [to] leap (over)
      - (_verb-like_) [to] transcend
      ==
  //
    , `trhjowngX`
    , [寵](/entries/cung#rendering-寵)
    ,
      ==
      - (_verb-like_) [to] favour, [to] adore
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
      - (_noun-like_) ox-branch
      ==
  //
    , `trhjuwH`
    , [畜~(noun)](/entries/cuk#rendering-畜-noun)
    ,
      ==
      - (_noun-like_) livestock
      ==
  //
    , `trhjuwk`
    , [蓄](/entries/cuk#rendering-蓄)
    ,
      ==
      - (_verb-like_) [to] hoard
      ==
  //
    , `trhjuwng`
    , [忡](/entries/cung#rendering-忡)
    ,
      ==
      - (_adjective-like_) grieved, distressed
      ==
  //
    , `trhjuwng`
    , [盅](/entries/cung#rendering-盅)
    ,
      ==
      - (_adjective-like_) empty
      ==
  //
    , `trin`
    , [珍](/entries/zan#rendering-珍)
    ,
      ==
      - (_noun-like_) precious-thing
      - (_adjective-like_) precious
      ==
  //
    , `trinH`
    , [鎮](/entries/zan#rendering-鎮)
    ,
      ==
      - (_verb-like_) [to] suppress, [to] subdue
      ==
  //
    , `trip`
    , [縶](/entries/zap#rendering-縶)
    ,
      ==
      - (_verb-like_) [to] tether
      ==
  //
    , `trit`
    , [挃](/entries/zat#rendering-挃)
    ,
      ==
      - (_onomatopoeia_) slash
      ==
  //
    , `trit`
    , [窒](/entries/zat#rendering-窒)
    ,
      ==
      - (_verb-like_) [to] stop up
      ==
  //
    , `trjangX`
    , [長~(rising)](/entries/zoeng#rendering-長-rising)
    ,
      ==
      - (_verb-like_) [to] grow
      - (_noun-like_) elder, leader
      - (_verb-like_) [to] lead
      ==
  //
    , `trjenX`
    , [紾](/entries/can#rendering-紾)
    ,
      ==
      - (_verb-like_) [to] twist
      ==
  //
    , `trjoX`
    , [貯](/entries/cyu#rendering-貯)
    ,
      ==
      - (_verb-like_) [to] stockpile
      ==
  //
    , `trjowngX`
    , [冢](/entries/cung#rendering-冢)
    ,
      ==
      - (_noun-like_) mound
      - (_adjective-like_) great, (_met._) prime
      ==
  //
    , `trjuw`
    , [侜](/entries/zau#rendering-侜)
    ,
      ==
      - (_verb-like_) [to] cover up, (_met._) [to] deceive
      ==
  //
    , `trjuw`
    , [啁](/entries/zau#rendering-啁)
    ,
      ==
      - Used in [啁噍](/entries/zau#rendering-啁噍).
      ==
  //
    , `trjuw`
    , [譸](/entries/zau#rendering-譸)
    ,
      ==
      - (_verb-like_) [to] deceive
      ==
  //
    , `trjuw`
    , [輈](/entries/zau#rendering-輈)
    ,
      ==
      - (_noun-like_) carriage-pole
      ==
  //
    , `trjuw tsjew`
    , [啁噍](/entries/zau#rendering-啁噍)
    ,
      ==
      - (_onomatopoeia_) twitter
      ==
  //
    , `trjuwH`
    , [咮~(departing)](/entries/zau#rendering-咮-departing)
    ,
      ==
      - (_noun-like_) beak
      ==
  //
    , `trjuwH`
    , [晝](/entries/zau#rendering-晝)
    ,
      ==
      - (_noun-like_) daytime
      ==
  //
    , `trjuwng`
    , [衷](/entries/cung#rendering-衷)
    ,
      ==
      - (_noun-like_) inner-garment
      - (_noun-like_) inner-feeling
      - (_noun-like_) goodness
      - (_adjective-like_) sincere
      ==
  //
    , `trjwejH`
    , [綴](/entries/zeoi#rendering-綴)
    ,
      ==
      - (_verb-like_) [to] stitch (together), [to] connect
      ==
  //
    , `trjwet`
    , [綴](/entries/zeoi#rendering-綴)
    ,
      ==
      - (_verb-like_) [to] stitch (together), [to] connect
      ==
  //
    , `trwij`
    , [追](/entries/zeoi#rendering-追)
    ,
      ==
      - (_verb-like_) [to] chase (after), (_met._) [to] reminisce, [to] send off
      ==
  //
    , `trwin`
    , [屯~(unvoiced)](/entries/zeon#rendering-屯-unvoiced)
    ,
      ==
      - (_adjective-like_) difficult
      ==
  //
    , `tsanH`
    , [讚](/entries/zaan#rendering-讚)
    ,
      ==
      - (_verb-like_) [to] praise
      ==
  //
    , `tsanH`
    , [贊](/entries/zaan#rendering-贊)
    ,
      ==
      - (_verb-like_) [to] assist (in), [to] advance
      ==
  //
    , `tsawX`
    , [澡](/entries/cou#rendering-澡)
    ,
      ==
      - (_verb-like_) [to] wash
      ==
  //
    , `tsawH`
    , [躁](/entries/cou#rendering-躁)
    ,
      ==
      - (_adjective-like_) rash
      - (_verb-like_) [to] move (hastily), [to] stir
      ==
  //
    , `tsej`
    , [擠](/entries/zai#rendering-擠)
    ,
      ==
      - (_verb-like_) [to] push
      ==
  //
    , `tsej`
    , [躋](/entries/zai#rendering-躋)
    ,
      ==
      - (_verb-like_) [to] ascend
      ==
  //
    , `tsej`
    , [隮~(ascend)](/entries/zai#rendering-隮-ascend)
    ,
      ==
      - (_verb-like_) [to] ascend
      - (_noun-like_) rainbow
      ==
  //
    , `tsej`
    , [齎](/entries/zai#rendering-齎)
    ,
      ==
      - (_verb-like_) [to] gift
      - (_interjection_) sigh
      ==
  //
    , `tsejX`
    , [濟~(rising)](/entries/zai#rendering-濟-rising)
    ,
      ==
      - (_adjective-like_) abundant
      - (_adjective-like_) stately
      ==
  //
    , `tsejH`
    , [擠](/entries/zai#rendering-擠)
    ,
      ==
      - (_verb-like_) [to] push
      ==
  //
    , `tsejH`
    , [濟~(departing)](/entries/zai#rendering-濟-departing)
    ,
      ==
      - (_verb-like_) [to] cross
      - (_verb-like_) [to] rescue, [to] relieve
      - (_verb-like_) [to] aid, [to] benefit
      ==
  //
    , `tsejH`
    , [穧](/entries/zai#rendering-穧)
    ,
      ==
      - (_verb-like_) [to] reap
      ==
  //
    , `tsejH`
    , [躋](/entries/zai#rendering-躋)
    ,
      ==
      - (_verb-like_) [to] ascend
      ==
  //
    , `tsejH`
    , [隮~(ascend)](/entries/zai#rendering-隮-ascend)
    ,
      ==
      - (_verb-like_) [to] ascend
      - (_noun-like_) rainbow
      ==
  //
    , `tsejH`
    , [隮~(fall)](/entries/zai#rendering-隮-fall)
    ,
      ==
      - (_verb-like_) [to] fall
      ==
  //
    , `tsejH`
    , [霽](/entries/zai#rendering-霽)
    ,
      ==
      - (_verb-like_) [to] cease (raining)
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
    , `tsha`
    , [傞](/entries/co#rendering-傞)
    ,
      ==
      - Used in [傞傞](/entries/co#rendering-傞傞).
      ==
  //
    , `tsha`
    , [瑳](/entries/co#rendering-瑳)
    ,
      ==
      - (_adjective-like_) brilliant-white
      ==
  //
    , `tsha`
    , [磋](/entries/co#rendering-磋)
    ,
      ==
      - (_verb-like_) [to] polish
      ==
  //
    , `tsha tsha`
    , [傞傞](/entries/co#rendering-傞傞)
    ,
      ==
      - (_adverb-like_) (dancing) drunkenly, on [and] on
      ==
  //
    , `tshaX`
    , [瑳](/entries/co#rendering-瑳)
    ,
      ==
      - (_adjective-like_) brilliant-white
      ==
  //
    , `tshak`
    , [錯](/entries/cok#rendering-錯)
    ,
      ==
      - (_noun-like_) whetstone
      - (_verb-like_) [to] inlay, [to] tattoo
      - (_verb-like_) [to] cross (diagonally)
      - (_adjective-like_) mixed, erroneous, confused
      - (_adjective-like_) diagonal
      - (_adjective-like_) wary
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
    , `tshang`
    , [倉](/entries/cong#rendering-倉)
    ,
      ==
      - (_noun-like_) granary
      ==
  //
    , `tshang`
    , [蒼](/entries/cong#rendering-蒼)
    ,
      ==
      - (_adjective-like_) azure, verdant
      ==
  //
    , `tshang`
    , [鶬~(noun)](/entries/cong#rendering-鶬-noun)
    ,
      ==
      - (_noun-like_) crane
      - Used in [鶬鶊](/entries/cong#rendering-鶬鶊).
      ==
  //
    , `tshang kaeng`
    , [鶬鶊](/entries/cong#rendering-鶬鶊)
    ,
      ==
      - (_noun-like_) oriole
      ==
  //
    , `tshaw`
    , [操~(verb)](/entries/cou#rendering-操-verb)
    ,
      ==
      - (_verb-like_) [to] hold, [to] handle
      ==
  //
    , `tshawX`
    , [懆](/entries/cou#rendering-懆)
    ,
      ==
      - (_adjective-like_) distraught
      ==
  //
    , `tshawX`
    , [草](/entries/cou#rendering-草)
    ,
      ==
      - (_noun-like_) grass, herbage
      - (_adjective-like_) rough, careless
      - (_adjective-like_) travailed
      ==
  //
    , `tshawH`
    , [操~(noun)](/entries/cou#rendering-操-noun)
    ,
      ==
      - (_noun-like_) integrity, moral-character
      ==
  //
    , `tshawH`
    , [造](/entries/cou#rendering-造)
    ,
      ==
      - (_verb-like_) [to] go unto, [to] attain
      - (_verb-like_) [to] contain
      - Used in [造次](/entries/cou#rendering-造次).
      ==
  //
    , `tshawH tshijH`
    , [造次](/entries/cou#rendering-造次)
    ,
      ==
      - (_adjective-like_) abrupt
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
    , [淒](/entries/cai#rendering-淒)
    ,
      ==
      - (_adjective-like_) cold
      - (_adjective-like_) sad
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
    , [切~(departing)](/entries/cai#rendering-切-departing)
    ,
      ==
      - Used in [一切](/entries/cai#rendering-一切).
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
    , `tshen`
    , [千](/entries/cin#rendering-千)
    ,
      ==
      - (_noun-like_) thousand
      ==
  //
    , `tsheng`
    , [青](/entries/cing#rendering-青)
    ,
      ==
      - (_adjective-like_) blue, green, black
      ==
  //
    , `tshet`
    , [切~(entering)](/entries/cit#rendering-切-entering)
    ,
      ==
      - (_verb-like_) [to] cut, [to] dissect, (_met._) [to] gnash
      - (_verb-like_) [to] take (pulse)
      - (_adjective-like_) (_met._) pressing
      - Used in [反切](/entries/faan#rendering-反切).
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
      - Used in [造次](/entries/cou#rendering-造次).
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
    , [且~(rising)](/entries/ce#rendering-且-rising)
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
    , `tshjang`
    , [將](/entries/coeng#rendering-將)
    ,
      ==
      - (_verb-like_) [to] entreat
      ==
  //
    , `tshjang`
    , [搶](/entries/coeng#rendering-搶)
    ,
      ==
      - (_verb-like_) [to] knock (against)
      ==
  //
    , `tshjang`
    , [斨](/entries/coeng#rendering-斨)
    ,
      ==
      - (_noun-like_) square-eyed-axe
      ==
  //
    , `tshjang`
    , [瑲](/entries/coeng#rendering-瑲)
    ,
      ==
      - (_onomatopoeia_) ting
      ==
  //
    , `tshjang`
    , [蹌](/entries/coeng#rendering-蹌)
    ,
      ==
      - (_verb-like_) [to] move, [to] fleet, (_met._) ^dignified
      ==
  //
    , `tshjang`
    , [鏘](/entries/coeng#rendering-鏘)
    ,
      ==
      - (_onomatopoeia_) ting
      ==
  //
    , `tshjang`
    , [鶬~(onomatopoeia)](/entries/coeng#rendering-鶬-onomatopoeia)
    ,
      ==
      - (_onomatopoeia_) ting
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
    , `tshjen`
    , [遷](/entries/cin#rendering-遷)
    ,
      ==
      - (_verb-like_) [to] shift
      ==
  //
    , `tshjenX`
    , [淺](/entries/cin#rendering-淺)
    ,
      ==
      - (_adjective-like_) shallow
      ==
  //
    , `tshjeng`
    , [清](/entries/cing#rendering-清)
    ,
      ==
      - (_adjective-like_) clear, pure
      - (_adjective-like_) unvoiced
      ==
  //
    , `tshjengX`
    , [請](/entries/cing#rendering-請)
    ,
      ==
      - (_verb-like_) [to] request, [to] ask
      ==
  //
    , `tshjep`
    , [妾](/entries/cip#rendering-妾)
    ,
      ==
      - (_noun-like_) concubine
      ==
  //
    , `tshjewX`
    , [悄](/entries/ciu#rendering-悄)
    ,
      ==
      - (_adjective-like_) distressed
      ==
  //
    , `tshjewX`
    , [愀](/entries/ciu#rendering-愀)
    ,
      ==
      - (_verb-like_) [to] change countenance
      ==
  //
    , `tshjo`
    , [疽](/entries/zeoi#rendering-疽)
    ,
      ==
      - (_noun-like_) ulcer
      ==
  //
    , `tshjo`
    , [苴~(hemp)](/entries/zeoi#rendering-苴-hemp)
    ,
      ==
      - (_noun-like_) hemp, hempseed
      ==
  //
    , `tshjo`
    , [苴~(insole)](/entries/zeoi#rendering-苴-insole)
    ,
      ==
      - (_noun-like_) grass-insole
      ==
  //
    , `tshjo`
    , [雎](/entries/zeoi#rendering-雎)
    ,
      ==
      - Used in [雎鳩](/entries/zeoi#rendering-雎鳩).
      ==
  //
    , `tshjo kjuw`
    , [雎鳩](/entries/zeoi#rendering-雎鳩)
    ,
      ==
      - (_noun-like_) water bird
      ==
  //
    , `tshjoH`
    , [蜡~(unvoiced)](/entries/ceoi#rendering-蜡-unvoiced)
    ,
      ==
      - (_noun-like_) maggot
      ==
  //
    , `tshjowng`
    , [樅](/entries/cung#rendering-樅)
    ,
      ==
      - (_noun-like_) fir
      - (_adjective-like_) toothed
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
    , [趣~(departing)](/entries/ceoi#rendering-趣-departing)
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
    , `tshjuwk`
    , [蹴~(unvoiced)](/entries/cuk#rendering-蹴-unvoiced)
    ,
      ==
      - (_verb-like_) [to] trample, [to] kick
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
    , `tshjwen`
    , [筌](/entries/cyun#rendering-筌)
    ,
      ==
      - (_noun-like_) fish-trap
      ==
  //
    , `tshjwen`
    , [譔](/entries/zaan#rendering-譔)
    ,
      ==
      - (_verb-like_) [to] panegyrise
      ==
  //
    , `tshjwen`
    , [銓](/entries/cyun#rendering-銓)
    ,
      ==
      - (_verb-like_) [to] weigh
      ==
  //
    , `tshojX`
    , [彩](/entries/coi#rendering-彩)
    ,
      ==
      - (_noun-like_) colour, variegation, brilliance
      ==
  //
    , `tshojX`
    , [採](/entries/coi#rendering-採)
    ,
      ==
      - (_verb-like_) [to] pick
      ==
  //
    , `tshojX`
    , [綵](/entries/coi#rendering-綵)
    ,
      ==
      - (_noun-like_) colourful-silk
      ==
  //
    , `tshojH`
    , [菜](/entries/coi#rendering-菜)
    ,
      ==
      - (_noun-like_) vegetable
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
    , `tshu`
    , [粗](/entries/cou#rendering-粗)
    ,
      ==
      - (_adjective-like_) coarse, thick
      ==
  //
    , `tshuH`
    , [措](/entries/cou#rendering-措)
    ,
      ==
      - (_verb-like_) [to] place, [to] put, [to] set
      - (_verb-like_) [to] apply
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
    , [趣~(rising)](/entries/cau#rendering-趣-rising)
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
    , `tshuwng`
    , [聰](/entries/cung#rendering-聰)
    ,
      ==
      - (_adjective-like_) hearing, well-hearing, (_met._) intelligent
      ==
  //
    , `tshuwng`
    , [蔥](/entries/cung#rendering-蔥)
    ,
      ==
      - (_noun-like_) spring-onion
      - (_adjective-like_) spring-onion-green
      ==
  //
    , `tshwaX`
    , [脞](/entries/co#rendering-脞)
    ,
      ==
      - (_noun-like_) mince, (_met._) trifle
      ==
  //
    , `tshwan`
    , [爨](/entries/cyun#rendering-爨)
    ,
      ==
      - (_noun-like_) cookstove
      ==
  //
    , `tshwanH`
    , [爨](/entries/cyun#rendering-爨)
    ,
      ==
      - (_noun-like_) cookstove
      ==
  //
    , `tshwanH`
    , [竄](/entries/cyun#rendering-竄)
    ,
      ==
      - (_verb-like_) [to] skulk
      - (_verb-like_) [to] exile
      ==
  //
    , `tshwat`
    , [撮](/entries/cyut#rendering-撮)
    ,
      ==
      - (_noun-like_) pinch
      - (_noun-like_) small-cap
      ==
  //
    , `tshwin`
    , [竣](/entries/zeon#rendering-竣)
    ,
      ==
      - (_verb-like_) [to] stand down, [to] cease
      ==
  //
    , `tshwin`
    , [蹲~(dancing)](/entries/cyun#rendering-蹲-dancing)
    ,
      ==
      - (_adverb-like_) (dancing) rhythmically
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
    , `tshwonX`
    , [忖](/entries/cyun#rendering-忖)
    ,
      ==
      - (_verb-like_) [to] consider
      ==
  //
    , `tshwonH`
    , [寸](/entries/cyun#rendering-寸)
    ,
      ==
      - (_noun-like_) inch
      ==
  //
    , `tsiX`
    , [子](/entries/zi#rendering-子)
    ,
      ==
      - (_noun-like_) child, son, daughter
      - (_noun-like_) master, (_met._) thou
      - (_noun-like_) numerator
      - (_noun-like_) rat-branch
      - Used in [赤子](/entries/cik#rendering-赤子).
      ==
  //
    , `tsij`
    , [齎](/entries/zai#rendering-齎)
    ,
      ==
      - (_verb-like_) [to] gift
      - (_interjection_) sigh
      ==
  //
    , `tsimH`
    , [浸](/entries/zam#rendering-浸)
    ,
      ==
      - (_verb-like_) [to] soak, [to] immerse, (_met._) ^lake
      - (_adverb-like_) gradually
      ==
  //
    , `tsin`
    , [津](/entries/zeon#rendering-津)
    ,
      ==
      - (_noun-like_) ford
      - (_verb-like_) [to] moisten
      ==
  //
    , `tsinX`
    , [盡~(unvoiced)](/entries/zeon#rendering-盡-unvoiced)
    ,
      ==
      - (_adverb-like_) completely
      ==
  //
    , `tsinH`
    , [搢](/entries/zeon#rendering-搢)
    ,
      ==
      - (_verb-like_) [to] tuck (in)
      ==
  //
    , `tsinH`
    , [晉](/entries/zeon#rendering-晉)
    ,
      ==
      - (_verb-like_) [to] advance
      ==
  //
    , `tsinH`
    , [進](/entries/zeon#rendering-進)
    ,
      ==
      - (_verb-like_) [to] advance, [to] put forth
      ==
  //
    , `tsingH`
    , [甑](/entries/zang#rendering-甑)
    ,
      ==
      - (_noun-like_) boiler
      ==
  //
    , `tsip`
    , [咠](/entries/cap#rendering-咠)
    ,
      ==
      - (_verb-like_) [to] whisper
      ==
  //
    , `tsjae`
    , [嗟](/entries/ze#rendering-嗟)
    ,
      ==
      - (_interjection_) alas
      ==
  //
    , `tsjae`
    , [瘥](/entries/co#rendering-瘥)
    ,
      ==
      - (_noun-like_) ailment, (_met._) plague
      ==
  //
    , `tsjae`
    , [罝](/entries/ze#rendering-罝)
    ,
      ==
      - (_noun-like_) rabbit-net
      ==
  //
    , `tsjaeH`
    , [借](/entries/ze#rendering-借)
    ,
      ==
      - (_verb-like_) [to] borrow, [to] lend
      ==
  //
    , `tsjejH`
    , [祭](/entries/zai#rendering-祭)
    ,
      ==
      - (_noun-like_) sacrifice
      ==
  //
    , `tsjejH`
    , [穄](/entries/zai#rendering-穄)
    ,
      ==
      - (_noun-like_) panicled-millet
      ==
  //
    , `tsjejH`
    , [穧](/entries/zai#rendering-穧)
    ,
      ==
      - (_verb-like_) [to] reap
      ==
  //
    , `tsjejH`
    , [際](/entries/zai#rendering-際)
    ,
      ==
      - (_noun-like_) juncture, connection, (_met._) time
      ==
  //
    , `tsjek`
    , [借](/entries/ze#rendering-借)
    ,
      ==
      - (_verb-like_) [to] borrow, [to] lend
      ==
  //
    , `tsjek`
    , [脊](/entries/zek#rendering-脊)
    ,
      ==
      - (_noun-like_) spine, (_met._) grounds
      ==
  //
    , `tsjek`
    , [蹐](/entries/zek#rendering-蹐)
    ,
      ==
      - (_verb-like_) [to] take small steps
      ==
  //
    , `tsjek`
    , [鶺](/entries/zek#rendering-鶺)
    ,
      ==
      - Used in [鶺鴒](/entries/zek#rendering-鶺鴒).
      ==
  //
    , `tsjek leng`
    , [鶺鴒](/entries/zek#rendering-鶺鴒)
    ,
      ==
      - (_noun-like_) wagtail
      ==
  //
    , `tsjem`
    , [殲](/entries/cim#rendering-殲)
    ,
      ==
      - (_verb-like_) [to] annihilate
      ==
  //
    , `tsjeng`
    , [菁](/entries/zing#rendering-菁)
    ,
      ==
      - (_noun-like_) leek-flower, chive-flower
      - (_noun-like_) spikerush
      - (_adjective-like_) luxuriant
      ==
  //
    , `tsjew`
    , [噍](/entries/ziu#rendering-噍)
    ,
      ==
      - Used in [啁噍](/entries/zau#rendering-啁噍).
      ==
  //
    , `tsjo`
    , [且~(level)](/entries/zeoi#rendering-且-level)
    ,
      ==
      - (_speech-assist_)
      - (_adjective-like_) many
      ==
  //
    , `tsjo`
    , [苴~(padding)](/entries/zeoi#rendering-苴-padding)
    ,
      ==
      - (_noun-like_) grass-padding
      ==
  //
    , `tsjoX`
    , [苴~(insole)](/entries/zeoi#rendering-苴-insole)
    ,
      ==
      - (_noun-like_) grass-insole
      ==
  //
    , `tsjoH`
    , [沮~(departing)](/entries/zeoi#rendering-沮-departing)
    ,
      ==
      - (_adjective-like_) dank
      ==
  //
    , `tsjowng`
    , [從~(vertical)](/entries/zung#rendering-從-vertical)
    ,
      ==
      - (_adjective-like_) vertical, (_met._) meridian
      ==
  //
    , `tsjowng`
    , [樅](/entries/cung#rendering-樅)
    ,
      ==
      - (_noun-like_) fir
      - (_adjective-like_) toothed
      ==
  //
    , `tsju`
    , [諏](/entries/zau#rendering-諏)
    ,
      ==
      - (_verb-like_) [to] inquire, [to] consult
      ==
  //
    , `tsjuH`
    , [緅](/entries/zau#rendering-緅)
    ,
      ==
      - (_adjective-like_) puce
      ==
  //
    , `tsjuH`
    , [足~(departing)](/entries/zeoi#rendering-足-departing)
    ,
      ==
      - (_verb-like_) [to] plenish, [to] heap
      - (_adjective-like_) excessive
      ==
  //
    , `tsjuw`
    , [遒](/entries/cau#rendering-遒)
    ,
      ==
      - (_verb-like_) [to] rally, [to] consolidate
      ==
  //
    , `tsjuwX`
    , [酒](/entries/zau#rendering-酒)
    ,
      ==
      - (_noun-like_) wine
      ==
  //
    , `tsjuwk`
    , [蹙](/entries/cuk#rendering-蹙)
    ,
      ==
      - (_verb-like_) [to] compress, [to] constrain
      - (_verb-like_) [to] scowl
      ==
  //
    , `tsjuwk`
    , [蹴~(unvoiced)](/entries/cuk#rendering-蹴-unvoiced)
    ,
      ==
      - (_verb-like_) [to] trample, [to] kick
      ==
  //
    , `tsjwe`
    , [劑~(level)](/entries/zai#rendering-劑-level)
    ,
      ==
      - (_noun-like_) bisected-contract
      ==
  //
    , `tsok`
    , [則](/entries/zak#rendering-則)
    ,
      ==
      - (_noun-like_) statute
      - (_noun-like_) exemplar
      - (_verb-like_) [to] emulate
      - (_conjunction-like_) then, thus
      - (_speech-assist_)
      ==
  //
    , `tsom`
    , [簪](/entries/zaam#rendering-簪)
    ,
      ==
      - (_noun-like_) hairpin
      - (_adjective-like_) swift
      ==
  //
    , `tsomX`
    , [寁](/entries/zaan#rendering-寁)
    ,
      ==
      - (_adverb-like_) hastily
      ==
  //
    , `tsong`
    , [增](/entries/zang#rendering-增)
    ,
      ==
      - (_verb-like_) [to] increase
      - (_adjective-like_) multitudinous
      ==
  //
    , `tsong`
    , [憎](/entries/zang#rendering-憎)
    ,
      ==
      - (_verb-like_) [to] hate
      ==
  //
    , `tsong`
    , [曾~(unvoiced)](/entries/zang#rendering-曾-unvoiced)
    ,
      ==
      - (_adjective-like_) great-
      ==
  //
    , `tsraeH`
    , [詐](/entries/zaa#rendering-詐)
    ,
      ==
      - (_verb-like_) [to] deceive, (_met._) ^cunning
      ==
  //
    , `tsraek`
    , [嘖](/entries/zaak#rendering-嘖)
    ,
      ==
      - (_verb-like_) [to] cry out
      ==
  //
    , `tsraek`
    , [柞](/entries/zaak#rendering-柞)
    ,
      ==
      - (_verb-like_) [to] fell away (trees)
      ==
  //
    , `tsraewX`
    , [爪](/entries/zaau#rendering-爪)
    ,
      ==
      - (_noun-like_) claw, nail
      ==
  //
    , `tsraewX`
    , [肘](/entries/zaau#rendering-肘)
    ,
      ==
      - (_noun-like_) elbow
      ==
  //
    , `tsreaH`
    , [債](/entries/zaai#rendering-債)
    ,
      ==
      - (_noun-like_) debt
      ==
  //
    , `tsreaj`
    , [齋](/entries/zaai#rendering-齋)
    ,
      ==
      - (_verb-like_) [to] purify [by abstinence]
      ==
  //
    , `tsreajH`
    , [瘵](/entries/zaai#rendering-瘵)
    ,
      ==
      - (_noun-like_) distress
      - (_noun-like_) disease, wasting-disease
      ==
  //
    , `tsreak`
    , [嘖](/entries/zaak#rendering-嘖)
    ,
      ==
      - (_verb-like_) [to] cry out
      ==
  //
    , `tsreak`
    , [簀](/entries/zaak#rendering-簀)
    ,
      ==
      - (_noun-like_) bed-mat, (_met._) [dense]-padding
      ==
  //
    , `tsreak`
    , [責](/entries/zaak#rendering-責)
    ,
      ==
      - (_verb-like_) [to] demand
      - (_verb-like_) [to] blame, [to] rebuke
      - (_noun-like_) responsibility
      ==
  //
    , `tsreamX`
    , [斬](/entries/zaam#rendering-斬)
    ,
      ==
      - (_verb-like_) [to] chop (off), [to] sever
      ==
  //
    , `tsreanX`
    , [琖](/entries/zaan#rendering-琖)
    ,
      ==
      - (_noun-like_) jade-cup
      ==
  //
    , `tsreanX`
    , [盞](/entries/zaan#rendering-盞)
    ,
      ==
      - (_noun-like_) cup
      ==
  //
    , `tsreanX`
    , [醆](/entries/zaan#rendering-醆)
    ,
      ==
      - (_noun-like_) wine-cup
      - (_noun-like_) slightly-clarified-wine
      ==
  //
    , `tsreang`
    , [爭](/entries/zang#rendering-爭)
    ,
      ==
      - (_verb-like_) [to] strive, [to] dispute
      ==
  //
    , `tsreat`
    , [札](/entries/zaat#rendering-札)
    ,
      ==
      - (_noun-like_) slip
      - (_noun-like_) pestilence
      ==
  //
    , `tsrhae`
    , [差~(discrepancy)](/entries/caa#rendering-差-discrepancy)
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
    , `tsrhaewng`
    , [窗](/entries/coeng#rendering-窗)
    ,
      ==
      - (_noun-like_) window
      ==
  //
    , `tsrheaj`
    , [差~(send)](/entries/caai#rendering-差-send)
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
    , `tsrhjang`
    , [創~(level)](/entries/cong#rendering-創-level)
    ,
      ==
      - (_verb-like_) [to] wound
      ==
  //
    , `tsrhjang`
    , [瘡](/entries/cong#rendering-瘡)
    ,
      ==
      - (_noun-like_) boil
      ==
  //
    , `tsrhjangH`
    , [創~(departing)](/entries/cong#rendering-創-departing)
    ,
      ==
      - (_verb-like_) [to] create, [to] initiate
      - (_verb-like_) [to] take heed
      ==
  //
    , `tsrhjangH`
    , [愴](/entries/cong#rendering-愴)
    ,
      ==
      - (_adjective-like_) grieved
      ==
  //
    , `tsrhje`
    , [差~(uneven)](/entries/ci#rendering-差-uneven)
    ,
      ==
      - Used in [參差](/entries/caam#rendering-參差).
      ==
  //
    , `tsrhjo`
    , [初](/entries/co#rendering-初)
    ,
      ==
      - (_noun-like_) beginning
      - (_adjective-like_) initial
      ==
  //
    , `tsrhjoX`
    , [楚](/entries/co#rendering-楚)
    ,
      ==
      - (_noun-like_) thorn-tree, thorn, (_met._) ferule
      - (_noun-like_) pain, suffering
      - (_adjective-like_) thickset
      - (_adjective-like_) neat, splendid
      - Used in [萇楚](/entries/coeng#rendering-萇楚).
      ==
  //
    , `tsrhju`
    , [芻](/entries/co#rendering-芻)
    ,
      ==
      - (_noun-like_) hay, fodder
      ==
  //
    , `tsrhjweX`
    , [揣](/entries/cyun#rendering-揣)
    ,
      ==
      - (_verb-like_) [to] measure, [to] reckon
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
    , `tsrik`
    , [仄](/entries/zak#rendering-仄)
    ,
      ==
      - (_adjective-like_) oblique, slanting
      ==
  //
    , `tsrik`
    , [側](/entries/zak#rendering-側)
    ,
      ==
      - (_noun-like_) side
      - (_adjective-like_) oblique, slanting, (_met._) [one]-sided
      - (_adjective-like_) lowly
      ==
  //
    , `tsrik`
    , [昃](/entries/zak#rendering-昃)
    ,
      ==
      - (_adjective-like_) slanting [west]
      ==
  //
    , `tsrim`
    , [簪](/entries/zaam#rendering-簪)
    ,
      ==
      - (_noun-like_) hairpin
      - (_adjective-like_) swift
      ==
  //
    , `tsrimH`
    , [譖](/entries/zam#rendering-譖)
    ,
      ==
      - (_verb-like_) [to] slander
      ==
  //
    , `tsrin`
    , [榛](/entries/zeon#rendering-榛)
    ,
      ==
      - (_noun-like_) hazel
      ==
  //
    , `tsrin`
    , [溱](/entries/zeon#rendering-溱)
    ,
      ==
      - (_adjective-like_) multitudinous, abundant
      ==
  //
    , `tsrin`
    , [臻](/entries/zeon#rendering-臻)
    ,
      ==
      - (_verb-like_) [to] arrive
      ==
  //
    , `tsrin`
    , [蓁](/entries/zeon#rendering-蓁)
    ,
      ==
      - (_adjective-like_) abundant, luxuriant
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
    , `tsrjo`
    , [菹](/entries/zeoi#rendering-菹)
    ,
      ==
      - (_noun-like_) pickle
      - (_noun-like_) marsh
      ==
  //
    , `tsrjuw`
    , [緅](/entries/zau#rendering-緅)
    ,
      ==
      - (_adjective-like_) puce
      ==
  //
    , `tsrjuw`
    , [騶](/entries/zau#rendering-騶)
    ,
      ==
      - (_noun-like_) horse-keeper
      ==
  //
    , `tsrjuwH`
    , [甃](/entries/zau#rendering-甃)
    ,
      ==
      - (_noun-like_) brickwork
      ==
  //
    , `tsrjuwH`
    , [皺](/entries/zau#rendering-皺)
    ,
      ==
      - (_noun-like_) wrinkle
      ==
  //
    , `tsrjuwH`
    , [縐](/entries/zau#rendering-縐)
    ,
      ==
      - (_noun-like_) wrinkled-cloth, fine-cloth
      ==
  //
    , `tsuw`
    , [緅](/entries/zau#rendering-緅)
    ,
      ==
      - (_adjective-like_) puce
      ==
  //
    , `tsuwX`
    , [走](/entries/zau#rendering-走)
    ,
      ==
      - (_verb-like_) [to] run, [to] run [away]
      - (_verb-like_) [to] go, [to] leave
      ==
  //
    , `tsuwH`
    , [奏](/entries/zau#rendering-奏)
    ,
      ==
      - (_verb-like_) [to] put forward
      - (_verb-like_) [to] perform [music]
      - (_verb-like_) [to] report
      ==
  //
    , `tswaH`
    , [挫](/entries/co#rendering-挫)
    ,
      ==
      - (_verb-like_) [to] break, [to] defeat, (_met._) [to] dampen
      - (_verb-like_) [to] push
      ==
  //
    , `tswajH`
    , [最](/entries/zeoi#rendering-最)
    ,
      ==
      - (_verb-like_) [to] collect
      - (_determiner-like_) -est, -most
      ==
  //
    , `tswijH`
    , [醉](/entries/zeoi#rendering-醉)
    ,
      ==
      - (_adjective-like_) drunk
      ==
  //
    , `tswin`
    , [遵](/entries/zeon#rendering-遵)
    ,
      ==
      - (_verb-like_) [to] go along, [to] adhere
      ==
  //
    , `tswinH`
    , [畯](/entries/zeon#rendering-畯)
    ,
      ==
      - (_noun-like_) farm-overseer
      ==
  //
    , `tswinH`
    , [餕](/entries/zeon#rendering-餕)
    ,
      ==
      - (_noun-like_) leftover
      ==
  //
    , `tswinH`
    , [駿](/entries/zeon#rendering-駿)
    ,
      ==
      - (_noun-like_) steed
      - (_adverb-like_) rapidly
      - (_adjective-like_) grand, lofty
      ==
  //
    , `tswon`
    , [樽](/entries/zeon#rendering-樽)
    ,
      ==
      - (_noun-like_) wine-vase
      ==
  //
    , `tsyae`
    , [遮](/entries/ze#rendering-遮)
    ,
      ==
      - (_verb-like_) [to] block
      - (_verb-like_) [to] cover
      ==
  //
    , `tsyaeX`
    , [者](/entries/ze#rendering-者)
    ,
      ==
      - (_pronoun-like_) he that, that which, one, -er
      - (_speech-assist_)
      ==
  //
    , `tsyaeX`
    , [赭](/entries/ze#rendering-赭)
    ,
      ==
      - (_noun-like_) red-ochre
      ==
  //
    , `tsyaeH`
    , [柘](/entries/ze#rendering-柘)
    ,
      ==
      - (_noun-like_) melonberry-tree, melonberry
      ==
  //
    , `tsyaeH`
    , [炙](/entries/zek#rendering-炙)
    ,
      ==
      - (_verb-like_) [to] broil
      ==
  //
    , `tsyaeH`
    , [蔗](/entries/ze#rendering-蔗)
    ,
      ==
      - (_noun-like_) sugarcane
      ==
  //
    , `tsyak`
    , [灼](/entries/coek#rendering-灼)
    ,
      ==
      - (_verb-like_) [to] burn, [to] scorch
      - (_adjective-like_) manifest, (_met._) bright
      ==
  //
    , `tsyejH`
    , [制](/entries/zai#rendering-制)
    ,
      ==
      - (_verb-like_) [to] cut out, (_met._) [to] form
      - (_noun-like_) institution, system
      - (_verb-like_) [to] control, [to] regulate
      ==
  //
    , `tsyejH`
    , [晢~(departing)](/entries/zai#rendering-晢-departing)
    ,
      ==
      - (_adjective-like_) bright
      ==
  //
    , `tsyejH`
    , [製](/entries/zai#rendering-製)
    ,
      ==
      - (_verb-like_) [to] cut out, [to] make
      ==
  //
    , `tsyek`
    , [摭](/entries/zek#rendering-摭)
    ,
      ==
      - (_verb-like_) [to] pick up, [to] pick
      ==
  //
    , `tsyek`
    , [炙](/entries/zek#rendering-炙)
    ,
      ==
      - (_verb-like_) [to] broil
      ==
  //
    , `tsyek`
    , [隻](/entries/zek#rendering-隻)
    ,
      ==
      - (_adjective-like_) single
      - (_classifier_)
      ==
  //
    , `tsyet`
    , [晢~(entering)](/entries/zit#rendering-晢-entering)
    ,
      ==
      - (_adjective-like_) bright
      ==
  //
    , `tsyew`
    , [昭](/entries/ciu#rendering-昭)
    ,
      ==
      - (_adjective-like_) luminous, illuminate
      ==
  //
    , `tsyhae`
    , [車](/entries/ce#rendering-車)
    ,
      ==
      - (_noun-like_) car
      ==
  //
    , `tsyhak`
    , [綽](/entries/coek#rendering-綽)
    ,
      ==
      - (_adjective-like_) generous, ample
      - (_adjective-like_) gentle
      ==
  //
    , `tsyhang`
    , [昌](/entries/coeng#rendering-昌)
    ,
      ==
      - (_adjective-like_) splendid
      - (_adjective-like_) flourishing, abundant
      ==
  //
    , `tsyhangH`
    , [倡](/entries/coeng#rendering-倡)
    ,
      ==
      - (_verb-like_) [to] lead [song]
      ==
  //
    , `tsyhangH`
    , [唱](/entries/coeng#rendering-唱)
    ,
      ==
      - (_verb-like_) [to] lead [song]
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
    , `tsyhejH`
    , [掣](/entries/zai#rendering-掣)
    ,
      ==
      - (_verb-like_) [to] tug, [to] drag
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
    , `tsyhew`
    , [弨](/entries/ciu#rendering-弨)
    ,
      ==
      - (_adjective-like_) relaxed, undrawn
      ==
  //
    , `tsyhiX`
    , [齒](/entries/ci#rendering-齒)
    ,
      ==
      - (_noun-like_) front-tooth, tooth, (_met._) age
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
    , `tsyhing`
    , [稱~(verb)](/entries/cing#rendering-稱-verb)
    ,
      ==
      - (_verb-like_) [to] weigh
      - (_verb-like_) [to] refer to, [to] proclaim
      - (_verb-like_) [to] extol
      - (_verb-like_) [to] raise
      ==
  //
    , `tsyhingH`
    , [稱~(noun)](/entries/cing#rendering-稱-noun)
    ,
      ==
      - (_noun-like_) steelyard
      ==
  //
    , `tsyhingH`
    , [稱~(adjective)](/entries/cing#rendering-稱-adjective)
    ,
      ==
      - (_adjective-like_) meet, (_met._) competent
      ==
  //
    , `tsyhit`
    , [叱](/entries/cik#rendering-叱)
    ,
      ==
      - (_verb-like_) [to] berate, [to] shout (at)
      ==
  //
    , `tsyhoX`
    , [杵](/entries/cyu#rendering-杵)
    ,
      ==
      - (_noun-like_) pestle
      ==
  //
    , `tsyhoX`
    , [處~(rising)](/entries/cyu#rendering-處-rising)
    ,
      ==
      - (_verb-like_) [to] reside, [to] stay
      - (_verb-like_) [to] place
      ==
  //
    , `tsyhoH`
    , [處~(departing)](/entries/cyu#rendering-處-departing)
    ,
      ==
      - (_noun-like_) place
      ==
  //
    , `tsyhowng`
    , [憧](/entries/cung#rendering-憧)
    ,
      ==
      - (_adjective-like_) unsettled, undecided
      ==
  //
    , `tsyhowng`
    , [罿](/entries/cung#rendering-罿)
    ,
      ==
      - (_noun-like_) bird-net
      ==
  //
    , `tsyhowng`
    , [衝](/entries/cung#rendering-衝)
    ,
      ==
      - (_noun-like_) crossroad, thoroughfare
      - (_verb-like_) [to] charge
      ==
  //
    , `tsyhuwX`
    , [醜](/entries/cau#rendering-醜)
    ,
      ==
      - (_adjective-like_) ugly
      - (_verb-like_) [to] abhor
      - (_noun-like_) humiliation
      - (_noun-like_) sort, (_met._) peers
      ==
  //
    , `tsyhuwH`
    , [臭](/entries/cau#rendering-臭)
    ,
      ==
      - (_noun-like_) smell
      ==
  //
    , `tsyhuwng`
    , [充](/entries/cung#rendering-充)
    ,
      ==
      - (_verb-like_) [to] fill, [to] stuff, (_met._) [to] serve as
      - (_adjective-like_) full, stuffed
      ==
  //
    , `tsyhwe`
    , [吹](/entries/ceoi#rendering-吹)
    ,
      ==
      - (_verb-like_) [to] blow
      ==
  //
    , `tsyhwen`
    , [川](/entries/cyun#rendering-川)
    ,
      ==
      - (_noun-like_) stream
      ==
  //
    , `tsyhwen`
    , [穿](/entries/cyun#rendering-穿)
    ,
      ==
      - (_verb-like_) [to] bore through
      ==
  //
    , `tsyhwenX`
    , [喘](/entries/cyun#rendering-喘)
    ,
      ==
      - (_verb-like_) [to] gasp
      ==
  //
    , `tsyhwenX`
    , [舛](/entries/cyun#rendering-舛)
    ,
      ==
      - (_adjective-like_) contrary
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
    , `tsyim`
    , [斟](/entries/zam#rendering-斟)
    ,
      ==
      - (_verb-like_) [to] pour, [to] deliberate
      ==
  //
    , `tsyim`
    , [箴](/entries/zam#rendering-箴)
    ,
      ==
      - (_noun-like_) needle, (_met._) admonition
      ==
  //
    , `tsyimX`
    , [枕~(rising)](/entries/zam#rendering-枕-rising)
    ,
      ==
      - (_noun-like_) pillow
      ==
  //
    , `tsyimH`
    , [枕~(departing)](/entries/zam#rendering-枕-departing)
    ,
      ==
      - (_verb-like_) [to] pillow upon
      ==
  //
    , `tsyin`
    , [振~(level)](/entries/zan#rendering-振-level)
    ,
      ==
      - (_adjective-like_) generous, honourable
      - (_adjective-like_) flourishing
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
    , `tsyin`
    , [真](/entries/zan#rendering-真)
    ,
      ==
      - (_adjective-like_) true
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
    , [賑~(rising)](/entries/zan#rendering-賑-rising)
    ,
      ==
      - (_adjective-like_) rich
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
    , [振~(departing)](/entries/zan#rendering-振-departing)
    ,
      ==
      - (_verb-like_) [to] shake, (_met._) [to] flap
      - (_verb-like_) [to] uplift, [to] rouse
      - (_verb-like_) [to] open up
      - (_verb-like_) [to] succour
      - (_verb-like_) [to] organise
      - (_verb-like_) [to] halt
      - (_verb-like_) [to] contain, [to] consolidate
      - (_adjective-like_) flocking
      - (_preposition-like_) since
      ==
  //
    , `tsyinH`
    , [袗](/entries/can#rendering-袗)
    ,
      ==
      - (_noun-like_) unlined-garment
      ==
  //
    , `tsyinH`
    , [賑~(departing)](/entries/zan#rendering-賑-departing)
    ,
      ==
      - (_verb-like_) [to] succour
      ==
  //
    , `tsyinH`
    , [震](/entries/zan#rendering-震)
    ,
      ==
      - (_noun-like_) thunder-crack
      - (_verb-like_) [to] shake, [to] quake
      ==
  //
    , `tsyingX`
    , [拯](/entries/cing#rendering-拯)
    ,
      ==
      - (_verb-like_) [to] lift (up)
      - (_verb-like_) [to] rescue
      ==
  //
    , `tsyip`
    , [執](/entries/zap#rendering-執)
    ,
      ==
      - (_verb-like_) [to] take hold, [to] hold, (_met._) [to] carry out
      - (_verb-like_) [to] seize
      - (_noun-like_) [close]-held [friend]
      ==
  //
    , `tsyip`
    , [汁](/entries/zap#rendering-汁)
    ,
      ==
      - (_noun-like_) juice, (_met._) sleet
      ==
  //
    , `tsyit`
    , [桎](/entries/zat#rendering-桎)
    ,
      ==
      - (_noun-like_) fetter
      ==
  //
    , `tsyit`
    , [質~(entering)](/entries/zat#rendering-質-entering)
    ,
      ==
      - (_noun-like_) substance
      - (_adjective-like_) simple
      - (_verb-like_) [to] complete
      - (_verb-like_) [to] affirm, [to] verify
      - (_verb-like_) [to] front
      - (_verb-like_) [to] interrogate
      - (_noun-like_) target
      - (_adverb-like_) directly
      ==
  //
    , `tsyit`
    , [騭](/entries/zat#rendering-騭)
    ,
      ==
      - (_verb-like_) [to] secure
      - (_verb-like_) [to] raise
      ==
  //
    , `tsyuw`
    , [周](/entries/zau#rendering-周)
    ,
      ==
      - (_noun-like_) cycle, circumference, (_met._) round-part
      - (_verb-like_) [to] encompass
      - (_adjective-like_) all-encompassing, all-round, (_met._) comprehensive, ultimate, utmost
      ==
  //
    , `tsyuw`
    , [州](/entries/zau#rendering-州)
    ,
      ==
      - (_noun-like_) province, district
      ==
  //
    , `tsyuw`
    , [洲](/entries/zau#rendering-洲)
    ,
      ==
      - (_noun-like_) islet
      ==
  //
    , `tsyuw`
    , [舟](/entries/zau#rendering-舟)
    ,
      ==
      - (_noun-like_) boat
      ==
  //
    , `tsyuw`
    , [賙](/entries/zau#rendering-賙)
    ,
      ==
      - (_verb-like_) [to] assist
      ==
  //
    , `tsyuwX`
    , [帚](/entries/zaau#rendering-帚)
    ,
      ==
      - (_noun-like_) besom
      ==
  //
    , `tsyuwH`
    , [祝~(departing)](/entries/zau#rendering-祝-departing)
    ,
      ==
      - (_verb-like_) [to] curse
      ==
  //
    , `tsyuwng`
    , [潨](/entries/cung#rendering-潨)
    ,
      ==
      - (_noun-like_) confluence
      ==
  //
    , `tsyweX`
    , [捶](/entries/ceoi#rendering-捶)
    ,
      ==
      - (_verb-like_) [to] beat
      ==
  //
    , `tsyweH`
    , [惴](/entries/zeoi#rendering-惴)
    ,
      ==
      - (_adjective-like_) apprehensive
      ==
  //
    , `tsywejH`
    , [贅](/entries/zeoi#rendering-贅)
    ,
      ==
      - (_verb-like_) [to] pledge
      - (_verb-like_) [to] annex
      - (_noun-like_) excrescence, (_met._) superfluous
      ==
  //
    , `tsywij`
    , [錐](/entries/zeoi#rendering-錐)
    ,
      ==
      - (_noun-like_) awl
      ==
  //
    , `tsywij`
    , [騅](/entries/zeoi#rendering-騅)
    ,
      ==
      - (_noun-like_) piebald
      ==
  //
    , `tsywin`
    , [肫](/entries/zeon#rendering-肫)
    ,
      ==
      - (_adjective-like_) earnest
      ==
  //
    , `tsywin`
    , [諄](/entries/zeon#rendering-諄)
    ,
      ==
      - (_adverb-like_) earnestly, repeatedly
      - (_verb-like_) [to] assist
      ==
  //
    , `tsywinX`
    , [準](/entries/zeon#rendering-準)
    ,
      ==
      - (_noun-like_) water-level
      - (_adjective-like_) level, even, (_met._) standard
      ==
  //
    , `tsywinH`
    , [諄](/entries/zeon#rendering-諄)
    ,
      ==
      - (_adverb-like_) earnestly, repeatedly
      - (_verb-like_) [to] assist
      ==
  //
    , `xjun`
    , [勳](/entries/fan#rendering-勳)
    ,
      ==
      - (_noun-like_) merit
      ==
  //
    , `xjun`
    , [焄](/entries/fan#rendering-焄)
    ,
      ==
      - (_noun-like_) fume, odour
      ==
  //
    , `xjun`
    , [熏](/entries/fan#rendering-熏)
    ,
      ==
      - (_verb-like_) [to] smoke, [to] fume, (_met._) [to] scorch
      - Used in [熏熏](/entries/fan#rendering-熏熏).
      ==
  //
    , `xjun`
    , [纁](/entries/fan#rendering-纁)
    ,
      ==
      - (_adjective-like_) light-red, pink
      ==
  //
    , `xjun`
    , [葷](/entries/fan#rendering-葷)
    ,
      ==
      - (_noun-like_) aromatic-vegetable
      ==
  //
    , `xjun`
    , [薰](/entries/fan#rendering-薰)
    ,
      ==
      - (_noun-like_) fragrance-grass
      ==
  //
    , `xjun`
    , [醺](/entries/fan#rendering-醺)
    ,
      ==
      - (_adjective-like_) intoxicated
      ==
  //
    , `xjun xjun`
    , [熏熏](/entries/fan#rendering-熏熏)
    ,
      ==
      - (_adjective-like_) elated
      ==
  //
    , `xjunH`
    , [訓](/entries/fan#rendering-訓)
    ,
      ==
      - (_verb-like_) [to] instruct
      - (_verb-like_) [to] explain
      - (_verb-like_) [to] comply (with)
      ==
  //
    , `xjuwH`
    , [嗅](/entries/cau#rendering-嗅)
    ,
      ==
      - (_verb-like_) [to] smell
      ==
  //
    , `xjuwk`
    , [慉](/entries/cuk#rendering-慉)
    ,
      ==
      - (_verb-like_) [to] cherish, [to] uplift
      ==
  //
    , `xjuwk`
    , [畜~(noun)](/entries/cuk#rendering-畜-noun)
    ,
      ==
      - (_noun-like_) livestock
      ==
  //
    , `xjuwk`
    , [畜~(verb)](/entries/cuk#rendering-畜-verb)
    ,
      ==
      - (_verb-like_) [to] rear, [to] nurture
      - (_verb-like_) [to] accommodate
      ==
  //
    , `xjuwk`
    , [蓄](/entries/cuk#rendering-蓄)
    ,
      ==
      - (_verb-like_) [to] hoard
      ==
  //
    , `xjw+j`
    , [徽](/entries/fai#rendering-徽)
    ,
      ==
      - (_noun-like_) three-stranded-cord
      - (_adjective-like_) good, beautiful
      - (_noun-like_) banner
      ==
  //
    , `xjw+j`
    , [揮](/entries/fai#rendering-揮)
    ,
      ==
      - (_verb-like_) [to] shake
      - (_verb-like_) [to] brandish
      ==
  //
    , `xjw+j`
    , [暉](/entries/fai#rendering-暉)
    ,
      ==
      - (_noun-like_) sunlight, (_met._) brightness
      ==
  //
    , `xjw+j`
    , [翬](/entries/fai#rendering-翬)
    ,
      ==
      - (_noun-like_) colourful-pheasant
      - (_verb-like_) [to] fly
      ==
  //
    , `xjw+j`
    , [輝](/entries/fai#rendering-輝)
    ,
      ==
      - (_noun-like_) brightness
      ==
  //
    , `xjwe`
    , [撝](/entries/fai#rendering-撝)
    ,
      ==
      - (_verb-like_) [to] signal
      ==
  //
    , `xjwe`
    , [麾](/entries/fai#rendering-麾)
    ,
      ==
      - (_noun-like_) signal-flag
      - (_verb-like_) [to] signal
      - (_adjective-like_) quick
      ==
  //
    , `xjwie`
    , [隳](/entries/fai#rendering-隳)
    ,
      ==
      - (_verb-like_) [to] destroy
      ==
  //
    , `xwaX`
    , [火](/entries/fo#rendering-火)
    ,
      ==
      - (_noun-like_) fire, (_met._) light
      ==
  //
    , `xwaH`
    , [貨](/entries/fo#rendering-貨)
    ,
      ==
      - (_noun-like_) goods, property
      - (_noun-like_) currency
      ==
  //
    , `xwae`
    , [花](/entries/faa#rendering-花)
    ,
      ==
      - (_noun-like_) flower, blossom
      ==
  //
    , `xwaeH`
    , [化](/entries/faa#rendering-化)
    ,
      ==
      - (_verb-like_) [to] transform
      ==
  //
    , `xwak`
    , [藿](/entries/fok#rendering-藿)
    ,
      ==
      - (_noun-like_) pulse-leaf, pulse-sprout
      ==
  //
    , `xwak`
    , [霍](/entries/fok#rendering-霍)
    ,
      ==
      - (_adverb-like_) swiftly
      ==
  //
    , `xwon`
    , [婚](/entries/fan#rendering-婚)
    ,
      ==
      - (_noun-like_) marriage
      - (_noun-like_) in-law
      ==
  //
    , `xwon`
    , [惛](/entries/fan#rendering-惛)
    ,
      ==
      - (_adjective-like_) muddled, muddle-[headed]
      ==
  //
    , `xwon`
    , [昏](/entries/fan#rendering-昏)
    ,
      ==
      - (_noun-like_) dusk
      - (_adjective-like_) adusk, (_met._) blind
      ==
  //
    , `xwon`
    , [閽](/entries/fan#rendering-閽)
    ,
      ==
      - (_noun-like_) doorkeeper
      ==
  //
    , `xwot`
    , [忽](/entries/fat#rendering-忽)
    ,
      ==
      - (_adjective-like_) sudden
      - (_verb-like_) [to] neglect
      - (_verb-like_) [to] obliterate
      - (_noun-like_) floss
      ==
  //
    , `xwot`
    , [惚](/entries/fat#rendering-惚)
    ,
      ==
      - (_adjective-like_) confused
      ==
  //
    , `xwot`
    , [笏](/entries/fat#rendering-笏)
    ,
      ==
      - (_noun-like_) tablet
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
    , `zinH`
    , [俊](/entries/zeon#rendering-俊)
    ,
      ==
      - (_noun-like_) eminent-man
      - (_adjective-like_) eminent
      ==
  //
    , `zinH`
    , [燼](/entries/zeon#rendering-燼)
    ,
      ==
      - (_noun-like_) cinder, embers
      ==
  //
    , `zinH`
    , [藎](/entries/zeon#rendering-藎)
    ,
      ==
      - (_adjective-like_) promoted, faithful
      ==
  //
    , `zinH`
    , [贐](/entries/zeon#rendering-贐)
    ,
      ==
      - (_noun-like_) travelling-gift
      ==
  //
    , `zip`
    , [習](/entries/zaap#rendering-習)
    ,
      ==
      - (_verb-like_) [to] practise
      - (_adjective-like_) gentle
      ==
  //
    , `zip`
    , [襲](/entries/zaap#rendering-襲)
    ,
      ==
      - (_verb-like_) [to] layer (up), [to] shroud
      - (_verb-like_) [to] repeat
      - (_verb-like_) [to] herit
      - (_verb-like_) [to] raid
      ==
  //
    , `zip`
    , [隰](/entries/zaap#rendering-隰)
    ,
      ==
      - (_noun-like_) marshland
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
    , `zjaeH`
    , [榭](/entries/ze#rendering-榭)
    ,
      ==
      - (_noun-like_) raised-pavilion
      ==
  //
    , `zjaeH`
    , [謝](/entries/ze#rendering-謝)
    ,
      ==
      - (_verb-like_) [to] decline, [to] renounce, (_met._) [to] apologise, [to] wilt
      ==
  //
    , `zjang`
    , [庠](/entries/coeng#rendering-庠)
    ,
      ==
      - (_noun-like_) academy
      ==
  //
    , `zjang`
    , [祥](/entries/coeng#rendering-祥)
    ,
      ==
      - (_adjective-like_) auspicious
      - (_noun-like_) auspice
      ==
  //
    , `zjang`
    , [翔](/entries/coeng#rendering-翔)
    ,
      ==
      - (_verb-like_) [to] fly about, [to] soar
      ==
  //
    , `zjang`
    , [詳](/entries/coeng#rendering-詳)
    ,
      ==
      - (_verb-like_) [to] scrutinise
      - (_adjective-like_) detailed
      - (_verb-like_) [to] detail, [to] elaborate
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
    , `zjoX`
    , [序](/entries/zeoi#rendering-序)
    ,
      ==
      - (_noun-like_) side-wall
      - (_noun-like_) learning-hall
      - (_noun-like_) order
      - (_noun-like_) preface
      ==
  //
    , `zjoX`
    , [藇](/entries/zeoi#rendering-藇)
    ,
      ==
      - (_adjective-like_) pleasant, fine
      ==
  //
    , `zjoX`
    , [鱮](/entries/zeoi#rendering-鱮)
    ,
      ==
      - (_noun-like_) tench
      ==
  //
    , `zjowng`
    , [松](/entries/cung#rendering-松)
    ,
      ==
      - (_noun-like_) pine-tree, pine
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
    , `zjuwH`
    , [袖](/entries/zau#rendering-袖)
    ,
      ==
      - (_noun-like_) sleeve
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
