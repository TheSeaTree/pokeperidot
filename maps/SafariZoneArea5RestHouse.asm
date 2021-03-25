	const_def 2 ; object constants

SafariZoneArea5RestHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestHouse
	
.RestHouse:
	setflag ENGINE_SAFARI_REST_HOUSE
	return
	
SafariArea5RestHouseReceptionist:
	jumptextfaceplayer SafariArea5RestHouseReceptionistText
	
SafariArea5RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 5 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done

SafariZoneArea5RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_5, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_5, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea5RestHouseReceptionist, -1
