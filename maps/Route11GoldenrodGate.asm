	const_def 2 ; object constants
	const ROUTE11GOLDENRODGATE_OFFICER

Route11GoldenrodGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route11GoldenrodGateOfficerScript:
	jumptextfaceplayer Route11GoldenrodGateOfficerText

Route11GoldenrodGateOfficerText:
	text "You're from JOHTO,"
	line "aren't you?"

	para "How do you like"
	line "KANTO? It's nice,"
	cont "don't you agree?"
	done

Route11GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_11, 1
	warp_event  5,  0, ROUTE_11, 2
	warp_event  4,  7, GOLDENROD_CITY, 10
	warp_event  5,  7, GOLDENROD_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11GoldenrodGateOfficerScript, -1
