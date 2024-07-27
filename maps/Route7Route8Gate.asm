	const_def 2 ; object constants
	const ROUTE7ROUTE8GATE_OFFICER

Route7Route8Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7Route8GateOfficerScript:
	jumptextfaceplayer Route7Route8OfficerText

Route7Route8OfficerText:
	text "PALEROCK CAVE will"
	line "take you back to"
	cont "ROUTE 3."
	done

Route7Route8Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_7, 4
	warp_event  0,  5, ROUTE_7, 5
	warp_event  9,  4, ROUTE_8, 1
	warp_event  9,  5, ROUTE_8, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7Route8GateOfficerScript, -1
