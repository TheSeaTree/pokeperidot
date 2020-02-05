	const_def 2 ; object constants

Route22Cave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22Cave1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 15, 25, ROUTE_22_SOUTH, 2
	warp_event 22, 19, ROUTE_22_CAVE_B1F, 1
	warp_event 12, 15, ROUTE_22_CAVE_B1F, 6
	warp_event 15,  5, ROUTE_22_SOUTH, 1
	warp_event 25, 11, BLACKTHORN_CAVE_1F, 7
	warp_event  5, 19, ROUTE_22_NORTH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
