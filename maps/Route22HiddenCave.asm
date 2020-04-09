	const_def 2 ; object constants

Route22HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_22_SOUTH, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17,  4, BGEVENT_READ, Route22NorthSign
	
	db 0 ; object events
