	const_def 2 ; object constants

SafariZoneArea3RestHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestHouse
	
.RestHouse:
	setflag ENGINE_SAFARI_REST_HOUSE
	return
	
SafariArea3RestHouseReceptionist:
	jumptextfaceplayer SafariArea3RestHouseReceptionistText
	
SafariArea3RestHousePokefan:
	jumptextfaceplayer SafariArea3RestHousePokefanText
	
SafariArea3RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 3 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done
	
SafariArea3RestHousePokefanText:
	text "WAHOO!"
	line "I did it!"
	
	para "I finally caught a"
	line "CHANSEY all of my"
	cont "own!"
	
	para "And it was green!"
	line "I've never seen one"
	cont "like that."
	done

SafariZoneArea3RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_3, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_3, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea3RestHouseReceptionist, -1
	object_event  3,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea3RestHousePokefan, -1
