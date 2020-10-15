	const_def 2 ; object constants
	
PalerockMountainWaterfallChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainWaterfallChamberBoulder:
	jumpstd strengthboulder

PalerockMountainWaterfallChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 21, 19, PALEROCK_MOUNTAIN_B3, 3
	warp_event 11,  5, PALEROCK_MOUNTAIN_B2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 22, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainWaterfallChamberBoulder, -1
	object_event 23, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainWaterfallChamberBoulder, -1
