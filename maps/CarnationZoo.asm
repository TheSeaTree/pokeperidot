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
	const CARNATIONZOO_FANGIRL

CarnationZoo_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks
	
.DummyScene:
	end
	
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

CarnationZooEmilyBattleLeft:
	playsound SFX_EXIT_BUILDING
	special FadeOutMusic
	checkcode VAR_MOVEMENT
	ifnotequal PLAYER_RUN, .NotRunning
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special ReplaceKrisSprite
.NotRunning
	moveobject CARNATIONZOO_FANGIRL, 12, 5
	appear CARNATIONZOO_FANGIRL
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	applymovement CARNATIONZOO_FANGIRL, CarnationZooFangirlExitBuilding
	showemote EMOTE_SHOCK, CARNATIONZOO_FANGIRL, 15
	opentext
	writetext CarnationZooFangirlIntroText
	waitbutton
	closetext
	applymovement CARNATIONZOO_FANGIRL, CarnationZooFangirlApproachPlayerLeft
	
	scall CarnationZooEmilyContinue

	applymovement CARNATIONZOO_FANGIRL, CarnationZooFangirlLeaveLeft
	disappear CARNATIONZOO_FANGIRL
	setscene SCENE_FINISHED
	playmapmusic
	end

CarnationZooEmilyBattleRight:
	playsound SFX_EXIT_BUILDING
	special FadeOutMusic
	special StopPlayerRunning
	moveobject CARNATIONZOO_FANGIRL, 12, 5
	appear CARNATIONZOO_FANGIRL
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	applymovement CARNATIONZOO_FANGIRL, CarnationZooFangirlExitBuilding
	showemote EMOTE_SHOCK, CARNATIONZOO_FANGIRL, 15
	opentext
	writetext CarnationZooFangirlIntroText
	waitbutton
	closetext
	applymovement CARNATIONZOO_FANGIRL, CarnationZooFangirlApproachPlayerRight
	turnobject CARNATIONZOO_FANGIRL, RIGHT
	turnobject PLAYER, LEFT
	
	scall CarnationZooEmilyContinue

	applymovement CARNATIONZOO_FANGIRL, CarnationZooFangirlLeaveRight
	disappear CARNATIONZOO_FANGIRL
	setscene SCENE_FINISHED
	playmapmusic
	end

CarnationZooEmilyContinue:
	opentext
	writetext CarnationZooFangirlVisitedSafariText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, CARNATIONZOO_FANGIRL, 15
	opentext
	writetext CarnationZooFangirlExplainSafariText
	waitbutton
	closetext
	winlosstext CarnationZooFangirlWinText, CarnatioNZooFangirlLossText
	loadtrainer FANGIRL, EMILY3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
.AfterBattle
	opentext
	writetext CarnationZooFangirlAfterText
	waitbutton
	closetext
	checkevent EVENT_CLAIMED_LUCKY_EGG
	iffalse .TryGiveLuckyEgg
	end
	
.TryGiveLuckyEgg:
	showemote EMOTE_SHOCK, CARNATIONZOO_FANGIRL, 15
	opentext
	writetext CarnationZooFangirlGiveLuckyEggText
	waitbutton
	setevent EVENT_BEAT_EMILYS_HOUSE
	verbosegiveitem LUCKY_EGG
	iffalse .NoRoom
	setevent EVENT_CLAIMED_LUCKY_EGG
	writetext CarnationZooFangirlAfterLuckyEggText
	waitbutton
	closetext
	end
	
.NoRoom
	writetext CarnationZooFangirlNoRoomText
	waitbutton
	closetext
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
	special SetSeenMon
	jumptext LaprasSignText

MachokeSign:
	refreshscreen
	pokepic MACHOKE
	cry MACHOKE
	waitsfx
	closepokepic
	writebyte MACHOKE
	special SetSeenMon
	jumptext MachokeSignText

ScytherSign:
	refreshscreen
	pokepic SCYTHER
	cry SCYTHER
	waitsfx
	closepokepic
	writebyte SCYTHER
	special SetSeenMon
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
	special SetSeenMon
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
	special PlaceMoneyTopRight
	pause 10
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
	
CarnationZooFangirlExitBuilding:
	step DOWN
	step_resume

CarnationZooFangirlApproachPlayerRight:
	step DOWN

