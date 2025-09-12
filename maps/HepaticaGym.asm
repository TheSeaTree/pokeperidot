	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_BURGLAR

HepaticaGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearFlash
	callback MAPCALLBACK_TILES, .HepaticaDoorCallback
	
.HepaticaDoorCallback
	checkevent GOLDENROD_LEADER_DOOR_1
	iffalse .firstdoor
	checkevent GOLDENROD_LEADER_DOOR_2
	iffalse .firstdoor
	checkevent GOLDENROD_LEADER_DOOR_3
	iffalse .firstdoor
	changeblock 8, 6, $0c
.firstdoor
	checkevent GOLDENROD_GYM_DOOR_1
	iffalse .incomplete
	changeblock  8 , 10, $4F
.incomplete
	return

.ClearFlash
	clearflag ENGINE_FLASH
	return

HepaticaGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	checkevent EVENT_BEAT_DUANE
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	checkflag ENGINE_FLYPOINT_RUGOSA
	iftrue .Team3
	checkflag ENGINE_FLYPOINT_STAGHORN
	iftrue .Team2
	loadtrainer DUANE, DUANE1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	loadtrainer DUANE, DUANE2
	startbattle
	reloadmapafterbattle
	jump .After

.Team3:
	loadtrainer DUANE, DUANE3
	startbattle
	reloadmapafterbattle

.After:
	setevent EVENT_BEAT_DUANE
	setevent GOLDENROD_GYM_DOOR_1
	setevent EVENT_BEAT_GUITARIST_ANDY
	setevent EVENT_BEAT_GUITARIST_LEE
	setevent EVENT_BEAT_GUITARIST_COLIN
	setevent EVENT_BEAT_GUITARIST_TREVOR
	setevent EVENT_BEAT_BIKER_JERRY
	setevent EVENT_BEAT_GUITARIST_MARCEL
	setevent EVENT_BEAT_GUITARIST_IVAN
	setevent EVENT_BEAT_GUITARIST_CONRAD
	setevent EVENT_BEAT_GUITARIST_BOBBY
	setevent EVENT_BEAT_POKEMANIAC_CHARLIE
	opentext
	writetext PlayerReceivedSkullBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SKULLBADGE
	checkcode VAR_BADGES
.FightDone:
	opentext
	special HealParty
	checkevent EVENT_GOT_TM_SWAGGER
	iftrue .GotSwagger
	writetext DuaneSkullBadgeText
	buttonsound
	verbosegiveitem TM_SWAGGER
	iffalse .NoRoomForSwagger
	setevent EVENT_GOT_TM_SWAGGER
	writetext WhitneySwaggerText
	waitbutton
	closetext
	end

.GotSwagger:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForSwagger:
	closetext
	end

.Rematch:
	checkflag ENGINE_REMATCH_DUANE
	iftrue .DoneRematch
	
	opentext
	writetext DuaneRematchText
	waitbutton
	closetext
	
	winlosstext DuaneRematchWinText, 0

	copybytetovar wDuaneFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer DUANE, DUANE_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer DUANE, DUANE_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer DUANE, DUANE_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer DUANE, DUANE_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer DUANE, DUANE_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle

	setflag ENGINE_REMATCH_DUANE
	copybytetovar wDuaneFightCount
	ifgreater 3, .DoneRematch
	addvar 1
	copyvartobyte wDuaneFightCount

.DoneRematch
	jumptext DuaneAfterRematchText

HepaticaGymDoorGuard:
	faceplayer
	opentext
	checkevent GOLDENROD_GYM_DOOR_1
	iftrue .Opened
	writetext DoorGuard1TextBefore
	waitbutton
	closetext
	showemote EMOTE_QUESTION, GOLDENRODGYM_BURGLAR, 15
	opentext
	writetext DoorGuard1TextQuestion
	yesorno
	iffalse .Battle
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 2000
	writetext DoorGuard1ThankYou
	waitbutton
	closetext
	setevent GOLDENROD_GYM_DOOR_1
	changeblock  8 , 10, $4F
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	end
	
.NotEnoughMoney
	writetext HepaticaNotEnough
	waitbutton
	jump .Battle
	
.Battle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext DoorGuard1Challenge
	waitbutton
	closetext
	winlosstext BurglarAllenWinText, 0
	loadtrainer BURGLAR, ALLEN
	startbattle
	reloadmapafterbattle
	setevent GOLDENROD_GYM_DOOR_1
	changeblock  8 , 10, $4F
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	setevent EVENT_BEAT_BURGLAR_ALLEN
	end
	
.Opened
	writetext Door1OpenedText
	waitbutton
	closetext
	end	

