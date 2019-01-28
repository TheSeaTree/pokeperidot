	const_def 2 ; object constants

EcruteakForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


EcruteakForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 3, 7, ILEX_FOREST, 5
	warp_event 4, 7, ILEX_FOREST, 5
	warp_event 2, 0, ECRUTEAK_CITY, 1
	warp_event 3, 0, ECRUTEAK_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	