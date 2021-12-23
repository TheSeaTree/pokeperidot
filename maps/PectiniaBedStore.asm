	const_def 2 ; object constants

PectiniaBedStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaBedStoreBeauty:
	jumptextfaceplayer PectiniaBedStoreBeautyText
	
PectiniaBedStoreBeautyText:
	text "I really need to"
	line "get a new bed be-"
	cont "fore I leave."
	
	para "I'm just so- yawn…"
	line "…tired."
	done

PectiniaBedStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, PECTINIA_MALL, 4
	warp_event  7,  5, PECTINIA_MALL, 4

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  1, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaBedStoreBeauty, -1
	object_event 10,  4, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
