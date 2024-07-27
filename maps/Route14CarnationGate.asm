	const_def 2 ; object constants

Route14CarnationGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route14CarnationGateOfficerScript:
	jumptext Route14CarnationGateOfficerText
	
Route14CarnationGateOfficerText:
	text "While you're in"
	line "CARNATION TOWN,"
	cont "please check out"
	cont "the FLOWER SHOP."
	
	para "My wife owns it!"
	done

Route14CarnationGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, CARNATION_TOWN, 1
	warp_event  0,  5, CARNATION_TOWN, 2
	warp_event  9,  4, ROUTE_14, 3
	warp_event  9,  5, ROUTE_14, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route14CarnationGateOfficerScript, -1
