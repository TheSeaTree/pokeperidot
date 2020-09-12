gam	const_def 2 ; object constants

MahoganyGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGateOfficerScript:
	jumptext MahoganyGateOfficerText
	
MahoganyGateOfficerText:
	text "RUGOSA CITY is"
	line "ahead."
	
	para "The city attracts"
	line "a lot of tourism"
	cont "from people who"
	cont "want to meet"
	cont "future #MON"
	cont "LEAGUE CHAMPIONS."
	done

MahoganyGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, MAHOGANY_TOWN, 1
	warp_event  5,  0, MAHOGANY_TOWN, 2
	warp_event  4,  7, OLIVINE_CITY, 3
	warp_event  5,  7, OLIVINE_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyGateOfficerScript, -1
