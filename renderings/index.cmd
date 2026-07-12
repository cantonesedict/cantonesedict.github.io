< /res/rules/boilerplate.cmdr
< /res/rules/syntax.cmdr

OrdinaryDictionaryReplacement: #.properties-override
- queue_position: AFTER #.boilerplate.properties-override
- apply_mode: SEQUENTIAL
* %title --> Index of literary renderings by Baxter notation
* %date-modified --> 2026-07-12
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
<label for="keys-filter">__Filter for Baxter/Term:__</label>
<input type="text" id="keys-filter" oninput="applyFilter()" lang="zh-Hant">
--
--
<label for="values-filter">__Filter for Renderings:__</label>
<input type="text" id="values-filter" oninput="applyFilter()">
--
<noscript>
--
**JavaScript is required for filters to work.**
--
</noscript>
||||

u<``<script>
function normaliseString(str)
{
  return str.toLowerCase().trim().replace(/[^\S\n]+/g, ' ');
}

function matchBaxter(keysFilterString, baxter)
{
  return baxter.indexOf(keysFilterString) > -1;
}

function matchString(keysFilterString, str)
{
  return str.indexOf(keysFilterString) > -1;
}

function applyFilter()
{
  let keysFilterElement = document.getElementById('keys-filter');
  let keysFilterString = normaliseString(keysFilterElement.value);

  let valuesFilterElement = document.getElementById('values-filter');
  let valuesFilterString = normaliseString(valuesFilterElement.value);

  for (const rowElement of document.querySelectorAll('tbody tr'))
  {
    let cellElements = rowElement.getElementsByTagName('td');
    let baxter = normaliseString(cellElements[0].textContent);
    let term = normaliseString(cellElements[1].textContent);
    let rendering = normaliseString(cellElements[2].textContent);

    let isBaxterMatch = matchBaxter(keysFilterString, baxter);
    let isTermMatch = matchString(keysFilterString, term);
    let isRenderingMatch = matchString(valuesFilterString, rendering);
    rowElement.style.display = ((isBaxterMatch || isTermMatch) && isRenderingMatch) ? '' : 'none';
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
    ; Term
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
    , `'jangX tsyangX`
    , [鞅掌](/entries/zoeng#rendering-鞅掌)
    ,
      ==
      - (_adjective-like_) uncomposed, bustling
      ==
      <## TODO: move 鞅掌 under $鞅joeng2 ##>
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
    , `'u xu`
    , [嗚呼](/entries/fu#rendering-嗚呼)
    ,
      ==
      - (_onomatopoeia_) boo hoo, (_met._) alas
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
    , `bjang`
    , [房](/entries/fong#rendering-房)
    ,
      ==
      - (_noun-like_) side-room, room
      - (_noun-like_) food-stand
      ==
  //
    , `bjang`
    , [防](/entries/fong#rendering-防)
    ,
      ==
      - (_noun-like_) dyke
      - (_verb-like_) [to] prevent, [to] guard against, (_met._) [to] forfend
      - (_verb-like_) [to] withstand, (_met._) [to] match
      ==
  //
    , `bjang`
    , [魴](/entries/fong#rendering-魴)
    ,
      ==
      - (_noun-like_) bream
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
      - (_adverb-like_) for all, (_met._) whenever
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
    , `bju`
    , [夫~(voiced)](/entries/fu#rendering-夫-voiced)
    ,
      ==
      - (_speech-assist_)
      - (_determiner-like_) this, that
      ==
  //
    , `bju`
    , [扶~(voiced)](/entries/fu#rendering-扶-voiced)
    ,
      ==
      - (_verb-like_) [to] support, [to] uphold
      ==
  //
    , `bju`
    , [符](/entries/fu#rendering-符)
    ,
      ==
      - (_noun-like_) corroborative-tally
      - (_adjective-like_) corroborative
      - (_noun-like_) talisman
      ==
  //
    , `bju`
    , [芙](/entries/fu#rendering-芙)
    ,
      ==
      - Used in [芙蓉](/entries/fu#rendering-芙蓉).
      ==
  //
    , `bju`
    , [鳧](/entries/fu#rendering-鳧)
    ,
      ==
      - (_noun-like_) mallard
      ==
  //
    , `bju yowng`
    , [芙蓉](/entries/fu#rendering-芙蓉)
    ,
      ==
      - (_noun-like_) lotus
      ==
  //
    , `bjuX`
    , [父~(voiced)](/entries/fu#rendering-父-voiced)
    ,
      ==
      - (_noun-like_) father
      ==
  //
    , `bjuX`
    , [腐](/entries/fu#rendering-腐)
    ,
      ==
      - (_adjective-like_) rotting, putrid
      - (_noun-like_) (_met._) castration
      ==
  //
    , `bjuX`
    , [輔](/entries/fu#rendering-輔)
    ,
      ==
      - (_noun-like_) carriage-support, (_met._) upper-jawbone
      - (_verb-like_) [to] support, [to] assist
      ==
  //
    , `bjuX`
    , [釜](/entries/fu#rendering-釜)
    ,
      ==
      - (_noun-like_) boiler
      ==
  //
    , `bjuH`
    , [傅~(voiced)](/entries/fu#rendering-傅-voiced)
    ,
      ==
      - (_verb-like_) [to] attach
      - (_adjective-like_) close (to)
      - (_verb-like_) [to] reach
      ==
  //
    , `bjuH`
    , [祔](/entries/fu#rendering-祔)
    ,
      ==
      - (_verb-like_) [to] adjoin [in sacrifice]
      - (_verb-like_) [to] bury jointly
      ==
  //
    , `bjuH`
    , [賻](/entries/fu#rendering-賻)
    ,
      ==
      - (_verb-like_) [to] contribute to funeral expense
      - (_noun-like_) contributed funeral expense
      ==
  //
    , `bjuH`
    , [附](/entries/fu#rendering-附)
    ,
      ==
      - (_verb-like_) [to] attach, [to] adjoin, [to] annex, (_met._) [to] add (to)
      ==
  //
    , `bjuH`
    , [鮒](/entries/fu#rendering-鮒)
    ,
      ==
      - (_noun-like_) small-carp
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
    , [枹](/entries/fu#rendering-枹)
    ,
      ==
      - (_noun-like_) drumstick
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
    , `bjuwX`
    , [婦](/entries/fu#rendering-婦)
    ,
      ==
      - (_noun-like_) woman
      - Used in [婦人](/entries/fu#rendering-婦人).
      ==
  //
    , `bjuwX`
    , [服~(rising)](/entries/fu#rendering-服-rising)
    ,
      ==
      - (_noun-like_) carriage-box
      ==
  //
    , `bjuwX`
    , [蛗](/entries/fau#rendering-蛗)
    ,
      ==
      - Used in [蛗螽](/entries/zung#rendering-蛗螽).
      ==
  //
    , `bjuwX`
    , [負](/entries/fu#rendering-負)
    ,
      ==
      - (_verb-like_) [to] carry on [the] back, (_met._) [to] bear, [to] support
      - (_verb-like_) [to] turn [the] back (upon), (_met._) [to] betray, [to] let down
      - (_verb-like_) [to] lean upon, (_met._) [to] keep near to
      - (_noun-like_) loss
      ==
  //
    , `bjuwX nyin`
    , [婦人](/entries/fu#rendering-婦人)
    ,
      ==
      - (_noun-like_) woman
      ==
  //
    , `bjuwX tsyuwng`
    , [蛗螽](/entries/zung#rendering-蛗螽)
    ,
      ==
      - (_noun-like_) locust, bush-cricket
      ==
  //
    , `bjuwH`
    , [伏~(departing)](/entries/fau#rendering-伏-departing)
    ,
      ==
      - (_verb-like_) [to] brood, [to] hatch
      ==
  //
    , `bjuwH`
    , [復~(departing)](/entries/fuk#rendering-復-departing)
    ,
      ==
      - (_adverb-like_) re-, again
      - (_verb-like_) [to] repeat
      ==
  //
    , `bjuwH`
    , [覆~(voiced)](/entries/fuk#rendering-覆-voiced)
    ,
      ==
      - (_verb-like_) [to] waylay
      ==
  //
    , `bjuwk`
    , [伏~(entering)](/entries/fuk#rendering-伏-entering)
    ,
      ==
      - (_verb-like_) [to] (lie) prostrate
      - (_verb-like_) [to] lie hidden, [to] ambush
      - (_verb-like_) [to] submit
      - (_verb-like_) [to] subject
      ==
  //
    , `bjuwk`
    , [匐](/entries/fuk#rendering-匐)
    ,
      ==
      - Used in [匍匐](/entries/fuk#rendering-匍匐).
      ==
  //
    , `bjuwk`
    , [復~(entering)](/entries/fuk#rendering-復-entering)
    ,
      ==
      - (_verb-like_) [to] return
      - (_verb-like_) [to] reply
      - (_verb-like_) [to] report
      - (_verb-like_) [to] repay
      - (_verb-like_) [to] restore, (_met._) [to] fulfil
      ==
  //
    , `bjuwk`
    , [服~(entering)](/entries/fuk#rendering-服-entering)
    ,
      ==
      - (_verb-like_) [to] submit
      - (_verb-like_) [to] subjugate, [to] yoke
      - (_verb-like_) (_met._) [to] harness, [to] apply
      - (_noun-like_) yoke-horse, inside-horse
      - (_noun-like_) service
      - (_verb-like_) [to] serve
      - (_verb-like_) [to] muse (upon)
      - (_noun-like_) raiment
      - (_verb-like_) [to] don
      - (_noun-like_) quiver
      - (_verb-like_) [to] take
      ==
  //
    , `bjuwk`
    , [輹~(voiced)](/entries/fuk#rendering-輹-voiced)
    ,
      ==
      - (_noun-like_) axle-housing
      ==
  //
    , `bjuwng`
    , [汎](/entries/faan#rendering-汎)
    ,
      ==
      - (_verb-like_) [to] float (about)
      ==
  //
    , `bok`
    , [仆](/entries/fu#rendering-仆)
    ,
      ==
      - (_verb-like_) [to] fall prostrate
      ==
  //
    , `bok`
    , [匐](/entries/fuk#rendering-匐)
    ,
      ==
      - Used in [匍匐](/entries/fuk#rendering-匍匐).
      ==
  //
    , `bu bjuwk`
    , [匍匐](/entries/fuk#rendering-匍匐)
    ,
      ==
      - (_verb-like_) [to] crawl
      ==
  //
    , `bu bok`
    , [匍匐](/entries/fuk#rendering-匍匐)
    ,
      ==
      - (_verb-like_) [to] crawl
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
    , `draewH`
    , [濯~(departing)](/entries/zok#rendering-濯-departing)
    ,
      ==
      - (_verb-like_) [to] wash
      - (_adjective-like_) sheeny
      ==
  //
    , `draewk`
    , [擢](/entries/zok#rendering-擢)
    ,
      ==
      - (_verb-like_) [to] pull out, [to] select, (_met._) [to] remove
      ==
  //
    , `draewk`
    , [濁](/entries/zuk#rendering-濁)
    ,
      ==
      - (_adjective-like_) muddy
      - (_adjective-like_) (_met._) voiced
      ==
  //
    , `draewk`
    , [濯~(entering)](/entries/zok#rendering-濯-entering)
    ,
      ==
      - (_verb-like_) [to] wash
      ==
  //
    , `draewng`
    , [撞](/entries/zong#rendering-撞)
    ,
      ==
      - (_verb-like_) [to] strike
      - (_verb-like_) [to] crash (into)
      ==
  //
    , `draewngH`
    , [撞](/entries/zong#rendering-撞)
    ,
      ==
      - (_verb-like_) [to] strike
      - (_verb-like_) [to] crash (into)
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
    , `dri`
    , [治~(verb)](/entries/zi#rendering-治-verb)
    ,
      ==
      - (_verb-like_) [to] govern, [to] administer, [to] regulate
      ==
  //
    , `driX`
    , [痔](/entries/zi#rendering-痔)
    ,
      ==
      - (_noun-like_) piles
      ==
  //
    , `driH`
    , [值~(hold)](/entries/zi#rendering-值-hold)
    ,
      ==
      - (_verb-like_) [to] hold
      ==
  //
    , `driH`
    , [值~(worth)](/entries/zik#rendering-值-worth)
    ,
      ==
      - (_verb-like_) [to] withstand, [to] face
      - (_verb-like_) [to] stand for, [to] be worth
      - (_noun-like_) worth
      ==
  //
    , `driH`
    , [植](/entries/zik#rendering-植)
    ,
      ==
      - (_verb-like_) [to] plant
      - (_verb-like_) [to] set up
      ==
  //
    , `driH`
    , [治~(adjective)](/entries/zi#rendering-治-adjective)
    ,
      ==
      - (_adjective-like_) governed, administered, regulated
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
    , [遲~(level)](/entries/ci#rendering-遲-level)
    ,
      ==
      - (_adjective-like_) slow
      ==
  //
    , `drijX`
    , [雉](/entries/zi#rendering-雉)
    ,
      ==
      - (_noun-like_) pheasant
      - (_noun-like_) perch
      ==
  //
    , `drijH`
    , [稚](/entries/zi#rendering-稚)
    ,
      ==
      - (_noun-like_) immature-grain
      - (_adjective-like_) immature
      - (_verb-like_) [to] sow late
      ==
  //
    , `drijH`
    , [遲~(departing)](/entries/zi#rendering-遲-departing)
    ,
      ==
      - (_verb-like_) [to] await
      ==
  //
    , `drik`
    , [值~(worth)](/entries/zik#rendering-值-worth)
    ,
      ==
      - (_verb-like_) [to] withstand, [to] face
      - (_verb-like_) [to] stand for, [to] be worth
      - (_noun-like_) worth
      ==
  //
    , `drik`
    , [直](/entries/zik#rendering-直)
    ,
      ==
      - (_adjective-like_) straight
      - (_adjective-like_) straightforward, direct
      - (_adverb-like_) just
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
      - (_pronoun-like_) I
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
    , `drjak`
    , [著~(voiced)](/entries/zoek#rendering-著-voiced)
    ,
      ==
      - (_verb-like_) [to] put
      - (_verb-like_) [to] attach, [to] apply
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
    , `drjangX`
    , [丈](/entries/zoeng#rendering-丈)
    ,
      ==
      - (_noun-like_) measure, rod
      - (_noun-like_) old-man, man
      ==
  //
    , `drjangX`
    , [杖~(noun)](/entries/zoeng#rendering-杖-noun)
    ,
      ==
      - (_noun-like_) staff, rod
      ==
  //
    , `drjangH`
    , [杖~(verb)](/entries/zoeng#rendering-杖-verb)
    ,
      ==
      - (_verb-like_) [to] lean (upon)
      - (_verb-like_) [to] hold
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
    , [彘](/entries/zi#rendering-彘)
    ,
      ==
      - (_noun-like_) swine
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
    , `drjek`
    , [躑](/entries/zaak#rendering-躑)
    ,
      ==
      - Used in [躑躅](/entries/zaak#rendering-躑躅).
      ==
  //
    , `drjek drjowk`
    , [躑躅](/entries/zaak#rendering-躑躅)
    ,
      ==
      - (_verb-like_) [to] pace back [and] forth
      - (_verb-like_) [to] stamp feet
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
    , `drjenH`
    , [邅~(departing)](/entries/zin#rendering-邅-departing)
    ,
      ==
      - (_verb-like_) [to] turn
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
    , [朝~(voiced)](/entries/ciu#rendering-朝-voiced)
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
    , `drjewX`
    , [趙~(hasten)](/entries/ziu#rendering-趙-hasten)
    ,
      ==
      - (_verb-like_) [to] hasten (unto)
      ==
  //
    , `drjewH`
    , [召](/entries/ziu#rendering-召)
    ,
      ==
      - (_verb-like_) [to] summon
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
    , `drjoH`
    , [箸](/entries/zyu#rendering-箸)
    ,
      ==
      - (_noun-like_) chopsticks
      ==
  //
    , `drjowk`
    , [躅](/entries/zuk#rendering-躅)
    ,
      ==
      - Used in [躑躅](/entries/zaak#rendering-躑躅).
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
    , `drjuH`
    , [住](/entries/zyu#rendering-住)
    ,
      ==
      - (_verb-like_) [to] stay
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
    , `drjuwk`
    , [蓫](/entries/zuk#rendering-蓫)
    ,
      ==
      - (_noun-like_) sorrel
      ==
  //
    , `drjuwk`
    , [軸](/entries/zuk#rendering-軸)
    ,
      ==
      - (_noun-like_) axle
      - (_noun-like_) (_met._) lethargy
      ==
  //
    , `drjuwk`
    , [逐](/entries/zuk#rendering-逐)
    ,
      ==
      - (_verb-like_) [to] pursue
      - (_verb-like_) [to] oust
      - (_verb-like_) [to] contend, [to] strive
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
    , `drjuwngH`
    , [仲](/entries/zung#rendering-仲)
    ,
      ==
      - (_adjective-like_) middle, mid, (_met._) second
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
    , [傳~(level)](/entries/cyun#rendering-傳-level)
    ,
      ==
      - (_verb-like_) [to] transmit
      - (_verb-like_) [to] summon
      ==
  //
    , `drjwenH`
    , [傳~(departing)](/entries/zyun#rendering-傳-departing)
    ,
      ==
      - (_noun-like_) chronicle
      - (_noun-like_) commentary
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
    , `dzak`
    , [怍](/entries/zok#rendering-怍)
    ,
      ==
      - (_verb-like_) [to] be ashamed
      - (_verb-like_) [to] change countenance
      ==
  //
    , `dzak`
    , [昨](/entries/zok#rendering-昨)
    ,
      ==
      - (_noun-like_) yesterday, yester
      ==
  //
    , `dzak`
    , [酢](/entries/zok#rendering-酢)
    ,
      ==
      - (_verb-like_) [to] pledge (in return)
      - (_verb-like_) [to] recompense
      ==
  //
    , `dzak`
    , [鑿~(voiced)](/entries/zok#rendering-鑿-voiced)
    ,
      ==
      - (_verb-like_) [to] chisel, [to] bore, (_met._) [to] dig
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
    , [戔](/entries/zin#rendering-戔)
    ,
      ==
      - (_adjective-like_) slender, cramped
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
    , [藏~(verb)](/entries/cong#rendering-藏-verb)
    ,
      ==
      - (_verb-like_) [to] store (away)
      ==
  //
    , `dzangH`
    , [臟](/entries/zong#rendering-臟)
    ,
      ==
      - (_noun-like_) viscera
      ==
  //
    , `dzangH`
    , [藏~(noun)](/entries/zong#rendering-藏-noun)
    ,
      ==
      - (_noun-like_) store
      - (_noun-like_) (_met._) viscera
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
    , `dzawX`
    , [皂](/entries/zou#rendering-皂)
    ,
      ==
      - (_noun-like_) acorn
      - (_adjective-like_) black
      - (_adjective-like_) [yet] soft
      - (_noun-like_) underling
      - (_noun-like_) stable
      ==
  //
    , `dzawX`
    , [造~(rising)](/entries/zou#rendering-造-rising)
    ,
      ==
      - (_verb-like_) [to] make, [to] create
      - (_verb-like_) [to] do, [to] take action
      - (_noun-like_) doing, (_met._) accomplishment
      - (_verb-like_) [to] commence
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
    , [眥](/entries/zi#rendering-眥)
    ,
      ==
      - (_noun-like_) canthus
      ==
  //
    , `dzejH`
    , [穧](/entries/zai#rendering-穧)
    ,
      ==
      - (_verb-like_) [to] reap
      ==
  //
    , `dzek`
    , [寂](/entries/zik#rendering-寂)
    ,
      ==
      - (_adjective-like_) still, silent
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
    , `dzenH`
    , [荐](/entries/zin#rendering-荐)
    ,
      ==
      - (_noun-like_) grass, (_met._) nomadically
      - (_adverb-like_) repeatedly
      ==
  //
    , `dzet`
    , [截](/entries/zit#rendering-截)
    ,
      ==
      - (_verb-like_) [to] cut (off), (_met._) [to] regulate
      - Used in [截截](/entries/zit#rendering-截截).
      ==
  //
    , `dzet dzet`
    , [截截](/entries/zit#rendering-截截)
    ,
      ==
      - (_adjective-like_) articulate
      ==
  //
    , `dzi`
    , [慈](/entries/ci#rendering-慈)
    ,
      ==
      - (_noun-like_) affection, kindness, (_met._) mother
      ==
  //
    , `dziH`
    , [字](/entries/zi#rendering-字)
    ,
      ==
      - (_verb-like_) [to] bear [child], [to] breed
      - (_verb-like_) [to] nurture, [to] love
      - (_noun-like_) character
      - (_noun-like_) style
      - (_verb-like_) (_met._) [to] betroth
      ==
  //
    , `dziH`
    , [孳~(departing)](/entries/zi#rendering-孳-departing)
    ,
      ==
      - (_verb-like_) [to] mammarise
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
    , `dzijH`
    , [自](/entries/zi#rendering-自)
    ,
      ==
      - (_pronoun-like_) self
      - (_adjective-like_) own
      - (_preposition-like_) since, from
      - (_adverb-like_) naturally
      - (_conjunction-like_) if
      - (_conjunction-like_) though
      ==
  //
    , `dzik`
    , [堲~(abhor)](/entries/zik#rendering-堲-abhor)
    ,
      ==
      - (_verb-like_) [to] abhor
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
    , `dzjaeH`
    , [藉~(departing)](/entries/zik#rendering-藉-departing)
    ,
      ==
      - (_noun-like_) straw-mat
      - (_verb-like_) [to] depend (upon)
      - (_verb-like_) [to] borrow, [to] lend
      ==
  //
    , `dzjak`
    , [爝](/entries/zoek#rendering-爝)
    ,
      ==
      - (_noun-like_) torch
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
    , `dzjangH`
    , [匠](/entries/zoeng#rendering-匠)
    ,
      ==
      - (_noun-like_) carpenter, artisan
      ==
  //
    , `dzje`
    , [疵](/entries/ci#rendering-疵)
    ,
      ==
      - (_noun-like_) defect
      ==
  //
    , `dzjeH`
    , [漬](/entries/zi#rendering-漬)
    ,
      ==
      - (_verb-like_) [to] soak
      ==
  //
    , `dzjeH`
    , [眥](/entries/zi#rendering-眥)
    ,
      ==
      - (_noun-like_) canthus
      ==
  //
    , `dzjek`
    , [瘠](/entries/zek#rendering-瘠)
    ,
      ==
      - (_adjective-like_) emaciated, (_met._) lean
      ==
  //
    , `dzjek`
    , [籍](/entries/zik#rendering-籍)
    ,
      ==
      - (_noun-like_) register, book
      - (_adjective-like_) personally-tilled
      ==
  //
    , `dzjek`
    , [藉~(entering)](/entries/zik#rendering-藉-entering)
    ,
      ==
      - (_noun-like_) tribute
      ==
  //
    , `dzjek`
    , [踖~(step)](/entries/zik#rendering-踖-step)
    ,
      ==
      - (_verb-like_) [to] step on, [to] step over
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
    , `dzjemX`
    , [漸~(rising)](/entries/zim#rendering-漸-rising)
    ,
      ==
      - (_adverb-like_) gradually
      - (_verb-like_) [to] proceed gradually, [to] graduate, (_met._) [to] increase
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
    , [錢~(level)](/entries/cin#rendering-錢-level)
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
    , [諓](/entries/zin#rendering-諓)
    ,
      ==
      - (_adjective-like_) artful
      ==
  //
    , `dzjenX`
    , [踐](/entries/cin#rendering-踐)
    ,
      ==
      - (_verb-like_) [to] trample, [to] tread, (_met._) [to] realise, [to] fulfil
      ==
  //
    , `dzjenX`
    , [餞](/entries/zin#rendering-餞)
    ,
      ==
      - (_verb-like_) [to] departure-feast, [to] send off
      ==
  //
    , `dzjenH`
    , [諓](/entries/zin#rendering-諓)
    ,
      ==
      - (_adjective-like_) artful
      ==
  //
    , `dzjenH`
    , [賤](/entries/zin#rendering-賤)
    ,
      ==
      - (_adjective-like_) cheap, lowly
      - (_verb-like_) [to] hold cheap
      ==
  //
    , `dzjenH`
    , [餞](/entries/zin#rendering-餞)
    ,
      ==
      - (_verb-like_) [to] departure-feast, [to] send off
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
    , `dzjengX`
    , [阱](/entries/zing#rendering-阱)
    ,
      ==
      - (_noun-like_) pitfall
      ==
  //
    , `dzjengX`
    , [靖](/entries/zing#rendering-靖)
    ,
      ==
      - (_verb-like_) [to] tranquilise, [to] (be) quiet
      - (_adjective-like_) tranquil, quiet, (_met._) observant
      ==
  //
    , `dzjengX`
    , [靜](/entries/zing#rendering-靜)
    ,
      ==
      - (_verb-like_) [to] (be) quiet
      - (_adjective-like_) quiet, still
      - (_adjective-like_) pure
      ==
  //
    , `dzjengH`
    , [淨](/entries/zing#rendering-淨)
    ,
      ==
      - (_adjective-like_) clean
      - (_verb-like_) [to] cleanse
      ==
  //
    , `dzjep`
    , [寁](/entries/zaan#rendering-寁)
    ,
      ==
      - (_adverb-like_) hastily
      ==
  //
    , `dzjep`
    , [捷](/entries/zit#rendering-捷)
    ,
      ==
      - (_noun-like_) victory
      - (_noun-like_) spoils
      - (_adjective-like_) nimble
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
    , [噍~(departing)](/entries/ziu#rendering-噍-departing)
    ,
      ==
      - (_verb-like_) [to] chew
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
    , `dzjowngH`
    , [從~(follower)](/entries/zung#rendering-從-follower)
    ,
      ==
      - (_noun-like_) follower
      - (_adjective-like_) auxiliary
      - (_adjective-like_) collateral
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
    , `dzjwet`
    , [絕](/entries/zyut#rendering-絕)
    ,
      ==
      - (_verb-like_) [to] cut (off), [to] sever, (_met._) [to] destroy (utterly)
      - (_adjective-like_) extreme, absolute
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
    , `dzojX`
    , [在](/entries/zoi#rendering-在)
    ,
      ==
      - (_verb-like_) [to] be (present), [to] be at, [to] be in, [to] be on
      - (_preposition-like_) at, in, on
      - (_verb-like_) [to] examine
      - Used in [所在](/entries/zoi#rendering-所在).
      ==
  //
    , `dzojH`
    , [在](/entries/zoi#rendering-在)
    ,
      ==
      - (_verb-like_) [to] be (present), [to] be at, [to] be in, [to] be on
      - (_preposition-like_) at, in, on
      - (_verb-like_) [to] examine
      - Used in [所在](/entries/zoi#rendering-所在).
      ==
  //
    , `dzojH`
    , [栽~(departing)](/entries/zoi#rendering-栽-departing)
    ,
      ==
      - (_verb-like_) [to] erect construction-panelling
      ==
  //
    , `dzojH`
    , [載~(voiced)](/entries/zoi#rendering-載-voiced)
    ,
      ==
      - (_verb-like_) [to] load
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
    , [巉](/entries/caam#rendering-巉)
    ,
      ==
      - (_adjective-like_) precipitous
      ==
  //
    , `dzraem`
    , [毚](/entries/caam#rendering-毚)
    ,
      ==
      - (_adjective-like_) wily
      ==
  //
    , `dzraemX`
    , [巉](/entries/caam#rendering-巉)
    ,
      ==
      - (_adjective-like_) precipitous
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
    , `dzrjangH`
    , [狀](/entries/zong#rendering-狀)
    ,
      ==
      - (_noun-like_) form, (_met._) appearance
      - (_noun-like_) (_met._) documented merit
      - (_noun-like_) state, circumstance
      - (_verb-like_) [to] portray
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
    , `dzrjoH`
    , [助](/entries/zo#rendering-助)
    ,
      ==
      - (_verb-like_) [to] help
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
    , `dzuH`
    , [祚](/entries/zou#rendering-祚)
    ,
      ==
      - (_noun-like_) blessing, prosperity
      - (_noun-like_) [high]-station, (_met._) throne
      ==
  //
    , `dzuH`
    , [胙](/entries/zou#rendering-胙)
    ,
      ==
      - (_noun-like_) sacrificial-meat
      - (_verb-like_) [to] bless
      - (_verb-like_) [to] reward, [to] confer (upon)
      - (_noun-like_) [high]-station, (_met._) throne
      ==
  //
    , `dzuH`
    , [阼](/entries/zou#rendering-阼)
    ,
      ==
      - (_noun-like_) eastern-steps
      ==
  //
    , `dzuwk`
    , [族](/entries/zuk#rendering-族)
    ,
      ==
      - (_noun-like_) clan
      - (_noun-like_) kindred, relation
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
    , [坐~(rising)](/entries/zo#rendering-坐-rising)
    ,
      ==
      - (_verb-like_) [to] sit, [to] kneel
      ==
  //
    , `dzwaH`
    , [坐~(departing)](/entries/zo#rendering-坐-departing)
    ,
      ==
      - (_noun-like_) seat
      - (_adjective-like_) seated, (_met._) hunkered
      - (_adjective-like_) implicated, convicted
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
    , `dzwot`
    , [捽](/entries/zeot#rendering-捽)
    ,
      ==
      - (_verb-like_) [to] grasp
      - (_verb-like_) [to] pick
      - (_verb-like_) [to] clash, [to] conflict
      ==
  //
    , `dzyak`
    , [勺~(noun)](/entries/zoek#rendering-勺-noun)
    ,
      ==
      - (_noun-like_) ladle
      ==
  //
    , `dzyak`
    , [妁](/entries/zoek#rendering-妁)
    ,
      ==
      - (_noun-like_) go-between
      ==
  //
    , `dzyak`
    , [芍](/entries/coek#rendering-芍)
    ,
      ==
      - Used in [芍藥](/entries/coek#rendering-芍藥).
      ==
  //
    , `dzyak yak`
    , [芍藥](/entries/coek#rendering-芍藥)
    ,
      ==
      - (_noun-like_) peony
      ==
  //
    , `dzyen`
    , [儃~(level)](/entries/zin#rendering-儃-level)
    ,
      ==
      - (_adjective-like_) hesitating
      ==
  //
    , `dzyet`
    , [折~(voiced)](/entries/zit#rendering-折-voiced)
    ,
      ==
      - (_adjective-like_) broken
      ==
  //
    , `dzyik`
    , [埴](/entries/zik#rendering-埴)
    ,
      ==
      - (_noun-like_) clay
      ==
  //
    , `dzyik`
    , [植](/entries/zik#rendering-植)
    ,
      ==
      - (_verb-like_) [to] plant
      - (_verb-like_) [to] set up
      ==
  //
    , `dzyik`
    , [殖](/entries/zik#rendering-殖)
    ,
      ==
      - (_verb-like_) [to] grow
      - (_verb-like_) [to] cultivate
      - (_verb-like_) [to] set up
      - (_adjective-like_) level
      ==
  //
    , `dzyik`
    , [湜](/entries/zik#rendering-湜)
    ,
      ==
      - (_adjective-like_) clear
      ==
  //
    , `dzyowngX`
    , [尰](/entries/zung#rendering-尰)
    ,
      ==
      - (_adjective-like_) swollen
      ==
  //
    , `dzyu`
    , [銖](/entries/zyu#rendering-銖)
    ,
      ==
      - (_noun-like_) dram
      ==
  //
    , `dzyuw`
    , [酬](/entries/cau#rendering-酬)
    ,
      ==
      - (_verb-like_) [to] toast (in return)
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
    , [菡](/entries/haam#rendering-菡)
    ,
      ==
      - Used in [菡萏](/entries/haam#rendering-菡萏).
      ==
  //
    , `homX domX`
    , [菡萏](/entries/haam#rendering-菡萏)
    ,
      ==
      - (_noun-like_) lotus flower
      ==
  //
    , `hu`
    , [乎](/entries/fu#rendering-乎)
    ,
      ==
      - (_speech-assist_)
      - (_preposition-like_) in, upon, unto
      - (_preposition-like_) than
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
    , `khu`
    , [刳](/entries/fu#rendering-刳)
    ,
      ==
      - (_verb-like_) [to] cut open
      - (_verb-like_) [to] eviscerate, (_met._) [to] hollow out
      ==
  //
    , `khu`
    , [枯](/entries/fu#rendering-枯)
    ,
      ==
      - (_adjective-like_) withered, (_met._) dried up, paralysed
      ==
  //
    , `khuX`
    , [苦](/entries/fu#rendering-苦)
    ,
      ==
      - (_noun-like_) bitter-plant
      - (_adjective-like_) bitter
      - (_noun-like_) bitterness, suffering
      - (_verb-like_) [to] (make) suffer
      ==
  //
    , `khuH`
    , [庫](/entries/fu#rendering-庫)
    ,
      ==
      - (_noun-like_) arsenal, (_met._) storehouse
      ==
  //
    , `khuH`
    , [袴](/entries/fu#rendering-袴)
    ,
      ==
      - (_noun-like_) trousers
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
    , `khwan`
    , [寬](/entries/fun#rendering-寬)
    ,
      ==
      - (_adjective-like_) wide, spacious
      - (_adjective-like_) magnanimous
      - (_adjective-like_) clement, lenient
      - (_verb-like_) [to] clemence, (_met._) [to] pardon
      ==
  //
    , `khwanX`
    , [款](/entries/fun#rendering-款)
    ,
      ==
      - (_adjective-like_) void, hollow
      - (_adjective-like_) true, staunch
      - (_verb-like_) [to] knock
      ==
  //
    , `khwanX`
    , [窾](/entries/fun#rendering-窾)
    ,
      ==
      - (_noun-like_) hollow
      ==
  //
    , `khweajH`
    , [塊](/entries/faai#rendering-塊)
    ,
      ==
      - (_noun-like_) clod
      ==
  //
    , `khwoj`
    , [恢](/entries/fui#rendering-恢)
    ,
      ==
      - (_verb-like_) [to] extend, [to] vasten
      - (_adjective-like_) extensive, vast
      - (_adjective-like_) complete
      ==
  //
    , `khwoj`
    , [魁](/entries/fui#rendering-魁)
    ,
      ==
      - (_noun-like_) dipper, dipper-[mollusc]
      - (_noun-like_) mound
      - (_adjective-like_) chief
      - (_adjective-like_) great
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
    , `pangH`
    , [舫](/entries/fong#rendering-舫)
    ,
      ==
      - (_noun-like_) boat
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
      - (_noun-like_) radish
      - (_adjective-like_) scant
      ==
  //
    , `phj+jH`
    , [費~(unvoiced)](/entries/fai#rendering-費-unvoiced)
    ,
      ==
      - (_verb-like_) [to] squander, [to] spend
      ==
  //
    , `phjang`
    , [妨](/entries/fong#rendering-妨)
    ,
      ==
      - (_verb-like_) [to] injure, [to] harm
      ==
  //
    , `phjang`
    , [芳](/entries/fong#rendering-芳)
    ,
      ==
      - (_adjective-like_) fragrant
      ==
  //
    , `phjangX`
    , [彷](/entries/fong#rendering-彷)
    ,
      ==
      - Used in [彷彿](/entries/fat#rendering-彷彿).
      ==
  //
    , `phjangX`
    , [紡](/entries/fong#rendering-紡)
    ,
      ==
      - (_verb-like_) [to] spin
      - (_noun-like_) spun-silk
      ==
  //
    , `phjangX phjut`
    , [彷彿](/entries/fat#rendering-彷彿)
    ,
      ==
      - (_verb-like_) [to] seem (like), [to] appear like
      ==
  //
    , `phjangH`
    , [訪](/entries/fong#rendering-訪)
    ,
      ==
      - (_verb-like_) [to] inquire
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
    , `phjowng`
    , [峰](/entries/fung#rendering-峰)
    ,
      ==
      - (_noun-like_) peak, summit
      ==
  //
    , `phju`
    , [俘](/entries/fu#rendering-俘)
    ,
      ==
      - (_verb-like_) [to] capture
      - (_noun-like_) captive, (_met._) spoils
      ==
  //
    , `phju`
    , [孚](/entries/fu#rendering-孚)
    ,
      ==
      - (_noun-like_) confidence, assurance
      - (_noun-like_) sincerity, trust
      ==
  //
    , `phju`
    , [孵](/entries/fu#rendering-孵)
    ,
      ==
      - (_verb-like_) [to] brood, [to] hatch
      ==
  //
    , `phju`
    , [敷](/entries/fu#rendering-敷)
    ,
      ==
      - (_verb-like_) [to] spread (widely)
      - (_adverb-like_) widely
      - (_verb-like_) [to] promulgate
      - (_verb-like_) [to] arrange, [to] display
      - (_verb-like_) [to] state
      ==
  //
    , `phju`
    , [桴](/entries/fu#rendering-桴)
    ,
      ==
      - (_noun-like_) raft
      ==
  //
    , `phju`
    , [郛](/entries/fu#rendering-郛)
    ,
      ==
      - (_noun-like_) outer-wall
      ==
  //
    , `phjuX`
    , [拊](/entries/fu#rendering-拊)
    ,
      ==
      - (_verb-like_) [to] beat (gently)
      - (_noun-like_) beating-[drum]
      - (_noun-like_) handle
      ==
  //
    , `phjuX`
    , [撫](/entries/fu#rendering-撫)
    ,
      ==
      - (_verb-like_) [to] lay hand upon, [to] hold
      - (_verb-like_) [to] soothe, [to] comfort, [to] pacify, (_met._) [to] stabilise
      - (_verb-like_) [to] conform
      ==
  //
    , `phjuH`
    , [仆](/entries/fu#rendering-仆)
    ,
      ==
      - (_verb-like_) [to] fall prostrate
      ==
  //
    , `phjuH`
    , [簠](/entries/fu#rendering-簠)
    ,
      ==
      - (_noun-like_) square-vessel
      ==
  //
    , `phjuH`
    , [訃](/entries/fu#rendering-訃)
    ,
      ==
      - (_verb-like_) [to] announce death
      ==
  //
    , `phjuH`
    , [赴](/entries/fu#rendering-赴)
    ,
      ==
      - (_verb-like_) [to] hasten (unto), [to] go unto, (_met._) [to] throw [oneself]
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
      - (_adjective-like_) sweet-smelling
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
    , `phjuwH`
    , [仆](/entries/fu#rendering-仆)
    ,
      ==
      - (_verb-like_) [to] fall prostrate
      ==
  //
    , `phjuwH`
    , [副~(departing)](/entries/fu#rendering-副-departing)
    ,
      ==
      - (_adjective-like_) subsidiary, (_met._) matched
      - (_noun-like_) headdress
      ==
  //
    , `phjuwH`
    , [覆~(unvoiced)](/entries/fuk#rendering-覆-unvoiced)
    ,
      ==
      - (_verb-like_) [to] overspread
      ==
  //
    , `phjuwk`
    , [蝮](/entries/fuk#rendering-蝮)
    ,
      ==
      - (_noun-like_) viper
      ==
  //
    , `phjuwk`
    , [覆~(entering)](/entries/fuk#rendering-覆-entering)
    ,
      ==
      - (_verb-like_) [to] overturn, [to] overthrow
      - (_adverb-like_) conversely
      - Used in [反覆](/entries/fuk#rendering-反覆).
      ==
  //
    , `phjuwng`
    , [豐](/entries/fung#rendering-豐)
    ,
      ==
      - (_noun-like_) flat-goblet
      - (_adjective-like_) plenteous, ample
      - (_adjective-like_) exuberant
      ==
  //
    , `phuwH`
    , [仆](/entries/fu#rendering-仆)
    ,
      ==
      - (_verb-like_) [to] fall prostrate
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
    , `pjang`
    , [方](/entries/fong#rendering-方)
    ,
      ==
      - (_noun-like_) square, cube, (_met._) block
      - (_noun-like_) direction, side
      - (_noun-like_) place, (_met._) [to] occupy
      - (_suffix_)
      - (_noun-like_) regularity, norm, prescription
      - (_adjective-like_) upright
      - (_noun-like_) method
      - (_adverb-like_) abreast, (_met._) [to] compare, raft
      - (_adverb-like_) just, (just) now, [only] then, when
      - (_adverb-like_) about to
      ==
  //
    , `pjangX`
    , [放~(rising)](/entries/fong#rendering-放-rising)
    ,
      ==
      - (_verb-like_) [to] imitate
      - (_verb-like_) [to] be in accordance with
      - (_preposition-like_) in accordance with
      ==
  //
    , `pjangH`
    , [放~(departing)](/entries/fong#rendering-放-departing)
    ,
      ==
      - (_verb-like_) [to] banish
      - (_verb-like_) [to] let go, [to] let down, (_met._) [to] neglect
      - (_verb-like_) [to] (let) loose
      - (_verb-like_) (_met._) [to] reach
      ==
  //
    , `pjangH`
    , [舫](/entries/fong#rendering-舫)
    ,
      ==
      - (_noun-like_) boat
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
      - Used in [反覆](/entries/fuk#rendering-反覆).
      ==
  //
    , `pjonX`
    , [返](/entries/faan#rendering-返)
    ,
      ==
      - (_verb-like_) [to] turn (back)
      ==
  //
    , `pjonX phjuwk`
    , [反覆](/entries/fuk#rendering-反覆)
    ,
      ==
      - (_adverb-like_) back [and] over, (_met._) over [and] over, back [and] forth
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
    , `pjowng`
    , [封](/entries/fung#rendering-封)
    ,
      ==
      - (_noun-like_) raised-mound, raised-boundary
      - (_verb-like_) [to] raise mound, [to] earth up
      - (_verb-like_) [to] seal up
      - (_noun-like_) feoff
      - (_verb-like_) [to] enfeoff, [to] appoint
      - (_adjective-like_) great
      ==
  //
    , `pjowng`
    , [葑](/entries/fung#rendering-葑)
    ,
      ==
      - (_noun-like_) turnip
      ==
  //
    , `pju`
    , [夫~(unvoiced)](/entries/fu#rendering-夫-unvoiced)
    ,
      ==
      - (_noun-like_) man, -er
      - (_noun-like_) husband
      - Used in [夫子](/entries/zi#rendering-夫子).
      ==
  //
    , `pju`
    , [扶~(unvoiced)](/entries/fu#rendering-扶-unvoiced)
    ,
      ==
      - (_noun-like_) palm
      ==
  //
    , `pju`
    , [簠](/entries/fu#rendering-簠)
    ,
      ==
      - (_noun-like_) square-vessel
      ==
  //
    , `pju`
    , [膚](/entries/fu#rendering-膚)
    ,
      ==
      - (_noun-like_) skin
      - (_noun-like_) cut-meat
      - (_noun-like_) pork
      - (_adjective-like_) comely
      - (_adjective-like_) great
      ==
  //
    , `pju`
    , [跗](/entries/fu#rendering-跗)
    ,
      ==
      - (_noun-like_) instep
      ==
  //
    , `pju`
    , [鈇~(cutter)](/entries/fu#rendering-鈇-cutter)
    ,
      ==
      - (_noun-like_) cutter, chopper
      ==
  //
    , `pju`
    , [鈇~(axe)](/entries/fu#rendering-鈇-axe)
    ,
      ==
      - (_noun-like_) axe, hatchet
      ==
  //
    , `pju tsiX`
    , [夫子](/entries/zi#rendering-夫子)
    ,
      ==
      - (_noun-like_) master
      ==
  //
    , `pjuX`
    , [俯](/entries/fu#rendering-俯)
    ,
      ==
      - (_verb-like_) [to] bow [the] head
      - (_verb-like_) [to] stoop
      ==
  //
    , `pjuX`
    , [府](/entries/fu#rendering-府)
    ,
      ==
      - (_noun-like_) treasury, depository
      - (_verb-like_) [to] accumulate
      - (_noun-like_) [government]-office
      ==
  //
    , `pjuX`
    , [斧](/entries/fu#rendering-斧)
    ,
      ==
      - (_noun-like_) axe, hatchet
      ==
  //
    , `pjuX`
    , [父~(unvoiced)](/entries/fu#rendering-父-unvoiced)
    ,
      ==
      - (_suffix_)
      - (_noun-like_) old-man
      ==
  //
    , `pjuX`
    , [甫](/entries/fu#rendering-甫)
    ,
      ==
      - (_suffix_)
      - (_adjective-like_) great
      - (_verb-like_) [to] begin
      ==
  //
    , `pjuX`
    , [簠](/entries/fu#rendering-簠)
    ,
      ==
      - (_noun-like_) square-vessel
      ==
  //
    , `pjuX`
    , [脯](/entries/fu#rendering-脯)
    ,
      ==
      - (_noun-like_) dried-meat
      ==
  //
    , `pjuX`
    , [腑](/entries/fu#rendering-腑)
    ,
      ==
      - (_noun-like_) secreting-organ
      ==
  //
    , `pjuX`
    , [鈇~(axe)](/entries/fu#rendering-鈇-axe)
    ,
      ==
      - (_noun-like_) axe, hatchet
      ==
  //
    , `pjuX`
    , [黼](/entries/fu#rendering-黼)
    ,
      ==
      - (_noun-like_) embroidered-axe
      ==
  //
    , `pjuH`
    , [付](/entries/fu#rendering-付)
    ,
      ==
      - (_verb-like_) [to] give
      ==
  //
    , `pjuH`
    , [傅~(unvoiced)](/entries/fu#rendering-傅-unvoiced)
    ,
      ==
      - (_verb-like_) [to] assist, [to] tutor
      - (_noun-like_) assistant, tutor
      ==
  //
    , `pjuH`
    , [賦](/entries/fu#rendering-賦)
    ,
      ==
      - (_verb-like_) [to] tax
      - (_verb-like_) [to] give, [to] spread, [to] distribute
      - (_noun-like_) rhyming-prose
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
    , `pjuwH`
    , [富](/entries/fu#rendering-富)
    ,
      ==
      - (_adjective-like_) wealthy
      - (_verb-like_) [to] wealthen
      ==
  //
    , `pjuwk`
    , [幅~(width)](/entries/fuk#rendering-幅-width)
    ,
      ==
      - (_noun-like_) cloth-width, width
      - (_noun-like_) hem
      - (_verb-like_) (_met._) [to] limit
      ==
  //
    , `pjuwk`
    , [福](/entries/fuk#rendering-福)
    ,
      ==
      - (_noun-like_) blessing, happiness
      ==
  //
    , `pjuwk`
    , [腹](/entries/fuk#rendering-腹)
    ,
      ==
      - (_noun-like_) belly
      - (_verb-like_) [to] embrace
      ==
  //
    , `pjuwk`
    , [葍](/entries/fuk#rendering-葍)
    ,
      ==
      - (_noun-like_) whiteroot
      ==
  //
    , `pjuwk`
    , [複](/entries/fuk#rendering-複)
    ,
      ==
      - (_noun-like_) lined-garment
      ==
  //
    , `pjuwk`
    , [輹~(unvoiced)](/entries/fuk#rendering-輹-unvoiced)
    ,
      ==
      - (_noun-like_) axle-tie
      ==
  //
    , `pjuwk`
    , [輻](/entries/fuk#rendering-輻)
    ,
      ==
      - (_noun-like_) spoke
      ==
  //
    , `pjuwng`
    , [風~(noun)](/entries/fung#rendering-風-noun)
    ,
      ==
      - (_noun-like_) wind
      - (_noun-like_) style, manner
      - (_noun-like_) (_met._) air
      - (_noun-like_) (_met._) [in] heat
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
    , `siH`
    , [笥](/entries/zi#rendering-笥)
    ,
      ==
      - (_noun-like_) hamper
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
    , `srjoX dzojX`
    , [所在](/entries/zoi#rendering-所在)
    ,
      ==
      - (_noun-like_) whereabouts
      ==
  //
    , `srjoX dzojH`
    , [所在](/entries/zoi#rendering-所在)
    ,
      ==
      - (_noun-like_) whereabouts
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
    , `syen`
    , [羶](/entries/zin#rendering-羶)
    ,
      ==
      - (_noun-like_) rank-odour
      ==
  //
    , `syen`
    , [顫~(level)](/entries/zin#rendering-顫-level)
    ,
      ==
      - (_noun-like_) discernment of smells
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
    , `syiH`
    , [幟](/entries/ci#rendering-幟)
    ,
      ==
      - (_noun-like_) flag
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
    , `syowng`
    , [舂](/entries/zung#rendering-舂)
    ,
      ==
      - (_verb-like_) [to] pound [grain]
      - (_noun-like_) pounding-stick
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
    , `trhiX`
    , [祉](/entries/zi#rendering-祉)
    ,
      ==
      - (_noun-like_) blessing, felicity
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
    , [悵](/entries/zoeng#rendering-悵)
    ,
      ==
      - (_adjective-like_) disappointed
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
    , `trhjem`
    , [覘](/entries/zim#rendering-覘)
    ,
      ==
      - (_verb-like_) [to] spy (upon)
      ==
  //
    , `trhjemX`
    , [諂](/entries/cim#rendering-諂)
    ,
      ==
      - (_verb-like_) [to] flatter
      ==
  //
    , `trhjemH`
    , [覘](/entries/zim#rendering-覘)
    ,
      ==
      - (_verb-like_) [to] spy (upon)
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
    , `trhjuwk`
    , [蓫](/entries/zuk#rendering-蓫)
    ,
      ==
      - (_noun-like_) sorrel
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
    , `trhwit`
    , [怵](/entries/zeot#rendering-怵)
    ,
      ==
      - (_verb-like_) [to] fear
      - (_verb-like_) [to] pity, [to] sorrow
      ==
  //
    , `trhwit`
    , [黜](/entries/zeot#rendering-黜)
    ,
      ==
      - (_verb-like_) [to] expel, [to] reject, [to] dismiss, [to] degrade
      ==
  //
    , `triX`
    , [徵~(rising)](/entries/zi#rendering-徵-rising)
    ,
      ==
      - (_noun-like_) sol
      ==
  //
    , `triH`
    , [置](/entries/zi#rendering-置)
    ,
      ==
      - (_verb-like_) [to] put, [to] set
      ==
  //
    , `trijX`
    , [黹](/entries/zi#rendering-黹)
    ,
      ==
      - (_noun-like_) embroidery
      ==
  //
    , `trijH`
    , [懥](/entries/zi#rendering-懥)
    ,
      ==
      - (_noun-like_) enragement
      ==
  //
    , `trijH`
    , [疐](/entries/zi#rendering-疐)
    ,
      ==
      - (_verb-like_) [to] stumble
      ==
  //
    , `trijH`
    , [致](/entries/zi#rendering-致)
    ,
      ==
      - (_verb-like_) [to] convey
      - (_verb-like_) [to] hand over, (_met._) [to] retire
      - (_verb-like_) [to] bring about
      - (_verb-like_) [to] arrive
      - (_verb-like_) [to] utmost, [to] do utmostly
      ==
  //
    , `trijH`
    , [質~(departing)](/entries/zi#rendering-質-departing)
    ,
      ==
      - (_verb-like_) [to] pledge, [to] give hostage
      - (_noun-like_) pledge, hostage
      ==
  //
    , `trijH`
    , [躓](/entries/zi#rendering-躓)
    ,
      ==
      - (_verb-like_) [to] stumble
      ==
  //
    , `trijH`
    , [輊](/entries/zi#rendering-輊)
    ,
      ==
      - (_noun-like_) low-fronted (chariot), front-heavy (chariot)
      ==
  //
    , `trik`
    , [稙](/entries/zik#rendering-稙)
    ,
      ==
      - (_verb-like_) [to] sow early
      ==
  //
    , `trik`
    , [陟](/entries/zik#rendering-陟)
    ,
      ==
      - (_verb-like_) [to] ascend
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
    , `tring`
    , [徵~(level)](/entries/zing#rendering-徵-level)
    ,
      ==
      - (_verb-like_) [to] call, [to] summon
      - (_verb-like_) [to] evidence
      - (_verb-like_) [to] collect
      - (_verb-like_) [to] seek
      - (_noun-like_) evidence, sign
      - (_noun-like_) completion-[gift]
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
    , `trjak`
    , [芍](/entries/coek#rendering-芍)
    ,
      ==
      - Used in [芍藥](/entries/coek#rendering-芍藥).
      ==
  //
    , `trjak`
    , [著~(unvoiced)](/entries/zoek#rendering-著-unvoiced)
    ,
      ==
      - (_verb-like_) [to] wear
      ==
  //
    , `trjak yak`
    , [芍藥](/entries/coek#rendering-芍藥)
    ,
      ==
      - (_noun-like_) peony
      ==
  //
    , `trjang`
    , [張~(level)](/entries/zoeng#rendering-張-level)
    ,
      ==
      - (_verb-like_) [to] tension
      - (_verb-like_) [to] string
      - (_verb-like_) [to] extend, [to] spread
      - (_verb-like_) [to] set out, [to] arrange
      - (_verb-like_) [to] boast
      - (_adjective-like_) large
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
    , `trjangH`
    , [張~(departing)](/entries/zoeng#rendering-張-departing)
    ,
      ==
      - (_verb-like_) [to] swell, [to] inflate
      ==
  //
    , `trje`
    , [知](/entries/zi#rendering-知)
    ,
      ==
      - (_verb-like_) [to] know
      ==
  //
    , `trje`
    , [蜘](/entries/zi#rendering-蜘)
    ,
      ==
      - Used in [蜘蛛](/entries/zi#rendering-蜘蛛).
      ==
  //
    , `trje trju`
    , [蜘蛛](/entries/zi#rendering-蜘蛛)
    ,
      ==
      - (_noun-like_) spider
      ==
  //
    , `trjeH`
    , [智](/entries/zi#rendering-智)
    ,
      ==
      - (_noun-like_) knowledge, (_met._) wisdom
      ==
  //
    , `trjem`
    , [沾](/entries/zim#rendering-沾)
    ,
      ==
      - (_verb-like_) [to] moisten, [to] soak
      ==
  //
    , `trjem`
    , [霑](/entries/zim#rendering-霑)
    ,
      ==
      - (_verb-like_) [to] moisten, [to] soak
      ==
  //
    , `trjen`
    , [邅~(level)](/entries/zin#rendering-邅-level)
    ,
      ==
      - (_adjective-like_) hindered
      ==
  //
    , `trjen`
    , [鱣](/entries/zin#rendering-鱣)
    ,
      ==
      - (_noun-like_) great-sturgeon
      ==
  //
    , `trjenX`
    , [展](/entries/zin#rendering-展)
    ,
      ==
      - (_verb-like_) [to] unfurl, [to] exhibit
      - (_verb-like_) [to] examine
      - (_adverb-like_) verily
      ==
  //
    , `trjenX`
    , [皽](/entries/zin#rendering-皽)
    ,
      ==
      - (_noun-like_) skin-crust
      ==
  //
    , `trjenX`
    , [紾](/entries/can#rendering-紾)
    ,
      ==
      - (_verb-like_) [to] twist
      ==
  //
    , `trjenX`
    , [輾](/entries/zin#rendering-輾)
    ,
      ==
      - (_verb-like_) [to] roll (over), (_met._) [to] toss
      ==
  //
    , `trjeng`
    , [楨](/entries/zing#rendering-楨)
    ,
      ==
      - (_noun-like_) support-post
      ==
  //
    , `trjeng`
    , [禎](/entries/zing#rendering-禎)
    ,
      ==
      - (_noun-like_) good-omen
      ==
  //
    , `trjeng`
    , [貞](/entries/zing#rendering-貞)
    ,
      ==
      - (_verb-like_) [to] divine
      - (_noun-like_) inner-trigram
      - (_adjective-like_) correct, proper, (_met._) determined
      ==
  //
    , `trjep`
    , [輒](/entries/zip#rendering-輒)
    ,
      ==
      - (_adverb-like_) immediately
      - (_adverb-like_) consistently
      ==
  //
    , `trjet`
    , [哲](/entries/zit#rendering-哲)
    ,
      ==
      - (_adjective-like_) wise
      ==
  //
    , `trjet`
    , [蜇](/entries/zit#rendering-蜇)
    ,
      ==
      - (_verb-like_) [to] sting
      ==
  //
    , `trjew`
    , [朝~(unvoiced)](/entries/ziu#rendering-朝-unvoiced)
    ,
      ==
      - (_noun-like_) morning
      ==
  //
    , `trjo`
    , [瀦](/entries/zyu#rendering-瀦)
    ,
      ==
      - (_noun-like_) reservoir
      ==
  //
    , `trjo`
    , [豬](/entries/zyu#rendering-豬)
    ,
      ==
      - (_noun-like_) pig
      ==
  //
    , `trjoX`
    , [貯](/entries/cyu#rendering-貯)
    ,
      ==
      - (_verb-like_) [to] stockpile
      ==
  //
    , `trjoH`
    , [著~(departing)](/entries/zyu#rendering-著-departing)
    ,
      ==
      - (_noun-like_) position, place
      - (_verb-like_) [to] manifest, [to] make evident
      - (_adjective-like_) manifest, evident, (_met._) notable
      - (_verb-like_) [to] write
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
    , `trju`
    , [株](/entries/zyu#rendering-株)
    ,
      ==
      - (_noun-like_) tree-root
      ==
  //
    , `trju`
    , [蛛](/entries/zyu#rendering-蛛)
    ,
      ==
      - Used in [蜘蛛](/entries/zi#rendering-蜘蛛).
      ==
  //
    , `trju`
    , [誅](/entries/zyu#rendering-誅)
    ,
      ==
      - (_verb-like_) [to] censure
      - (_verb-like_) [to] punish, (_met._) [to] put to death
      ==
  //
    , `trjuX`
    , [拄](/entries/zyu#rendering-拄)
    ,
      ==
      - (_verb-like_) [to] prop up
      ==
  //
    , `trjuH`
    , [注](/entries/zyu#rendering-注)
    ,
      ==
      - (_verb-like_) [to] flow in, [to] pour in
      - (_verb-like_) [to] channel, [to] focus
      - (_verb-like_) (_met._) [to] bring together
      - (_verb-like_) (_met._) [to] give heed
      - (_verb-like_) (_met._) [to] shoot
      ==
  //
    , `trjuH`
    , [註](/entries/zyu#rendering-註)
    ,
      ==
      - (_verb-like_) [to] record
      - (_verb-like_) [to] annotate
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
    , `trjuw tsjuw`
    , [啁噍](/entries/zau#rendering-啁噍)
    ,
      ==
      - (_onomatopoeia_) chirp chirp
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
    , `trjuwk`
    , [竹](/entries/zuk#rendering-竹)
    ,
      ==
      - (_noun-like_) bamboo
      ==
  //
    , `trjuwk`
    , [築](/entries/zuk#rendering-築)
    ,
      ==
      - (_verb-like_) [to] pound
      - (_verb-like_) [to] build
      ==
  //
    , `trjuwng`
    , [中~(level)](/entries/zung#rendering-中-level)
    ,
      ==
      - (_noun-like_) centre, middle, midst
      - (_adjective-like_) centred, central, mid, medium
      - (_postposition-like_) amidst, among
      ==
  //
    , `trjuwng`
    , [忠](/entries/zung#rendering-忠)
    ,
      ==
      - (_adjective-like_) loyal
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
    , `trjuwngH`
    , [中~(departing)](/entries/zung#rendering-中-departing)
    ,
      ==
      - (_verb-like_) [to] hit (centre), [to] hit [the] mark
      - (_adjective-like_) on [the] mark, (_met._) meet
      ==
  //
    , `trjwejH`
    , [綴](/entries/zeoi#rendering-綴)
    ,
      ==
      - (_verb-like_) [to] stitch (together), [to] connect
      ==
  //
    , `trjwenX`
    , [轉](/entries/zyun#rendering-轉)
    ,
      ==
      - (_verb-like_) [to] turn, (_met._) [to] transfer
      ==
  //
    , `trjwenH`
    , [傳~(unvoiced)](/entries/zyun#rendering-傳-unvoiced)
    ,
      ==
      - (_noun-like_) relay
      ==
  //
    , `trjwet`
    , [啜~(sob)](/entries/zyut#rendering-啜-sob)
    ,
      ==
      - (_verb-like_) [to] sob
      ==
  //
    , `trjwet`
    , [掇~(take)](/entries/zyut#rendering-掇-take)
    ,
      ==
      - (_verb-like_) [to] take, [to] pluck
      ==
  //
    , `trjwet`
    , [綴](/entries/zeoi#rendering-綴)
    ,
      ==
      - (_verb-like_) [to] stitch (together), [to] connect
      ==
  //
    , `trjwet`
    , [輟](/entries/zyut#rendering-輟)
    ,
      ==
      - (_verb-like_) [to] stop
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
    , `tsaX`
    , [左](/entries/zo#rendering-左)
    ,
      ==
      - (_adjective-like_) left
      - (_adverb-like_) left, aleft, (_met._) below, east
      ==
  //
    , `tsaH`
    , [佐](/entries/zo#rendering-佐)
    ,
      ==
      - (_verb-like_) [to] aid (aleft)
      - (_noun-like_) aid
      ==
  //
    , `tsak`
    , [作](/entries/zok#rendering-作)
    ,
      ==
      - (_verb-like_) [to] arise, [to] raise
      - (_verb-like_) [to] construct, [to] make
      - (_verb-like_) [to] compose, [to] write
      - (_verb-like_) [to] work
      - (_verb-like_) [to] be, (_met._) ^as
      ==
  //
    , `tsak`
    , [糳](/entries/zok#rendering-糳)
    ,
      ==
      - (_noun-like_) intricate-grain
      ==
  //
    , `tsak`
    , [鑿~(unvoiced)](/entries/zok#rendering-鑿-unvoiced)
    ,
      ==
      - (_adjective-like_) clear, bright
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
    , `tsang`
    , [牂](/entries/zong#rendering-牂)
    ,
      ==
      - (_noun-like_) ewe
      - (_adjective-like_) flourishing
      ==
  //
    , `tsang`
    , [臧](/entries/zong#rendering-臧)
    ,
      ==
      - (_adjective-like_) good
      ==
  //
    , `tsangH`
    , [葬](/entries/zong#rendering-葬)
    ,
      ==
      - (_verb-like_) [to] inter, [to] bury
      ==
  //
    , `tsaw`
    , [糟](/entries/zou#rendering-糟)
    ,
      ==
      - (_noun-like_) wine-dregs
      - (_adjective-like_) dreggy
      ==
  //
    , `tsaw`
    , [遭](/entries/zou#rendering-遭)
    ,
      ==
      - (_verb-like_) [to] meet (with)
      ==
  //
    , `tsawX`
    , [早](/entries/zou#rendering-早)
    ,
      ==
      - (_adjective-like_) early
      ==
  //
    , `tsawX`
    , [棗](/entries/zou#rendering-棗)
    ,
      ==
      - (_noun-like_) jujube
      ==
  //
    , `tsawX`
    , [澡](/entries/cou#rendering-澡)
    ,
      ==
      - (_verb-like_) [to] wash
      ==
  //
    , `tsawX`
    , [璪](/entries/zou#rendering-璪)
    ,
      ==
      - (_noun-like_) jade-pendant
      ==
  //
    , `tsawX`
    , [藻](/entries/zou#rendering-藻)
    ,
      ==
      - (_noun-like_) pondweed
      - (_noun-like_) (_met._) splendour, brilliance
      - (_noun-like_) cushion
      ==
  //
    , `tsawX`
    , [蚤](/entries/zou#rendering-蚤)
    ,
      ==
      - (_noun-like_) flea
      ==
  //
    , `tsawH`
    , [灶](/entries/zou#rendering-灶)
    ,
      ==
      - (_noun-like_) kitchen-stove, stove
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
    , `tsek`
    , [績](/entries/zik#rendering-績)
    ,
      ==
      - (_verb-like_) [to] twist (thread)
      - (_noun-like_) achievement
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
    , `tsen`
    , [戔](/entries/zin#rendering-戔)
    ,
      ==
      - (_adjective-like_) slender, cramped
      ==
  //
    , `tsen`
    , [箋](/entries/zin#rendering-箋)
    ,
      ==
      - (_noun-like_) lesser-note
      ==
  //
    , `tsenH`
    , [薦](/entries/zin#rendering-薦)
    ,
      ==
      - (_noun-like_) grass-fodder
      - (_noun-like_) padding
      - (_verb-like_) [to] present, [to] recommend
      ==
  //
    , `tsep`
    , [浹](/entries/zip#rendering-浹)
    ,
      ==
      - (_verb-like_) [to] soak through
      - (_noun-like_) cycle
      ==
  //
    , `tset`
    , [節](/entries/zit#rendering-節)
    ,
      ==
      - (_noun-like_) joint, node, juncture, (_met._) division
      - (_noun-like_) [moral] restraint, (_met._) regulation, chastity
      - (_verb-like_) [to] restrain, (_met._) [to] regulate
      - (_noun-like_) token
      - (_adjective-like_) (_met._) crested
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
    , [造~(departing)](/entries/cou#rendering-造-departing)
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
    , `tshejX`
    , [泚](/entries/ci#rendering-泚)
    ,
      ==
      - (_adjective-like_) limpid
      - (_adjective-like_) perspiring
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
    , `tshjak`
    , [鵲](/entries/zoek#rendering-鵲)
    ,
      ==
      - (_noun-like_) magpie
      ==
  //
    , `tshjang`
    , [將~(aspirated)](/entries/coeng#rendering-將-aspirated)
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
    , `tshjek`
    , [踖~(demeanour)](/entries/zik#rendering-踖-demeanour)
    ,
      ==
      - Used in [踖踖](/entries/zik#rendering-踖踖).
      ==
  //
    , `tshjek tshjek`
    , [踖踖](/entries/zik#rendering-踖踖)
    ,
      ==
      - (_adverb-like_) with [reverent] demeanour
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
      - (_adjective-like_) (_met._) unvoiced
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
    , `tshwot`
    , [卒~(abruptly)](/entries/cyut#rendering-卒-abruptly)
    ,
      ==
      - (_adverb-like_) abruptly
      ==
  //
    , `tsi`
    , [仔](/entries/zi#rendering-仔)
    ,
      ==
      - (_verb-like_) [to] bear
      ==
  //
    , `tsi`
    , [孜](/entries/zi#rendering-孜)
    ,
      ==
      - (_adjective-like_) industrious
      ==
  //
    , `tsi`
    , [孳~(level)](/entries/zi#rendering-孳-level)
    ,
      ==
      - (_verb-like_) [to] breed, [to] multiply
      ==
  //
    , `tsi`
    , [滋](/entries/zi#rendering-滋)
    ,
      ==
      - (_verb-like_) [to] grow
      - (_verb-like_) [to] breed, [to] multiply
      - (_adjective-like_) numerous, abundant
      - (_noun-like_) fine-flavour
      ==
  //
    , `tsi`
    , [茲](/entries/zi#rendering-茲)
    ,
      ==
      - (_determiner-like_) this
      - (_adverb-like_) now, [at] this [time]
      ==
  //
    , `tsi`
    , [鎡](/entries/zi#rendering-鎡)
    ,
      ==
      - Used in [鎡基](/entries/zi#rendering-鎡基).
      ==
  //
    , `tsi`
    , [鼒](/entries/zi#rendering-鼒)
    ,
      ==
      - (_noun-like_) small-tripod-cauldron
      ==
  //
    , `tsi ki`
    , [鎡基](/entries/zi#rendering-鎡基)
    ,
      ==
      - (_noun-like_) hoe
      ==
  //
    , `tsiX`
    , [仔](/entries/zi#rendering-仔)
    ,
      ==
      - (_verb-like_) [to] bear
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
      - Used in [夫子](/entries/zi#rendering-夫子), [赤子](/entries/cik#rendering-赤子).
      ==
  //
    , `tsiX`
    , [梓](/entries/zi#rendering-梓)
    ,
      ==
      - (_noun-like_) catalpa
      ==
  //
    , `tsiX`
    , [耔](/entries/zi#rendering-耔)
    ,
      ==
      - (_verb-like_) [to] earth roots
      ==
  //
    , `tsij`
    , [咨](/entries/zi#rendering-咨)
    ,
      ==
      - (_verb-like_) [to] consult
      - (_interjection_) sigh
      ==
  //
    , `tsij`
    , [粢](/entries/zi#rendering-粢)
    ,
      ==
      - (_noun-like_) millet
      ==
  //
    , `tsij`
    , [資](/entries/zi#rendering-資)
    ,
      ==
      - (_noun-like_) means, capital, (_met._) capability
      - (_noun-like_) expense
      - (_verb-like_) [to] utilise
      - (_verb-like_) [to] depend (upon)
      - (_verb-like_) [to] accumulate
      - (_verb-like_) [to] supply
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
    , `tsijX`
    , [姊](/entries/zi#rendering-姊)
    ,
      ==
      - (_noun-like_) elder-sister
      ==
  //
    , `tsijX`
    , [秭](/entries/zi#rendering-秭)
    ,
      ==
      - (_noun-like_) haystack
      ==
  //
    , `tsijH`
    , [恣](/entries/zi#rendering-恣)
    ,
      ==
      - (_verb-like_) [to] wanton, [to] indulge
      ==
  //
    , `tsik`
    , [即](/entries/zik#rendering-即)
    ,
      ==
      - (_verb-like_) [to] approach
      - (_verb-like_) [to] take [place]
      - (_adverb-like_) forthwith
      - (_adverb-like_) that is, which is
      - (_verb-like_) [to] be
      - (_conjunction-like_) though
      ==
  //
    , `tsik`
    , [畟](/entries/zik#rendering-畟)
    ,
      ==
      - (_adjective-like_) sharp
      ==
  //
    , `tsik`
    , [稷](/entries/zik#rendering-稷)
    ,
      ==
      - (_noun-like_) millet
      - (_adjective-like_) prompt
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
    , `tsit`
    , [堲~(fired-brick)](/entries/zik#rendering-堲-fired-brick)
    ,
      ==
      - (_noun-like_) fired-brick
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
    , `tsjak`
    , [燋~(entering)](/entries/ziu#rendering-燋-entering)
    ,
      ==
      - (_noun-like_) unlit-torch
      ==
  //
    , `tsjak`
    , [爝](/entries/zoek#rendering-爝)
    ,
      ==
      - (_noun-like_) torch
      ==
  //
    , `tsjak`
    , [爵](/entries/zoek#rendering-爵)
    ,
      ==
      - (_noun-like_) sparrow-cup
      - (_noun-like_) nobility, noble-rank
      - (_verb-like_) [to] ennoble
      ==
  //
    , `tsjak`
    , [雀](/entries/zoek#rendering-雀)
    ,
      ==
      - (_noun-like_) sparrow
      ==
  //
    , `tsjang`
    , [將~(unaspirated)](/entries/zoeng#rendering-將-unaspirated)
    ,
      ==
      - (_verb-like_) [to] bring (forth), [to] take
      - (_verb-like_) [to] escort
      - (_verb-like_) [to] support (forth), [to] push (forth)
      - (_verb-like_) [to] perform
      - (_verb-like_) [to] advance
      - (_verb-like_) ^shall, [to] intend (to)
      - (_adverb-like_) about (to)
      - (_conjunction-like_) and, (_met._) both
      - (_conjunction-like_) or
      - (_adjective-like_) great
      - (_adjective-like_) strong, vigorous
      - (_adjective-like_) long
      - (_verb-like_) [to] go
      - (_noun-like_) side
      ==
  //
    , `tsjang`
    , [漿](/entries/zoeng#rendering-漿)
    ,
      ==
      - (_noun-like_) thick-liquid
      ==
  //
    , `tsjangH`
    , [將~(departing)](/entries/zoeng#rendering-將-departing)
    ,
      ==
      - (_verb-like_) [to] command, [to] lead
      - (_noun-like_) commander, general
      ==
  //
    , `tsjangH`
    , [醬](/entries/zoeng#rendering-醬)
    ,
      ==
      - (_noun-like_) paste
      ==
  //
    , `tsje`
    , [訾~(level)](/entries/zi#rendering-訾-level)
    ,
      ==
      - (_verb-like_) [to] think, [to] measure
      - (_verb-like_) [to] restrict
      ==
  //
    , `tsje`
    , [髭](/entries/zi#rendering-髭)
    ,
      ==
      - (_noun-like_) moustache
      ==
  //
    , `tsjeX`
    , [紫](/entries/zi#rendering-紫)
    ,
      ==
      - (_adjective-like_) purple
      ==
  //
    , `tsjeX`
    , [訾~(rising)](/entries/zi#rendering-訾-rising)
    ,
      ==
      - (_verb-like_) [to] traduce
      - (_verb-like_) [to] loathe
      ==
  //
    , `tsjeH`
    , [積](/entries/zik#rendering-積)
    ,
      ==
      - (_verb-like_) [to] accumulate
      - (_noun-like_) product, area, volume
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
    , [積](/entries/zik#rendering-積)
    ,
      ==
      - (_verb-like_) [to] accumulate
      - (_noun-like_) product, area, volume
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
    , [跡](/entries/zik#rendering-跡)
    ,
      ==
      - (_noun-like_) footprint, footstep, trace, (_met._) accomplishment
      ==
  //
    , `tsjek`
    , [踖~(reverential)](/entries/zik#rendering-踖-reverential)
    ,
      ==
      - Used in [踧踖](/entries/zik#rendering-踧踖).
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
    , `tsjem`
    , [漸~(level)](/entries/zim#rendering-漸-level)
    ,
      ==
      - (_verb-like_) [to] inflow
      - (_verb-like_) [to] soak
      ==
  //
    , `tsjen`
    , [煎](/entries/zin#rendering-煎)
    ,
      ==
      - (_verb-like_) [to] decoct
      ==
  //
    , `tsjenX`
    , [戩](/entries/zin#rendering-戩)
    ,
      ==
      - (_adjective-like_) complete
      ==
  //
    , `tsjenX`
    , [翦](/entries/zin#rendering-翦)
    ,
      ==
      - (_verb-like_) [to] clip, [to] cut, (_met._) [to] annihilate
      - (_adverb-like_) utterly
      - (_adjective-like_) pale
      ==
  //
    , `tsjenX`
    , [錢~(rising)](/entries/zin#rendering-錢-rising)
    ,
      ==
      - (_noun-like_) adze-hoe
      ==
  //
    , `tsjenH`
    , [濺](/entries/zin#rendering-濺)
    ,
      ==
      - (_verb-like_) [to] spatter
      ==
  //
    , `tsjenH`
    , [箭](/entries/zin#rendering-箭)
    ,
      ==
      - (_noun-like_) arrow
      - (_noun-like_) small-bamboo
      ==
  //
    , `tsjeng`
    , [旌](/entries/zing#rendering-旌)
    ,
      ==
      - (_noun-like_) pennon
      - (_verb-like_) [to] signify
      ==
  //
    , `tsjeng`
    , [精](/entries/zing#rendering-精)
    ,
      ==
      - (_noun-like_) fine-rice
      - (_adjective-like_) fine
      - (_noun-like_) essence
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
    , `tsjengX`
    , [井](/entries/zing#rendering-井)
    ,
      ==
      - (_noun-like_) well, (_met._) square
      - (_noun-like_) field-grid
      - (_adverb-like_) (_met._) continuously
      ==
  //
    , `tsjep`
    , [接](/entries/zip#rendering-接)
    ,
      ==
      - (_verb-like_) [to] connect, [to] contact
      - (_verb-like_) [to] succeed
      - (_verb-like_) [to] receive
      - (_adjective-like_) (_met._) near
      - (_adverb-like_) quickly
      ==
  //
    , `tsjep`
    , [楫](/entries/zip#rendering-楫)
    ,
      ==
      - (_noun-like_) oar
      ==
  //
    , `tsjep`
    , [睫](/entries/zit#rendering-睫)
    ,
      ==
      - (_noun-like_) eyelash
      ==
  //
    , `tsjew`
    , [噍~(adjective)](/entries/ziu#rendering-噍-adjective)
    ,
      ==
      - (_adjective-like_) urgent, quiet
      ==
  //
    , `tsjew`
    , [椒](/entries/ziu#rendering-椒)
    ,
      ==
      - (_noun-like_) pepper
      - (_noun-like_) (_met._) summit
      ==
  //
    , `tsjew`
    , [焦](/entries/ziu#rendering-焦)
    ,
      ==
      - (_verb-like_) [to] scorch
      ==
  //
    , `tsjew`
    , [燋~(level)](/entries/ziu#rendering-燋-level)
    ,
      ==
      - (_verb-like_) [to] scorch
      ==
  //
    , `tsjew`
    , [蕉](/entries/ziu#rendering-蕉)
    ,
      ==
      - (_noun-like_) raw-hemp
      ==
  //
    , `tsjew`
    , [鷦](/entries/ziu#rendering-鷦)
    ,
      ==
      - Used in [鷦鷯](/entries/ziu#rendering-鷦鷯).
      ==
  //
    , `tsjew lew`
    , [鷦鷯](/entries/ziu#rendering-鷦鷯)
    ,
      ==
      - (_noun-like_) wren
      ==
  //
    , `tsjewX`
    , [剿](/entries/ziu#rendering-剿)
    ,
      ==
      - (_verb-like_) [to] sever, (_met._) [to] extirpate
      ==
  //
    , `tsjewX`
    , [勦](/entries/ziu#rendering-勦)
    ,
      ==
      - (_verb-like_) [to] toil
      ==
  //
    , `tsjewH`
    , [爝](/entries/zoek#rendering-爝)
    ,
      ==
      - (_noun-like_) torch
      ==
  //
    , `tsjewH`
    , [醮](/entries/ziu#rendering-醮)
    ,
      ==
      - (_verb-like_) [to] serve [the ceremonial] cup
      - (_verb-like_) [to] finish
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
    , `tsjowk`
    , [足~(entering)](/entries/zuk#rendering-足-entering)
    ,
      ==
      - (_noun-like_) foot
      - (_adjective-like_) sufficient
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
    , `tsjowng`
    , [豵](/entries/zung#rendering-豵)
    ,
      ==
      - (_noun-like_) shote
      ==
  //
    , `tsjowngH`
    , [縱~(departig)](/entries/zung#rendering-縱-departig)
    ,
      ==
      - (_verb-like_) [to] let loose
      - (_verb-like_) [to] indulge
      - (_noun-like_) looseness
      - (_conjunction-like_) although
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
    , [噍~(onomatopoeia)](/entries/zau#rendering-噍-onomatopoeia)
    ,
      ==
      - Used in [啁噍](/entries/zau#rendering-啁噍).
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
    , `tsjuwk tsjek`
    , [踧踖](/entries/zik#rendering-踧踖)
    ,
      ==
      - (_adjective-like_) moving reverently, reverential
      ==
  //
    , `tsjwe`
    , [劑~(level)](/entries/zai#rendering-劑-level)
    ,
      ==
      - (_noun-like_) bisected-contract
      ==
  //
    , `tsoj`
    , [哉](/entries/zoi#rendering-哉)
    ,
      ==
      - (_speech-assist_)
      - (_verb-like_) [to] begin
      ==
  //
    , `tsoj`
    , [栽~(level)](/entries/zoi#rendering-栽-level)
    ,
      ==
      - (_verb-like_) [to] plant
      ==
  //
    , `tsoj`
    , [災](/entries/zoi#rendering-災)
    ,
      ==
      - (_noun-like_) calamity
      ==
  //
    , `tsojX`
    , [宰](/entries/zoi#rendering-宰)
    ,
      ==
      - (_noun-like_) steward, minister, governor
      - (_verb-like_) [to] rule over
      - (_verb-like_) [to] butcher
      ==
  //
    , `tsojX`
    , [載~(rising)](/entries/zoi#rendering-載-rising)
    ,
      ==
      - (_noun-like_) year
      ==
  //
    , `tsojH`
    , [再](/entries/zoi#rendering-再)
    ,
      ==
      - (_adverb-like_) twice, again
      ==
  //
    , `tsojH`
    , [載~(unvoiced)](/entries/zoi#rendering-載-unvoiced)
    ,
      ==
      - (_verb-like_) [to] carry, [to] load, (_met._) [to] fill, [to] fulfil
      - (_verb-like_) [to] record
      - (_verb-like_) [to] carry [out]
      - (_noun-like_) work
      - (_speech-assist_)
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
    , `tsowng`
    , [宗](/entries/zung#rendering-宗)
    ,
      ==
      - (_noun-like_) ancestral-temple, ancestral-tablet
      - (_noun-like_) ancestor, origin, honoured-one
      - (_noun-like_) kinsfolk
      - (_noun-like_) mentor
      - (_verb-like_) [to] honour
      - (_verb-like_) [to] return to origin
      - (_verb-like_) [to] regard mentor
      ==
  //
    , `tsowngH`
    , [綜](/entries/zung#rendering-綜)
    ,
      ==
      - (_verb-like_) [to] collect [together]
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
    , `tsraewk`
    , [捉](/entries/zuk#rendering-捉)
    ,
      ==
      - (_verb-like_) [to] grip, [to] grasp
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
    , [惻](/entries/cak#rendering-惻)
    ,
      ==
      - (_verb-like_) [to] compassion
      ==
  //
    , `tsrhik`
    , [測](/entries/cak#rendering-測)
    ,
      ==
      - (_verb-like_) [to] fathom
      ==
  //
    , `tsrhik`
    , [畟](/entries/zik#rendering-畟)
    ,
      ==
      - (_adjective-like_) sharp
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
    , `tsri`
    , [緇](/entries/zi#rendering-緇)
    ,
      ==
      - (_noun-like_) black-silk
      - (_adjective-like_) black
      ==
  //
    , `tsri`
    , [菑~(level)](/entries/zi#rendering-菑-level)
    ,
      ==
      - (_noun-like_) new-tillage
      - (_verb-like_) [to] till newly
      ==
  //
    , `tsri`
    , [錙](/entries/zi#rendering-錙)
    ,
      ==
      - (_noun-like_) ounce
      ==
  //
    , `tsriX`
    , [胏](/entries/zi#rendering-胏)
    ,
      ==
      - (_noun-like_) boneful-meat
      ==
  //
    , `tsriH`
    , [胾](/entries/zi#rendering-胾)
    ,
      ==
      - (_noun-like_) chunked-meat
      ==
  //
    , `tsriH`
    , [菑~(departing)](/entries/zi#rendering-菑-departing)
    ,
      ==
      - (_noun-like_) standing-dead-tree
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
    , `tsrit`
    , [櫛](/entries/zit#rendering-櫛)
    ,
      ==
      - (_noun-like_) comb
      ==
  //
    , `tsrjang`
    , [莊](/entries/zong#rendering-莊)
    ,
      ==
      - (_adjective-like_) serious, grave
      ==
  //
    , `tsrjangH`
    , [壯](/entries/zong#rendering-壯)
    ,
      ==
      - (_adjective-like_) vigorous
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
    , `tsrjoX`
    , [俎](/entries/zo#rendering-俎)
    ,
      ==
      - (_noun-like_) sacrificial-stand
      ==
  //
    , `tsrjoX`
    , [阻](/entries/zo#rendering-阻)
    ,
      ==
      - (_noun-like_) difficult-pass, dangerous-pass, obstruction
      - (_adjective-like_) difficult, dangerous
      - (_verb-like_) [to] difficult, [to] obstruct
      - (_verb-like_) [to] rely (upon)
      ==
  //
    , `tsrjoH`
    , [詛](/entries/zo#rendering-詛)
    ,
      ==
      - (_verb-like_) [to] imprecate, (_met._) [to] oath
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
    , `tsrjwet`
    , [茁](/entries/zyut#rendering-茁)
    ,
      ==
      - (_adjective-like_) sprouting, (_met._) thriving
      ==
  //
    , `tsrweat`
    , [茁](/entries/zyut#rendering-茁)
    ,
      ==
      - (_adjective-like_) sprouting, (_met._) thriving
      ==
  //
    , `tsu`
    , [租](/entries/zou#rendering-租)
    ,
      ==
      - (_noun-like_) land-tax, tax
      - (_noun-like_) grain-stalk
      - (_verb-like_) [to] collect
      ==
  //
    , `tsuX`
    , [祖](/entries/zou#rendering-祖)
    ,
      ==
      - (_noun-like_) forefather, forebear
      - (_verb-like_) [to] begin
      - (_verb-like_) [to] take after
      - (_verb-like_) [to] make wayside sacrifice
      ==
  //
    , `tsuX`
    , [組](/entries/zou#rendering-組)
    ,
      ==
      - (_noun-like_) ribbon, band
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
    , `tsuwk`
    , [鏃](/entries/zuk#rendering-鏃)
    ,
      ==
      - (_noun-like_) arrowhead
      ==
  //
    , `tsuwng`
    , [總~(level)](/entries/zung#rendering-總-level)
    ,
      ==
      - (_noun-like_) thread-bundle
      ==
  //
    , `tsuwng`
    , [豵](/entries/zung#rendering-豵)
    ,
      ==
      - (_noun-like_) shote
      ==
  //
    , `tsuwng`
    , [鬷](/entries/zung#rendering-鬷)
    ,
      ==
      - (_verb-like_) [to] gather
      ==
  //
    , `tsuwngX`
    , [縱~(rising)](/entries/zung#rendering-縱-rising)
    ,
      ==
      - (_adjective-like_) hurried
      ==
  //
    , `tsuwngX`
    , [總~(rising)](/entries/zung#rendering-總-rising)
    ,
      ==
      - (_verb-like_) [to] bundle (together), [to] aggregate
      - (_noun-like_) grain-bundle
      - (_verb-like_) [to] take command (of)
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
    , `tswan`
    , [鑽](/entries/zyun#rendering-鑽)
    ,
      ==
      - (_verb-like_) [to] drill (into)
      ==
  //
    , `tswanX`
    , [纂](/entries/zyun#rendering-纂)
    ,
      ==
      - (_noun-like_) red-band
      ==
  //
    , `tswanX`
    , [纘](/entries/zyun#rendering-纘)
    ,
      ==
      - (_verb-like_) [to] succeed, [to] continue
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
    , `tswit`
    , [卒~(end)](/entries/zeot#rendering-卒-end)
    ,
      ==
      - (_verb-like_) [to] end, [to] conclude
      - (_adverb-like_) finally, completely
      ==
  //
    , `tswon`
    , [尊](/entries/zyun#rendering-尊)
    ,
      ==
      - (_verb-like_) [to] honour
      ==
  //
    , `tswon`
    , [樽](/entries/zeon#rendering-樽)
    ,
      ==
      - (_noun-like_) wine-vase
      ==
  //
    , `tswonX`
    , [噂](/entries/zyun#rendering-噂)
    ,
      ==
      - (_verb-like_) [to] talk together
      ==
  //
    , `tswot`
    , [卒~(serviceman)](/entries/zeot#rendering-卒-serviceman)
    ,
      ==
      - (_noun-like_) serviceman
      - (_noun-like_) troops
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
    , [勺~(verb)](/entries/zoek#rendering-勺-verb)
    ,
      ==
      - (_verb-like_) [to] ladle
      ==
  //
    , `tsyak`
    , [妁](/entries/zoek#rendering-妁)
    ,
      ==
      - (_noun-like_) go-between
      ==
  //
    , `tsyak`
    , [斫](/entries/zoek#rendering-斫)
    ,
      ==
      - (_verb-like_) [to] hack (off), (_met._) [to] hew
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
    , `tsyak`
    , [酌](/entries/zoek#rendering-酌)
    ,
      ==
      - (_verb-like_) [to] fill cup, [to] pour (cup)
      - (_verb-like_) [to] deliberate, [to] consider
      ==
  //
    , `tsyang`
    , [彰](/entries/zoeng#rendering-彰)
    ,
      ==
      - (_adjective-like_) manifest, decorated
      - (_verb-like_) [to] manifest
      ==
  //
    , `tsyang`
    , [樟](/entries/zoeng#rendering-樟)
    ,
      ==
      - (_noun-like_) camphor-tree
      ==
  //
    , `tsyang`
    , [璋](/entries/zoeng#rendering-璋)
    ,
      ==
      - (_noun-like_) jade-ornament
      ==
  //
    , `tsyang`
    , [章](/entries/zoeng#rendering-章)
    ,
      ==
      - (_adjective-like_) manifest, decorated, (_met._) magnificent
      - (_verb-like_) [to] manifest
      - (_noun-like_) decoration
      - (_noun-like_) emblem
      - (_noun-like_) composition
      - (_noun-like_) chapter, section
      - (_noun-like_) statute
      ==
  //
    , `tsyang`
    , [障](/entries/zoeng#rendering-障)
    ,
      ==
      - (_verb-like_) [to] barrier, [to] embank, (_met._) [to] shield
      - (_noun-like_) barrier
      ==
  //
    , `tsyangX`
    , [掌](/entries/zoeng#rendering-掌)
    ,
      ==
      - (_noun-like_) palm, (_met._) paw
      - (_verb-like_) [to] have charge (of), [to] take charge (of)
      - Used in [鞅掌](/entries/zoeng#rendering-鞅掌).
      ==
  //
    , `tsyangH`
    , [障](/entries/zoeng#rendering-障)
    ,
      ==
      - (_verb-like_) [to] barrier, [to] embank, (_met._) [to] shield
      - (_noun-like_) barrier
      ==
  //
    , `tsye`
    , [巵](/entries/zi#rendering-巵)
    ,
      ==
      - (_noun-like_) goblet
      ==
  //
    , `tsye`
    , [支](/entries/zi#rendering-支)
    ,
      ==
      - (_noun-like_) branch, limb
      - (_verb-like_) [to] support
      - (_verb-like_) [to] pay (for)
      - (_verb-like_) [to] reckon
      ==
  //
    , `tsye`
    , [枝](/entries/zi#rendering-枝)
    ,
      ==
      - (_noun-like_) branch
      - (_classifier_)
      ==
  //
    , `tsye`
    , [肢](/entries/zi#rendering-肢)
    ,
      ==
      - (_noun-like_) limb
      ==
  //
    , `tsye`
    , [觶](/entries/zi#rendering-觶)
    ,
      ==
      - (_noun-like_) drinking-vessel
      ==
  //
    , `tsyeX`
    , [只](/entries/zi#rendering-只)
    ,
      ==
      - (_speech-assist_)
      ==
  //
    , `tsyeX`
    , [紙](/entries/zi#rendering-紙)
    ,
      ==
      - (_noun-like_) paper
      ==
  //
    , `tsyeH`
    , [寘](/entries/zi#rendering-寘)
    ,
      ==
      - (_verb-like_) [to] put
      ==
  //
    , `tsyeH`
    , [觶](/entries/zi#rendering-觶)
    ,
      ==
      - (_noun-like_) drinking-vessel
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
    , `tsyem`
    , [占~(level)](/entries/zim#rendering-占-level)
    ,
      ==
      - (_verb-like_) [to] prognosticate
      ==
  //
    , `tsyem`
    , [瞻](/entries/zim#rendering-瞻)
    ,
      ==
      - (_verb-like_) [to] look (at)
      - (_verb-like_) [to] look up (to)
      ==
  //
    , `tsyem`
    , [詹](/entries/zim#rendering-詹)
    ,
      ==
      - (_adjective-like_) verbose
      - (_verb-like_) [to] arrive
      ==
  //
    , `tsyemH`
    , [占~(departing)](/entries/zim#rendering-占-departing)
    ,
      ==
      - (_verb-like_) [to] occupy
      - (_verb-like_) [to] possess
      ==
  //
    , `tsyen`
    , [旃](/entries/zin#rendering-旃)
    ,
      ==
      - (_noun-like_) banner
      - Contraction of 之焉 (`tsyi hjen`).
      ==
  //
    , `tsyen`
    , [氈](/entries/zin#rendering-氈)
    ,
      ==
      - (_noun-like_) felt
      ==
  //
    , `tsyen`
    , [饘](/entries/zin#rendering-饘)
    ,
      ==
      - (_noun-like_) porridge
      ==
  //
    , `tsyen`
    , [鸇](/entries/zin#rendering-鸇)
    ,
      ==
      - (_noun-like_) hawk
      ==
  //
    , `tsyenX`
    , [皽](/entries/zin#rendering-皽)
    ,
      ==
      - (_noun-like_) skin-crust
      ==
  //
    , `tsyenX`
    , [饘](/entries/zin#rendering-饘)
    ,
      ==
      - (_noun-like_) porridge
      ==
  //
    , `tsyenH`
    , [戰](/entries/zin#rendering-戰)
    ,
      ==
      - (_verb-like_) [to] battle
      - (_verb-like_) [to] tremble
      ==
  //
    , `tsyenH`
    , [顫~(departing)](/entries/zin#rendering-顫-departing)
    ,
      ==
      - (_verb-like_) [to] tremble
      ==
  //
    , `tsyeng`
    , [征](/entries/zing#rendering-征)
    ,
      ==
      - (_verb-like_) [to] (make) expedition
      - (_verb-like_) [to] correct [punitively]
      - (_verb-like_) [to] take
      - (_verb-like_) [to] levy
      ==
  //
    , `tsyeng`
    , [正~(level)](/entries/zing#rendering-正-level)
    ,
      ==
      - (_adjective-like_) central
      - (_noun-like_) centre
      ==
  //
    , `tsyeng`
    , [鉦](/entries/zing#rendering-鉦)
    ,
      ==
      - (_noun-like_) halting-bell
      ==
  //
    , `tsyengX`
    , [整](/entries/zing#rendering-整)
    ,
      ==
      - (_verb-like_) [to] arrange, [to] straighten
      ==
  //
    , `tsyengH`
    , [政](/entries/zing#rendering-政)
    ,
      ==
      - (_noun-like_) governance
      ==
  //
    , `tsyengH`
    , [正~(departing)](/entries/zing#rendering-正-departing)
    ,
      ==
      - (_adjective-like_) right, proper
      - (_verb-like_) [to] right, (_met._) [to] determine
      - (_adverb-like_) right, exactly
      - (_adjective-like_) principal
      ==
  //
    , `tsyengH`
    , [証](/entries/zing#rendering-証)
    ,
      ==
      - (_verb-like_) [to] remonstrate (with)
      ==
  //
    , `tsyet`
    , [折~(unvoiced)](/entries/zit#rendering-折-unvoiced)
    ,
      ==
      - (_verb-like_) [to] break (off), (_met._) [to] decide, [to] die early
      - (_verb-like_) [to] bend
      - (_noun-like_) burial-frame
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
    , [招](/entries/ziu#rendering-招)
    ,
      ==
      - (_verb-like_) [to] beckon, [to] invite
      - (_verb-like_) [to] seek
      - (_verb-like_) [to] tie
      ==
  //
    , `tsyew`
    , [昭](/entries/ciu#rendering-昭)
    ,
      ==
      - (_adjective-like_) luminous, illuminate
      ==
  //
    , `tsyewX`
    , [沼](/entries/ziu#rendering-沼)
    ,
      ==
      - (_noun-like_) pond
      ==
  //
    , `tsyewH`
    , [照](/entries/ziu#rendering-照)
    ,
      ==
      - (_verb-like_) [to] illume
      ==
  //
    , `tsyewH`
    , [詔](/entries/ziu#rendering-詔)
    ,
      ==
      - (_verb-like_) [to] inform
      - (_verb-like_) [to] promulge
      ==
  //
    , `tsyhae`
    , [車](/entries/ce#rendering-車)
    ,
      ==
      - (_noun-like_) carriage, (_met._) lower-jawbone
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
    , `tsyhem`
    , [幨~(level)](/entries/zim#rendering-幨-level)
    ,
      ==
      - (_verb-like_) [to] fray, [to] purse up
      ==
  //
    , `tsyhem`
    , [襜](/entries/zim#rendering-襜)
    ,
      ==
      - (_noun-like_) apron
      - (_verb-like_) [to] flap, [to] adjust
      ==
  //
    , `tsyhemH`
    , [幨~(departing)](/entries/zim#rendering-幨-departing)
    ,
      ==
      - (_noun-like_) lapel
      ==
  //
    , `tsyhenX`
    , [闡](/entries/zin#rendering-闡)
    ,
      ==
      - (_verb-like_) [to] open (up), (_met._) [to] elucidate
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
    , [幟](/entries/ci#rendering-幟)
    ,
      ==
      - (_noun-like_) flag
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
    , `tsyhowk`
    , [觸](/entries/zuk#rendering-觸)
    ,
      ==
      - (_verb-like_) [to] butt, [to] knock against
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
    , `tsyhuwk`
    , [柷](/entries/zuk#rendering-柷)
    ,
      ==
      - (_noun-like_) sounding-box
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
    , `tsyhwet`
    , [啜~(sip)](/entries/zyut#rendering-啜-sip)
    ,
      ==
      - (_verb-like_) [to] sip, [to] taste
      ==
  //
    , `tsyhwet`
    , [歠](/entries/zyut#rendering-歠)
    ,
      ==
      - (_verb-like_) [to] drink [gulpingly]
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
    , `tsyi`
    , [之](/entries/zi#rendering-之)
    ,
      ==
      - (_verb-like_) [to] go
      - (_preposition-like_) till
      - (_determiner-like_) this, such
      - (_pronoun-like_) him, it, (_met._) [a] thing
      - (_postposition-like_) of
      - (_speech-assist_) ^[that]
      ==
  //
    , `tsyiX`
    , [止](/entries/zi#rendering-止)
    ,
      ==
      - (_verb-like_) [to] halt, [to] cease, [to] rest, [to] stay
      - (_noun-like_) deportment
      - (_speech-assist_)
      ==
  //
    , `tsyiX`
    , [沚](/entries/zi#rendering-沚)
    ,
      ==
      - (_noun-like_) islet
      ==
  //
    , `tsyiX`
    , [趾](/entries/zi#rendering-趾)
    ,
      ==
      - (_noun-like_) foot, toe
      ==
  //
    , `tsyiH`
    , [志](/entries/zi#rendering-志)
    ,
      ==
      - (_noun-like_) will, mind, (_met._) aims
      ==
  //
    , `tsyiH`
    , [織~(departing)](/entries/zik#rendering-織-departing)
    ,
      ==
      - (_noun-like_) dyed-weaving
      ==
  //
    , `tsyiH`
    , [誌](/entries/zi#rendering-誌)
    ,
      ==
      - (_verb-like_) [to] remember, [to] record
      ==
  //
    , `tsyij`
    , [祗](/entries/zi#rendering-祗)
    ,
      ==
      - (_verb-like_) [to] reverence
      ==
  //
    , `tsyij`
    , [脂](/entries/zi#rendering-脂)
    ,
      ==
      - (_noun-like_) grease, fat
      ==
  //
    , `tsyijX`
    , [指](/entries/zi#rendering-指)
    ,
      ==
      - (_noun-like_) finger
      - (_verb-like_) [to] point
      ==
  //
    , `tsyijX`
    , [旨](/entries/zi#rendering-旨)
    ,
      ==
      - (_adjective-like_) fine-tasting, fine, excellent
      - (_noun-like_) intent
      ==
  //
    , `tsyijH`
    , [懥](/entries/zi#rendering-懥)
    ,
      ==
      - (_noun-like_) enragement
      ==
  //
    , `tsyijH`
    , [摯](/entries/zi#rendering-摯)
    ,
      ==
      - (_verb-like_) [to] seize, [to] hold
      - (_verb-like_) [to] arrive
      ==
  //
    , `tsyijH`
    , [至](/entries/zi#rendering-至)
    ,
      ==
      - (_verb-like_) [to] arrive, [to] reach
      - (_preposition-like_) unto
      - (_adverb-like_) most
      - (_adjective-like_) utmost
      - (_noun-like_) solstice
      - Used in [至於](/entries/zi#rendering-至於).
      ==
  //
    , `tsyijH`
    , [贄](/entries/zi#rendering-贄)
    ,
      ==
      - (_noun-like_) first-meeting-gift
      ==
  //
    , `tsyijH`
    , [鷙](/entries/zi#rendering-鷙)
    ,
      ==
      - (_noun-like_) bird-of-prey
      - (_verb-like_) [to] prey (upon)
      ==
  //
    , `tsyijH 'jo`
    , [至於](/entries/zi#rendering-至於)
    ,
      ==
      - (_preposition-like_) as to
      ==
  //
    , `tsyik`
    , [織~(entering)](/entries/zik#rendering-織-entering)
    ,
      ==
      - (_verb-like_) [to] weave
      ==
  //
    , `tsyik`
    , [職](/entries/zik#rendering-職)
    ,
      ==
      - (_noun-like_) office, duty
      - (_verb-like_) [to] officiate
      - (_adverb-like_) exclusively
      ==
  //
    , `tsyim`
    , [斟](/entries/zam#rendering-斟)
    ,
      ==
      - (_verb-like_) [to] pour
      - (_verb-like_) [to] deliberate
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
    , `tsying`
    , [烝](/entries/zing#rendering-烝)
    ,
      ==
      - (_verb-like_) [to] convect upward, [to] steam
      - (_verb-like_) [to] adulter upward
      - (_verb-like_) [to] put forth, [to] advance
      - (_adjective-like_) multitudinous
      - (_adjective-like_) stately
      - (_noun-like_) winter-sacrifice
      - (_speech-assist_)
      ==
  //
    , `tsying`
    , [蒸](/entries/zing#rendering-蒸)
    ,
      ==
      - (_verb-like_) [to] steam
      - (_noun-like_) twig
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
    , `tsyingH`
    , [證](/entries/zing#rendering-證)
    ,
      ==
      - (_verb-like_) [to] attest, [to] prove
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
    , `tsyo`
    , [諸](/entries/zyu#rendering-諸)
    ,
      ==
      - (_determiner-like_) all [the], many, various
      - (_noun-like_) preserve
      - (_speech-assist_)
      - Contraction of 之於 (`tsyi 'jo`).
      - Contraction of 之乎 (`tsyi hu`).
      ==
  //
    , `tsyoX`
    , [渚](/entries/zyu#rendering-渚)
    ,
      ==
      - (_noun-like_) islet
      ==
  //
    , `tsyoX`
    , [煮](/entries/zyu#rendering-煮)
    ,
      ==
      - (_verb-like_) [to] cook, [to] boil
      ==
  //
    , `tsyowk`
    , [燭](/entries/zuk#rendering-燭)
    ,
      ==
      - (_noun-like_) torch
      ==
  //
    , `tsyowng`
    , [鍾](/entries/zung#rendering-鍾)
    ,
      ==
      - (_noun-like_) wine-vessel
      - (_verb-like_) [to] gather, [to] concentrate
      ==
  //
    , `tsyowng`
    , [鐘](/entries/zung#rendering-鐘)
    ,
      ==
      - (_noun-like_) bell
      ==
  //
    , `tsyowngX`
    , [種~(noun)](/entries/zung#rendering-種-noun)
    ,
      ==
      - (_noun-like_) seed
      - (_noun-like_) kind
      ==
  //
    , `tsyowngX`
    , [腫](/entries/zung#rendering-腫)
    ,
      ==
      - (_verb-like_) [to] swell
      - (_noun-like_) swelling
      ==
  //
    , `tsyowngX`
    , [踵](/entries/zung#rendering-踵)
    ,
      ==
      - (_noun-like_) heel
      - (_verb-like_) [to] heel, (_met._) [to] follow (after), [to] arrive, [to] visit
      ==
  //
    , `tsyowngH`
    , [種~(verb)](/entries/zung#rendering-種-verb)
    ,
      ==
      - (_verb-like_) [to] seed
      ==
  //
    , `tsyu`
    , [侏](/entries/zyu#rendering-侏)
    ,
      ==
      - Used in [侏儒](/entries/zyu#rendering-侏儒).
      ==
  //
    , `tsyu`
    , [朱](/entries/zyu#rendering-朱)
    ,
      ==
      - (_adjective-like_) vermilion
      ==
  //
    , `tsyu`
    , [珠](/entries/zyu#rendering-珠)
    ,
      ==
      - (_noun-like_) pearl
      ==
  //
    , `tsyu nyu`
    , [侏儒](/entries/zyu#rendering-侏儒)
    ,
      ==
      - (_noun-like_) dwarf
      ==
  //
    , `tsyuX`
    , [主](/entries/zyu#rendering-主)
    ,
      ==
      - (_noun-like_) lord, host, owner, (_met._) lady
      - (_noun-like_) princess
      - (_noun-like_) [ancestral]-tablet
      - (_verb-like_) [to] host
      - (_verb-like_) [to] govern
      - (_adjective-like_) principal
      - (_verb-like_) [to] regard principal
      - (_verb-like_) [to] occupy
      ==
  //
    , `tsyuH`
    , [注](/entries/zyu#rendering-注)
    ,
      ==
      - (_verb-like_) [to] flow in, [to] pour in
      - (_verb-like_) [to] channel, [to] focus
      - (_verb-like_) (_met._) [to] bring together
      - (_verb-like_) (_met._) [to] give heed
      - (_verb-like_) (_met._) [to] shoot
      ==
  //
    , `tsyuH`
    , [註](/entries/zyu#rendering-註)
    ,
      ==
      - (_verb-like_) [to] record
      - (_verb-like_) [to] annotate
      ==
  //
    , `tsyuH`
    , [鑄](/entries/zyu#rendering-鑄)
    ,
      ==
      - (_verb-like_) [to] cast
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
    , `tsyuwk`
    , [柷](/entries/zuk#rendering-柷)
    ,
      ==
      - (_noun-like_) sounding-box
      ==
  //
    , `tsyuwk`
    , [祝~(entering)](/entries/zuk#rendering-祝-entering)
    ,
      ==
      - (_noun-like_) priest
      - (_verb-like_) [to] pray
      - (_verb-like_) [to] attach
      - (_verb-like_) [to] cut off
      ==
  //
    , `tsyuwk`
    , [粥](/entries/zuk#rendering-粥)
    ,
      ==
      - (_noun-like_) gruel
      - (_adjective-like_) gruelly, (_met._) meek
      ==
  //
    , `tsyuwng`
    , [潨](/entries/cung#rendering-潨)
    ,
      ==
      - (_noun-like_) confluence
      ==
  //
    , `tsyuwng`
    , [終](/entries/zung#rendering-終)
    ,
      ==
      - (_verb-like_) [to] end
      - (_adverb-like_) [in the] end, [to the] end, ultimately
      - (_determiner-like_) complete, (_met._) all
      - (_determiner-like_) (_met._) both
      ==
  //
    , `tsyuwng`
    , [螽](/entries/zung#rendering-螽)
    ,
      ==
      - (_noun-like_) locust, bush-cricket
      - Used in [蛗螽](/entries/zung#rendering-蛗螽), [螽斯](/entries/zung#rendering-螽斯).
      ==
  //
    , `tsyuwng sje`
    , [螽斯](/entries/zung#rendering-螽斯)
    ,
      ==
      - (_noun-like_) locust, bush-cricket
      ==
  //
    , `tsyuwngH`
    , [眾](/entries/zung#rendering-眾)
    ,
      ==
      - (_noun-like_) multitude
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
    , `tsywen`
    , [專](/entries/zyun#rendering-專)
    ,
      ==
      - (_adverb-like_) exclusively, solely
      - (_verb-like_) [to] focus (upon)
      - (_verb-like_) [to] monopolise, [to] possess solely, (_met._) [to] have sole [power]
      ==
  //
    , `tsywet`
    , [拙](/entries/zyut#rendering-拙)
    ,
      ==
      - (_adjective-like_) stupid, incompetent
      ==
  //
    , `tsywet`
    , [掇~(short)](/entries/zyut#rendering-掇-short)
    ,
      ==
      - (_adjective-like_) short
      ==
  //
    , `tsywet`
    , [梲](/entries/zyut#rendering-梲)
    ,
      ==
      - (_noun-like_) truss-post
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
    , `twat`
    , [掇~(take)](/entries/zyut#rendering-掇-take)
    ,
      ==
      - (_verb-like_) [to] take, [to] pluck
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
    , `xjwangX`
    , [怳](/entries/fong#rendering-怳)
    ,
      ==
      - (_adjective-like_) disappointed
      ==
  //
    , `xjwangH`
    , [況](/entries/fong#rendering-況)
    ,
      ==
      - (_conjunction-like_) furthermore
      - (_conjunction-like_) how much more
      - (_verb-like_) [to] increase
      - (_verb-like_) [to] compare (with)
      ==
  //
    , `xjwangH`
    , [貺](/entries/fong#rendering-貺)
    ,
      ==
      - (_verb-like_) [to] bestow
      - (_noun-like_) bestowment
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
    , `xu`
    , [呼](/entries/fu#rendering-呼)
    ,
      ==
      - (_verb-like_) [to] call (out), [to] shout (out)
      - Used in [嗚呼](/entries/fu#rendering-嗚呼). <## TODO: move under $嗚wu1 ##>
      ==
  //
    , `xu`
    , [嘑](/entries/fu#rendering-嘑)
    ,
      ==
      - (_verb-like_) [to] shout (out)
      ==
  //
    , `xuX`
    , [琥](/entries/fu#rendering-琥)
    ,
      ==
      - (_noun-like_) tiger-jewel
      ==
  //
    , `xuX`
    , [虎](/entries/fu#rendering-虎)
    ,
      ==
      - (_noun-like_) tiger
      ==
  //
    , `xuH`
    , [呼](/entries/fu#rendering-呼)
    ,
      ==
      - (_verb-like_) [to] call (out), [to] shout (out)
      - Used in [嗚呼](/entries/fu#rendering-嗚呼). <## TODO: move under $嗚wu1 ##>
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
    , `xwan`
    , [歡](/entries/fun#rendering-歡)
    ,
      ==
      - (_verb-like_) [to] rejoice, [to] delight (in)
      - (_adjective-like_) (_met._) friendly
      ==
  //
    , `xwang`
    , [肓](/entries/fong#rendering-肓)
    ,
      ==
      - (_noun-like_) mediastinal-floor
      ==
  //
    , `xwang`
    , [荒](/entries/fong#rendering-荒)
    ,
      ==
      - (_adjective-like_) uncultivated, overgrown
      - (_noun-like_) dearth
      - (_adjective-like_) desolate
      - (_adjective-like_) extensive, (_met._) excessive
      - (_verb-like_) [to] extend
      - (_verb-like_) [to] neglect
      ==
  //
    , `xwang`
    , [衁](/entries/fong#rendering-衁)
    ,
      ==
      - (_noun-like_) blood
      ==
  //
    , `xwangX`
    , [恍](/entries/fong#rendering-恍)
    ,
      ==
      - (_adjective-like_) vague, unclear
      ==
  //
    , `xwangX`
    , [慌](/entries/fong#rendering-慌)
    ,
      ==
      - (_adjective-like_) vague, unclear
      ==
  //
    , `xweaj`
    , [虺~(level)](/entries/fui#rendering-虺-level)
    ,
      ==
      - (_adjective-like_) jaded
      ==
  //
    , `xwoj`
    , [灰](/entries/fui#rendering-灰)
    ,
      ==
      - (_noun-like_) ash
      - (_noun-like_) charcoal
      ==
  //
    , `xwoj`
    , [虺~(level)](/entries/fui#rendering-虺-level)
    ,
      ==
      - (_adjective-like_) jaded
      ==
  //
    , `xwojX`
    , [悔~(rising)](/entries/fui#rendering-悔-rising)
    ,
      ==
      - (_verb-like_) [to] regret
      ==
  //
    , `xwojH`
    , [悔~(departing)](/entries/fui#rendering-悔-departing)
    ,
      ==
      - (_verb-like_) [to] repent
      - (_noun-like_) outer-trigram
      ==
  //
    , `xwojH`
    , [晦](/entries/fui#rendering-晦)
    ,
      ==
      - (_noun-like_) month's-end
      - (_adjective-like_) dark, obscure
      ==
  //
    , `xwojH`
    , [誨](/entries/fui#rendering-誨)
    ,
      ==
      - (_verb-like_) [to] instruct, (_met._) [to] induce
      ==
  //
    , `xwojH`
    , [靧](/entries/fui#rendering-靧)
    ,
      ==
      - (_verb-like_) [to] wash [the] face
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
    , [巳](/entries/zi#rendering-巳)
    ,
      ==
      - (_noun-like_) snake-branch
      ==
  //
    , `ziX`
    , [汜](/entries/ci#rendering-汜)
    ,
      ==
      - (_noun-like_) rejoining-water
      ==
  //
    , `ziX`
    , [祀](/entries/zi#rendering-祀)
    ,
      ==
      - (_verb-like_) [to] sacrifice
      - (_noun-like_) annus
      ==
  //
    , `ziX`
    , [耜](/entries/zi#rendering-耜)
    ,
      ==
      - (_noun-like_) ploughshare, plough
      ==
  //
    , `ziH`
    , [嗣](/entries/zi#rendering-嗣)
    ,
      ==
      - (_verb-like_) [to] succeed, [to] inherit
      - (_verb-like_) [to] continue
      - (_noun-like_) successor
      ==
  //
    , `ziH`
    , [寺](/entries/zi#rendering-寺)
    ,
      ==
      - (_noun-like_) court, (_met._) eunuch
      - (_noun-like_) temple
      - Used in [寺人](/entries/zi#rendering-寺人).
      ==
  //
    , `ziH`
    , [食~(departing)](/entries/zi#rendering-食-departing)
    ,
      ==
      - (_verb-like_) [to] feed
      ==
  //
    , `ziH nyin`
    , [寺人](/entries/zi#rendering-寺人)
    ,
      ==
      - (_noun-like_) eunuch
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
    , `zjangX`
    , [像](/entries/zoeng#rendering-像)
    ,
      ==
      - (_verb-like_) [to] image, [to] depict
      ==
  //
    , `zjangX`
    , [橡](/entries/zoeng#rendering-橡)
    ,
      ==
      - (_noun-like_) acorn
      ==
  //
    , `zjangX`
    , [象](/entries/zoeng#rendering-象)
    ,
      ==
      - (_noun-like_) elephant
      - (_noun-like_) image, depiction
      ==
  //
    , `zjek`
    , [夕](/entries/zik#rendering-夕)
    ,
      ==
      - (_noun-like_) evening
      ==
  //
    , `zjek`
    , [席](/entries/zik#rendering-席)
    ,
      ==
      - (_noun-like_) mat
      ==
  //
    , `zjek`
    , [蓆](/entries/zik#rendering-蓆)
    ,
      ==
      - (_adjective-like_) large
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
    , `zjowk`
    , [俗](/entries/zuk#rendering-俗)
    ,
      ==
      - (_noun-like_) custom
      - (_adjective-like_) vulgar
      ==
  //
    , `zjowk`
    , [續](/entries/zuk#rendering-續)
    ,
      ==
      - (_verb-like_) [to] continue, [to] carry on, (_met._) [to] join
      ==
  //
    , `zjowk`
    , [藚](/entries/zuk#rendering-藚)
    ,
      ==
      - (_noun-like_) alisma
      ==
  //
    , `zjowng`
    , [松](/entries/cung#rendering-松)
    ,
      ==
      - (_noun-like_) pine-tree, pine
      ==
  //
    , `zjowng`
    , [訟](/entries/zung#rendering-訟)
    ,
      ==
      - (_verb-like_) [to] litigate
      - (_verb-like_) [to] reproach, [to] reprove
      ==
  //
    , `zjowngH`
    , [訟](/entries/zung#rendering-訟)
    ,
      ==
      - (_verb-like_) [to] litigate
      - (_verb-like_) [to] reproach, [to] reprove
      ==
  //
    , `zjowngH`
    , [誦](/entries/zung#rendering-誦)
    ,
      ==
      - (_verb-like_) [to] recite
      - (_noun-like_) recitative
      - (_verb-like_) [to] mock
      ==
  //
    , `zjowngH`
    , [頌](/entries/zung#rendering-頌)
    ,
      ==
      - (_verb-like_) [to] laud
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
    , `zriX`
    , [俟](/entries/zi#rendering-俟)
    ,
      ==
      - (_verb-like_) [to] await
      - (_adjective-like_) ambling together
      ==
  //
    , `zriX`
    , [涘](/entries/zi#rendering-涘)
    ,
      ==
      - (_noun-like_) riverbank, bank
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
