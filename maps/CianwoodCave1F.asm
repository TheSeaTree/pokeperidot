	const_def 2 ; object constants

CianwoodCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, CIANWOOD_CITY, 7
	warp_event 11,  3, CIANWOOD_CAVE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
