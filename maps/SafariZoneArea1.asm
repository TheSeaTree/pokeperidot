	const_def 2 ; object constants

SafariZoneArea1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea1Sign:
	jumptext SafariZoneArea1SignText
	
SafariZoneArea1SignText:
	text "SAFARI ZONE-"
	line "AREA 1"
	done

SafariZoneArea1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16, 29, SAFARI_ZONE_GATE_1F, 3
	warp_event 17, 29, SAFARI_ZONE_GATE_1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 18, 24, BGEVENT_READ, SafariZoneArea1Sign

	db 0 ; object events
