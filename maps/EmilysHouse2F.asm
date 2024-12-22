	const_def 2 ; object constants
	const EMILYSHOUSE2F_EMILY
	const EMILYSHOUSE2F_CONSOLE
	const EMILYSHOUSE2F_DOLL

EmilysHouse2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .InitializeRoom

.InitializeRoom:
	changeblock  0,  0, $2c
	changeblock  0,  4, $1c
	changeblock  6,  0, $1f
	changeblock  6,  4, $22
	return

Emily:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_EMILY
	iftrue .AlreadyAskedBattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	writetext EmilyWelcomeText
	yesorno
	iffalse .Decline
	jump .Battle
	
.Decline
	writetext EmilyDeclineText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_EMILY
	end

.AlreadyAskedBattle
	writetext EmilyAskBattleText
	waitbutton

.Battle
	writetext EmilyChallengeText
	waitbutton
	winlosstext EmilyWinText, 0
	setlasttalked EMILYSHOUSE2F_EMILY
	loadtrainer FANGIRL, EMILY2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER

.AfterBattle
	opentext
	writetext EmilyAfterText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoRoom
	setevent EVENT_CLAIMED_LUCKY_EGG
	writetext EmilyLuckyEggDescribeText
	jump .WalkOut
	
.NoRoom
	writetext EmilyNoRoomText

.WalkOut
	waitbutton
	writetext EmilyLeaveText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	applymovement EMILYSHOUSE2F_EMILY, EmilyLeaveMovement1
	jump .Disappear
	
.FacingUp
	applymovement EMILYSHOUSE2F_EMILY, EmilyLeaveMovement2
.Disappear
	setevent EVENT_BEAT_EMILYS_HOUSE
	disappear EMILYSHOUSE2F_EMILY
	playmapmusic
	end
	
EmilyGameConsoleScript:
	jumptext EmilyGameConsoleText

EmilyDollScript:
	jumptext EmilyDollText

EmilysHouseRadioScript:
	jumptext EmilysRadioText

EmilysHouseBookshelfScript:
	jumptext EmilysHouseBookshelfText

EmilysHousePCScript:
	jumptext EmilysHousePCText
	
EmilysHousePosterScript:
	opentext
	farwritetext UnknownText_0x1bc591
	waitbutton
	closetext
	end
	
EmilyLeaveMovement1:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

EmilyLeaveMovement2:
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end
	
EmilyWelcomeText:
	text "Oh, <PLAYER>!"
	line "I didn't expect" 
	cont "you to come visit"
	cont "me like this!"
	
	para "I was just seeing"
	line "family and sorting"
	cont "out my PACK."
	
	para "You know, <PLAYER>,"
	line "it's been a little"
	cont "while since I've"
	cont "seen your #MON."
	
	para "How about we have"
	line "a battle right"
	cont "here? Loser gets"
	cont "to clean up after!"
	done
	
EmilyAskBattleText:
	text "All healed up?"
	line "Good!"
	done
	
EmilyChallengeText:
	text "Don't go easy on"
	line "me, <PLAYER>!"
	
	para "Because I won't"
	line "do the same!"
	done

EmilyDeclineText:
	text "Do you need to"
	line "visit the #MON"
	cont "CENTER first?"
	
	para "I understand."
	
	para "But don't keep me"
	line "waiting for too"
	cont "long!"
	done
	
EmilyAcceptText:
	text "Okay, let's see if"
	line "my new strategy"
	cont "will work out!"
	done
	
EmilyWinText:
	text "Gah! I thought for"
	line "sure that would"
	cont "work! Back to the"
	cont "drawing board!"
	done
	
EmilyAfterText:
	text "I try so hard to"
	line "be the best train-"
	cont "er I can be, but"
	cont "you always seem to"
	cont "have the advantage"
	cont "with this kind of"
	cont "thing."
	
	para "You gotta give me"
	line "some pointers"
	cont "sometime!"
	
	para "Anyway, I need to"
	line "get going now!"
	
	para "Before I go, take"
	line "this item. It's"
	done
	
EmilyLuckyEggDescribeText:
	text "I heard that a"
	line "LUCKY EGG will"
	cont "boost the EXPERIE-"
	cont "NCE gained by the"
	cont "holder."
	
	para "They're hard to"
	line "come by, but I had"
	cont "a spare one."
	
	para "That was a fun"
	line "battle, but I must"
	cont "get going!"
	done
	
EmilyNoRoomText:
	text "Is your PACK full?"
	
	para "I'll leave the"
	line "item with my MOM."
	
	para "Just talk to her"
	line "when you get a"
	cont "chance."
	done
	
EmilyLeaveText:
	text "I'll see you next"
	line "time, <PLAYER>!"
	done

EmilyGameConsoleText:
	text "It's a SUPER NES!"
	
	para "There's a 3D game"
	line "where you fly a"
	cont "space ship."
	
	para "These graphics are"
	line "incredible!"
	done

EmilyDollText:
	text "It's an adorable"
	line "CLEFAIRY DOLL."
	done

EmilysRadioText:
	text "It's a RADIO."
	
	para "It looks like it"
	line "needs its battery"
	cont "replaced…"
	done

EmilysHousePCText:
	text "It's EMILY's PC."
	
	para "…Better not snoop"
	line "around in her per-"
	cont "sonal files."
	done
	
EmilysHouseBookshelfText:
	text "It's a bookshelf"
	line "packed with notes"
	cont "on #MON battles"
	cont "and strategies."
	done

EmilysHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, EMILYS_HOUSE_1F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  1, BGEVENT_UP, EmilysHousePCScript
	bg_event  3,  1, BGEVENT_READ, EmilysHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, EmilysHouseBookshelfScript
	bg_event  1,  0, BGEVENT_READ, EmilysHousePosterScript

	db 3 ; object events
	object_event  2,  2, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Emily, EVENT_BEAT_EMILYS_HOUSE
	object_event  4,  2, SPRITE_SNES, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EmilyGameConsoleScript, -1
	object_event  5,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EmilyDollScript, -1
