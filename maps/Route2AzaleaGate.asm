	const_def 2 ; object constants
	const Route2AzaleaGATE_OFFICER
	const Route2AzaleaGATE_COOLTRAINER_F

Route2AzaleaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2AzaleaGateOfficerScript:
	jumptextfaceplayer Route2AzaleaGateOfficerText

Route2AzaleaGateCooltrainerFScript:
	jumptextfaceplayer Route2AzaleaGateCooltrainerFText

Route2AzaleaGateOfficerText:
	text "Up ahead is"
	cont "PECTINIA CITY."

	para "The GYM there is"
	line "quite friendly to"
	cont "new trainers."
	done

Route2AzaleaGateCooltrainerFText:
	text "It's amazing how"
	line "much PECTINIA CITY"
	cont "has changed in a"
	cont "short amount of"
	cont "time." 
	
	para "You might say it"
	line "evolved like a"
	cont "#MON!"
	done

Route2AzaleaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_2, 1
	warp_event  0,  5, ROUTE_2, 2
	warp_event  9,  4, AZALEA_TOWN, 6
	warp_event  9,  5, AZALEA_TOWN, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2AzaleaGateOfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2AzaleaGateCooltrainerFScript, -1
