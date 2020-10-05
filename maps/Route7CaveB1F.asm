	const_def 2 ; object constants

Route7CaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_KINGERS_DEN_OPEN
	iffalse .skip
	changeblock 18, 10, $13
.skip
	return

Route7CaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 17,  5, ROUTE_7_CAVE_1F, 3
	warp_event 35, 17, ROUTE_7_CAVE_1F, 4
	warp_event  9, 13, ROUTE_7_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_7_CAVE_B1F, 3
	warp_event 19, 11, KINGLERS_DEN, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
