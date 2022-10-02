	const_def 2 ; object constants

Route8HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_ROUTE_8_HIDDEN_CAVE_OPEN
	return

Route8HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_8, 7

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events
