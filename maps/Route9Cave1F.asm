	const_def 2 ; object constants

Route9Cave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route9Cave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, ROUTE_9, 3
	warp_event  9,  7, PAVONA_OASIS_CAVE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
