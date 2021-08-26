	const_def 2 ; object constants
	
LostLandHiddenCave1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_LOST_LAND_HIDDEN_CAVE_OPEN
	return

LostLandHiddenCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 14,  9, LOST_LAND, 4
	warp_event  3,  3, LOST_LAND_HIDDEN_CAVE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
