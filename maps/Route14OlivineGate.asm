	const_def 2 ; object constants

Route14OlivineGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route14OlivineGateOfficerScript:
	jumptext Route14OlivineGateOfficerText
	
Route14OlivineGateOfficerText:
	text "Beyond this gate"
	line "is RUGOSA COAST."
	
	para "I wish I could"
	line "spend some time at"
	cont "the beach, but I"
	cont "have to stand"
	cont "guard all day."
	done

Route14OlivineGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_14, 2
	warp_event  0,  5, ROUTE_14, 3
	warp_event  9,  4, OLIVINE_CITY, 1
	warp_event  9,  5, OLIVINE_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route14OlivineGateOfficerScript, -1
