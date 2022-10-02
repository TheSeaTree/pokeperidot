	const_def 2 ; object constants
	const RIDGEVILLAGE_EARL
	const RIDGEVILLAGE_LASS
	const RIDGEVILLAGE_SUPER_NERD
	const RIDGEVILLAGE_GRAMPS
	const RIDGEVILLAGE_YOUNGSTER
	const RIDGEVILLAGE_FRUIT_TREE
	const RIDGEVILLAGE_SILVER
	const RIDGEVILLAGE_BUSH
	const RIDGEVILLAGE_SHOEMAN
	const RIDGEVILLAGE_FANGIRL

RidgeVillage_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0
	scene_script .DummyScene1
	scene_script .ShoesScene

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end
	
.DummyScene1:
	end
	
.ShoesScene:
	moveobject RIDGEVILLAGE_SHOEMAN, 36, 9
	appear RIDGEVILLAGE_SHOEMAN
	end
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_RIDGE
	return

RidgeVillageRivalBattleScene1:
	moveobject RIDGEVILLAGE_SILVER, 33, 8
	opentext
	writetext RidgeVillageRivalWait
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear RIDGEVILLAGE_SILVER
	applymovement RIDGEVILLAGE_SILVER, RidgeVillageRivalBattleApproachMovement1
	jump RidgeVillageRivalBattleScript

RidgeVillageRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RidgeVillageRivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Totodile
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Chikorita
	winlosstext RidgeVillageRivalWinText, RidgeVillageRivalLossText
	setlasttalked RIDGEVILLAGE_SILVER
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext RidgeVillageRivalWinText, RidgeVillageRivalLossText
	setlasttalked RIDGEVILLAGE_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext RidgeVillageRivalWinText, RidgeVillageRivalLossText
	setlasttalked RIDGEVILLAGE_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext RidgeVillageRivalAfterText
	waitbutton
	closetext
	applymovement RIDGEVILLAGE_SILVER, RidgeVillageRivalBattleExitMovement
	disappear RIDGEVILLAGE_SILVER
	waitsfx
	setevent EVENT_BEAT_RIVAL_1
	setscene SCENE_RIDGEVILLAGE_DEFEATED_RIVAL
	playsound SFX_EXIT_BUILDING
	moveobject RIDGEVILLAGE_FANGIRL, 38, 7
	appear RIDGEVILLAGE_FANGIRL
	applymovement PLAYER, RidgePlayerStepRight
	applymovement RIDGEVILLAGE_FANGIRL, RidgeFangirlStepDown
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext RidgeFangirlIntroductionText
	waitbutton
.RivalNameLoop
	special NameRival
	writetext RidgeFangirlConfirmRivalName
	yesorno
	iffalse .RivalNameLoop
	writetext RidgeFangirlLeaveText
	waitbutton
	closetext
	applymovement RIDGEVILLAGE_FANGIRL, RidgeVillageRivalBattleExitMovement
	disappear RIDGEVILLAGE_FANGIRL
	playmapmusic
	end
	
RidgeVillageShoeGuy:
	turnobject RIDGEVILLAGE_SHOEMAN, UP
	showemote EMOTE_SHOCK, RIDGEVILLAGE_SHOEMAN, 15
	opentext
	writetext ShoeGuyText1
	waitbutton
	closetext
	applymovement RIDGEVILLAGE_SHOEMAN, ShoeGuyApproach
	turnobject PLAYER, LEFT
	opentext
	writetext ShoeGuyText2
	waitbutton
	writetext PlayerReceivedRunningShoes
	playsound SFX_KEY_ITEM
	setflag ENGINE_RUNNING_SHOES
	waitsfx
	writetext ShoeguyExplain
	yesorno
	iffalse .ExplainedShoes
	writetext ExplainRunningShoes
	waitbutton
.ExplainedShoes
	writetext RunningShoesCaution
	waitbutton
	closetext
	applymovement RIDGEVILLAGE_SHOEMAN, ShoeGuyLeave
	disappear RIDGEVILLAGE_SHOEMAN
	setscene SCENE_RIDGEVILLAGE_DEFEATED_RIVAL
	end
	
RidgeGymEvent:
	checkflag ENGINE_WAVEBADGE
	iftrue .havebadge
	clearevent EVENT_BEAT_SWIMMERM_VINNY
	clearevent EVENT_BEAT_SWIMMERM_JIMMY
	clearevent EVENT_BEAT_SWIMMERF_VIVIAN
	clearevent EVENT_BEAT_SWIMMERM_RONNIE
	scall RidgeGymEntrance
	iffalse .no
