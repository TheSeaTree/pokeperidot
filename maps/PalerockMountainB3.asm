	const_def 2 ; object constants
	
PalerockMountainB3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainB3Boulder:
	jumpstd strengthboulder

PalerockMountainB3_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  11,  5, PALEROCK_CAVE_B2F, 1
	warp_event  37,  7, PALEROCK_MOUNTAIN_B1, 3
	warp_event  35, 19, PALEROCK_MOUNTAIN_WATERFALL_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 12, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB3Boulder, -1
	object_event 13, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB3Boulder, -1
