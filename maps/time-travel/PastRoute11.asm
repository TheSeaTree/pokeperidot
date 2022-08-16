	const_def 2 ; object constants

PastRoute11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastRoute11_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 27, 27, PAST_ROUTE_11_GATE, 5 ; Favia Gate
	warp_event 28, 27, PAST_ROUTE_11_GATE, 5 ; Favia Gate
	warp_event 47, 17, PAST_ROUTE_11, 3 ; Battle House
	warp_event 49, 21, PAST_ROUTE_11, 4 ; Curse House
	warp_event 37,  7, PAST_ROUTE_11, 5 ; Misc House 1
	warp_event 29, 11, PAST_ROUTE_11_INN, 1
	warp_event 19,  7, PAST_ROUTE_11, 7 ; Misc House 2
	warp_event 17, 17, PAST_ROUTE_11, 8 ; Misc House 3
	warp_event  7, 11, PAST_ROUTE_11, 9 ; Cleanse Tag House

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
