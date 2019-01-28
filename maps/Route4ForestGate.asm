	const_def 2 ; object constants
	const ROUTE4FORESTGATE_OFFICER

Route4ForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route4ForestGateOfficerScript:
	jumptextfaceplayer Route4ForestGateOfficerText


Route4ForestGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

Route4ForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_4, 3
	warp_event  0,  5, ROUTE_4, 4
	warp_event  9,  4, EAST_FOREST, 1
	warp_event  9,  5, EAST_FOREST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4ForestGateOfficerScript, -1
