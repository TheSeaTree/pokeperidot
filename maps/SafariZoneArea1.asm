	const_def 2 ; object constants

SafariZoneArea1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRestHouse
	
.ClearRestHouse:
	clearflag ENGINE_SAFARI_REST_HOUSE
	return

SafariZoneArea1Sign:
	jumptext SafariZoneArea1SignText

SafariZoneArea1RestHouseSign:
	jumptext SafariZoneArea1RestHouseSignText
	
SafariZoneArea1SignText:
	text "SAFARI ZONE-"
	line "AREA 1"
	done
	
SafariZoneArea1RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea1_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 16, 29, SAFARI_ZONE_GATE_1F, 3
	warp_event 17, 29, SAFARI_ZONE_GATE_1F, 3
	warp_event  5, 11, SAFARI_ZONE_AREA_1_REST_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 18, 24, BGEVENT_READ, SafariZoneArea1Sign
	bg_event 27,  7, BGEVENT_READ, SafariZoneArea1Sign
	bg_event  6, 12, BGEVENT_READ, SafariZoneArea1RestHouseSign

	db 0 ; object events
