	const_def 2 ; object constants

Route11FaviaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route11FaviaGateOfficerScript:
	jumptextfaceplayer Route11FaviaGateOfficerText

Route11FaviaGateOfficerText:
	text "There are rumors"
	line "of a haunted house"
	cont "on ROUTE 11."

	para "You don't believe"
	line "in any of that"
	cont "nonsense, do you?"
	done

Route11FaviaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_11, 1
	warp_event  5,  0, ROUTE_11, 2
	warp_event  4,  7, FAVIA_TOWN, 10
	warp_event  5,  7, FAVIA_TOWN, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11FaviaGateOfficerScript, -1
