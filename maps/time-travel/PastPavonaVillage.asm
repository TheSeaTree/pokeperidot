	const_def 2 ; object constants

PastPavonaVillage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PastPavonaVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 19,  5, PAST_PAVONA_INN, 1 ; Maple's Lab
	warp_event 23, 13, PAST_PAVONA_HOUSE_1, 1 ; The Vidya Guy
	warp_event 13, 11, PAST_PAVONA_HOUSE_2, 1 ; Inn

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
