	const_def 2 ; object constants

Route21EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route21EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_21, 1
	warp_event  0,  5, ROUTE_21, 2
	warp_event  9,  4, ECRUTEAK_CITY, 9
	warp_event  9,  5, ECRUTEAK_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
