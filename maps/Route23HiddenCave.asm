	const_def 2 ; object constants

Route23HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_ROUTE_21_HIDDEN_CAVE_OPEN
	return

Route23HiddenCaveLightBuoy:
	itemball LIGHT_BUOY

Route23HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_21, 1

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route23HiddenCaveLightBuoy, EVENT_ROUTE_21_HIDDEN_CAVE_LIGHT_BUOY