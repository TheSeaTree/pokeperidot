	const_def 2 ; object constants

PalerockMountainHiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_PALEROCK_MOUNTAIN_HIDDEN_CAVE_OPEN
	return

PalerockMountainHiddenCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13, 33, PALEROCK_MOUNTAIN_3F, 4
	warp_event  7,  1, SKARMORYS_DEN, 1

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events
