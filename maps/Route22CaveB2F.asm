	const_def 2 ; object constants

Route22CaveB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22CaveB2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 21, ROUTE_22_CAVE_B1F, 2
	warp_event 13,  5, ROUTE_22_CAVE_B1F, 3
	warp_event 19, 15, ROUTE_22_CAVE_B1F, 4
	warp_event 27,  7, ROUTE_22_CAVE_B1F, 5
	warp_event 23, 19, ROUTE_22_CAVE_B1F, 7
	warp_event 27, 15, ROUTE_22_CAVE_B1F, 8

	db 0 ; coord events

	db 3 ; bg events
	bg_event 35, 36, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 17, 38, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 26,  4, BGEVENT_READ, ObjectEvent ; Hidden Item

	db 0 ; object events
