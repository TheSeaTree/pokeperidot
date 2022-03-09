	const_def 2 ; object constants

Route28_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route28Sign:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .Construction
	jumptext Route28SignText

.Construction
	jumptext Route28ConstructionSignText

Route28SignText:
	text "ROUTE 22"
	done

Route28ConstructionSignText:
	text "ROUTE 22"
	
	para "Temporarily"
	line "blocked due to"
	cont "landslide."
	done

Route28_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 17,  5, ROUTE_28, 1 ;  Mewtwo forest

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 29, BGEVENT_READ, Route28Sign

	db 4 ; object events
	object_event 15, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
