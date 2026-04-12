	const_def 2 ; object constants
	
PalerockMountainB2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainB2RareCandy:
	itemball RARE_CANDY

PalerockMountainB2HiddenCarbos:
	hiddenitem CARBOS, EVENT_PALEROCK_MOUNTAIN_B2_HIDDEN_CARBOS

PalerockMountainB2HiddenXSpeed:
	hiddenitem X_SPEED, EVENT_PALEROCK_MOUNTAIN_B2_HIDDEN_X_SPEED

PalerockMountainB2HiddenNugget:
	hiddenitem NUGGET, EVENT_PALEROCK_MOUNTAIN_B2_HIDDEN_NUGGET

PalerockMountainB2Boulder:
	jumpstd strengthboulder

PalerockMountainB2Rock:
	jumpstd smashrock

PalerockMountainB2_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 19,  3, PALEROCK_MOUNTAIN_B3, 1
	warp_event 13, 19, PALEROCK_MOUNTAIN_B1, 3
	warp_event  5, 35, PALEROCK_MOUNTAIN_B1, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7, 29, BGEVENT_ITEM, PalerockMountainB2HiddenCarbos
	bg_event  9, 32, BGEVENT_ITEM, PalerockMountainB2HiddenXSpeed
	bg_event  9,  6, BGEVENT_ITEM, PalerockMountainB2HiddenNugget

	db 7 ; object events
	object_event 16, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB2RareCandy, EVENT_PALEROCK_MOUNTAIN_B2F_RARE_CANDY
	object_event  5, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
	object_event  4, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
	object_event  7,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
	object_event  6, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
	object_event  5, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Boulder, -1
	object_event  5, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB2Rock, -1
