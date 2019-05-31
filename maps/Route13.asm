	const_def 2 ; object constants

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route13FruitTree:
	fruittree FRUITTREE_ROUTE_13

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 31, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13FruitTree, -1
