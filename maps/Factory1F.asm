	const_def 2 ; object constants
	const FACTORY1F_BOULDER1
	const FACTORY1F_BOULDER2
	const FACTORY1F_BOULDER3
	const FACTORY1F_BOULDER4
	const FACTORY1F_BOULDER5
	const FACTORY1F_BOULDER6
	const FACTORY1F_ROCK
	const FACTORY1F_ITEM_BALL1
	const FACTORY1F_ITEM_BALL2
	const FACTORY1F_ITEM_BALL3
	const FACTORY1F_BOOK

Factory1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Doors

.Doors:
	checkevent EVENT_FACTORY_1F_DOOR_1_OPEN
	iffalse .CheckDoor2
	changeblock 12, 8, $07
.CheckDoor2
	checkevent EVENT_FACTORY_1F_DOOR_2_OPEN
	iffalse .skip
	changeblock 10, 14, $B6
	changeblock 12, 14, $24
	checkevent EVENT_FACTORY_BACK_ROOM_OPEN
	iffalse .skip
	changeblock 14, 0, $4C
	changeblock 16, 0, $A8
.skip
	return

Factory1FPasscodeDoor1:
	opentext
	checkevent EVENT_FACTORY_1F_DOOR_1_OPEN
	iftrue .AlreadyOpened
	writetext Factory1FPasscodeDoorText
	waitbutton
	checkitem JOURNAL_PAGE
	iffalse .NoPasscode
	writetext Factory1FPasscodeEnterText
	refreshscreen
	closetext
	setevent EVENT_FACTORY_1F_DOOR_1_OPEN
	changeblock 12, 8, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext Factory1FPasscodeWorkedText
	waitbutton
.NoPasscode
	closetext
	end
.AlreadyOpened
	writetext Factory1FDoorOpenedText
	waitbutton
	closetext
	end

Factory1FPasscodeDoor2:
	opentext
	checkevent EVENT_FACTORY_1F_DOOR_2_OPEN
	iftrue .AlreadyOpened
	writetext Factory1FPasscodeDoorText
	waitbutton
	checkitem JOURNAL_PAGE
	iffalse .NoPasscode
	writetext Factory1FPasscodeEnterText
	waitbutton
	closetext
	setevent EVENT_FACTORY_1F_DOOR_2_OPEN
	changeblock 10, 14, $B6
	changeblock 12, 14, $24
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext Factory1FPasscodeWorkedText
	waitbutton
.NoPasscode
	closetext
	end
.AlreadyOpened
	writetext Factory1FDoorOpenedText
	waitbutton
	closetext
	end

Factory1FBackDoor:
	conditional_event EVENT_FACTORY_BACK_ROOM_OPEN, .Script

.Script
	opentext
	writetext Factory1FBackDoorKeySlotText
	waitbutton
	checkitem BACKDOOR_KEY
	iffalse .nope
	writetext Factory1FBackDoorUseKeyText
	yesorno
	iffalse .nope
	writetext Factory1FUsedBackdoorKeyText
	waitbutton
	closetext
	setevent EVENT_FACTORY_BACK_ROOM_OPEN
	changeblock 14, 0, $4C
	changeblock 16, 0, $A8
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	takeitem BACKDOOR_KEY
	opentext
	writetext Factory1FBackdoorOpenedText
	waitbutton
.nope
	closetext
	end

FactoryPasscode:
	opentext
	checkevent EVENT_FACTORY_TOOK_JOURNAL_PAGE
	iftrue .AlreadyKnow
	writetext Factory1FPasscodePaperText
	yesorno
	iffalse .Decline
	writetext Factory1FTakeJournalPageText
	waitbutton
	verbosegiveitem JOURNAL_PAGE
	setevent EVENT_FACTORY_TOOK_JOURNAL_PAGE
.Decline
	closetext
	end

.AlreadyKnow
	writetext Factory1FJournalAfterText
	waitbutton
	closetext
	end

Factory1FVendingMachine1:
	opentext
	writetext FactoryVendingMachineText
	yesorno
	iffalse .Decline
	writetext FactoryVendingMachineEmptyText
	waitbutton
.Decline
	closetext
	end