CarnationZooFangirlApproachPlayerLeft:
	step DOWN
	step_resume
	
CarnationZooFangirlLeaveLeft:
	step RIGHT
	step DOWN

CarnationZooFangirlLeaveRight:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
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
	
	para "Thanks, Mommy!"
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

	para "The belt they wear"
	line "keeps their power"
	cont "under control."
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

	para "It says they can"
	line "be very destruct-"
	cont "ive when they"
	cont "stampede, but this"
	cont "one seems calm."
	done

CarnationZooFangirlIntroText:
	text "<PLAYER>!"
	line "What a surprise!"
	done

CarnationZooFangirlVisitedSafariText:
	text "Check it out! I"
	line "have 7 BADGEs now!"
	
	para "I'm just taking a"
	line "short break before"
	cont "heading to ORCHID"
	cont "CITY for my final"
	cont "BADGE."
	
	para "Have you been to"
	line "the SAFARI ZONE?"
	
	para "I just caught some"
	line "great new #MON"
	cont "there!"
	done
	
CarnationZooFangirlExplainSafariText:
	text "What? You haven't"
	line "been to the SAFARI"
	cont "ZONE yet?"

	para "A lot of rare"
	line "#MON can only"
	cont "be found there."

	para "Here, let me show"
	line "you some of the"
	cont "ones I caught!"
	done
	
CarnationZooFangirlWinText:
	text "No big deal."

	para "These #MON will"
	line "get better after"
	cont "some training!"
	done

CarnatioNZooFangirlLossText:
	text "Oh, wow!"
	
	para "These #MON are"
	line "strong even with-"
	cont "out training!"
	done

CarnationZooFangirlAfterText:
	text "You put up a good"
	line "fight, but I think"
	cont "these #MON will"
	cont "become great after"
	cont "we spend more time"
	cont "together."
	
	para "I'm going to go"
	line "heal my #MON,"
	cont "then it's time for"
	cont "training!"
	
	para "Take care,"
	line "<PLAYER>!"
	done

CarnationZooFangirlGiveLuckyEggText:
	text "…Oh, wait!"
	line "I almost forgot!"
	
	para "I found this item"
	line "while I was in the"
	cont "SAFARI ZONE."
	
	para "I already have"
	line "one, so you can"
	cont "take my spare!"
	done

CarnationZooFangirlAfterLuckyEggText:
	text "A LUCKY EGG really"
	line "comes in handy if"
	cont "you want to train"
	cont "a weaker #MON."
	
	para "I hope it'll help,"
	line "<PLAYER>."
	
	para "Anyway, I've gotta"
	line "run! I'm sure I'll"
	cont "see you later!"
	
	para "Take care!"
	done

CarnationZooFangirlNoRoomText:
	text "…I guess you don't"
	line "have enough room"
	cont "for this item."
	
	para "I'll just leave it"
	line "with my mom in"
	cont "STAGHORN TOWN."
	
	para "I was going to go"
	line "visit home anyway."
	
	para "See you later!"
	done

SafariZoneGateSignText:
	text "SAFARI ZONE-"
	line "Main gate."
	done

CarnationZoo_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 29, 14, CARNATION_ZOO_GATE, 1
	warp_event 29, 15, CARNATION_ZOO_GATE, 2
	warp_event 12,  5, SAFARI_ZONE_GATE_1F, 1

	db 2 ; coord events
	coord_event 12,  8, SCENE_DEFAULT, CarnationZooEmilyBattleLeft
	coord_event 13,  8, SCENE_DEFAULT, CarnationZooEmilyBattleRight

	db 8 ; bg events
	bg_event 11,  9, BGEVENT_READ, SafariZoneGateSign
	bg_event 16, 15, BGEVENT_READ, LaprasSign
	bg_event  7, 15, BGEVENT_READ, MachokeSign
	bg_event 21, 19, BGEVENT_READ, ScytherSign
	bg_event  3, 21, BGEVENT_READ, SudowoodoSign
	bg_event 13, 21, BGEVENT_READ, RhyhornSign
	bg_event  6,  9, BGEVENT_UP, CarnationZooVendingMachine
	bg_event 19, 19, BGEVENT_UP, CarnationZooVendingMachine

	db 11 ; object events
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
	object_event 0, 0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	