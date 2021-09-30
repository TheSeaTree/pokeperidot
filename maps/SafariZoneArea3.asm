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
	
SafariZoneArea3MiracleSeed:
	itemball MIRACLE_SEED

SafariZoneArea3HiddenRevive:
	hiddenitem REVIVE, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_REVIVE

SafariZoneArea3HiddenCarbos:
	hiddenitem CARBOS, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_CARBOS

SafariZoneArea3HiddenXSpeed:
	hiddenitem X_SPEED, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_X_SPEED

SafariZoneArea3HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_MAX_ETHER

SafariZoneArea3HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_FULL_RESTORE

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

	db 7 ; bg events
	bg_event 18, 20, BGEVENT_READ, SafariZoneArea3Sign
	bg_event  8, 22, BGEVENT_READ, SafariZoneArea3RestHouseSign
	bg_event 20, 27, BGEVENT_ITEM, SafariZoneArea3HiddenRevive
	bg_event 13,  2, BGEVENT_ITEM, SafariZoneArea3HiddenCarbos
	bg_event  9, 20, BGEVENT_ITEM, SafariZoneArea3HiddenXSpeed
	bg_event 11, 17, BGEVENT_ITEM, SafariZoneArea3HiddenMaxEther
	bg_event  8, 18, BGEVENT_ITEM, SafariZoneArea3HiddenFullRestore

	db 2 ; object events
	object_event 23,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, SafariZoneTMLeechLife, EVENT_GOT_TM_LEECH_LIFE
	object_event 17, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea3MiracleSeed, EVENT_SAFARI_ZONE_MIRACLE_SEED
