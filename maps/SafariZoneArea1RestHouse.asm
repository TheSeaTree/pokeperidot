	const_def 2 ; object constants

SafariZoneArea1RestHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea1RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_1, 3
	warp_event  3,  7, SAFARI_ZONE_AREA_1, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
