	const_def 2 ; object constants
	
SeaRoute2CaveOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SeaRoute2CaveOutside_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SEA_ROUTE_2_CAVE_2F, 2
	warp_event 29, 11, SEA_ROUTE_2_CAVE_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
