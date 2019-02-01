	const_def 2 ; object constants

PaintersForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PaintersForestFruitTree:
	fruittree FRUITTREE_PAINTERS_FOREST
	
PaintersForest_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  1, PAINTERS_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6, 5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PaintersForestFruitTree, -1