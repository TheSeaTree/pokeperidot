	const_def 2 ; object constants
	const ROUTE1CHERRYGROVEGATE_OFFICER

Route1CherrygroveGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route1CherrygroveGateOfficerScript:
	jumptextfaceplayer Route1CherrygroveGateOfficerText

Route1CherrygroveGateOfficerText:
	text "You're from JOHTO,"
	line "aren't you?"

	para "How do you like"
	line "KANTO? It's nice,"
	cont "don't you agree?"
	done

Route1CherrygroveGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_1, 2
	warp_event  5,  0, ROUTE_1, 3
	warp_event  4,  7, CHERRYGROVE_CITY, 2
	warp_event  5,  7, CHERRYGROVE_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1CherrygroveGateOfficerScript, -1
