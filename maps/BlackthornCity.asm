	const_def 2 ; object constants

BlackthornCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 39, 13, ROUTE_20, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	