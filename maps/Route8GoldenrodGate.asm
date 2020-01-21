	const_def 2 ; object constants
	const ROUTE8GOLDENRODGATE_OFFICER
	const ROUTE8GOLDENRODGATE_SCIENTIST

Route8GoldenrodGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route8GoldenrodGateOfficerScript:
	jumptextfaceplayer Route8GoldenrodGateOfficerText

Route8GoldenrodGateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_SHARE
	iftrue .gotit
	writetext Route8GoldenrodGateScientistText
	waitbutton
	checkflag ENGINE_PLAINBADGE
	iffalse .nobadge
	writetext Route8GoldenrodGateScientistGiftText
	waitbutton
	verbosegiveitem EXP_SHARE
	iffalse .noroom
	waitbutton
	setevent EVENT_GOT_EXP_SHARE
.gotit
	writetext Route8GoldenrodGateScientistAfterText
	waitbutton
	closetext
	end
	
.nobadge
	jumptext Route8GoldenrodGateScientistNoBadgeText
	end
	
.noroom
	jumptext Route8GoldenrodGateScientistNoRoomText
	end

Route8GoldenrodGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

Route8GoldenrodGateScientistText:
	text "Hello there."
	
	para "I am developing a"
	line "new kind of item"
	cont "and I would like"
	cont "to get a strong"
	cont "trainer to help"
	cont "out."
	done
	
Route8GoldenrodGateScientistNoBadgeText:
	text "I think someone"
	line "who is able to win"
	cont "a MYSTICBADGE from"
	cont "the FAVIA GYM will"
	cont "be the perfect"
	cont "test candidate."
	done
	
Route8GoldenrodGateScientistGiftText:
	text "Oh my! Is that a"
	line "MYSTICBADGE?"
	
	para "You simply must"
	line "assist me in the"
	cont "development of"
	cont "this item!"
	done
	
Route8GoldenrodGateScientistNoRoomText:
	text "Please make some"
	line "room in your PACK"
	cont "before I give you"
	cont "this item."
	
	para "It's very delicate"
	line "equipment, and I"
	cont "would hate to see"
	cont "it break."
	done
	
Route8GoldenrodGateScientistAfterText:
	text "If you allow one"
	line "of your #MON to"
	cont "hold my EXP.SHARE,"
	cont "it will grow"
	cont "stronger without"
	cont "needing to battle"
	cont "itself."
	
	para "It is quite the"
	line "marvelous little"
	cont "device, I think!"
	done

Route8GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, GOLDENROD_CITY, 8
	warp_event  0,  5, GOLDENROD_CITY, 9
	warp_event  9,  4, ROUTE_8, 2
	warp_event  9,  5, ROUTE_8, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route8GoldenrodGateOfficerScript, -1
	object_event  1,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route8GoldenrodGateScientistScript, -1
