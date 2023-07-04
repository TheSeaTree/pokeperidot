	const_def 2 ; object constants

PastRoute11Schoolhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute11Schoolhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  9, PAST_ROUTE_11, 3
	warp_event  6,  9, PAST_ROUTE_11, 3

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
