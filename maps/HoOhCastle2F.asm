	const_def 2 ; object constants

HoOhCastle2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Pits
	
.Pits
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_1
	iffalse .Check2
	changeblock  30, 4, $2e
.Check2
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_2
	iffalse .Done
	changeblock  30, 6, $2d
.Done
	return
	
HoOhCastle2FBrittleFloor1:
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_1
	iftrue SkipHoOhCastle2FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  30,  4, $2e
	setevent EVENT_HO_OH_CASTLE_2F_PIT_1
	jump HoOhCastleBrittleFloor

HoOhCastle2FBrittleFloor2:
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_2
	iftrue SkipHoOhCastle2FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  30,  6, $2d
	setevent EVENT_HO_OH_CASTLE_2F_PIT_2
	jump HoOhCastleBrittleFloor
	
SkipHoOhCastle2FPit:
	end

HoOhCastle2F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 14, 13, HO_OH_CASTLE_1F_CENTER_ROOM, 9
	warp_event 19, 13, HO_OH_CASTLE_1F_CENTER_ROOM, 10
	warp_event 15,  3, HO_OH_CASTLE_1F_CENTER_ROOM, 11
	warp_event  4, 21, HO_OH_CASTLE_1F_SIDE_ROOMS, 7
	warp_event 31, 21, HO_OH_CASTLE_1F_SIDE_ROOMS, 8
	warp_event 29,  4, HO_OH_CASTLE_1F_SIDE_ROOMS, 9
	warp_event  3, 13, HO_OH_CASTLE_3F, 1
	warp_event 32, 19, HO_OH_CASTLE_3F, 2
	warp_event 12, 14, HO_OH_CASTLE_3F, -1 ; Pit
	warp_event 11, 13, HO_OH_CASTLE_3F, -1 ; Pit
	warp_event 30,  5, HO_OH_CASTLE_1F_SIDE_ROOMS, 10 ; Pit
	warp_event 31,  6, HO_OH_CASTLE_1F_SIDE_ROOMS, 11 ; Pit

	db 4 ; coord events
	coord_event 30,  5, -1, HoOhCastle2FBrittleFloor1
	coord_event 31,  6, -1, HoOhCastle2FBrittleFloor2

	db 0 ; bg events

	db 0 ; object events
