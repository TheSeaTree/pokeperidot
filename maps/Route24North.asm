	const_def 2 ; object constants

Route24North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24NorthFruitTree:
	fruittree FRUITTREE_ROUTE_24_NORTH

Route24NorthElixer:
	itemball ELIXER

Route24NorthHiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_ROUTE_24_HIDDEN_BRICK_PIECE

Route24NorthHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_24_HIDDEN_ULTRA_BALL

Route24NorthHiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_ROUTE_24_HIDDEN_GOLD_LEAF

Route24North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 18,  5, ROUTE_24_NORTH, 1 ; Entei Cave
	warp_event  8,  9, ROUTE_24_NORTH, 2 ; Hidden Cave

	db 0 ; coord events

	db 3 ; bg events
	bg_event 15, 19, BGEVENT_ITEM, Route24NorthHiddenBrickPiece
	bg_event 32, 21, BGEVENT_ITEM, Route24NorthHiddenUltraBall
	bg_event  6, 23, BGEVENT_ITEM, Route24NorthHiddenGoldLeaf

	db 2 ; object events
	object_event 32, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, Route24NorthFruitTree, -1
	object_event 29, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, Route24NorthElixer, EVENT_ROUTE_24_ELIXER
