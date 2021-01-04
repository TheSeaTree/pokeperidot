	const_def 2 ; object constants

Route23_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route23_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 30,  9, ROUTE_23, 1
	warp_event 16, 19, ROUTE_23, 2
	warp_event 15,  5, ROUTE_23, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
