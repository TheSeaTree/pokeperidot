	const_def 2 ; object constants

SafariZoneArea3RestHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SafariArea3RestHouseReceptionist:
	jumptextfaceplayer SafariArea3RestHouseReceptionistText

SafariArea3RestHouseCooltrainerF:
	faceplayer
	opentext
	checkevent EVENT_GOT_LUCKY_PUNCH
	iftrue .After
	checkevent EVENT_LUCKY_PUNCH_GIFT_PENDING
	iftrue .GiftPending
	checkevent EVENT_HEARD_ABOUT_LOST_SAFARI_ITEMS
	iffalse .NoItems
	checkevent EVENT_SAFARI_ZONE_AREA_3_HIDDEN_X_SPEED
	iffalse .NoItems
	checkevent EVENT_SAFARI_ZONE_AREA_3_HIDDEN_MAX_ETHER
	iffalse .NoItems
	checkevent EVENT_SAFARI_ZONE_AREA_3_HIDDEN_FULL_RESTORE
	iffalse .NoItems
	checkitem X_SPEED
	iffalse .NoItems
	checkitem MAX_ETHER
	iffalse .NoItems
	checkitem FULL_RESTORE
	iftrue .LuckyPunch
.NoItems
	writetext SafariArea3RestHouseCooltrainerFText
	waitbutton
	closetext
	setevent EVENT_HEARD_ABOUT_LOST_SAFARI_ITEMS
	end

.LuckyPunch
	writetext SafariArea3RestHouseCooltainerFReturnItemsText
	waitbutton
	playsound SFX_GOT_SAFARI_BALLS
	writetext SafariArea3RestHousePlayerReturnItemsText
	waitsfx
	takeitem X_SPEED
	takeitem MAX_ETHER
	takeitem FULL_RESTORE
	writetext SafariArea3RestHouseCooltrainerFGiveRewardText
	waitbutton
	verbosegiveitem LUCKY_PUNCH
	iffalse .BagFull
	setevent EVENT_GOT_LUCKY_PUNCH
	jump .After

.BagFull
	writetext SafariArea3RestHouseCooltrainerFNoRoomText
	waitbutton
	closetext
	setevent EVENT_LUCKY_PUNCH_GIFT_PENDING
	end

.GiftPending
	writetext SafariArea3RestHouseCooltrainerFCheckPackText
	waitbutton
	giveitem LUCKY_PUNCH
	iffalse .BagFull
	writetext SafariArea3RestHouseCooltrainerFMadeRoomText
	waitbutton
	itemtotext LUCKY_PUNCH, MEM_BUFFER_0
	itemnotify
	setevent EVENT_GOT_LUCKY_PUNCH
.After
	writetext SafariArea3RestHouseCooltrainerFAfterText
	waitbutton
	closetext
	end

SafariArea3RestHousePokefan:
	jumptextfaceplayer SafariArea3RestHousePokefanText
	
SafariArea3RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 3 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done

SafariArea3RestHouseCooltrainerFText
	text "Oh no!"

	para "I took some of my"
	line "items out of my"
	cont "PACK to organize"
	cont "it, and a wild"
	cont "FARFETCH'D came in"
	cont "through the window"
	cont "and stole some of"
	cont "my items!"
	
	para "They're all scatt-"
	line "ered around out-"
	cont "side, and I don't"
	cont "have enough time"
	cont "to go out and get"
	cont "them all!"
	done

SafariArea3RestHouseCooltainerFReturnItemsText:
	text "Oh my goodness!"

	para "Did you really go"
	line "out to collect all"
	cont "of my items?"
	
	para "That's so sweet of"
	line "you to do that!"
	done

SafariArea3RestHousePlayerReturnItemsText:
	text "<PLAYER> returned"
	line "the lost items."
	done

SafariArea3RestHouseCooltrainerFGiveRewardText:
	text "There's one item"
	line "that I was able to"
	cont "hold onto, but I"
	cont "don't have any use"
	cont "for it right now."
	
	para "Here, you can have"
	line "it!"
	done

SafariArea3RestHouseCooltrainerFNoRoomText:
	text "Oh…"

	para "There's not enough"
	line "space in your PACK"
	cont "for it…"

	para "When you make some"
	line "room, let me know."

	para "I can't exactly go"
	line "anywhere right now."
	done

SafariArea3RestHouseCooltrainerFCheckPackText:
	text "Hey! Did you make"
	line "room in your PACK"
	cont "for this item…?"
	done

SafariArea3RestHouseCooltrainerFMadeRoomText:
	text "Oh, you did!"
	line "awesome!"

	para "Here you go!"
	done

SafariArea3RestHouseCooltrainerFAfterText:
	text "I'll need to be"
	line "more careful to"
	cont "hold onto my imp-"
	cont "ortant items from"
	cont "now on."
	done

SafariArea3RestHousePokefanText:
	text "WAHOO!"
	line "I did it!"

	para "I finally caught a"
	line "CHANSEY all of my"
	cont "own!"

	para "And it was green!"
	line "I've never seen one"
	cont "like that."
	done

SafariZoneArea3RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_3, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_3, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea3RestHouseReceptionist, -1
	object_event  4,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariArea3RestHouseCooltrainerF, -1
	object_event  3,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea3RestHousePokefan, -1
