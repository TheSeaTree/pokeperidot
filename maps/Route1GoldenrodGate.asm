	const_def 2 ; object constants
	const ROUTE1GOLDENRODGATE_OFFICER
	const ROUTE1GOLDENRODGATE_YOUNGSTER

Route1GoldenrodGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route1GoldenrodOfficerScript:
	jumptextfaceplayer Route1GoldenrodOfficerText

Route1GoldenrodYoungsterScript:
	jumptextfaceplayer Route1GoldenrodYoungsterText

Route1GoldenrodOfficerText:
	text "Have you ever seen"
	line "a #MON EGG?"
	
	para "Nobody knows where"
	line "they come from."
	
	para "I have my own the-"
	line "ories, though."
	done

Route1GoldenrodYoungsterText:
	text "I was so close to"
	line "catching a NATU,"
	cont "but then it used"
	cont "TELEPORT…"
	done

Route1GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, GOLDENROD_CITY, 6
	warp_event  5,  0, GOLDENROD_CITY, 7
	warp_event  4,  7, ROUTE_1, 4
	warp_event  5,  7, ROUTE_1, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route1GoldenrodOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route1GoldenrodYoungsterScript, -1
