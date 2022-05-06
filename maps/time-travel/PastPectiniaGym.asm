	const_def 2 ; object constants

PastPectiniaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastPectiniaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 21, PAST_PECTINIA_CITY, 7
	warp_event  5, 21, PAST_PECTINIA_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
