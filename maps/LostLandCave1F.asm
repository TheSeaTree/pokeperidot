	const_def 2 ; object constants
	
LostLandCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LostLandCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12,  7, LOST_LAND, 2
	warp_event  8, 17, LOST_LAND, 3
	warp_event 20, 13, LOST_LAND_CAVE_B1F, 1
	warp_event  3, 21, LOST_LAND_CAVE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
