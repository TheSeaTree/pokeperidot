	const_def 2 ; object constants
	const ABANDONEDFACTORY1F_BOULDER1
	const ABANDONEDFACTORY1F_BOULDER2
	const ABANDONEDFACTORY1F_BOULDER3
	const ABANDONEDFACTORY1F_BOULDER4
	const ABANDONEDFACTORY1F_BOULDER5
	const ABANDONEDFACTORY1F_BOULDER6
	const ABANDONEDFACTORY1F_ROCK
	const ABANDONEDFACTORY1F_ITEM_BALL1
	const ABANDONEDFACTORY1F_ITEM_BALL2
	const ABANDONEDFACTORY1F_ITEM_BALL3
	const ABANDONEDFACTORY1F_BOOK

AbandonedFactory1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Doors

.Doors:
	checkevent EVENT_ABANDONED_FACTORY_1F_DOOR_1_OPEN
	iffalse .CheckDoor2
	changeblock 12, 8, $07
.CheckDoor2
	checkevent EVENT_ABANDONED_FACTORY_1F_DOOR_2_OPEN
	iffalse .skip
	changeblock 10, 14, $CC
	changeblock 12, 14, $24
	checkevent EVENT_ABANDONED_FACTORY_BACK_ROOM_OPEN
	iffalse .skip
	changeblock 14, 0, $4C
	changeblock 16, 0, $A8
.skip
	return

AbandonedFactory1FPasscodeDoor1:
	opentext
	checkevent EVENT_ABANDONED_FACTORY_1F_DOOR_1_OPEN
	iftrue .AlreadyOpened
	writetext AbandonedFactory1FPasscodeDoorText
	waitbutton
	checkitem JOURNAL_PAGE
	iffalse .NoPasscode
	writetext AbandonedFactory1FPasscodeEnterText
	refreshscreen
	closetext
	setevent EVENT_ABANDONED_FACTORY_1F_DOOR_1_OPEN
	changeblock 12, 8, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext AbandonedFactory1FPasscodeWorkedText
	waitbutton
.NoPasscode
	closetext
	end
.AlreadyOpened
	writetext AbandonedFactory1FDoorOpenedText
	waitbutton
	closetext
	end

AbandonedFactory1FPasscodeDoor2:
	opentext
	checkevent EVENT_ABANDONED_FACTORY_1F_DOOR_2_OPEN
	iftrue .AlreadyOpened
	writetext AbandonedFactory1FPasscodeDoorText
	waitbutton
	checkitem JOURNAL_PAGE
	iffalse .NoPasscode
	writetext AbandonedFactory1FPasscodeEnterText
	waitbutton
	closetext
	setevent EVENT_ABANDONED_FACTORY_1F_DOOR_2_OPEN
	changeblock 10, 14, $CC
	changeblock 12, 14, $24
	playsound SFX_ENTER_DOOR
	reloadmappart
	opentext
	writetext AbandonedFactory1FPasscodeWorkedText
	waitbutton
.NoPasscode
	closetext
	end
.AlreadyOpened
	writetext AbandonedFactory1FDoorOpenedText
	waitbutton
	closetext
	end

AbandonedFactory1FBackDoor:
	conditional_event EVENT_ABANDONED_FACTORY_BACK_ROOM_OPEN, .Script

.Script
	opentext
	writetext AbandonedFactory1FBackDoorKeySlotText
	waitbutton
	checkitem BACKDOOR_KEY
	iffalse .nope
	writetext AbandonedFactory1FBackDoorUseKeyText
	yesorno
	iffalse .nope
	writetext AbandonedFactory1FUsedBackdoorKeyText
	waitbutton
	closetext
	setevent EVENT_ABANDONED_FACTORY_BACK_ROOM_OPEN
	changeblock 14, 0, $4C
	changeblock 16, 0, $A8
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	takeitem BACKDOOR_KEY
	opentext
	writetext AbandonedFactory1FBackdoorOpenedText
	waitbutton
.nope
	closetext
	end

AbandonedFactoryPasscode:
	opentext
	checkevent EVENT_ABANDONED_FACTORY_TOOK_JOURNAL_PAGE
	iftrue .AlreadyKnow
	writetext AbandonedFactory1FPasscodePaperText
	yesorno
	iffalse .Decline
	writetext AbandonedFactory1FTakeJournalPageText
	waitbutton
	verbosegiveitem JOURNAL_PAGE
	setevent EVENT_ABANDONED_FACTORY_TOOK_JOURNAL_PAGE
.Decline
	closetext
	end

.AlreadyKnow
	writetext AbandonedFactory1FJournalAfterText
	waitbutton
	closetext
	end

AbandonedFactory1FVendingMachine1:
	opentext
	writetext AbandonedFactoryVendingMachineText
	yesorno
	iffalse .Decline
	writetext AbandonedFactoryVendingMachineEmptyText
	waitbutton
