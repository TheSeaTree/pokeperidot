	const_def 2 ; object constants
	const Route4PectiniaGATE_OFFICER
	const Route4PectiniaGATE_COOLTRAINER_F

Route4PectiniaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route4PectiniaGateOfficerScript:
	jumptextfaceplayer Route4PectiniaGateOfficerText

Route4PectiniaGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

Route4PectiniaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, PECTINIA_CITY, 9
	warp_event  0,  5, PECTINIA_CITY, 10
	warp_event  9,  4, ROUTE_4, 7
	warp_event  9,  5, ROUTE_4, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4PectiniaGateOfficerScript, -1
