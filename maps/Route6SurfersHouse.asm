Route6SurfersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route6SurfersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_6, 2
	warp_event  3,  7, ROUTE_6, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
