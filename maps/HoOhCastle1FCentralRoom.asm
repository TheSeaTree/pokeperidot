	const_def 2 ; object constants

HoOhCastle1FCentralRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .OpenGates
	
.OpenGates:
	writebyte RAIKOU
	special CheckOwnedMon
	iffalse .Gate2
	changeblock  14, 30, $37
.Gate2
	writebyte ENTEI
	special CheckOwnedMon
	iffalse .Gate3
	changeblock  14, 28, $37
.Gate3
	writebyte SUICUNE
	special CheckOwnedMon
	iffalse .skip
	changeblock  14, 26, $37
.skip
	return

HoOhCastleLockedDoor:
	jumptext HoOhCastleLockedDoorText
	
HoOhCastleLockedDoorText:
	text "The door is locked"
	line "from this side!"
	done

HoOhCastle1FCentralRoom_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 14, 35, CARNATION_TOWN, 3
	warp_event 15, 35, CARNATION_TOWN, 4
	warp_event  8, 21, HO_OH_CASTLE_1F_SIDE_ROOMS, 1
	warp_event 21, 21, HO_OH_CASTLE_1F_SIDE_ROOMS, 2
	warp_event  2,  9, HO_OH_CASTLE_1F_SIDE_ROOMS, 3
	warp_event  3,  9, HO_OH_CASTLE_1F_SIDE_ROOMS, 4
	warp_event 20,  5, HO_OH_CASTLE_1F_SIDE_ROOMS, 5
	warp_event 21,  5, HO_OH_CASTLE_1F_SIDE_ROOMS, 6
	warp_event 12, 13, HO_OH_CASTLE_2F, 1
	warp_event 17, 13, HO_OH_CASTLE_2F, 2
	warp_event 13,  3, HO_OH_CASTLE_2F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  8, 21, BGEVENT_READ, HoOhCastleLockedDoor
	bg_event 21, 21, BGEVENT_READ, HoOhCastleLockedDoor

	db 0 ; object events
