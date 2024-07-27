	const_def 2 ; object constants

PalerockCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PalerockCave1FBoulder:
	jumpstd strengthboulder

PalerockCave1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  5,  5, ROUTE_8_NORTH, 3
	warp_event 21, 25, ROUTE_3, 10
	warp_event 12,  7, PALEROCK_CAVE_B1F, 1
	warp_event 19, 15, PALEROCK_CAVE_B1F, 2
	warp_event  9, 25, PALEROCK_CAVE_B1F, 3
	warp_event 15, 29, PALEROCK_CAVE_B1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  21, 19, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockCave1FBoulder, -1
