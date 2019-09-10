	const_def 2 ; object constants
	const CARNATIONZOO_SCYTHER
	const CARNATIONZOO_LAPRAS
	const CARNATIONZOO_MACHOKE
	const CARNATIONZOO_RHYHORN
	const CARNATIONZOO_SUDOWOODO
	const CARNATIONZOO_CHILD
	const CARNATIONZOO_MOTHER
	const CARNATIONZOO_SWIMMER
	const CARNATIONZOO_BLACKBELT
	const CARNATIONZOO_YOUNGSTER

CarnationZoo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CarnationZooSwimmer:
	jumptextfaceplayer CarnationZooSwimmerText
	
CarnationZooBlackBelt:
	jumptextfaceplayer CarnationZooBlackBeltText
	
CarnationZooYoungster:
	jumptextfaceplayer CarnationZooYoungsterText
	
CarnationZooMotherSon:
	applymovement CARNATIONZOO_CHILD, CarnationZooChildStomp
	turnobject CARNATIONZOO_CHILD, RIGHT
	opentext
	writetext CarnationZooChildText
	waitbutton
	turnobject CARNATIONZOO_MOTHER, LEFT
	opentext
	writetext CarnationZooMotherText
	waitbutton
	closetext
	applymovement CARNATIONZOO_CHILD, CarnationZooChildStomp
	opentext
	writetext CarnationZooChildText2
	waitbutton	
	writetext CarnationZooMotherText2
	waitbutton
	closetext
	turnobject CARNATIONZOO_CHILD, RIGHT
	opentext
	writetext CarnationZooChildText3
	waitbutton	
	closetext
	turnobject CARNATIONZOO_CHILD, UP
	turnobject CARNATIONZOO_MOTHER, UP
	end	

SafariZoneGateSign:
	jumptext SafariZoneGateSignText
	
LaprasSign:
	refreshscreen
	pokepic LAPRAS
	cry LAPRAS
	waitsfx
	closepokepic
	writebyte LAPRAS
	special UnusedSetSeenMon
	jumptext LaprasSignText

MachokeSign:
	refreshscreen
	pokepic MACHOKE
	cry MACHOKE
	waitsfx
	closepokepic
	writebyte MACHOKE
	special UnusedSetSeenMon
	jumptext MachokeSignText

ScytherSign:
	refreshscreen
	pokepic SCYTHER
	cry SCYTHER
	waitsfx
	closepokepic
	writebyte SCYTHER
	special UnusedSetSeenMon
	jumptext ScytherSignText

SudowoodoSign:
	opentext
	writetext SudowoodoSignText
	waitbutton
	closetext
	playsound SFX_SANDSTORM
	applymovement CARNATIONZOO_SUDOWOODO, SudowoodoShakeMovement
	waitsfx
	cry SUDOWOODO
	waitsfx
	jumptext SudowoodoAfterText

RhyhornSign:
	refreshscreen
	pokepic RHYHORN
	cry RHYHORN
	waitsfx
	closepokepic
	writebyte RHYHORN
	special UnusedSetSeenMon
	jumptext RhyhornSignText
	
CarnationZooVendingMachine:
	opentext
	writetext ZooVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .Lemonade
	ifequal 3, .RageCandyBar
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 350
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem
	
.Lemonade:
	checkmoney YOUR_MONEY, 450
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 450
	itemtotext LEMONADE, MEM_BUFFER_0
	jump .VendItem

.RageCandyBar:
	checkmoney YOUR_MONEY, 800
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 800
	itemtotext RAGECANDYBAR, MEM_BUFFER_0
	jump .VendItem
	
.VendItem:
	pause 10
	special PlaceMoneyTopRight
	playsound SFX_ENTER_DOOR
	writetext ZooClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext ZooVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext ZooVendingNoSpaceText
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FRESH WATER  ¥350@"
	db "LEMONADE     ¥450@"
	db "RAGECANDYBAR ¥800@"
	db "CANCEL@"
	
