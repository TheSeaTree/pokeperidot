	const_def 2 ; object constants
	
PalerockMountainB3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainB3PPUp:
	itemball PP_UP

PalerockMountainB3WaterStone:
	itemball WATER_STONE

PalerockMountainB3KingsRock:
	itemball KINGS_ROCK

PalerockMountainB3HiddenIron:
	hiddenitem IRON, EVENT_PALEROCK_MOUNTAIN_B3F_HIDDEN_IRON

PalerockMountainB3HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_PALEROCK_MOUNTAIN_B3F_HIDDEN_FULL_HEAL

PalerockMountainB3HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_PALEROCK_MOUNTAIN_B3F_HIDDEN_MAX_ETHER

PalerockMountainB3HiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_PALEROCK_MOUNTAIN_B3F_HIDDEN_STAR_PIECE

PalerockMountainB3Boulder:
	jumpstd strengthboulder

PalerockMountainB3_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  11,  5, PALEROCK_CAVE_B2F, 1
	warp_event  37,  7, PALEROCK_MOUNTAIN_B1, 3
	warp_event  35, 19, PALEROCK_MOUNTAIN_WATERFALL_CHAMBER, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 37, 20, BGEVENT_ITEM, PalerockMountainB3HiddenIron
	bg_event 23, 29, BGEVENT_ITEM, PalerockMountainB3HiddenFullHeal
	bg_event  5, 21, BGEVENT_ITEM, PalerockMountainB3HiddenMaxEther
	bg_event  4,  5, BGEVENT_ITEM, PalerockMountainB3HiddenStarPiece

	db 5 ; object events
	object_event 12, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB3Boulder, -1
	object_event 13, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB3Boulder, -1
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB3PPUp, EVENT_PALEROCK_MOUNTAIN_B3F_PP_UP
	object_event 19, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB3WaterStone, EVENT_PALEROCK_MOUNTAIN_B3F_WATER_STONE
	object_event 17,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB3KingsRock, EVENT_PALEROCK_MOUNTAIN_B3F_KINGS_ROCK
