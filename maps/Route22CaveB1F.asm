	const_def 2 ; object constants

Route22CaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22CaveB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 33,  7, ROUTE_22_CAVE_1F,  2
	warp_event  5, 19, ROUTE_22_CAVE_B2F, 1
	warp_event  5,  3, ROUTE_22_CAVE_B2F, 2
	warp_event 11, 13, ROUTE_22_CAVE_B2F, 3
	warp_event 19,  5, ROUTE_22_CAVE_B2F, 4
	warp_event 23,  3, ROUTE_22_CAVE_1F,  3
	warp_event 15, 17, ROUTE_22_CAVE_B2F, 5
	warp_event 19, 13, ROUTE_22_CAVE_B2F, 6

	db 0 ; coord events

	db 6 ; bg events
	bg_event 21, 24, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 40, 13, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 13, 17, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 24, 28, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 16,  6, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 28,  3, BGEVENT_READ, ObjectEvent ; Hidden Item

	db 0 ; object events
