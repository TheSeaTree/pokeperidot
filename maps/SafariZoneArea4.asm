	const_def 2 ; object constants

SafariZoneArea4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneTMLeechLife:
	itemball TM_LEECH_LIFE

SafariZoneArea4Sign:
	jumptext SafariZoneArea4SignText
	
SafariZoneArea4RestHouseSign:
	jumptext SafariZoneArea4RestHouseSignText
	
SafariZoneArea4SignText:
	text "SAFARI ZONE-"
	line "AREA 4"
	done
	
SafariZoneArea4RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea4_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  1,  5, SAFARI_ZONE_AREA_4_REST_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 23, BGEVENT_READ, SafariZoneArea4Sign
	bg_event  2,  6, BGEVENT_READ, SafariZoneArea4RestHouseSign

	db 1 ; object events
	object_event  4, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, SafariZoneTMLeechLife, EVENT_GOT_TM_LEECH_LIFE
