	const_def 2 ; object constants

MahoganyGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, MAHOGANY_TOWN, 1
	warp_event  5,  0, MAHOGANY_TOWN, 2
	warp_event  4,  7, OLIVINE_CITY, 3
	warp_event  5,  7, OLIVINE_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
