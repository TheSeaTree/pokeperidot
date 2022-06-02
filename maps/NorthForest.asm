	const_def 2 ; object constants

NorthForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
NorthForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 25, ROUTE_28_GATE, 1
	warp_event 18, 25, ROUTE_28_GATE, 2
	warp_event 24,  4, NORTH_FOREST, 3
	warp_event 25,  4, NORTH_FOREST, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
