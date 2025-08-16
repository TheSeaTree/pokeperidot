	const_def 2 ; object constants

AcroporaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
GroundGymLeader:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	opentext
	checkevent EVENT_BEAT_ALAN
	iftrue .FightDone
	writetext GroundLeaderChallengeText
	waitbutton
	closetext
	winlosstext GroundLeaderWinText, 0
	loadtrainer ALAN, ALAN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ALAN
	special HealParty
	opentext
	writetext Text_ReceivedTerraBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_EARTHQUAKE
	iftrue .GotEarthquake
	writetext TerraBadgeText
	buttonsound
	verbosegiveitem TM_EARTHQUAKE
	iffalse .NoRoomForEarthquake
	setevent EVENT_GOT_TM_EARTHQUAKE

.GotEarthquake:
	writetext EarthquakeTMText
	waitbutton
.NoRoomForEarthquake:
	closetext
	end

.Rematch:
	checkflag ENGINE_REMATCH_ALAN
	iftrue .DoneRematch
	
	opentext
	copybytetovar wAlanFightCount
	ifgreater 0, .FirstRematch
	writetext AlanRematchText
	jump .LoadTrainer
.FirstRematch
	writetext AlanFirstRematchText
.LoadTrainer
	waitbutton
	closetext
	
	winlosstext AlanRematchWinText, 0

	copybytetovar wAlanFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer ALAN, ALAN_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer ALAN, ALAN_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer ALAN, ALAN_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer ALAN, ALAN_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer ALAN, ALAN_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle

	setflag ENGINE_REMATCH_ALAN
	copybytetovar wAlanFightCount
	ifgreater 3, .DoneRematch
	addvar 1
	copyvartobyte wAlanFightCount

.DoneRematch
	jumptext AlanAfterRematchText

AcroporaGymStatue:
	trainertotext ALAN, ALAN1, MEM_BUFFER_1
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	checkflag ENGINE_RISINGBADGE
	iftrue .RivalBeaten
	jumpstd gymstatue2
.RivalBeaten
	jumpstd gymstatue3

AcroporaCantLeave:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext AcroporaGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, AcroporaLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, ACROPORA_CITY, 14, 7
	end

AcroporaLeaveGym:
	turn_step DOWN
	step_end

AcroporaGymHaveBadge:
	text "<PLAYER> used"
	line "the TERRABADGE to"
	cont "unlock the door!"
	done
	
GroundLeaderChallengeText:
	text "Ahahaha!"
	
	para "Someone else has"
	line "navigated the"
	cont "tunnels I dug out"
	cont "with the help of"
	cont "my #MON!"
	
	para "I prefer to make"
	line "trainers prove"
	cont "themselves in my"
	cont "cave before I"
	cont "accept their"
	cont "challenge."
	
	para "Now, trainer."
	
	para "Get psyched!"
	
	para "We will make the"
	line "foundation of this"
	cont "GYM quake!"
	done
	
GroundLeaderWinText:
	text "Ah! You have with-"
	line "stood my ferocious"
	cont "tremors!"
	
	para "You have earned"
	line "my TERRABADGE."
	done

AlanFirstRematchText:
	text "Aha! <PLAYER>!"

	para "How good to see"
	line "you again!"

	para "You must have"
	line "noticed the more"
	cont "direct path to"
	cont "this GYM now!"

	para "I wasn't getting"
	line "as many battles as"
	cont "I wanted to."

	para "Since then, my"
	line "#MON and I have"
	cont "made great discov-"
	cont "eries."

	para "You must have made"
	line "some discoveries"
	cont "of your own."

	para "Let's share our"
	line "experiences!"
	done

AlanRematchText:
	text "Aha! There you"
	line "are, <PLAYER>!"

	para "I wondered when I'd"
	line "see you again."

	para "Come on! Let's make"
	line "the foundation of"
	cont "this GYM shake"
	cont "like no other"
	cont "trainers can!"
	done

AlanRematchWinText:
	text "Aha! What a good"
	line "battle that was!"
	
	para "You've knocked me"
	line "off my feet again!"

	para "Don't get used to"
	line "that feeling, be-"
	cont "cause I'll get you"
	cont "next time!"
	done

AlanAfterRematchText:
	text "Ha! This world has"
	line "so many secrets"
	cont "for us to find!"

	para "I will keep digg-"
	line "ing to unlock"
	cont "these secrets!"

	para "Give me some time"
	line "and I'll find some-"
	cont "thing to make my"
	cont "#MON even"
	cont "better in battle!"
	done

Text_ReceivedTerraBadge:
	text "<PLAYER> received"
	line "TERRABADGE."
	done
	
TerraBadgeText:
	text "That BADGE will"
	line "let you use"
	cont "#MON up to Lv60"
	cont "without them"
	cont "second guessing"
	cont "your decisions."

	para "I must also reward"
	line "you with my sig-"
	cont "nature move."
	
	para "One of the most"
	line "powerful moves of"
	cont "them all!"
	done
	
EarthquakeTMText:
	text "EARTHQUAKE may not"
	line "have any special"
	cont "effects, but it"
	cont "will surely spell"
	cont "doom for any foe"
	cont "on the ground."
	done
	
AcroporaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 11, ACROPORA_CITY, 10
	warp_event 5, 11, ACROPORA_CITY, 10

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  9, BGEVENT_READ, AcroporaGymStatue
	bg_event  6,  9, BGEVENT_READ, AcroporaGymStatue

	db 1 ; object events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GroundGymLeader, -1
