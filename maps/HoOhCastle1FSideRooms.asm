	const_def 2 ; object constants

HoOhCastle1FSideRooms_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HoOhCastle1FSideRooms_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 12, 16, HO_OH_CASTLE_1F_CENTER_ROOM, 3
	warp_event 19, 20, HO_OH_CASTLE_1F_CENTER_ROOM, 4
	warp_event  6,  4, HO_OH_CASTLE_1F_CENTER_ROOM, 5
	warp_event  7,  4, HO_OH_CASTLE_1F_CENTER_ROOM, 6
	warp_event 18,  4, HO_OH_CASTLE_1F_CENTER_ROOM, 7
	warp_event 19,  4, HO_OH_CASTLE_1F_CENTER_ROOM, 8
	warp_event  6, 17, HO_OH_CASTLE_2F, 4
	warp_event 23, 17, HO_OH_CASTLE_2F, 5
	warp_event 25,  3, HO_OH_CASTLE_2F, 6
	warp_event 27,  5, HO_OH_CASTLE_2F, -1 ; Pit
	warp_event 28,  6, HO_OH_CASTLE_2F, -1 ; Pit
	warp_event 11, 13, HO_OH_CASTLE_3F, -1 ; Pit
	warp_event 12, 14, HO_OH_CASTLE_3F, -1 ; Pit

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6,  4, BGEVENT_READ, HoOhCastleLockedDoor
	bg_event  7,  4, BGEVENT_READ, HoOhCastleLockedDoor
	bg_event 18,  4, BGEVENT_READ, HoOhCastleLockedDoor
	bg_event 19,  4, BGEVENT_READ, HoOhCastleLockedDoor

	db 0 ; object events
