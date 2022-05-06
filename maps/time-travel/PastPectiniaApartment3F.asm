	const_def 2 ; object constants

PastPectiniaApartment3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaApartment3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PAST_PECTINIA_APARTMENT_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
