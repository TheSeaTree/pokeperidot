	const_def 2 ; object constants
	const ROUTE8GOLDENRODGATE_OFFICER
	const ROUTE8GOLDENRODGATE_COOLTRAINER_F

Route8GoldenrodGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route8GoldenrodGateOfficerScript:
	jumptextfaceplayer Route8GoldenrodGateOfficerText

Route8GoldenrodGateCooltrainerFScript:
	jumptextfaceplayer Route8GoldenrodGateCooltrainerFText

Route8GoldenrodGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

Route8GoldenrodGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

Route8GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, GOLDENROD_CITY, 8
	warp_event  0,  5, GOLDENROD_CITY, 9
	warp_event  9,  4, ROUTE_8, 2
	warp_event  9,  5, ROUTE_8, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route8GoldenrodGateOfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8GoldenrodGateCooltrainerFScript, -1
