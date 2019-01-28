	const_def 2 ; object constants

FastShipCabins_NNW_NNE_NE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	