.Decline
	closetext
	end

AbandonedFactory1FVendingMachine2:
	checkevent EVENT_ABANDONED_FACTORY_1F_FRIEND_BALL
	iftrue AbandonedFactory1FVendingMachine1
	opentext
	writetext AbandonedFactoryVendingMachineText
	yesorno
	iffalse .Decline
	checkevent EVENT_ABANDONED_FACTORY_1F_HEAVY_BALL
	iftrue .FriendBall
	itemtotext HEAVY_BALL, MEM_BUFFER_0
	writetext AbandonedFactoryVendingMachineFoundItemText
	waitbutton
	giveitem HEAVY_BALL
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_1F_HEAVY_BALL
	itemtotext FRIEND_BALL, MEM_BUFFER_0
	writetext AbandonedFactoryVendingMachineAnotherItemText
	waitbutton
	giveitem FRIEND_BALL
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_1F_FRIEND_BALL
.Decline
	closetext
	end

.FriendBall
	itemtotext FRIEND_BALL, MEM_BUFFER_0
	writetext AbandonedFactoryVendingMachineFoundItemText
	waitbutton
	giveitem FRIEND_BALL
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_1F_FRIEND_BALL
	closetext
	end

.NoRoom
	writetext AbandonedFactoryVendingMachineNoRoomText
	waitbutton
	closetext
	end

AbandonedFactory1FVendingMachine3:
	checkevent EVENT_ABANDONED_FACTORY_1F_GREAT_BALL
	iftrue AbandonedFactory1FVendingMachine1
	opentext
	writetext AbandonedFactoryVendingMachineText
	yesorno
	iffalse .Decline
	itemtotext GREAT_BALL, MEM_BUFFER_0
	writebyte 20
	writetext AbandonedFactoryVendingMachineFoundMultipleItemText
	waitbutton
	giveitem GREAT_BALL, 20
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeMultipleItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_1F_GREAT_BALL
.Decline
	closetext
	end

.NoRoom
	writetext AbandonedFactoryVendingMachineNoRoomMultipleText
	waitbutton
	closetext
	end

AbandonedFactory1FBoulder:
	jumpstd strengthboulder

AbandonedFactory1FSmashRock:
	jumpstd smashrock

AbandonedFactoryBasementKey:
	itemball BASEMENT_KEY
	
AbandonedFactoryBackDoorKey:
	itemball BACKDOOR_KEY

AbandonedFactory1FXSpAtk:
	itemball X_SP_ATK

AbandonedFactory1FMetalCoat:
	itemball METAL_COAT

AbandonedFactory1FHiddenPokeBall:
	hiddenitem POKE_BALL, EVENT_ABANDONED_FACTORY_HIDDEN_POKE_BALL

AbandonedFactory1FHiddenRevive:
	hiddenitem REVIVE, EVENT_ABANDONED_FACTORY_HIDDEN_REVIVE

AbandonedFactory1FHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_ABANDONED_FACTORY_HIDDEN_SILVER_LEAF

AbandonedFactory1FPasscodeDoorText:
	text "There's a keypad"
	line "on this terminal."

	para "It must require a"
	line "pass code to open."
	done

AbandonedFactory1FPasscodeEnterText:
	text "<PLAYER> entered"
	line "a pass code from"
	cont "the JOURNAL PAGE…"
	done

AbandonedFactory1FPasscodeWorkedText:
	text "The door opened!"
	done

AbandonedFactory1FDoorOpenedText:
	text "The door has"
	line "already opened."
	done

AbandonedFactory1FBackDoorKeySlotText:
	text "These doors are"
	line "shut tight!"

	para "There must be a"
	line "KEY for them"
	cont "around somewhere…"
	done

AbandonedFactory1FBackDoorUseKeyText:
	text "Use the BACKDOOR"
	line "KEY on this door?"
	done

AbandonedFactory1FUsedBackdoorKeyText:
	text "<PLAYER> used the"
	line "BACKDOOR KEY!"
	done

AbandonedFactory1FBackdoorOpenedText:
	text "There! The doors"
	line "were unlocked!"

	para "…But the KEY broke"
	line "off in the lock."
	done

AbandonedFactory1FPasscodePaperText:
	text "The journal is"
	line "opened to a page"
	cont "of access codes."

	para "…It would be impo-"
	line "ssible to memorize"
	cont "these codes!"

	para "Take the page?"
	done

AbandonedFactory1FTakeJournalPageText:
	text "<PLAYER> tore the"
	line "page out of the"
	cont "journal."
	done

AbandonedFactory1FJournalAfterText:
	text "The rest of the"
	line "journal is filled"
	cont "with #BALL sch-"
	cont "ematics."
	done