CarnationZooChildStomp:
	turn_step UP
	step_sleep 8
	turn_step UP
	step_sleep 8
	step_resume
	
SudowoodoShakeMovement:
	tree_shake
	step_resume
	
CarnationZooSwimmerText:
	text "One day I hope to"
	line "ride around the"
	cont "world on the back"
	cont "of my very own"
	cont "LAPRAS."
	
	para "Sigh…"
	line "Someday…"
	done

CarnationZooBlackBeltText:
	text "You know, I used"
	line "to be a SUPER NERD"
	cont "before MACHOKE"
	cont "inspired me to"
	cont "start working out."
	
	para "I owe it all to"
	line "this guy right"
	cont "here."
	done
	
CarnationZooYoungsterText:
	text "This zoo is cool"
	line "and all, but I"
	cont "prefer to get up"
	cont "close and personal"
	cont "with #MON."
	
	para "Unfortunately, I'm"
	line "out of money…"
	done

CarnationZooChildText:
	text "Mommy, Mommy!"
	line "Can you catch me a"
	cont "SCYTHER in the"
	cont "SAFARI ZONE?"
	
	para "Pleeease!"
	
	para "I'll take good"
	line "care of it."
	cont "I promise!"
	done
	
CarnationZooChildText2:
	text "I know…"
	
	para "But they're just"
	line "so cool!"
	done
	
CarnationZooMotherText:
	text "Now, now. You know"
	line "we don't have the"
	cont "kind of home a"
	cont "SCYTHER needs."
	done
	
CarnationZooMotherText2:
	text "How about we stop"
	line "at the toy store"
	cont "on the way home so"
	cont "you can pick out a"
	cont "SCYTHER doll"
	cont "instead?"
	done
	
CarnationZooChildText3:
	text "Wow! Really?"
	
	para "That would be the"
	line "best!"
	
	para "Thanks Mommy!"
	done
	
ZooVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

ZooClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
ZooVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

ZooVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

LaprasSignText:
	text "It's LAPRAS!"
	
	para "It says LAPRAS are"
	line "intelligent enough"
	cont "to understand"
	cont "human speech."
	done

MachokeSignText:
	text "It's MACHOKE!"
	done

ScytherSignText:
	text "SCYTHER is showing"
	line "off for the child."
	done

SudowoodoSignText:
	text "Wait a second…"
	
	para "This isn't a"
	line "#MON…"
	done
	
SudowoodoAfterText:
	text "Oh, it says this"
	line "is a SUDOWOODO."
	
	para "They oftentimes"
	line "mimic trees."
	done

RhyhornSignText:
	text "It's RHYHORN!"
	done

SafariZoneGateSignText:
	text "SAFARI ZONE-"
	line "Main gate."
	done

CarnationZoo_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 29, 14, CARNATION_TOWN, 3
	warp_event 29, 15, CARNATION_TOWN, 4
	warp_event 12,  5, SAFARI_ZONE_GATE_1F, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 11,  9, BGEVENT_READ, SafariZoneGateSign
	bg_event 16, 15, BGEVENT_READ, LaprasSign
	bg_event  7, 15, BGEVENT_READ, MachokeSign
	bg_event 21, 19, BGEVENT_READ, ScytherSign
	bg_event  3, 21, BGEVENT_READ, SudowoodoSign
	bg_event 13, 21, BGEVENT_READ, RhyhornSign
	bg_event  6,  9, BGEVENT_UP, CarnationZooVendingMachine
	bg_event 19, 19, BGEVENT_UP, CarnationZooVendingMachine

	db 10 ; object events
	object_event 23, 17, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 14, SPRITE_LAPRAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 14, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12, 19, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4, 19, SPRITE_SUDOWOODO, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 23, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CarnationZooMotherSon, -1
	object_event 24, 20, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CarnationZooMotherSon, -1
	object_event 14, 16, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CarnationZooSwimmer, -1
	object_event  3, 14, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CarnationZooBlackBelt, -1
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CarnationZooYoungster, -1
	