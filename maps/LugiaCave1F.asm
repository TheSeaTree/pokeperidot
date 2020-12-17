	const_def 2 ; object constants

LugiaCave1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenWall
	
.OpenWall:
	setevent EVENT_SEA_ROUTE_5_HIDDEN_CAVE_OPEN
	return

LugiaCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, SEA_ROUTE_5, 3
	warp_event  3,  3, LUGIA_CAVE_B1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
