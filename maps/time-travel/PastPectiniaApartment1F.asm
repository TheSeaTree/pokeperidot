	const_def 2 ; object constants

PastPectiniaApartment1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaApartment1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PAST_PECTINIA_CITY, 10
	warp_event  3,  7, PAST_PECTINIA_CITY, 10
	warp_event  6,  0, PAST_PECTINIA_APARTMENT_2F,  1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
