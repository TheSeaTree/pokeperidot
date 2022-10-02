	const_def 2 ; object constants

SafariZoneArea5RestHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SafariArea5RestHouseReceptionist:
	jumptextfaceplayer SafariArea5RestHouseReceptionistText

SafariArea5RestHouseYoungster:
	jumptextfaceplayer SafariArea5RestHouseYoungsterText

SafariArea5RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 5 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done

SafariArea5RestHouseYoungsterText:
	text "This AREA must've"
	line "just opened up."
	
	para "I'm gonna be the"
	line "first one to catch"
	cont "all of the rare"
	cont "#MON here!"
	done

SafariZoneArea5RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_5, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_5, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea5RestHouseReceptionist, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea5RestHouseYoungster, -1
