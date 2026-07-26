	const_def 2 ; object constants

GildedHall1FSideRooms_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Chest1
	
.Chest1
	checkevent EVENT_GILDED_HALL_1F_SUPER_REPEL
	iffalse .Done
	changeblock 26, 4, $44
.Done
	return

GildedHall1FTreasureChest:
	checkevent EVENT_GILDED_HALL_1F_SUPER_REPEL
	iftrue GildedHallEmptyChest
	opentext
	scall GildedHallTreasureChestCommon
	iffalse .end
	changeblock 26, 4, $44
	reloadmappart
	waitsfx
	opentext
	verbosegiveitem SUPER_REPEL
	iffalse .end
	setevent EVENT_GILDED_HALL_1F_SUPER_REPEL
	takeitem SMALL_KEY
.end
	closetext
	end

GildedHallTreasureChestCommon:
	writetext GildedHallOpenChest
	waitbutton
	checkitem SMALL_KEY
	iffalse .end
	writetext GildedHallUseKey
	yesorno
	iffalse .end
	playsound SFX_ENTER_DOOR
.end
	return

GildedHallEmptyChest:
	jumptext GildedHallEmptyChestText

GildedHall1FHiddenSmallKey2:
	hiddenitem SMALL_KEY, EVENT_GILDED_HALL_1F_SMALL_KEY_2

GildedHallOpenChest:
	text "A key might fit"
	line "this lock."
	done

GildedHallUseKey:
	text "Use a SMALL KEY?"
	done
	
GildedHallEmptyChestText:
	text "This chest has al-"
	line "ready been raided."
	done
	
GildedHallPokemonInChest:
	text "There is a wild"
	line "#MON inside!"
	done

GildedHallMoneyInChest:
	text "There's some money"
	line "in the chest."
	done

GildedHallEeveeReward:
	text "<PLAYER> took the"
	line "¥851.@"
	sound_dex_fanfare_50_79
	text_end

GildedHallDrowzeeReward:
	text "<PLAYER> took the"
	line "¥1238.@"
	sound_dex_fanfare_50_79
	text_end

GildedHallMeowthReward:
	text "<PLAYER> took the"
	line "¥2072.@"
	sound_dex_fanfare_50_79
	text_end

GildedHall1FSideRooms_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 12, 16, GILDED_HALL_1F_CENTER_ROOM, 3
	warp_event 19, 20, GILDED_HALL_1F_CENTER_ROOM, 4
	warp_event  6,  4, GILDED_HALL_1F_CENTER_ROOM, 5
	warp_event  7,  4, GILDED_HALL_1F_CENTER_ROOM, 6
	warp_event 18,  4, GILDED_HALL_1F_CENTER_ROOM, 7
	warp_event 19,  4, GILDED_HALL_1F_CENTER_ROOM, 8
	warp_event  6, 17, GILDED_HALL_2F, 4
	warp_event 23, 17, GILDED_HALL_2F, 5
	warp_event 22,  1, GILDED_HALL_2F, -1 ; Pit
	warp_event 23,  2, GILDED_HALL_2F, -1 ; Pit
	warp_event 11, 13, GILDED_HALL_3F, -1 ; Pit
	warp_event 12, 14, GILDED_HALL_3F, -1 ; Pit

	db 0 ; coord events

	db 6 ; bg events
	bg_event  6,  4, BGEVENT_READ, GildedHallLockedDoor
	bg_event  7,  4, BGEVENT_READ, GildedHallLockedDoor
	bg_event 18,  4, BGEVENT_READ, GildedHallLockedDoor
	bg_event 19,  4, BGEVENT_READ, GildedHallLockedDoor
	bg_event 27,  4, BGEVENT_UP,   GildedHall1FTreasureChest
	bg_event 25, 19, BGEVENT_ITEM, GildedHall1FHiddenSmallKey2

	db 0 ; object events
