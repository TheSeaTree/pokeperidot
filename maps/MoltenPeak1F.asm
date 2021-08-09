	const_def 2 ; object constants

MoltenPeak1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoltenPeak1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 15, 25, MOLTEN_PEAK_OUTSIDE, 2
	warp_event 22, 19, MOLTEN_PEAK_B1F, 1
	warp_event 12, 15, MOLTEN_PEAK_B1F, 6
	warp_event 15,  5, MOLTEN_PEAK_OUTSIDE, 1
	warp_event 25, 11, ACROPORA_CAVE_1F, 7
	warp_event  5, 19, ROUTE_22, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
