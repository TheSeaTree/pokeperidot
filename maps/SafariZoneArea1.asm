	const_def 2 ; object constants

SafariZoneArea1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16, 29, SAFARI_ZONE_GATE, 3
	warp_event 17, 29, SAFARI_ZONE_GATE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
