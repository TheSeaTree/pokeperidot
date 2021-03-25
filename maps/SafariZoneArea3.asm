	const_def 2 ; object constants

SafariZoneArea3_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRestHouse
	
.ClearRestHouse:
	clearflag ENGINE_SAFARI_REST_HOUSE
	return
	
SafariZoneTMLeechLife:
	itemball TM_LEECH_LIFE

SafariZoneArea3Sign:
	jumptext SafariZoneArea3SignText
	
SafariZoneArea3RestHouseSign:
	jumptext SafariZoneArea3RestHouseSignText
	
SafariZoneArea3SignText:
	text "SAFARI ZONE-"
	line "AREA 3"
	done
	
SafariZoneArea3RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea3_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7, 21, SAFARI_ZONE_AREA_3_REST_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 18, 20, BGEVENT_READ, SafariZoneArea3Sign
	bg_event  8, 22, BGEVENT_READ, SafariZoneArea3RestHouseSign
;	bg_event 20, 27, BGEVENT_ITEM, SafariZoneArea3Hidden
;	bg_event 13,  2, BGEVENT_ITEM, SafariZoneArea3Hidden

	db 2 ; object events
	object_event 23,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, SafariZoneTMLeechLife, EVENT_GOT_TM_LEECH_LIFE
	object_event 17, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
