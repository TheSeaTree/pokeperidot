	const_def 2 ; object constants

PastRoute11House4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastRoute11House4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_11, 9
	warp_event 3,  7, PAST_ROUTE_11, 9

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
