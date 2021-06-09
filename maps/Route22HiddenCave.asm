	const_def 2 ; object constants

Route22HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_ROUTE_22_HIDDEN_CAVE_OPEN
	return

Route22SouthSabreFossil:
	itemball SABRE_FOSSIL

Route22HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7, 13, ROUTE_22_SOUTH, 3

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event  7,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22SouthSabreFossil, EVENT_ROUTE_22_SABRE_FOSSIL
