	const_def 2 ; object constants
	const ROUTE4_COOLTRAINER_F
	const ROUTE4_SCIENTIST

Route4_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.SmashWall:
	checkevent EVENT_ROUTE_4_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock  6, 26, $73
.skip
	return

TrainerLassMelissa:
	trainer LASS, MELISSA, EVENT_BEAT_LASS_MELISSA, LassMelissaText, LassMelissaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMelissaWinText
	waitbutton
	closetext
	end

TrainerLadLawrence:
	trainer LAD, LAWRENCE, EVENT_BEAT_LAD_LAWRENCE, LadLawrenceText, LadLawrenceWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadLawrenceAfterText
	waitbutton
	closetext
	end

HerbSaleswoman:
	faceplayer
	opentext
	pokemart MARTTYPE_HERBS, MART_UNDERGROUND
	closetext
	end

Route4HPUp:
	itemball HP_UP

Route4UltraBall:
	itemball ULTRA_BALL

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL
	
Route4Rock:
	jumpstd smashrock
	
LassMelissaText:
	text "My #MON are the"
	line "most loyal!"
	done
	
LassMelissaWinText:
	text "We weren't"
	line "prepared for some-"
	cont "one as strong as"
	cont "you."
	done
	
LassMelissaAfterText:
	text "My #MON may be"
	line "loyal, but they"
	cont "were no match for"
	cont "you."
	done

LadLawrenceText:
	text "Stop!"
	line "Finders, keepers!"
	done
	
LadLawrenceWinText:
	text "Losers, weepers…"
	done
	
LadLawrenceAfterText:
	text "I was going to use"
	line "that ULTRA BALL to"
	cont "catch the last"
	cont "#MON I needed"
	cont "on this route."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  8,  12, ROUTE_3_ROUTE_4_GATE, 3
	warp_event  8,  13, ROUTE_3_ROUTE_4_GATE, 4
	warp_event 43,  14, ROUTE_4_FOREST_GATE, 1
	warp_event 43,  15, ROUTE_4_FOREST_GATE, 2
	warp_event  4,  46, ROUTE_4_PECTINIA_GATE, 3
	warp_event  4,  47, ROUTE_4_PECTINIA_GATE, 4
	warp_event  6,  27, ROUTE_4_HIDDEN_CAVE, 1
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 20, 23, BGEVENT_ITEM, Route4HiddenUltraBall

	db 8 ; object events
	object_event 17,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerLassMelissa, -1
	object_event 31, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLadLawrence, -1
	object_event 38, 39, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HerbSaleswoman, -1
	object_event 31, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4UltraBall, EVENT_ROUTE_4_ULTRA_BALL
	object_event 30, 45, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
	object_event  8, 28, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4Rock, -1
	object_event  7, 30, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4Rock, -1
	object_event 12, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4Rock, -1
