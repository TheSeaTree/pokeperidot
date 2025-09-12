	const_def 2 ; object constants

TreasureHuntersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
;	callback MAPCALLBACK_NEWMAP, .Items

.Items
	giveitem RUBY_PENDANT
	giveitem SAPPHIRE_PIN
	giveitem EMERALD_RING
	giveitem QUARTZ_BEADS
	giveitem SPINEL_CHAIN
	return

TreasureHunter:
	faceplayer
	opentext
	checkevent EVENT_MET_TREASURE_HUNTER
	iftrue .NotFirstTime
	writetext TreasureHunterFirstTimeIntroText
	waitbutton
	clearevent EVENT_TRADED_ALL_TREASURES
	setevent EVENT_MET_TREASURE_HUNTER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump .CheckItems
.NotFirstTime
	checkevent EVENT_TRADED_ALL_TREASURES
	iftrue .AllTreasures
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .AfterNoItems
	writetext TreasureHunterIntroText
	waitbutton
.CheckItems
	checkitem RUBY_PENDANT
	iftrue .HaveTreasure
	checkitem SAPPHIRE_PIN
	iftrue .HaveTreasure
	checkitem QUARTZ_BEADS
	iftrue .HaveTreasure
	checkitem EMERALD_RING
	iftrue .HaveTreasure
	checkitem SPINEL_CHAIN
	iftrue .HaveTreasure
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FirstTime
	writetext TreasureHunterNoTreasureText
	waitbutton
	closetext
	end

.FirstTime
	writetext TreasureHunterFirstTimeNoTreasureText
	waitbutton
	closetext
	end

.HaveTreasure
	writetext TreasureHunterHaveTreasureText
	waitbutton
.TradeTreasure
	special SelectTreasureMenu
	ifequal RUBY_PENDANT, .RubyBox
	ifequal QUARTZ_BEADS, .AmethystBox
	ifequal SAPPHIRE_PIN, .SapphireBox
	ifequal SPINEL_CHAIN, .SpinelBox
	ifequal EMERALD_RING, .EmeraldBox
	jump .Decline

.RubyBox
	checkcode VAR_ITEM_POCKET
	ifgreater 18, .ItemsNearlyFull
	itemtotext RUBY_PENDANT, MEM_BUFFER_0
	writetext TreasureHunterAskTreasureText
	yesorno
	iffalse .Decline
	takeitem RUBY_PENDANT
	writetext TreasureHunterGiveTreasureText
	waitbutton
	itemtotext X_ATTACK, MEM_BUFFER_0
	writetext TreasureHunterRewardText
	specialsound
	waitbutton
	giveitem X_ATTACK, 5
	jump .TreasureCheckLoop

.AmethystBox
	checkcode VAR_ITEM_POCKET
	ifgreater 18, .ItemsNearlyFull
	itemtotext QUARTZ_BEADS, MEM_BUFFER_0
	writetext TreasureHunterAskTreasureText
	yesorno 
	iffalse .Decline
	takeitem QUARTZ_BEADS
	writetext TreasureHunterGiveTreasureText
	waitbutton
	itemtotext X_DEFEND, MEM_BUFFER_0
	writetext TreasureHunterRewardText
	specialsound
	waitbutton
	giveitem X_DEFEND, 5
	jump .TreasureCheckLoop

.SapphireBox
	checkcode VAR_ITEM_POCKET
	ifgreater 18, .ItemsNearlyFull
	itemtotext SAPPHIRE_PIN, MEM_BUFFER_0
	writetext TreasureHunterAskTreasureText
	yesorno 
	iffalse .Decline
	takeitem SAPPHIRE_PIN
	writetext TreasureHunterGiveTreasureText
	waitbutton
	itemtotext X_SP_ATK, MEM_BUFFER_0
	writetext TreasureHunterRewardText
	specialsound
	waitbutton
	giveitem X_SP_ATK, 5
	jump .TreasureCheckLoop

.SpinelBox
	checkcode VAR_ITEM_POCKET
	ifgreater 18, .ItemsNearlyFull
	itemtotext SPINEL_CHAIN, MEM_BUFFER_0
	writetext TreasureHunterAskTreasureText
	yesorno 
	iffalse .Decline
	takeitem SPINEL_CHAIN
	writetext TreasureHunterGiveTreasureText
	waitbutton
	itemtotext X_SP_DEF, MEM_BUFFER_0
	writetext TreasureHunterRewardText
	specialsound
	waitbutton
	giveitem X_SP_DEF, 5
	jump .TreasureCheckLoop

.EmeraldBox
	checkcode VAR_ITEM_POCKET
	ifgreater 18, .ItemsNearlyFull
	itemtotext EMERALD_RING, MEM_BUFFER_0
	writetext TreasureHunterAskTreasureText
	yesorno 
	iffalse .Decline
	takeitem EMERALD_RING
	writetext TreasureHunterGiveTreasureText
	waitbutton
	itemtotext X_SPEED, MEM_BUFFER_0
	writetext TreasureHunterRewardText
	specialsound
	waitbutton
	giveitem X_SPEED, 5

.TreasureCheckLoop:
	itemnotify
	verbosegiveitem NUGGET
	copybytetovar wTreasuresTraded
	addvar 1
	copyvartobyte wTreasuresTraded
	ifequal 5, .TradedAllTreasures
	checkitem RUBY_PENDANT
	iftrue .MoreTreasure
	checkitem SAPPHIRE_PIN
	iftrue .MoreTreasure
	checkitem QUARTZ_BEADS
	iftrue .MoreTreasure
	checkitem EMERALD_RING
	iftrue .MoreTreasure
	checkitem SPINEL_CHAIN
	iftrue .MoreTreasure
	writetext TreasureHunterNoMoreTreasureText
	waitbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	closetext
	end

