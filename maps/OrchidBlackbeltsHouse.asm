	const_def 2 ; object constants

OrchidBlackbeltsHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave

.OpenCave
	setevent EVENT_ORCHID_CITY_HIDDEN_CAVE_OPEN
	return

OrchidBackbeltsHouseGramps:
	jumptextfaceplayer OrchidBackbeltsHouseGrampsText

OrchidBlackbelt1Text:
	text "Have you heard the"
	line "legends of the"
	cont "powerful #MON"
	cont "that used to live"
	cont "here?"
	
	para "I bet it was a"
	line "FIGHTING-type!"
	done
	
OrchidBlackbelt1ShowEnteiText:
	text "No way? You caught"
	line "the GUARDIAN?"
	
	para "…And it's FIRE,"
	line "not FIGHTING-type?"
	
	para "My life has been a"
	line "lie! FIGHTING-"
	cont "types should be"
	cont "the strongest!"
	done

OrchidBackbeltsHouseGrampsText:
	text "Ehehehe!"
	
	para "I may not look"
	line "like much now, but"
	cont "I used to be quite"
	cont "the bodybuilder in"
	cont "my day."
	
	para "I still have some"
	line "fight left in me!"
	
	para "Someone has to"
	line "keep these boys in"
	cont "line!"
	done

OrchidBlackbeltsHouse_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  9, ORCHID_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 12,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidBackbeltsHouseGramps, -1
	object_event  2,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  4, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 1, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
