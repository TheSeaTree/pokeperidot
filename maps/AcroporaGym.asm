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
	writetext AlanRematchText
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

AlanRematchText:
	text "This is where the"
	line "rematch text goes."
	done

AlanRematchWinText:
	text "This is where the"
	line "victory text goes."
	done

AlanAfterRematchText:
	text "Good job!"

	para "We'll do this"
	line "again tomorrow."
	done

Text_ReceivedTerraBadge:
	text "<PLAYER> received"
	line "TERRABADGE."
	done
	
TerraBadgeText:
	text "I must also reward"
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

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4, 12, BGEVENT_DOWN, AcroporaCantLeave
	bg_event  5, 12, BGEVENT_DOWN, AcroporaCantLeave
	bg_event  3,  9, BGEVENT_READ, AcroporaGymStatue
	bg_event  6,  9, BGEVENT_READ, AcroporaGymStatue

	db 1 ; object events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GroundGymLeader, -1
