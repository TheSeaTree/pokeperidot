	const_def 2 ; object constants
	const ROUTE8FAVIAGATE_OFFICER
	const ROUTE8FAVIAGATE_SCIENTIST

Route8FaviaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route8FaviaGateOfficerScript:
	jumptextfaceplayer Route8FaviaGateOfficerText

Route8FaviaGateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_SHARE
	iftrue .gotit
	writetext Route8FaviaGateScientistText
	waitbutton
	checkflag ENGINE_MYSTICBADGE
	iffalse .nobadge
	writetext Route8FaviaGateScientistGiftText
	waitbutton
	verbosegiveitem EXP_SHARE
	iffalse .noroom
	waitbutton
	setevent EVENT_GOT_EXP_SHARE
.gotit
	writetext Route8FaviaGateScientistAfterText
	waitbutton
	closetext
	end
	
.nobadge
	jumptext Route8FaviaGateScientistNoBadgeText
	end
	
.noroom
	jumptext Route8FaviaGateScientistNoRoomText
	end

Route8FaviaGateOfficerText:
	text "Hi there!"
	
	para "Are you planning"
	line "to visit the DAY"
	cont "CARE?"
	done

Route8FaviaGateScientistText:
	text "Hello there."
	
	para "I am developing a"
	line "new kind of item"
	cont "and I would like"
	cont "to get a strong"
	cont "trainer to help"
	cont "out."
	done
	
Route8FaviaGateScientistNoBadgeText:
	text "I think someone"
	line "who is able to win"
	cont "a MYSTICBADGE from"
	cont "the FAVIA GYM will"
	cont "be the perfect"
	cont "test candidate."
	done
	
Route8FaviaGateScientistGiftText:
	text "Oh my! Is that a"
	line "MYSTICBADGE?"
	
	para "You simply must"
	line "assist me in the"
	cont "development of"
	cont "this item!"
	done
	
Route8FaviaGateScientistNoRoomText:
	text "Please make some"
	line "room in your PACK"
	cont "before I give you"
	cont "this item."
	
	para "It's very delicate"
	line "equipment, and I"
	cont "would hate to see"
	cont "it break."
	done
	
Route8FaviaGateScientistAfterText:
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

Route8FaviaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, FAVIA_TOWN, 8
	warp_event  0,  5, FAVIA_TOWN, 9
	warp_event  9,  4, ROUTE_8, 2
	warp_event  9,  5, ROUTE_8, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route8FaviaGateOfficerScript, -1
	object_event  1,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route8FaviaGateScientistScript, -1
