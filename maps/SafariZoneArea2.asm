	const_def 2 ; object constants

SafariZoneArea2_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRestHouse
	
.ClearRestHouse:
	clearflag ENGINE_SAFARI_REST_HOUSE
	return

SafariZoneArea2Sign:
	jumptext SafariZoneArea2SignText
	
SafariZoneArea2RestHouseSign:
	jumptext SafariZoneArea2RestHouseSignText
	
SafariZoneArea2SignText:
	text "SAFARI ZONE-"
	line "AREA 2"
	done
	
SafariZoneArea2RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea2_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 29,  7, SAFARI_ZONE_AREA_2_REST_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 20, BGEVENT_READ, SafariZoneArea2Sign
	bg_event 16,  2, BGEVENT_READ, SafariZoneArea2Sign
	bg_event 30,  8, BGEVENT_READ, SafariZoneArea2RestHouseSign
;	bg_event 28, 25, BGEVENT_ITEM, SafariZoneArea2Hidden
;	bg_event  6, 14, BGEVENT_ITEM, SafariZoneArea2Hidden

	db 0 ; object events
	object_event 14, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
