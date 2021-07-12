	const_def 2 ; object constants
	
RemnantCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RemnantCave2FBoulder:
	jumpstd strengthboulder

RemnantCave2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 27, REMNANT_CAVE_1F, 1
	warp_event 33, 13, REMNANT_CAVE_OUTSIDE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 26, 20, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RemnantCave2FBoulder, -1
