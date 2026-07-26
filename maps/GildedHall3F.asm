	const_def 2 ; object constants

GildedHall3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Chest1
	
.Chest1
	checkevent EVENT_GILDED_HALL_3F_FULL_RESTORE
	iffalse .Chest2
	changeblock  16,  2, $44
.Chest2
	checkevent EVENT_GILDED_HALL_3F_MEOWTH
	iffalse .Chest3
	changeblock  10,  8, $44
.Chest3
	checkevent EVENT_GILDED_HALL_3F_NUGGET
	iffalse .Pit1
	changeblock  16, 10, $44
.Pit1
	checkevent EVENT_GILDED_HALL_3F_PIT_1
	iffalse .Pit2
	changeblock  12, 4, $2e
.Pit2
	checkevent EVENT_GILDED_HALL_3F_PIT_2
	iffalse .Pit3
	changeblock  12, 6, $2d
.Pit3
	checkevent EVENT_GILDED_HALL_3F_PIT_3
	iffalse .Pit4
	changeblock  8, 10, $2d
.Pit4
	checkevent EVENT_GILDED_HALL_3F_PIT_4
	iffalse .Done
	changeblock 10, 10, $2e
.Done
	return
	

GildedHall3FBrittleFloor1:
	checkevent EVENT_GILDED_HALL_3F_PIT_1
	iftrue SkipGildedHall3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  12, 4, $2e
	setevent EVENT_GILDED_HALL_3F_PIT_1
	jump GildedHallBrittleFloor

GildedHall3FBrittleFloor2:
	checkevent EVENT_GILDED_HALL_3F_PIT_2
	iftrue SkipGildedHall3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  12, 6, $2d
	setevent EVENT_GILDED_HALL_3F_PIT_2
	jump GildedHallBrittleFloor

GildedHall3FBrittleFloor3:
	checkevent EVENT_GILDED_HALL_3F_PIT_3
	iftrue SkipGildedHall3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  8, 10, $2d
	setevent EVENT_GILDED_HALL_3F_PIT_3
	jump GildedHallBrittleFloor

GildedHall3FBrittleFloor4:
	checkevent EVENT_GILDED_HALL_3F_PIT_4
	iftrue SkipGildedHall3FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock 10, 10, $2e
	setevent EVENT_GILDED_HALL_3F_PIT_4

GildedHallBrittleFloor:
	refreshscreen
	pause 15
	applymovement PLAYER, CastleMovement_PlayerStartsToFall
	warpcheck
	end
	
SkipGildedHall3FPit:
	end
	
GildedHall3FTreasureChest1:
	checkevent EVENT_GILDED_HALL_3F_FULL_RESTORE
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 16, 2, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem FULL_RESTORE
	iffalse .end
	setevent EVENT_GILDED_HALL_3F_FULL_RESTORE
	takeitem SMALL_KEY
.end
	closetext
	end
	
GildedHall3FTreasureChest2:
	checkevent EVENT_GILDED_HALL_3F_MEOWTH
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 10, 8, $44
	reloadmappart
	waitsfx
	setevent EVENT_GILDED_HALL_3F_MEOWTH
	takeitem SMALL_KEY
	opentext
	writetext GildedHallPokemonInChest
	waitbutton
	closetext
	loadwildmon MEOWTH, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	startbattle
	reloadmapafterbattle
	opentext
	givemoney YOUR_MONEY, 2072
	writetext GildedHallMoneyInChest
	waitbutton
	writetext GildedHallMeowthReward
	waitbutton
.end
	closetext
	end
	
GildedHall3FTreasureChest3:
	checkevent EVENT_GILDED_HALL_3F_NUGGET
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 16, 10, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem NUGGET
	iffalse .end
	setevent EVENT_GILDED_HALL_3F_NUGGET
	takeitem SMALL_KEY
.end
	closetext
	end
	
GildedHall3FHiddenSmallKey1:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_3F_SMALL_KEY_1
	
GildedHall3FHiddenSmallKey2:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_3F_SMALL_KEY_2
	
GildedHall3FHiddenSmallKey3:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_3F_SMALL_KEY_3
	
CastleMovement_PlayerStartsToFall:
	skyfall_top
	step_end

GildedHall3F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  3,  5, GILDED_HALL_2F, 6
	warp_event 32, 11, GILDED_HALL_2F, 7
	warp_event 12,  5, GILDED_HALL_2F, 8 ; Pit
	warp_event 13,  6, GILDED_HALL_2F, 9 ; Pit
	warp_event  9, 10, GILDED_HALL_1F_SIDE_ROOMS, 11 ; Pit
	warp_event 10, 11, GILDED_HALL_1F_SIDE_ROOMS, 12 ; Pit
	warp_event 23,  9, GILDED_HALL_ROOF, 1

	db 4 ; coord events
	coord_event 12,  5, -1, GildedHall3FBrittleFloor1
	coord_event 13,  6, -1, GildedHall3FBrittleFloor2
	coord_event  9, 10, -1, GildedHall3FBrittleFloor3
	coord_event 10, 11, -1, GildedHall3FBrittleFloor4

	db 8 ; bg events
	bg_event 17,  2, BGEVENT_UP, GildedHall3FTreasureChest1
	bg_event 11,  8, BGEVENT_UP, GildedHall3FTreasureChest2
	bg_event 17, 10, BGEVENT_UP, GildedHall3FTreasureChest3
	bg_event 17,  8, BGEVENT_UP, GildedHallEmptyChest
	bg_event 15, 10, BGEVENT_UP, GildedHallEmptyChest
	bg_event 15,  4, BGEVENT_ITEM, GildedHall3FHiddenSmallKey1
	bg_event 24, 14, BGEVENT_ITEM, GildedHall3FHiddenSmallKey2
	bg_event 12, 10, BGEVENT_ITEM, GildedHall3FHiddenSmallKey3

	db 0 ; object events
