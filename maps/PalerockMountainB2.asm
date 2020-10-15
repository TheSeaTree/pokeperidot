	const_def 2 ; object constants
	
PalerockMountainB2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainB2Boulder:
	jumpstd strengthboulder

PalerockMountainB2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  3, PALEROCK_MOUNTAIN_WATERFALL_CHAMBER, 2
	warp_event  3, 19, PALEROCK_MOUNTAIN_1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 22, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
	object_event 23, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
