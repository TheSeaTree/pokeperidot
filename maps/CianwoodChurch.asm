	const_def 2 ; object constants

CianwoodChurch_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodChurch_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, CIANWOOD_CITY, 9
	warp_event  7, 17, CIANWOOD_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
