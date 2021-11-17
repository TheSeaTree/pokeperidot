	const_def 2 ; object constants

Route24South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 13, ROUTE_25_GATE, 1
	warp_event 24, 13, ROUTE_25_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
