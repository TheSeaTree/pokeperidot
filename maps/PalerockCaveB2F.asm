	const_def 2 ; object constants

PalerockCaveB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PalerockCaveB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  3, PALEROCK_MOUNTAIN_B2, 1
	warp_event  3,  5, PALEROCK_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
