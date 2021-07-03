	const_def 2 ; object constants
	
SeaRoute2Cave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SeaRoute2Cave2FBoulder:
	jumpstd strengthboulder

SeaRoute2Cave2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 27, SEA_ROUTE_2_CAVE, 1
	warp_event 33, 13, SEA_ROUTE_2_CAVE_OUTSIDE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 26, 20, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeaRoute2Cave2FBoulder, -1
