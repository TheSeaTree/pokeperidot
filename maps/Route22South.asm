	const_def 2 ; object constants

Route22South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 33, 27, ROUTE_22_CAVE_1F, 4
	warp_event  7,  5, ROUTE_22_CAVE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
