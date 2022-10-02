	const_def 2 ; object constants

SafariZoneArea2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea2XDefend:
	itemball X_DEFEND

SafariZoneArea2HiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_SAFARI_ZONE_AREA_2_HIDDEN_BRICK_PIECE

SafariZoneArea2HiddenEnergyRoot:
	hiddenitem ENERGY_ROOT, EVENT_SAFARI_ZONE_AREA_2_HIDDEN_ENERGY_ROOT

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

	db 5 ; bg events
	bg_event  6, 20, BGEVENT_READ, SafariZoneArea2Sign
	bg_event 16,  2, BGEVENT_READ, SafariZoneArea2Sign
	bg_event 30,  8, BGEVENT_READ, SafariZoneArea2RestHouseSign
	bg_event 28, 25, BGEVENT_ITEM, SafariZoneArea2HiddenBrickPiece
	bg_event  6, 14, BGEVENT_ITEM, SafariZoneArea2HiddenEnergyRoot

	db 0 ; object events
	object_event 14, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea2XDefend, EVENT_SAFARI_ZONE_X_DEFEND