Factory1FVendingMachine2:
	checkevent EVENT_FACTORY_1F_FRIEND_BALL
	iftrue Factory1FVendingMachine1
	opentext
	writetext FactoryVendingMachineText
	yesorno
	iffalse .Decline
	checkevent EVENT_FACTORY_1F_HEAVY_BALL
	iftrue .FriendBall
	itemtotext HEAVY_BALL, MEM_BUFFER_0
	writetext FactoryVendingMachineFoundItemText
	waitbutton
	giveitem HEAVY_BALL
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_1F_HEAVY_BALL
	itemtotext FRIEND_BALL, MEM_BUFFER_0
	writetext FactoryVendingMachineAnotherItemText
	waitbutton
	giveitem FRIEND_BALL
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_1F_FRIEND_BALL
.Decline
	closetext
	end

.FriendBall
	itemtotext FRIEND_BALL, MEM_BUFFER_0
	writetext FactoryVendingMachineFoundItemText
	waitbutton
	giveitem FRIEND_BALL
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_1F_FRIEND_BALL
	closetext
	end

.NoRoom
	writetext FactoryVendingMachineNoRoomText
	waitbutton
	closetext
	end

Factory1FVendingMachine3:
	checkevent EVENT_FACTORY_1F_GREAT_BALL
	iftrue Factory1FVendingMachine1
	opentext
	writetext FactoryVendingMachineText
	yesorno
	iffalse .Decline
	itemtotext GREAT_BALL, MEM_BUFFER_0
	writebyte 20
	writetext FactoryVendingMachineFoundMultipleItemText
	waitbutton
	giveitem GREAT_BALL, 20
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeMultipleItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_1F_GREAT_BALL
.Decline
	closetext
	end

.NoRoom
	writetext FactoryVendingMachineNoRoomMultipleText
	waitbutton
	closetext
	end

Factory1FBoulder:
	jumpstd strengthboulder

Factory1FSmashRock:
	jumpstd smashrock

FactoryBasementKey:
	itemball BASEMENT_KEY
	
FactoryBackDoorKey:
	itemball BACKDOOR_KEY

Factory1FXSpAtk:
	itemball X_SP_ATK

Factory1FMetalCoat:
	itemball METAL_COAT

Factory1FHiddenPokeBall:
	hiddenitem POKE_BALL, EVENT_FACTORY_HIDDEN_POKE_BALL

Factory1FHiddenRevive:
	hiddenitem REVIVE, EVENT_FACTORY_HIDDEN_REVIVE

Factory1FHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_FACTORY_HIDDEN_SILVER_LEAF

Factory1FPasscodeDoorText:
	text "There's a keypad"
	line "on this terminal."

	para "It must require a"
	line "pass code to open."
	done

Factory1FPasscodeEnterText:
	text "<PLAYER> entered"
	line "a pass code from"
	cont "the JOURNAL PAGE…"
	done

Factory1FPasscodeWorkedText:
	text "The door opened!"
	done

Factory1FDoorOpenedText:
	text "The door has"
	line "already opened."
	done

Factory1FBackDoorKeySlotText:
	text "These doors are"
	line "shut tight!"

	para "There must be a"
	line "KEY for them"
	cont "around somewhere…"
	done

Factory1FBackDoorUseKeyText:
	text "Use the BACKDOOR"
	line "KEY on this door?"
	done

Factory1FUsedBackdoorKeyText:
	text "<PLAYER> used the"
	line "BACKDOOR KEY!"
	done

Factory1FBackdoorOpenedText:
	text "There! The doors"
	line "were unlocked!"

	para "…But the KEY broke"
	line "off in the lock."
	done

Factory1FPasscodePaperText:
	text "The journal is"
	line "opened to a page"
	cont "of access codes."

	para "…It would be impo-"
	line "ssible to memorize"
	cont "these codes!"

	para "Take the page?"
	done

Factory1FTakeJournalPageText:
	text "<PLAYER> tore the"
	line "page out of the"
	cont "journal."
	done

Factory1FJournalAfterText:
	text "The rest of the"
	line "journal is filled"
	cont "with #BALL sch-"
	cont "ematics."
	done

FactoryVendingMachineText:
	text "It looks like a"
	line "vending machine"
	cont "for #BALLs."

	para "Check inside it?"
	done

