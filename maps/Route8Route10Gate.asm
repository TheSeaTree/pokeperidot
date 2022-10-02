	const_def 2 ; object constants
	const Route8Route10GATE_OFFICER

Route8Route10Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route8Route10GateOfficerScript:
	jumptextfaceplayer Route8Route10GateOfficerText

Route8Route10GateOfficerText:
	text "PALEROCK CAVE will"
	line "take you back to"
	cont "ROUTE 3."
	done

Route8Route10Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_8, 4
	warp_event  0,  5, ROUTE_8, 5
	warp_event  9,  4, ROUTE_10_NORTH, 1
	warp_event  9,  5, ROUTE_10_NORTH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8Route10GateOfficerScript, -1
