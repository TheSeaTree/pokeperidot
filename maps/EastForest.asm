	const_def 2 ; object constants

EastForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
EastForest_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  6, ROUTE_4_FOREST_GATE, 3
	warp_event  4,  7, ROUTE_4_FOREST_GATE, 4
	warp_event 50,  9, FACTORY_1F, 1
	warp_event 51,  5, FACTORY_BACK, 3
	warp_event 52,  5, FACTORY_BACK, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
