	const_def 2 ; object constants

MoltenPeak1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoltenPeak1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 17, MOLTEN_PEAK_OUTSIDE, 2
	warp_event 24, 11, MOLTEN_PEAK_B1F, 1
	warp_event 14,  7, MOLTEN_PEAK_B1F, 6
	warp_event  7, 11, ROUTE_20, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