FactoryVendingMachineEmptyText:
	text "There's nothing"
	line "inside…"
	done

FactoryVendingMachineFoundItemText:
	text "Hey! There's a"
	line "@"
	text_from_ram wStringBuffer3
	text " inside!"
	done

FactoryVendingMachineTakeItemText:
	text "<PLAYER> took the"
	line "@"
	text_from_ram wStringBuffer3
	text " from"
	cont "the machine."
	done

FactoryVendingMachineTakeMultipleItemText:
	text "<PLAYER> took the"
	line "@"
	text_from_ram wStringBuffer3
	text "s from"
	cont "the machine."
	done

FactoryVendingMachineFoundMultipleItemText:
	text "Hey! There's some"
	line "@"
	text_from_ram wStringBuffer3
	text "s left"
	cont "in the machine!"

	para "There's @"
	deciram wScriptVar, 1, 3
	text " of them"
	line "in total!"
	done

FactoryVendingMachineAnotherItemText:
	text "There's a"
	line "@"
	text_from_ram wStringBuffer3
	text " too!"
	done

FactoryVendingMachineNoRoomText:
	text "…But there's no-"
	line "where to put it."
	done

FactoryVendingMachineNoRoomMultipleText:
	text "…But there's no-"
	line "where to put them."
	done

Factory1F_MapEvents:
	db 0, 0 ; filler

	db 18 ; warp events
	warp_event 24, 23, EAST_FOREST, 3
	warp_event 25, 23, EAST_FOREST, 4
	warp_event 16, 14, FACTORY_B1, 1
	warp_event 11,  4, FACTORY_B1, 2
	warp_event  6, 22, FACTORY_2F, 1
	warp_event  2, 10, FACTORY_2F, 2
	warp_event 28, 14, FACTORY_2F, 3
	warp_event 15,  0, FACTORY_BACK, 1
	warp_event 16,  0, FACTORY_BACK, 2
	warp_event  9, 20, FACTORY_2F, 4
	warp_event 17, 19, FACTORY_2F, 5
	warp_event 17, 16, FACTORY_2F, 6
	warp_event 24, 20, FACTORY_2F, 7
	warp_event 27, 22, FACTORY_2F, 8
	warp_event 22, 17, FACTORY_2F, 9
	warp_event 10, 17, FACTORY_2F, 10
	warp_event 11, 18, FACTORY_2F, 11
	warp_event 19, 21, FACTORY_2F, 12

	db 0 ; coord events

	db 11 ; bg events
	bg_event 14,  8, BGEVENT_UP, Factory1FPasscodeDoor1
	bg_event 10, 15, BGEVENT_UP, Factory1FPasscodeDoor2
	bg_event 15,  0, BGEVENT_IFNOTSET, Factory1FBackDoor
	bg_event 16,  0, BGEVENT_IFNOTSET, Factory1FBackDoor
	bg_event 28, 17, BGEVENT_UP, Factory1FVendingMachine1
	bg_event 30, 17, BGEVENT_UP, Factory1FVendingMachine1
	bg_event 26,  3, BGEVENT_UP, Factory1FVendingMachine2
	bg_event 31, 17, BGEVENT_UP, Factory1FVendingMachine3
	bg_event 29, 16, BGEVENT_ITEM, Factory1FHiddenPokeBall
	bg_event 23, 22, BGEVENT_ITEM, Factory1FHiddenSilverLeaf
	bg_event  2,  7, BGEVENT_ITEM, Factory1FHiddenRevive

	db 12 ; object events
	object_event 26,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 20,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 27,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 20, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 14,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 13, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FBoulder, -1
	object_event 17, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory1FSmashRock, -1
	object_event 28,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryBasementKey, EVENT_RECEIVED_BASEMENT_KEY
	object_event 10,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryBackDoorKey, EVENT_FACTORY_BACK_ROOM_KEY
	object_event  1, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Factory1FXSpAtk, EVENT_FACTORY_1F_X_SP_ATK
	object_event 19, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Factory1FMetalCoat, EVENT_FACTORY_1F_METAL_COAT
	object_event  6, 16, SPRITE_PAPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FactoryPasscode, -1