HepaticaGymStatue:
	trainertotext DUANE, DUANE1, MEM_BUFFER_1
	checkflag ENGINE_SKULLBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	checkflag ENGINE_COGBADGE
	iftrue .RivalBeaten
	jumpstd gymstatue2
.RivalBeaten
	jumpstd gymstatue3

HepaticaCantLeave:
	checkflag ENGINE_SKULLBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end

.Leave
	opentext
	writetext HepaticaGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, HepaticaLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, HEPATICA_TOWN, 20, 15
	end
	
HepaticaLeaveGym:
	turn_step DOWN
	step_end
	
HepaticaGymHaveBadge:
	text "<PLAYER> used"
	line "the SKULLBADGE to"
	cont "unlock the door!"
	done
	
WhitneyBeforeText:
	text "I am…"
	
	para "…The dweller in"
	line "darkness."
	
	para "Have you come"
	line "seeking a battle?"
	
	para "Let me help you to"
	line "see, trainer…"
	
	para "The might of my"
	line "grim #MON!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Your might has"
	line "exceeded my expec-"
	cont "tations."
	
	para "Take my BADGE and"
	line "leave this place."
	done

PlayerReceivedSkullBadgeText:
	text "<PLAYER> received"
	line "SKULLBADGE."
	done

DuaneSkullBadgeText:
	text "My TM as well."
	done

WhitneySwaggerText:
	text "That is SWAGGER!"
	
	para "It will boost a"
	line "#MON's ATTACK."
	
	para "Then leave it"
	line "helpless as it"
	cont "strikes itself."
	
	para "Devious, yes?"
	line "Just how I like"
	cont "it!"
	done

WhitneyGoodCryText:
	text "Move on, trainer."
	
	para "You have already"
	line "won. What else is"
	cont "there for you to"
	cont "take from me?"
	done

DuaneRematchText:
	text "Ah, <PLAYER>…"
	line "You have returned…"

	para "Do not waste my"
	line "time with talk…"

	para "Let me see how"
	line "strong a CHAMPION"
	cont "truly is!"
	done

DuaneRematchWinText:
	text "I have fallen to"
	line "you once more…"

	para "I must grow even"
	line "stronger!"
	done

DuaneAfterRematchText:
	text "I could not stand"
	line "to your might, but"
	cont "I will not turn"
	cont "down to your"
	cont "next challenge."

	para "Meet me in battle"
	line "again tomorrow."
	done

DoorGuard1TextBefore:
	text "You must be new"
	line "here. I'll let you"
	cont "in on a secret."
	
	para "This GYM was"
	line "designed to fool"
	cont "naive trainers."
	done
	
DoorGuard1TextQuestion:
	text "Hm? This door"
	line "beside me?"

	para "I'm so glad you"
	line "noticed!"
	
	para "I am the only one"
	line "who can open it!"

	para "…For a price."
	
	para "I'll let you past"
	line "for ¥2000."
	done
	
DoorGuard1ThankYou:
	text "Hehe! Thanks, kid!"
	
	para "You can go now."
	done

HepaticaNotEnough:
	text "Looks like you"
	line "don't have enough"
	cont "cash, stranger."
	done
	
DoorGuard1Challenge:
	text "If you can't pay,"
	line "a battle will"
	cont "suffice."
	done

Door2or3AlreadyOpen:
	text "Use the other door"
	line "that was opened."
	done
	
BurglarAllenWinText:
	text "Why couldn't you"
	line "just give me the"
	cont "money?"
	done

Door1OpenedText:
	text "The trainers in"
	line "this GYM dwell in"
	cont "total darkness."
	
	para "They really hate"
	line "when anyone dist-"
	cont "urbs them."
	
	para "Prepare for some"
	line "tough battles if"
	cont "you're going to"
	cont "turn the lights"
	cont "on."
	done

HepaticaGym_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5,  3, HEPATICA_GYM_NORTH_CHAMBER, 1
	warp_event 12,  3, HEPATICA_GYM_NORTH_CHAMBER, 2
	warp_event  1,  7, HEPATICA_GYM_WEST_CHAMBER, 1
	warp_event 16,  7, HEPATICA_GYM_EAST_CHAMBER, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  7, 15, BGEVENT_READ, HepaticaGymStatue
	bg_event 10, 15, BGEVENT_READ, HepaticaGymStatue
	bg_event  8, 18, BGEVENT_DOWN, HepaticaCantLeave
	bg_event  9, 18, BGEVENT_DOWN, HepaticaCantLeave

	db 2 ; object events
	object_event  9,  3, SPRITE_DUANE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, HepaticaGymWhitneyScript, -1
	object_event  8, 11, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HepaticaGymDoorGuard, EVENT_BEAT_DUANE
