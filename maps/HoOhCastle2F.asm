	const_def 2 ; object constants

HoOhCastle2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Chest1
	
.Chest1
	checkevent EVENT_HO_OH_CASTLE_2F_EEVEE
	iffalse .Chest2
	changeblock  14, 10, $44
.Chest2
	checkevent EVENT_HO_OH_CASTLE_2F_DROWZEE
	iffalse .Chest3
	changeblock  28,  2, $44
.Chest3
	checkevent EVENT_HO_OH_CASTLE_2F_STAR_PIECE
	iffalse .Chest4
	changeblock  32, 10, $44
.Chest4
	checkevent EVENT_HO_OH_CASTLE_2F_REVIVE
	iffalse .Pit1
	changeblock  18, 18, $44
.Pit1
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_1
	iffalse .Pit2
	changeblock  30,  4, $2e
.Pit2
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_2
	iffalse .Pit3
	changeblock  30,  6, $2d
.Pit3
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_3
	iffalse .Done
	changeblock  16, 16, $2c
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

HoOhCastle2FBrittleFloor3:
	checkevent EVENT_HO_OH_CASTLE_2F_PIT_3
	iftrue SkipHoOhCastle2FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  16, 16, $2c
	setevent EVENT_HO_OH_CASTLE_2F_PIT_3
	jump HoOhCastleBrittleFloor

SkipHoOhCastle2FPit:
	end

HoOhCastle2FTreasureChest1:
	checkevent EVENT_HO_OH_CASTLE_2F_EEVEE
	iftrue HoOhCastleEmptyChest
	opentext
	scall HoOhCastleTreasureChestCommon
	iffalse .end
	changeblock 14, 10, $44
	reloadmappart
	waitsfx
	setevent EVENT_HO_OH_CASTLE_2F_EEVEE
	takeitem SMALL_KEY
	opentext
	loadwildmon EEVEE, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	givemoney YOUR_MONEY, 851
	opentext
	writetext HoOhCastleMoneyInChest
	waitbutton
	writetext HoOhCastleEeveeReward
	waitbutton
.end
	closetext
	end

HoOhCastle2FTreasureChest2:
	checkevent EVENT_HO_OH_CASTLE_2F_DROWZEE
	iftrue HoOhCastleEmptyChest
	opentext
	scall HoOhCastleTreasureChestCommon
	iffalse .end
	changeblock 28, 2, $44
	reloadmappart
	waitsfx
	setevent EVENT_HO_OH_CASTLE_2F_DROWZEE
	takeitem SMALL_KEY
	opentext
	writetext HoOhCastlePokemonInChest
	waitbutton
	closetext
	loadwildmon DROWZEE, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	opentext
	givemoney YOUR_MONEY, 1238
	writetext HoOhCastleMoneyInChest
	waitbutton
	writetext HoOhCastleDrowzeeReward
	waitbutton
.end
	closetext
	end
	
HoOhCastle2FTreasureChest3:
	opentext
	checkevent EVENT_HO_OH_CASTLE_2F_STAR_PIECE
	iftrue HoOhCastleEmptyChest
	scall HoOhCastleTreasureChestCommon
	iffalse .end
	changeblock 32, 10, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem STAR_PIECE
	iffalse .end
	setevent EVENT_HO_OH_CASTLE_2F_STAR_PIECE
	takeitem SMALL_KEY
.end
	closetext
	end

HoOhCastle2FTreasureChest4:
	checkevent EVENT_HO_OH_CASTLE_2F_REVIVE
	iftrue HoOhCastleEmptyChest
	opentext
	scall HoOhCastleTreasureChestCommon
	iffalse .end
	changeblock 18, 18, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem REVIVE
	iffalse .end
	setevent EVENT_HO_OH_CASTLE_2F_REVIVE
	takeitem SMALL_KEY
.end
	closetext
	end
	
HoOhCastle2FHiddenSmallKey1:
	hiddenitem SMALL_KEY, EVENT_HO_OH_CASTLE_2F_SMALL_KEY_1
	
HoOhCastle2FHiddenSmallKey2:
	hiddenitem SMALL_KEY, EVENT_HO_OH_CASTLE_2F_SMALL_KEY_2
	
HoOhCastle2FHiddenSmallKey3:
	hiddenitem SMALL_KEY, EVENT_HO_OH_CASTLE_2F_SMALL_KEY_3

HoOhCastle2F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 14, 13, HO_OH_CASTLE_1F_CENTER_ROOM, 9
	warp_event 19, 13, HO_OH_CASTLE_1F_CENTER_ROOM, 10
	warp_event 15,  3, HO_OH_CASTLE_1F_CENTER_ROOM, 11
	warp_event  4, 21, HO_OH_CASTLE_1F_SIDE_ROOMS, 7
	warp_event 31, 21, HO_OH_CASTLE_1F_SIDE_ROOMS, 8
	warp_event  3, 13, HO_OH_CASTLE_3F, 1
	warp_event 32, 19, HO_OH_CASTLE_3F, 2
	warp_event  8, 14, HO_OH_CASTLE_3F, -1 ; Pit
	warp_event  7, 13, HO_OH_CASTLE_3F, -1 ; Pit
	warp_event 30,  5, HO_OH_CASTLE_1F_SIDE_ROOMS,  9 ; Pit
	warp_event 31,  6, HO_OH_CASTLE_1F_SIDE_ROOMS, 10 ; Pit
	warp_event 16, 16, HO_OH_CASTLE_1F_CENTER_ROOM, 12 ; Pit

	db 3 ; coord events
	coord_event 30,  5, -1, HoOhCastle2FBrittleFloor1
	coord_event 31,  6, -1, HoOhCastle2FBrittleFloor2
	coord_event 16, 16, -1, HoOhCastle2FBrittleFloor3

	db 7 ; bg events
	bg_event 15, 10, BGEVENT_UP, HoOhCastle2FTreasureChest1
	bg_event 29,  2, BGEVENT_UP, HoOhCastle2FTreasureChest2
	bg_event 33, 10, BGEVENT_UP, HoOhCastle2FTreasureChest3
	bg_event 19, 18, BGEVENT_UP, HoOhCastle2FTreasureChest4
	bg_event 17, 20, BGEVENT_ITEM, HoOhCastle2FHiddenSmallKey1
	bg_event 34, 23, BGEVENT_ITEM, HoOhCastle2FHiddenSmallKey2
	bg_event 10,  8, BGEVENT_ITEM, HoOhCastle2FHiddenSmallKey3

	db 0 ; object events
