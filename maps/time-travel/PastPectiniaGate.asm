	const_def 2 ; object constants

PastPectiniaGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RemoveComputer

.RemoveComputer
	changeblock 0, 2, $92
	return

PastPectiniaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, PAST_ROUTE_3, 1
	warp_event  5,  0, PAST_ROUTE_3, 2
	warp_event  4,  7, PAST_PECTINIA_CITY, 4
	warp_event  5,  7, PAST_PECTINIA_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
