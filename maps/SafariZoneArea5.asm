	const_def 2 ; object constants

SafariZoneArea5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea5Sign:
	jumptext SafariZoneArea5SignText

SafariZoneArea5RestHouseSign:
	jumptext SafariZoneArea5RestHouseSignText
	
SafariZoneArea5SignText:
	text "SAFARI ZONE-"
	line "AREA 5"
	done
	
SafariZoneArea5RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea5_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  3, SAFARI_ZONE_AREA_5_REST_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 24, 14, BGEVENT_READ, SafariZoneArea5Sign
	bg_event 14, 22, BGEVENT_READ, SafariZoneArea5Sign
	bg_event 20,  4, BGEVENT_READ, SafariZoneArea5RestHouseSign

	db 0 ; object events
