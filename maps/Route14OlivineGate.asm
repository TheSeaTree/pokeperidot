	const_def 2 ; object constants

Route14OlivineGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route14OlivineGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_14, 1
	warp_event  0,  5, ROUTE_14, 2
	warp_event  9,  4, OLIVINE_CITY, 1
	warp_event  9,  5, OLIVINE_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
