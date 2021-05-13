	const_def 2 ; object constants
	const ROUTE22CAVEB2F_POKEFAN

Route22CaveB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .OpenCave
	
.OpenCave:
	checkevent EVENT_ENTEI_HIDDEN_CAVE_OPEN
	iffalse .end
	changeblock 8, 2, $13
.end
	return
	
TrainerFirebreatherRoger:
	trainer FIREBREATHER, ROGER, EVENT_BEAT_FIREBREATHER_ROGER, FirebreatherRogerText, FirebreatherRogerWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherRogerAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerEve:
	trainer COOLTRAINERF, EVE, EVENT_BEAT_COOLTRAINER_EVE, CooltrainerEveText, CooltrainerEveWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerEveAfterText
	waitbutton
	closetext
	end
	
Route22CaveB2FRoarGuy:
	checkevent EVENT_GOT_TM_ROAR
	iftrue .GotRoar
	opentext
	writetext RoarGuyRoar
	earthquake 12
	cry TYRANITAR
	waitsfx
	closetext
	showemote EMOTE_SHOCK, ROUTE22CAVEB2F_POKEFAN, 15
	faceplayer
	opentext
	iftrue .GotRoar
	writetext RoarGuyText
	waitbutton
	verbosegiveitem TM_ROAR
	setevent EVENT_GOT_TM_ROAR
	jump .ExplainRoar
.GotRoar
	faceplayer
	opentext
.ExplainRoar
	writetext RoarExplainText
	waitbutton
	closetext
	end

Route22CaveB2FCharcoal:
	itemball CHARCOAL

Route22CaveB2FKingsRock:
	itemball KINGS_ROCK

Route22CaveB2FNugget:
	itemball NUGGET

Route22CaveHiddenXSpDef:
	hiddenitem X_SP_DEF, EVENT_ROUTE_22_CAVE_HIDDEN_X_SP_DEF

Route22CaveHiddenPPUp:
	hiddenitem PP_UP, EVENT_ROUTE_22_CAVE_HIDDEN_PP_UP

Route22CaveHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_22_CAVE_HIDDEN_ULTRA_BALL

Route22CaveB2FBoulder:
	jumpstd strengthboulder
	
Route22CaveB2FRock:
	jumpstd smashrock
	
FirebreatherRogerText:
	text "Ah! Fresh meat for"
	line "the grill!"
	done
	
FirebreatherRogerWinText:
	text "Once again, my"
	line "eyes were bigger"
	cont "than my stomach."
	done
	
FirebreatherRogerAfterText:
	text "As you can tell,"
	line "I like my meat"
	cont "well-done."
	done

CooltrainerEveText:
	text "The magma isn't"
	line "the hottest thing"
	cont "in this cave, I"
	cont "assure you."
	done

CooltrainerEveWinText:
	text "The command over"
	line "your #MON is"
	cont "quite admirable."
	done
	
CooltrainerEveAfterText:
	text "I'll be better"
	line "prepared the next"
	cont "time a kid like"
	cont "you shows up in"
	cont "these parts."
	done

RoarGuyRoar:
	text "RRRRROOAR!"
	done
	
RoarGuyText:
	text "Oh! You scared me!"
	
	para "I come here to let"
	line "out some stress"
	cont "and learn to"
	cont "assert myself."
	
	para "Hardly anyone can"
	line "make it down in"
	cont "this cavern, so I"
	cont "don't have to make"
	cont "a fool of myself."
	
	para "…Most days, at"
	line "least."
	
	para "Anyway, I have no"
	line "longer have a need"
	cont "for this TM, so"
	cont "you can have it."
	done

RoarExplainText:
	text "That move is ROAR."
	
	para "Any #MON that"
	line "hears the terrible"
	cont "roar will surely"
	cont "be too frightened"
	cont "to continue fight-"
	cont "ing."
	
	para "It even works"
	line "against #MON"
	cont "other trainers"
	cont "have tamed!"
	done

Route22CaveB2F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 13, 21, ROUTE_22_CAVE_B1F, 2
	warp_event 19,  5, ROUTE_22_CAVE_B1F, 3
	warp_event 21, 19, ROUTE_22_CAVE_B1F, 4
	warp_event 27,  9, ROUTE_22_CAVE_B1F, 5
	warp_event 29, 21, ROUTE_22_CAVE_B1F, 7
	warp_event 31, 15, ROUTE_22_CAVE_B1F, 8
	warp_event  9,  3, ENTEI_CAVE_1F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 35, 36, BGEVENT_ITEM, Route22CaveHiddenXSpDef
	bg_event 17, 38, BGEVENT_ITEM, Route22CaveHiddenUltraBall
	bg_event 26,  4, BGEVENT_ITEM, Route22CaveHiddenPPUp

	db 10 ; object events
	object_event  7, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherRoger, -1
	object_event 26,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerEve, -1
	object_event 32, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route22CaveB2FRoarGuy, -1
	object_event 30, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22CaveB2FCharcoal, EVENT_ROUTE_22_CAVE_B2F_CHARCOAL
	object_event 32, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22CaveB2FKingsRock, EVENT_ROUTE_22_CAVE_B2F_KINGS_ROCK
	object_event 24, 39, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22CaveB2FNugget, EVENT_ROUTE_22_CAVE_B2F_NUGGET
	object_event 27, 38, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22CaveB2FBoulder, -1
	object_event 29, 35, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22CaveB2FBoulder, -1
	object_event 28, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22CaveB2FBoulder, -1
	object_event 32, 34, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22CaveB2FRock, -1