.warp
	warpfacing UP, RIDGE_GYM,  4, 7
.no
	end	
	
.havebadge
	scall RidgeEnterGym
	jump .warp
	
RidgeGymEntrance:
	jumpstd gymdoor
	end
	
RidgeEnterGym:
	jumpstd entergym
	end
	
RidgeVillageSuperNerd:
	jumptextfaceplayer RidgeVillageSuperNerdText
	
RidgeVillageLass:
	jumptextfaceplayer RidgeVillageLassText
	
RidgeVillageFisher1:
	jumptextfaceplayer RidgeVillageFisher1Text

RidgeVillageFisher2:
	jumptextfaceplayer RidgeVillageFisher2Text
	
RidgeVillageYoungster:
	jumptextfaceplayer RidgeVillageYoungsterText
	
RidgeVillageSign:
	jumptext RidgeVillageSignText

RidgeTutorSign:
	jumptext RidgeTutorSignText

RidgeVillagePokecenterSign:
	jumpstd pokecentersign

RidgeVillageCafeSign:
	jumptext RidgeCafeSignText
	
RidgeVillageMagikarpBrosSign:
	jumptext RidgeVillageMagikarpBrosSignText

RidgeVillageFruitTree:
	fruittree FRUITTREE_VIOLET_CITY_1

RidgeVillageItemBush:
	itembush FRUITTREE_VIOLET_CITY_2
	
RidgeVillageHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION
	
RidgeGymMovement:
	step UP
	step_resume

RidgeVillageRivalBattleApproachMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RidgeVillageRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
RidgeFangirlStepDown:
	step DOWN
	turn_head RIGHT
	step_end
	
RidgePlayerStepRight:
	turn_head LEFT
	fix_facing
	step RIGHT
	remove_fixed_facing
	step_end
	
ShoeGuyApproach:
	step UP
	step RIGHT
	step_end
	
ShoeGuyLeave:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RidgeVillageRivalWait:
	text "Hey you!"
	done
	
RidgeVillageRivalBeforeText:
	text "Where do you think"
	line "you're going?"

	para "I already had an"
	line "appointment with"
	cont "the gym leader!"

	para "What's that?"

	para "You just started"
	line "your journey as a"
	cont "#MON trainer?"
	
	para "And you think"
	line "you're good enough"
	cont "to even set foot"
	cont "in a gym?"
	
	para "Don't make"
	line "me laugh!"
	
	para "You think you're"
	line "so good?"
	
	para "Get through me"
	line "first!"
	done

RidgeVillageRivalWinText:
	text "Argh!"

	para "Fine. You can"
	line "challenge this gym"
	cont "before me."
	done

RidgeVillageRivalAfterText:
	text "…"
	done

RidgeVillageRivalLossText:
	text "…Humph! I knew"
	line "you were lying."
	done
	
RidgeFangirlIntroductionText:
	text "Hey! That battle"
	line "was great! I was"
	cont "able to catch the"
	cont "end of it after I"
	cont "finished up my GYM"
	cont "challenge here."
	
	para "By the way, what's"
	line "your name?"
	
	para "<……><……><……>"
	
	para "<PLAYER>? It's"
	line "a pleasure to meet"
	cont "you! I'm EMILY!"
	
	para "Your opponent was"
	line "so quick to leave."
	cont "Did you catch his"
	cont "name?"
	done
	
RidgeFangirlConfirmRivalName:
	text "<RIVAL>?"
	line "Did I hear that"
	cont "right?"
	done
	
RidgeFangirlLeaveText:
	text "Thanks! I'll try"
	line "and catch up with"
	cont "him! You two have"
	cont "a lot of promise"
	cont "as trainers."
	
	para "I'm going to have"
	line "my eye on you,"
	cont "<PLAYER>!"
	done
	
ShoeGuyText1:
	text "Hey, trainer! Can"
	line "I have a moment?"
	done
	
ShoeGuyText2:
	text "You just defeated"
	line "that gym, right?"
	
	para "Congrats!"
	
	para "Where are you"
	line "from, kid?"
	
	para "…"
	
	para "ELKHORN TOWN, eh?"
	
	para "That's quite a"
	line "long way to come"
	cont "on foot."
	
	para "Hey, this might"
	line "sound weird, but I"
	cont "have a new pair of"
	cont "RUNNING SHOES that"
	cont "don't fit me."
	
	para "You could use them"
	line "more than I could."
	done
	
PlayerReceivedRunningShoes:
	text "<PLAYER> got the"
	line "RUNNING SHOES!"
	done
	
