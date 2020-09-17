	const_def 2 ; object constants

Route4HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_ROUTE_4_HIDDEN_CAVE_OPEN
	return

Route4CaveDragonFang:
	itemball DRAGON_FANG

Route4HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_4, 7

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4CaveDragonFang, EVENT_ROUTE_4_CAVE_DRAGON_FANG