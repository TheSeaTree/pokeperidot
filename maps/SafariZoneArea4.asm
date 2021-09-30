	const_def 2 ; object constants

SafariZoneArea4_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRestHouse
	
.ClearRestHouse:
	clearflag ENGINE_SAFARI_REST_HOUSE
	return

SafariZoneTMSubmission:
	itemball TM_SUBMISSION

SafariZoneArea4XSpDef:
	itemball X_SP_DEF
	
SafariZoneArea4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_SAFARI_ZONE_AREA_4_HIDDEN_ULTRA_BALL
	
SafariZoneArea4HiddenRevivalHerb:
	hiddenitem REVIVAL_HERB, EVENT_SAFARI_ZONE_AREA_4_HIDDEN_REVIVAL_HERB

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
	warp_event 15, 15, SAFARI_ZONE_AREA_4_REST_HOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  9, 21, BGEVENT_READ, SafariZoneArea4Sign
	bg_event 16, 16, BGEVENT_READ, SafariZoneArea4RestHouseSign
	bg_event  1,  3, BGEVENT_ITEM, SafariZoneArea4HiddenUltraBall
	bg_event 25, 27, BGEVENT_ITEM, SafariZoneArea4HiddenRevivalHerb

	db 2 ; object events
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, SafariZoneTMSubmission, EVENT_GOT_TM_SUBMISSION
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea4XSpDef, EVENT_SAFARI_ZONE_X_SP_DEF
