	const_def 2 ; object constants

Route24North_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_ROUTE_18_HIDDEN_CAVE_1_OPEN
	iffalse .checknextcave
	changeblock   8, 8, $73
.checknextcave
	checkevent EVENT_ROUTE_18_HIDDEN_CAVE_2_OPEN
	iffalse .skip
	changeblock  18, 4, $73
.skip
	return

Route24NorthFruitTree:
	fruittree FRUITTREE_ROUTE_18_NORTH

Route24NorthElixer:
	itemball ELIXER

Route24NorthHiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_ROUTE_18_HIDDEN_BRICK_PIECE

Route24NorthHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_18_HIDDEN_ULTRA_BALL

Route24NorthHiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_ROUTE_18_HIDDEN_GOLD_LEAF

Route24North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  9, ROUTE_18_HIDDEN_CAVE_1F, 1
	warp_event 18,  5, ROUTE_18_HIDDEN_CAVE_1F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 15, 19, BGEVENT_ITEM, Route24NorthHiddenBrickPiece
	bg_event 32, 21, BGEVENT_ITEM, Route24NorthHiddenUltraBall
	bg_event  6, 23, BGEVENT_ITEM, Route24NorthHiddenGoldLeaf

	db 2 ; object events
	object_event 32, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24NorthFruitTree, -1
	object_event 29, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24NorthElixer, EVENT_ROUTE_18_ELIXER
