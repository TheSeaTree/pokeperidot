	const_def 2 ; object constants
	const ROUTE1FAVIAGATE_OFFICER
	const ROUTE1FAVIAGATE_YOUNGSTER

Route1FaviaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route1FaviaOfficerScript:
	jumptextfaceplayer Route1FaviaOfficerText

Route1FaviaYoungsterScript:
	jumptextfaceplayer Route1FaviaYoungsterText

Route1FaviaOfficerText:
	text "Have you ever seen"
	line "a #MON EGG?"
	
	para "Nobody knows where"
	line "they come from."
	
	para "I have my own the-"
	line "ories, though."
	done

Route1FaviaYoungsterText:
	text "I was so close to"
	line "catching a NATU,"
	cont "but then it used"
	cont "TELEPORT…"
	done

Route1FaviaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, FAVIA_TOWN, 6
	warp_event  5,  0, FAVIA_TOWN, 7
	warp_event  4,  7, ROUTE_1, 4
	warp_event  5,  7, ROUTE_1, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route1FaviaOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route1FaviaYoungsterScript, -1
