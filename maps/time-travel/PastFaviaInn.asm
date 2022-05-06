	const_def 2 ; object constants

PastFaviaInn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastFaviaInn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 2
	warp_event 3,  7, PAST_FAVIA_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
