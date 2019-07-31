	const_def 2 ; object constants

Route11Route12Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route11Route12Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_11, 3
	warp_event  5,  7, ROUTE_11, 3
	warp_event  4,  0, ROUTE_12, 4
	warp_event  5,  0, ROUTE_12, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
