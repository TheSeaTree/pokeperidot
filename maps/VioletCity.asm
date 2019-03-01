	const_def 2 ; object constants
	const VIOLETCITY_EARL
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_SILVER

VioletCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return

VioletCityRivalBattleScene1:
	checkevent EVENT_BEAT_RIVAL_1
	iftrue .skip
	moveobject VIOLETCITY_SILVER, 33, 8
	opentext
	writetext VioletCityRivalWait
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VIOLETCITY_SILVER
	applymovement VIOLETCITY_SILVER, VioletCityRivalBattleApproachMovement1
	jump VioletCityRivalBattleScript
	
.skip:
	end

VioletCityRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VioletCityRivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext VioletCityRivalWinText, VioletCityRivalLossText
	setlasttalked VIOLETCITY_SILVER
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext VioletCityRivalWinText, VioletCityRivalLossText
	setlasttalked VIOLETCITY_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext VioletCityRivalWinText, VioletCityRivalLossText
	setlasttalked VIOLETCITY_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext VioletCityRivalAfterText
	waitbutton
	closetext
	applymovement VIOLETCITY_SILVER, VioletCityRivalBattleExitMovement
	disappear VIOLETCITY_SILVER
	waitsfx
	playmapmusic
	setevent EVENT_BEAT_RIVAL_1
	end	
	
VioletCityFisher2:
	jumptextfaceplayer VioletCityFisher2Text
	
VioletCityYoungster:
	jumptextfaceplayer VioletCityYoungsterText
	
VioletCitySign:
	jumptext VioletCitySignText

VioletTutorSign:
	jumptext VioletTutorSignText

VioletCityPokecenterSign:
	jumpstd pokecentersign

VioletCityMartSign:
	jumpstd martsign

VioletCityFruitTree:
	fruittree FRUITTREE_VIOLET_CITY_1

VioletCityItemBush:
	itembush FRUITTREE_VIOLET_CITY_2
	
VioletCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION
	
VioletCityRivalBattleApproachMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VioletCityRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

VioletCityRivalWait:
	text "Hey you!"
	done
	
VioletCityRivalBeforeText:
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

VioletCityRivalWinText:
	text "Argh!"

	para "Fine. You can"
	line "challenge this gym"
	cont "before me."
	done

VioletCityRivalAfterText:
	text "…"
	done

VioletCityRivalLossText:
	text "…Humph! I knew"
	line "you were lying."
	done
	
VioletCityFisher2Text:
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
	
VioletCityYoungsterText:
	text "I visited the NAME"
	line "RATER, but he"
	cont "wouldn't change"
	cont "the name of a"
	cont "#MON I got in a"
	cont "trade."
	done
	
VioletCitySignText:
	text "RIDGE VILLAGE"

	para "Admire the"
	line "sea's majesty."
	done

VioletTutorSignText:
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

VioletCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 21,  9, VIOLET_MART, 2
	warp_event 38,  7, VIOLET_GYM, 1
	warp_event  9,  7, VIOLET_POKECENTER_1F, 1
	warp_event 15, 13, VIOLET_MOVE_TUTOR, 1
	warp_event  3, 11, GOLDENROD_NAME_RATER, 1
	warp_event 15,  3, VIOLET_WEATHER_HOUSE, 1
	warp_event  1, 15, VIOLET_TRADE_HOUSE, 1

	db 1 ; coord events
	coord_event 38, 8, -1, VioletCityRivalBattleScene1

	db 5 ; bg events
	bg_event  8, 13, BGEVENT_READ, VioletCitySign
	bg_event 16, 14, BGEVENT_READ, VioletTutorSign
	bg_event 10,  7, BGEVENT_READ, VioletCityPokecenterSign
	bg_event 22,  9, BGEVENT_READ, VioletCityMartSign
	bg_event  5,  7, BGEVENT_ITEM, VioletCityHiddenHyperPotion

	db 8 ; object events
	object_event 12, 18, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 18,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 21, 20, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityFisher2, -1
	object_event  6, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityYoungster, -1
	object_event  1, 18, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityFruitTree, -1
	object_event  1, 1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_1
	object_event  5, 9, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityItemBush, -1