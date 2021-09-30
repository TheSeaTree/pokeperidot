	const_def 2 ; object constants
	const ROUTE1CHERRYGROVEGATE_OFFICER

Route1PavonaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route1PavonaGateOfficerScript:
	jumptextfaceplayer Route1PavonaGateOfficerText

Route1PavonaGateOfficerText:
	text "You must be from"
	line "ELKHORN TOWN."

	para "You're starting out"
	line "on a big adven-"
	cont "ture, aren't you?"
	done

Route1PavonaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_1, 2
	warp_event  5,  0, ROUTE_1, 3
	warp_event  4,  7, PAVONA_VILLAGE, 2
	warp_event  5,  7, PAVONA_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1PavonaGateOfficerScript, -1
