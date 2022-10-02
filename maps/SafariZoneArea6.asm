	const_def 2 ; object constants

SafariZoneArea6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea6Sign:
	jumptext SafariZoneArea6SignText

SafariZoneArea6RestHouseSign:
	jumptext SafariZoneArea6RestHouseSignText
	
SafariZoneArea6SignText:
	text "SAFARI ZONE-"
	line "AREA 6"
	done
	
SafariZoneArea6RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea6_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  9, SAFARI_ZONE_AREA_6_REST_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 22, BGEVENT_READ, SafariZoneArea6Sign
	bg_event  6, 10, BGEVENT_READ, SafariZoneArea6RestHouseSign

	db 0 ; object events
