	const_def 2 ; object constants
	
PalerockMountainWaterfallChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainWaterfallChamberMaxRepel:
	itemball MAX_REPEL

PalerockMountainWaterfallChamberHPUp:
	itemball HP_UP

PalerockMountainWaterfallChamberBigPearl:
	itemball BIG_PEARL

Route18HiddenCave1FHiddenCarbos:
	hiddenitem CARBOS, EVENT_PALEROCK_WATERFALL_HIDDEN_CARBOS

Route18HiddenCave1FHiddenPPUp:
	hiddenitem PP_UP, EVENT_PALEROCK_WATERFALL_HIDDEN_PP_UP

PalerockMountainWaterfallChamberBoulder:
	jumpstd strengthboulder

PalerockMountainWaterfallChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 21, 19, PALEROCK_MOUNTAIN_B3, 3
	warp_event 11,  5, PALEROCK_MOUNTAIN_B2, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 21, BGEVENT_ITEM, Route18HiddenCave1FHiddenPPUp
	bg_event  7,  7, BGEVENT_ITEM, Route18HiddenCave1FHiddenCarbos

	db 4 ; object events
	object_event 23, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainWaterfallChamberBoulder, -1
	object_event 25, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainWaterfallChamberMaxRepel, EVENT_PALEROCK_WATERFALL_MAX_REPEL
	object_event 24, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainWaterfallChamberHPUp, EVENT_PALEROCK_WATERFALL_HP_UP
	object_event  6, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainWaterfallChamberBigPearl, EVENT_PALEROCK_WATERFALL_BIG_PEARL
