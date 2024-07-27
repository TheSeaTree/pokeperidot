	const_def 2 ; object constants

PavonaOasisCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PavonaOasisCave1FBoulder:
	jumpstd strengthboulder

PavonaOasisCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 11, PAVONA_OASIS, 1
	warp_event 13,  5, PAVONA_OASIS_CAVE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  4,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  9,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  9,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  7,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  6,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
	object_event  9,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaOasisCave1FBoulder, -1