AbandonedFactoryVendingMachineText:
	text "It looks like a"
	line "vending machine"
	cont "for #BALLs."

	para "Check inside it?"
	done

AbandonedFactoryVendingMachineEmptyText:
	text "There's nothing"
	line "inside…"
	done

AbandonedFactoryVendingMachineFoundItemText:
	text "Hey! There's a"
	line "@"
	text_from_ram wStringBuffer3
	text " inside!"
	done

AbandonedFactoryVendingMachineTakeItemText:
	text "<PLAYER> took the"
	line "@"
	text_from_ram wStringBuffer3
	text " from"
	cont "the machine."
	done

AbandonedFactoryVendingMachineTakeMultipleItemText:
	text "<PLAYER> took the"
	line "@"
	text_from_ram wStringBuffer3
	text "s from"
	cont "the machine."
	done

AbandonedFactoryVendingMachineFoundMultipleItemText:
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

AbandonedFactoryVendingMachineAnotherItemText:
	text "There's a"
	line "@"
	text_from_ram wStringBuffer3
	text " too!"
	done

AbandonedFactoryVendingMachineNoRoomText:
	text "…But there's no-"
	line "where to put it."
	done

AbandonedFactoryVendingMachineNoRoomMultipleText:
	text "…But there's no-"
	line "where to put them."
	done

AbandonedFactory1F_MapEvents:
	db 0, 0 ; filler

	db 18 ; warp events
	warp_event 24, 23, ORIENTEM_FOREST, 3
	warp_event 25, 23, ORIENTEM_FOREST, 4
	warp_event 16, 14, ABANDONED_FACTORY_B1, 1
	warp_event 11,  4, ABANDONED_FACTORY_B1, 2
	warp_event  6, 22, ABANDONED_FACTORY_2F, 1
	warp_event  2, 10, ABANDONED_FACTORY_2F, 2
	warp_event 28, 14, ABANDONED_FACTORY_2F, 3
	warp_event 15,  0, ABANDONED_FACTORY_BACK, 1
	warp_event 16,  0, ABANDONED_FACTORY_BACK, 2
	warp_event  9, 20, ABANDONED_FACTORY_2F, 4
	warp_event 17, 19, ABANDONED_FACTORY_2F, 5
	warp_event 17, 16, ABANDONED_FACTORY_2F, 6
	warp_event 24, 20, ABANDONED_FACTORY_2F, 7
	warp_event 27, 22, ABANDONED_FACTORY_2F, 8
	warp_event 22, 17, ABANDONED_FACTORY_2F, 9
	warp_event 10, 17, ABANDONED_FACTORY_2F, 10
	warp_event 11, 18, ABANDONED_FACTORY_2F, 11
	warp_event 19, 21, ABANDONED_FACTORY_2F, 12

	db 0 ; coord events

	db 11 ; bg events
	bg_event 14,  8, BGEVENT_UP, AbandonedFactory1FPasscodeDoor1
	bg_event 10, 15, BGEVENT_UP, AbandonedFactory1FPasscodeDoor2
	bg_event 15,  0, BGEVENT_IFNOTSET, AbandonedFactory1FBackDoor
	bg_event 16,  0, BGEVENT_IFNOTSET, AbandonedFactory1FBackDoor
	bg_event 28, 17, BGEVENT_UP, AbandonedFactory1FVendingMachine1
	bg_event 30, 17, BGEVENT_UP, AbandonedFactory1FVendingMachine1
	bg_event 26,  3, BGEVENT_UP, AbandonedFactory1FVendingMachine2
	bg_event 31, 17, BGEVENT_UP, AbandonedFactory1FVendingMachine3
	bg_event 29, 16, BGEVENT_ITEM, AbandonedFactory1FHiddenPokeBall
	bg_event 23, 22, BGEVENT_ITEM, AbandonedFactory1FHiddenSilverLeaf
	bg_event  2,  7, BGEVENT_ITEM, AbandonedFactory1FHiddenRevive

	db 12 ; object events
	object_event 26,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FBoulder, -1
	object_event 20,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FBoulder, -1
	object_event 27,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FBoulder, -1
	object_event 20, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FBoulder, -1
	object_event 14,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FBoulder, -1
	object_event 13, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FBoulder, -1
	object_event 17, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory1FSmashRock, -1
	object_event 28,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactoryBasementKey, EVENT_RECEIVED_BASEMENT_KEY
	object_event 10,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactoryBackDoorKey, EVENT_ABANDONED_FACTORY_BACK_ROOM_KEY
	object_event  1, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactory1FXSpAtk, EVENT_ABANDONED_FACTORY_1F_X_SP_ATK
	object_event 19, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactory1FMetalCoat, EVENT_ABANDONED_FACTORY_1F_METAL_COAT
	object_event  6, 16, SPRITE_PAPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactoryPasscode, -1
