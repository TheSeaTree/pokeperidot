	const_def 2 ; object constants

EnteiCave1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_ENTEI_CAVE_OPEN
	return

EnteiCave1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 13, ORCHID_CITY, 5 ; Out to city
	warp_event 14,  7, ENTEI_CAVE_B1F, 1
	warp_event  4,  3, ENTEI_CAVE_B1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