.MoreTreasure
	writetext TreasureHunterMoreTreasureText
	jump .TradeTreasure

.Decline:
	writetext TreasureHunterDeclineTreasureText
	waitbutton
	closetext
	end

.ItemsNearlyFull:
	writetext TreasureHunterBagFullText
	waitbutton
	closetext
	end

.AfterNoItems:
	writetext TreasureHunterCompanyText
	waitbutton
	closetext
	end

.TradedAllTreasures:
	writetext TreasureHunterAllTreasuresText
	waitbutton
	verbosegiveitem MACHINE_PART
	setevent EVENT_TRADED_ALL_TREASURES
	closetext
	end

.AllTreasures:
	writetext TreasureHunterAfterAllTreasuresText
	waitbutton
	closetext
	end

TreasureHunterWorkbench:
	jumptext TreasureHunterWorkbenchText

TreasureHunterToolsDrawer:
	jumptext TreasureHunterToolsDrawerText

TreasureHunterBookshelf:
	jumptext TreasureHunterBookshelfText

TreasureHunterDisplayCase:
	jumptext TreasureHunterDisplayCaseText

TreasureHunterFirstTimeIntroText:
	text "Why, hello there!"

	para "I am a TREASURE"
	line "HUNTER."

	para "Have you come"
	line "across any rare"
	cont "treasures on your"
	cont "adventures?"
	done

TreasureHunterFirstTimeNoTreasureText:
	text "No? Well don't let"
	line "that get you down!"

	para "You will find"
	line "something truly"
	cont "valuable if you"
	cont "look hard enough!"
	done

TreasureHunterIntroText:
	text "Hello, <PLAYER>!"

	para "Have you brought"
	line "any treasures to"
	cont "trade with me?"
	done

TreasureHunterHaveTreasureText:
	text "Oh my! You have?"

	para "Please, let me see"
	line "what you have!"
	done

TreasureHunterNoTreasureText:
	text "Did you just come"
	line "to say hello?"

	para "Thanks, that was"
	line "very kind of you."
	done

TreasureHunterAskTreasureText:
	text "Really? You'd trade"
	line "your @"
	text_ram wStringBuffer3
	text_start
	cont "to me?"
	done

TreasureHunterDeclineTreasureText:
	text "This must be more"
	line "valuable to you"
	cont "than I thought."

	para "Thank you for"
	line "showing me!"
	done

TreasureHunterGiveTreasureText:
	text "Thank you so much!"
	line "You're wonderful!"

	para "Here are some"
	line "treasures I found!"
	done

TreasureHunterRewardText:
	text "<PLAYER> received 5"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done

TreasureHunterMoreTreasureText:
	text "Do you have any"
	line "more beautiful"
	cont "treasure to share"
	cont "with me?"
	done

TreasureHunterNoMoreTreasureText:
	text "Aw, is that all"
	line "you have on you"
	cont "right now?"

	para "Well that's okay,"
	line "my friend! I never"
	cont "mind company! Make"
	cont "yourself at home!"
	done

TreasureHunterCompanyText:
	text "It's always so nice"
	line "to be visited by"
	cont "people who share"
	cont "my hobby!"
	done

TreasureHunterAllTreasuresText:
	text "Goodness! You have"
	line "given me so many"
	cont "lovely treasures."

	para "Nobody has ever"
	line "been so generous"
	cont "with me!"

	para "I found this one"
	line "treasure a long"
	cont "time ago, but I"
	cont "haven't been able"
	cont "to make use of it."

	para "Maybe you could"
	line "find its purpose!"
	done

TreasureHunterAfterAllTreasuresText:
	text "Think of that"
	line "MACHINE PART as"
	cont "thanks for being"
	cont "such a good friend"
	cont "to me and sharing"
	cont "your treasure."

	para "I hope you can"
	line "find a purpose for"
	cont "such an old part."
	done

TreasureHunterBagFullText:
	text "My, oh my!"

	para "This is some fine"
	line "treasure!"

	para "I'd love to trade"
	line "for it, but I can"
	cont "see your BAG is"
	cont "nearly overflowing"
	cont "with items."

	para "Before I take your"
	line "treasure, how"
	cont "about you free up"
	cont "some BAG space?"
	done

TreasureHunterWorkbenchText:
	text "It's a work bench"
	line "with lots of tools"
	cont "set up on it."
	done

TreasureHunterToolsDrawerText:
	text "There's so many"
	line "different kinds of"
	cont "tools stored in"
	cont "these drawers."
	done

TreasureHunterBookshelfText:
	text "Plenty of books"
	line "about appraising"
	cont "jewelry and preci-"
	cont "ous metals."
	done

TreasureHunterDisplayCaseText:
	text "It's a display case"
	line "full of all kinds"
	cont "of jewels."
	done

TreasureHuntersHouse_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, ROUTE_23, 5

	db 0 ; coord events

	db 6 ; bg events
	bg_event  8,  2, BGEVENT_READ, TreasureHunterWorkbench
	bg_event  9,  2, BGEVENT_READ, TreasureHunterWorkbench
	bg_event 10,  2, BGEVENT_READ, TreasureHunterWorkbench
	bg_event 11,  2, BGEVENT_READ, TreasureHunterToolsDrawer
	bg_event  3,  2, BGEVENT_UP, TreasureHunterBookshelf
	bg_event  2,  2, BGEVENT_READ, TreasureHunterDisplayCase

	db 1 ; object events
	object_event 4, 4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, TreasureHunter, -1
