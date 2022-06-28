	const_def 2 ; object constants

Route23_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_ROUTE_23_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock  6, 28, $73
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

	db 2 ; warp events
	warp_event  6, 29, ROUTE_23_HIDDEN_CAVE, 1
	warp_event 11,  3, ROUTE_23_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19, 28, BGEVENT_ITEM, Route23HiddenWaterStone

	db 2 ; object events
	object_event 27,  6, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, Route23ItemBush, -1
	object_event 27, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 4, Route23StarPiece, -1
