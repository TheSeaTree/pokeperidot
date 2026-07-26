	const_def 2 ; object constants

GildedHall2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Chest1
	
.Chest1
	checkevent EVENT_GILDED_HALL_2F_EEVEE
	iffalse .Chest2
	changeblock  14, 10, $44
.Chest2
	checkevent EVENT_GILDED_HALL_2F_DROWZEE
	iffalse .Chest3
	changeblock  28,  2, $44
.Chest3
	checkevent EVENT_GILDED_HALL_2F_STAR_PIECE
	iffalse .Chest4
	changeblock  32, 10, $44
.Chest4
	checkevent EVENT_GILDED_HALL_2F_REVIVE
	iffalse .Pit1
	changeblock  18, 18, $44
.Pit1
	checkevent EVENT_GILDED_HALL_2F_PIT_1
	iffalse .Pit2
	changeblock  30,  4, $2e
.Pit2
	checkevent EVENT_GILDED_HALL_2F_PIT_2
	iffalse .Pit3
	changeblock  30,  6, $2d
.Pit3
	checkevent EVENT_GILDED_HALL_2F_PIT_3
	iffalse .Done
	changeblock  16, 16, $2c
.Done
	return
	
GildedHall2FBrittleFloor1:
	checkevent EVENT_GILDED_HALL_2F_PIT_1
	iftrue SkipGildedHall2FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  30,  4, $2e
	setevent EVENT_GILDED_HALL_2F_PIT_1
	jump GildedHallBrittleFloor

GildedHall2FBrittleFloor2:
	checkevent EVENT_GILDED_HALL_2F_PIT_2
	iftrue SkipGildedHall2FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  30,  6, $2d
	setevent EVENT_GILDED_HALL_2F_PIT_2
	jump GildedHallBrittleFloor

GildedHall2FBrittleFloor3:
	checkevent EVENT_GILDED_HALL_2F_PIT_3
	iftrue SkipGildedHall2FPit
	earthquake 15
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	changeblock  16, 16, $2c
	setevent EVENT_GILDED_HALL_2F_PIT_3
	jump GildedHallBrittleFloor

SkipGildedHall2FPit:
	end

GildedHall2FTreasureChest1:
	checkevent EVENT_GILDED_HALL_2F_EEVEE
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 14, 10, $44
	reloadmappart
	waitsfx
	setevent EVENT_GILDED_HALL_2F_EEVEE
	takeitem SMALL_KEY
	opentext
	loadwildmon EEVEE, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	startbattle
	reloadmapafterbattle
	givemoney YOUR_MONEY, 851
	opentext
	writetext GildedHallMoneyInChest
	waitbutton
	writetext GildedHallEeveeReward
	waitbutton
.end
	closetext
	end

GildedHall2FTreasureChest2:
	checkevent EVENT_GILDED_HALL_2F_DROWZEE
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 28, 2, $44
	reloadmappart
	waitsfx
	setevent EVENT_GILDED_HALL_2F_DROWZEE
	takeitem SMALL_KEY
	opentext
	writetext GildedHallPokemonInChest
	waitbutton
	closetext
	loadwildmon DROWZEE, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	startbattle
	reloadmapafterbattle
	opentext
	givemoney YOUR_MONEY, 1238
	writetext GildedHallMoneyInChest
	waitbutton
	writetext GildedHallDrowzeeReward
	waitbutton
.end
	closetext
	end
	
GildedHall2FTreasureChest3:
	opentext
	checkevent EVENT_GILDED_HALL_2F_STAR_PIECE
	iftrue GildedHallEmptyChest
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 32, 10, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem STAR_PIECE
	iffalse .end
	setevent EVENT_GILDED_HALL_2F_STAR_PIECE
	takeitem SMALL_KEY
.end
	closetext
	end

GildedHall2FTreasureChest4:
	checkevent EVENT_GILDED_HALL_2F_REVIVE
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 18, 18, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem REVIVE
	iffalse .end
	setevent EVENT_GILDED_HALL_2F_REVIVE
	takeitem SMALL_KEY
.end
	closetext
	end
	
GildedHall2FHiddenSmallKey1:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_2F_SMALL_KEY_1
	
GildedHall2FHiddenSmallKey2:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_2F_SMALL_KEY_2
	
GildedHall2FHiddenSmallKey3:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_2F_SMALL_KEY_3

GildedHall2F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 14, 13, GILDED_HALL_1F_CENTER_ROOM, 9
	warp_event 19, 13, GILDED_HALL_1F_CENTER_ROOM, 10
	warp_event 15,  3, GILDED_HALL_1F_CENTER_ROOM, 11
	warp_event  4, 21, GILDED_HALL_1F_SIDE_ROOMS, 7
	warp_event 31, 21, GILDED_HALL_1F_SIDE_ROOMS, 8
	warp_event  3, 13, GILDED_HALL_3F, 1
	warp_event 32, 19, GILDED_HALL_3F, 2
	warp_event  8, 14, GILDED_HALL_3F, -1 ; Pit
	warp_event  7, 13, GILDED_HALL_3F, -1 ; Pit
	warp_event 30,  5, GILDED_HALL_1F_SIDE_ROOMS,  9 ; Pit
	warp_event 31,  6, GILDED_HALL_1F_SIDE_ROOMS, 10 ; Pit
	warp_event 16, 16, GILDED_HALL_1F_CENTER_ROOM, 12 ; Pit

	db 3 ; coord events
	coord_event 30,  5, -1, GildedHall2FBrittleFloor1
	coord_event 31,  6, -1, GildedHall2FBrittleFloor2
	coord_event 16, 16, -1, GildedHall2FBrittleFloor3

	db 7 ; bg events
	bg_event 15, 10, BGEVENT_UP, GildedHall2FTreasureChest1
	bg_event 29,  2, BGEVENT_UP, GildedHall2FTreasureChest2
	bg_event 33, 10, BGEVENT_UP, GildedHall2FTreasureChest3
	bg_event 19, 18, BGEVENT_UP, GildedHall2FTreasureChest4
	bg_event 17, 20, BGEVENT_ITEM, GildedHall2FHiddenSmallKey1
	bg_event 34, 23, BGEVENT_ITEM, GildedHall2FHiddenSmallKey2
	bg_event 10,  8, BGEVENT_ITEM, GildedHall2FHiddenSmallKey3

	db 0 ; object events
