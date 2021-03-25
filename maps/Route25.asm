	const_def 2 ; object constants

Route25_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route25_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 29, HO_OH_CASTLE_1F_CENTER_ROOM, 1 ; Entei Cave
	warp_event  6, 29, HO_OH_CASTLE_1F_CENTER_ROOM, 2 ; Hidden Cave
	warp_event 25,  5, ROUTE_24, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
