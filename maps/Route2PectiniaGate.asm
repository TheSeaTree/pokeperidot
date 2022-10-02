	const_def 2 ; object constants

Route2PectiniaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2PectiniaGateOfficerScript:
	jumptextfaceplayer Route2PectiniaGateOfficerText

Route2PectiniaGateCooltrainerFScript:
	jumptextfaceplayer Route2PectiniaGateCooltrainerFText

Route2PectiniaGateOfficerText:
	text "Up ahead is"
	line "PECTINIA CITY."

	para "The GYM there is"
	line "quite friendly to"
	cont "new trainers."
	done

Route2PectiniaGateCooltrainerFText:
	text "It's amazing how"
	line "much PECTINIA CITY"
	cont "has changed in a"
	cont "short amount of"
	cont "time." 
	
	para "You might say it"
	line "evolved like a"
	cont "#MON!"
	done

Route2PectiniaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_2, 1
	warp_event  0,  5, ROUTE_2, 2
	warp_event  9,  4, PECTINIA_CITY, 6
	warp_event  9,  5, PECTINIA_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2PectiniaGateOfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2PectiniaGateCooltrainerFScript, -1
