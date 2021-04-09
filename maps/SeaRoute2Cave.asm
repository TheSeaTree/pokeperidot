	const_def 2 ; object constants
	
SeaRoute2Cave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeaRoute2Cave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 32,  7, LOST_LAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
