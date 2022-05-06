	const_def 2 ; object constants

PastPectiniaCity_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastPectiniaCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 31, 11, PAST_PECTINIA_CITY,  1 ; Mart
	warp_event  4, 26, PAST_PECTINIA_CITY,  2 ; Route 2 Gate
	warp_event  4, 27, PAST_PECTINIA_CITY,  3 ; Route 2 Gate
	warp_event  9,  5, PAST_ROUTE_3,  		1 ; Route 3 Gate
	warp_event 11, 25, PAST_PECTINIA_CITY,  5 ; Gym Guy's House
	warp_event 17, 25, PAST_PECTINIA_CITY,  6 ; Bike House
	warp_event 51, 25, PAST_PECTINIA_CITY,  7 ; Berry House
	warp_event 40, 17, PAST_PECTINIA_GYM,   1 ; Police Station
	warp_event 37, 11, PAST_PECTINIA_CITY,  9 ; Evolution House
	warp_event 23, 11, PAST_PECTINIA_APARTMENT_1F, 10 ; Apartments

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
