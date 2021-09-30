	const_def 2 ; object constants

Route23_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_ROUTE_23_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock  6, 58, $73
.skip
	return

Route23ItemBush:
	itembush FRUITTREE_ROUTE_23

Route23StarPiece:
	itemball STAR_PIECE

Route23HiddenWaterStone:
	hiddenitem WATER_STONE, EVENT_ROUTE_23_HIDDEN_WATER_STONE

Route23_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 25, ROUTE_23_HIDDEN_CAVE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19, 24, BGEVENT_ITEM, Route23HiddenWaterStone

	db 2 ; object events
	object_event 25,  2, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, Route23ItemBush, -1
	object_event 25,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, Route23StarPiece, -1
