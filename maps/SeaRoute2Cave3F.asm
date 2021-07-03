	const_def 2 ; object constants
	
SeaRoute2Cave3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SeaRoute2Cave3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 23, SEA_ROUTE_2_CAVE_OUTSIDE, 2
	warp_event 11, 17, SEA_ROUTE_2_CAVE_3F, 3
	warp_event  3,  9, SEA_ROUTE_2_CAVE_3F, 2
	warp_event  8,  5, LOST_LAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
