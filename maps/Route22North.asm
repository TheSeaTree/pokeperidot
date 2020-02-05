	const_def 2 ; object constants

Route22North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22North_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 29,  5, ROUTE_22_CAVE_1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
