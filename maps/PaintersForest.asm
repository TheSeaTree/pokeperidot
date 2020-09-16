	const_def 2 ; object constants

PaintersForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PaintersForestBeautyScript:
	jumptextfaceplayer PaintersForestBeautyText

PaintersForestFruitTree:
	fruittree FRUITTREE_PAINTERS_FOREST
	
PaintersForestBeautyText:
	text "Do you know about"
	line "SMEARGLE?"
	
	para "They say it can"
	line "learn every single"
	cont "#MON move!"
	
	para "I'm trying to find"
	line "one for myself. I"
	cont "bet it's really"
	cont "powerful!"
	done

PaintersForest_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  5, PAINTERS_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5, 13, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PaintersForestBeautyScript, -1
	object_event  6,  0, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PaintersForestFruitTree, -1
