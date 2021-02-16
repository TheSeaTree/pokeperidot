	const_def 2 ; object constants

HoOhCastle3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Pits
	
.Pits
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_1
	iffalse .Check2
	changeblock  12, 4, $2c
.Check2
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_2
	iffalse .Check3
	changeblock  12, 6, $2d
.Check3
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_3
	iffalse .Check4
	changeblock  8, 10, $2d
.Check4
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_4
	iffalse .Done
	changeblock  10, 10, $2e
.Done
	return
	

HoOhCastle3FBrittleFloor1:
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_1
	iftrue SkipHoOhCastle3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  12, 4, $2c
	setevent EVENT_HO_OH_CASTLE_3F_PIT_1
	jump HoOhCastleBrittleFloor

HoOhCastle3FBrittleFloor2:
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_2
	iftrue SkipHoOhCastle3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  12, 6, $2d
	setevent EVENT_HO_OH_CASTLE_3F_PIT_2
	jump HoOhCastleBrittleFloor

HoOhCastle3FBrittleFloor3:
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_3
	iftrue SkipHoOhCastle3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  8, 10, $2d
	setevent EVENT_HO_OH_CASTLE_3F_PIT_3
	jump HoOhCastleBrittleFloor

HoOhCastle3FBrittleFloor4:
	checkevent EVENT_HO_OH_CASTLE_3F_PIT_4
	iftrue SkipHoOhCastle3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  10, 10, $2e
	setevent EVENT_HO_OH_CASTLE_3F_PIT_4

HoOhCastleBrittleFloor:
	refreshscreen
	pause 15
	applymovement PLAYER, CastleMovement_PlayerStartsToFall
	warpcheck
	end
	
SkipHoOhCastle3FPit:
	end
	
CastleMovement_PlayerStartsToFall:
	skyfall_top
	step_end

HoOhCastle3F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  5, HO_OH_CASTLE_2F, 7
	warp_event 32, 11, HO_OH_CASTLE_2F, 8
	warp_event 12,  5, HO_OH_CASTLE_2F, 9 ; Pit
	warp_event 13,  6, HO_OH_CASTLE_2F, 10 ; Pit
	warp_event  9, 10, HO_OH_CASTLE_1F_SIDE_ROOMS, 12 ; Pit
	warp_event 10, 11, HO_OH_CASTLE_1F_SIDE_ROOMS, 13 ; Pit
;	warp_event 23,  9, HO_OH_LAIR, 1

	db 4 ; coord events
	coord_event 12,  5, -1, HoOhCastle3FBrittleFloor1
	coord_event 13,  6, -1, HoOhCastle3FBrittleFloor2
	coord_event  9, 10, -1, HoOhCastle3FBrittleFloor3
	coord_event 10, 11, -1, HoOhCastle3FBrittleFloor4

	db 0 ; bg events

	db 0 ; object events
