	const_def 2 ; object constants

Route22_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 29,  5, BLACKTHORN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
