	const_def 2 ; object constants

Route2NuggetHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	