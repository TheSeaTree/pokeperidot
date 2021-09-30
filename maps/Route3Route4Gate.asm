	const_def 2 ; object constants
	const ROUTE3ROUTE4GATE_OFFICER

Route3Route4Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route3Route4GateOfficerScript:
	jumptextfaceplayer Route3Route4GateOfficerText

Route3Route4GateOfficerText:
	text "Up ahead is ROUTE"
	line "4. I hope you can"
	cont "enjoy the calming"
	cont "view of the lake."
	done

Route3Route4Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_3, 6
	warp_event  0,  5, ROUTE_3, 7
	warp_event  9,  4, ROUTE_4, 1
	warp_event  9,  5, ROUTE_4, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route3Route4GateOfficerScript, -1
