	const_def 2 ; object constants

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route18_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 28, 35, ROUTE_14, 4
	warp_event 27, 35, ROUTE_14, 4
	warp_event 27,  3, SAFARI_ZONE_GATE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
