	const_def 2 ; object constants
	
RemnantCave3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RemnantCave3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 23, REMNANT_CAVE_OUTSIDE, 2
	warp_event 11, 17, REMNANT_CAVE_3F, 3
	warp_event  3,  9, REMNANT_CAVE_3F, 2
	warp_event  8,  5, LOST_LAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
