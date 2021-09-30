	const_def 2 ; object constants

Route24North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24NorthFruitTree:
	fruittree FRUITTREE_ROUTE_24_NORTH

Route24North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  5, ROUTE_24_NORTH, 1 ; Entei Cave
	warp_event  6,  9, ROUTE_24_NORTH, 2 ; Hidden Cave

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 30, 18, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, Route24NorthFruitTree, -1
	object_event 27, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
