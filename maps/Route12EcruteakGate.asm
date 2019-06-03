	const_def 2 ; object constants

Route12EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route12EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ECRUTEAK_CITY, 6
	warp_event  0,  5, ECRUTEAK_CITY, 7
	warp_event  9,  4, ROUTE_12, 1
	warp_event  9,  5, ROUTE_12, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
