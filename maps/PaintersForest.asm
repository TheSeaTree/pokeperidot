	const_def 2 ; object constants

PaintersForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PaintersForestBeautyScript:
	jumptextfaceplayer PaintersForestBeautyText

PaintersForestHiddenPalette:
	hiddenitem PALETTE, EVENT_PAINTERS_FOREST_HIDDEN_PALETTE

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

	db 1 ; bg events
	bg_event 14,  4, BGEVENT_ITEM, PaintersForestHiddenPalette

	db 2 ; object events
	object_event  6, 12, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PaintersForestBeautyScript, -1
	object_event  6,  0, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PaintersForestFruitTree, -1
