	const_def 2 ; object constants
	
RemnantCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RemnantCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, SEA_ROUTE_2, 1
	warp_event 29, 15, REMNANT_CAVE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
