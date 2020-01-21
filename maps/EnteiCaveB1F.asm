	const_def 2 ; object constants

EnteiCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EnteiCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 31,  9, ENTEI_CAVE_1F, 2
	warp_event  3, 21, ORCHID_CITY, 5 ; Down to B2F 1
	warp_event  3,  7, ORCHID_CITY, 5 ; Down to B2F 2
	warp_event  9, 15, ORCHID_CITY, 5 ; Down to B2F 3
	warp_event 17,  7, ORCHID_CITY, 5 ; Down to B2F Exit
	warp_event 21,  5, ENTEI_CAVE_1F, 3
	warp_event 13, 19, ORCHID_CITY, 5 ; Secret Item Room
	warp_event 17, 15, ORCHID_CITY, 5 ; Secret Item Room

	db 0 ; coord events

	db 6 ; bg events
	bg_event 19, 26, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 38, 15, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 11, 19, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 22, 30, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 14,  8, BGEVENT_READ, ObjectEvent ; Hidden Item
	bg_event 26,  5, BGEVENT_READ, ObjectEvent ; Hidden Item

	db 0 ; object events
