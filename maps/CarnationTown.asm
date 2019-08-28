	const_def 2 ; object constants

CarnationTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_CARNATION
	return

CarnationTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 27,  6, ROUTE_18, 4
	warp_event 27,  7, ROUTE_18, 5
	warp_event 13, 19, BLACKTHORN_CITY, 1
	warp_event 14, 19, BLACKTHORN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	