ShoeguyExplain:
	text "Would you like me"
	line "to explain how"
	cont "those shoes work?"
	done
	
ExplainRunningShoes:
	text "With those shoes,"
	line "you will be able"
	cont "to move faster as"
	cont "long as you hold"
	cont "the B button."
	done
	
RunningShoesCaution:
	text "Be careful! Moving"
	line "fast will alert"
	cont "trainers and wild"
	cont "#MON!"
	
	para "Anyway…"
	
	para "I'm sure you have"
	line "more important"
	cont "things to do than"
	cont "listen to me blab"
	cont "all day."
	
	para "Good luck,"
	line "trainer!"
	done
	
RidgeVillageSuperNerdText:
	text "I tried to battle"
	line "LEADER CECIL with"
	cont "only GRASS-type"
	cont "#MON."

	para "I can tell you"
	line "that didn't turn"
	cont "out well for me"
	cont "one bit."
	done
	
RidgeVillageLassText:
	text "Ah! The smell of"
	line "the ocean breeze"
	cont "is so soothing!"
	
	para "I don't live here,"
	line "but I might need"
	cont "to move."
	done
	
RidgeVillageFisher1Text:
	text "I love to fish!"
	
	para "The ocean hides so"
	line "many cool #MON"
	cont "you can't find"
	cont "anywhere else."
	done

RidgeVillageFisher2Text:
	text "ARGH!"
	
	para "This stupid OLD"
	line "ROD I have won't"
	cont "catch any #MON!"
	
	para "There's a guy on"
	line "ROUTE 5 that is"
	cont "giving away a GOOD"
	cont "ROD, but he will"
	cont "only give it to"
	cont "someone with a"
	cont "WAVE BADGE."
	done
	
RidgeVillageYoungsterText:
	text "I visited the NAME"
	line "RATER, but he"
	cont "wouldn't change"
	cont "the name of a"
	cont "#MON I got in a"
	cont "trade."
	done
	
RidgeVillageSignText:
	text "RIDGE VILLAGE"

	para "Admire the"
	line "sea's majesty."
	done

RidgeCafeSignText:
	text "RIDGE CAFé"
	done
	
RidgeVillageMagikarpBrosSignText:
	text "MAGIKARP BROS."
	
	para "Selling fresh"
	line "MAGIKARP EGGs"
	cont "daily!"
	done

RidgeTutorSignText:
	text "MOVE TUTOR"
	done

SproutTowerSignText:
	text "SPROUT TOWER"

	para "Experience the"
	line "Way of #MON"
	done

EarlsPokemonAcademySignText:
	text "EARL'S #MON"
	line "ACADEMY"
	done

RidgeVillage_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 21,  9, RIDGE_CAFE, 2
	warp_event 37, 15, RIDGE_MAGIKARP_HOUSE, 1
	warp_event  9,  7, RIDGE_POKECENTER_1F, 1
	warp_event 15, 13, RIDGE_MOVE_TUTOR, 1
	warp_event  3, 11, NAME_RATER, 1
	warp_event 17,  3, RIDGE_WEATHER_HOUSE, 1
	warp_event  1, 15, RIDGE_TRADE_HOUSE, 1

	db 2 ; coord events
	coord_event 38, 8, SCENE_RIDGEVILLAGE_NOTHING, RidgeVillageRivalBattleScene1
	coord_event 38, 8, SCENE_RIDGEVILLAGE_RUNNING_SHOES, RidgeVillageShoeGuy

	db 7 ; bg events
	bg_event  8, 13, BGEVENT_READ, RidgeVillageSign
	bg_event 16, 14, BGEVENT_READ, RidgeTutorSign
	bg_event 10,  7, BGEVENT_READ, RidgeVillagePokecenterSign
	bg_event 20, 10, BGEVENT_READ, RidgeVillageCafeSign
	bg_event 36, 16, BGEVENT_READ, RidgeVillageMagikarpBrosSign
	bg_event 19,  1, BGEVENT_ITEM, RidgeVillageHiddenHyperPotion
	bg_event 38,  7, BGEVENT_UP, RidgeGymEvent

	db 10 ; object events
	object_event 12, 18, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RidgeVillageFisher1, -1
	object_event 16,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RidgeVillageLass, -1
	object_event 22, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_GREEN,OBJECTTYPE_SCRIPT, 0, RidgeVillageSuperNerd, -1
	object_event 23, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeVillageFisher2, -1
	object_event  6, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RidgeVillageYoungster, -1
	object_event  1, 18, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeVillageFruitTree, -1
	object_event  1,  1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_1
	object_event  5,  9, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeVillageItemBush, -1
	object_event  1,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
