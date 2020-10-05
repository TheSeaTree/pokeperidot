	const_def 2 ; object constants

Route7Cave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7Cave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 17, ROUTE_7, 1
	warp_event  7, 11, ROUTE_7, 2
	warp_event  9,  7, ROUTE_7_CAVE_B1F, 1
	warp_event 19,  3, ROUTE_7_CAVE_B1F, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
