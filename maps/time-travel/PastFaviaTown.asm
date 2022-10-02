	const_def 2 ; object constants

PastFaviaTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastFaviaTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 11,  7, PAST_FAVIA_TOWN, 1 ; Celeste's House
	warp_event 19, 15, PAST_FAVIA_TOWN, 2 ; Inn
	warp_event 13, 21, PAST_FAVIA_TOWN, 3 ; Friendship House
	warp_event  9, 17, PAST_FAVIA_TOWN, 4 ; Day Care
	warp_event  5,  5, PAST_ROUTE_11_GATE, 1 ; Route 11 Gate
	warp_event 21, 25, PAST_FAVIA_TOWN, 6 ; Mart

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
