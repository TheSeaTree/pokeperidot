	const_def 2 ; object constants

PastRoute1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastRoute1_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 45,  7, PAST_ROUTE_1, 1 ; Cut Guy's House

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
