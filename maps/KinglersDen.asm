	const_def 2 ; object constants

KinglersDen_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_KINGERS_DEN_OPEN
	return

KinglersDen_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_7_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event  5,  3, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_KINGERS_DEN_DEFEATED