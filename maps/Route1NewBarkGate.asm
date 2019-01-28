	const_def 2 ; object constants
	const ROUTE1NewBarkGATE_OFFICER
	const ROUTE1NewBarkGATE_YOUNGSTER

Route1NewBarkGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route1NewBarkGateOfficerScript:
	jumptextfaceplayer Route1NewBarkGateOfficerText

Route1NewBarkGateYoungsterScript:
	jumptextfaceplayer Route1NewBarkGateYoungsterText

Route1NewBarkGateOfficerText:
	text "You can't climb"
	line "ledges."

	para "But you can jump"
	line "down from them to"
	cont "take a shortcut."
	done

Route1NewBarkGateYoungsterText:
	text "Different kinds of"
	line "#MON appear"
	cont "past here."

	para "If you want to"
	line "catch them all,"

	para "you have to look"
	line "everywhere."
	done

Route1NewBarkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, NEW_BARK_TOWN, 6
	warp_event  5,  0, NEW_BARK_TOWN, 7
	warp_event  4,  7, ROUTE_1, 1
	warp_event  5,  7, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route1NewBarkGateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route1NewBarkGateYoungsterScript, -1
