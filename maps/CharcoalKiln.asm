	const_def 2 ; object constants
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkflag ENGINE_MYSTICBADGE
	iffalse .NoBadge
	checkevent EVENT_GOT_TM_CUT
	iftrue .GotCut
	writetext CharcoalKilnBossText1
	buttonsound
	verbosegiveitem TM_CUT
	setevent EVENT_GOT_TM_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	end
	
.NoBadge:
	writetext Text_CharcoalMasterNoBadge
	waitbutton
	closetext
	end

.GotCut:
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	end

CharcoalKilnOddish:
	opentext
	writetext OddishText
	cry ODDISH
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd magazinebookshelf

CharcoalKilnBossText1:
	text "Ah, a fresh face!"
	
	para "ODDISH and I don't"
	line "see too many of"
	cont "those out here."
	
	para "You must be expec-"
	line "ting something for"
	cont "making it to my"
	cont "home, right?"
	
	para "It doesn't matter,"
	line "because I do have"
	cont "something for you!"
	
	para "Take it!"
	done
	
Text_CharcoalMasterNoBadge:
	text "Ah, a fresh face!"
	
	para "ODDISH and I don't"
	line "see too many of"
	cont "those out here."
	
	para "You must be expec-"
	line "ting something for"
	cont "making it to my"
	cont "home, right?"
	
	para "It just so happens"
	line "I do have some-"
	cont "thing for you!"
	
	para "…Provided you have"
	line "the MYSTICBADGE."
	
	para "Come back with one"
	line "of those, and this"
	cont "gift is all yours!"
	done
	
Text_CharcoalMasterOutro:
	text "That move there is"
	line "called CUT."
	
	para "It lands critical"
	line "hits more easily."
	
	para "That means even"
	line "#MON with"
	cont "boosted DEFENSE"
	cont "won't be able to"
	cont "block it well."
	
	para "It will also cut"
	line "some pesky trees"
	cont "that get in your"
	cont "way."
	done

OddishText:
	text "ODDISH: Neel'eet!"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_1, 5
	warp_event  3,  7, ROUTE_1, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, -1
	object_event  5,  6, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnOddish, -1
