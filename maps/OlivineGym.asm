	const_def 2 ; object constants

OlivineGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
GroundGymLeader:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext GroundLeaderChallengeText
	waitbutton
	closetext
	winlosstext GroundLeaderWinText, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
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
	
OlivineCantLeave:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext OlivineGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, OlivineLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, BLACKTHORN_CITY, 20, 7
	end
	
OlivineLeaveGym:
	turn_step DOWN
	step_end
	
OlivineGymHaveBadge:
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
	
	para "I hope you have"
	line "prepared yourself."
	
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
	
OlivineGym_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 12, BGEVENT_DOWN, OlivineCantLeave
	bg_event  5, 12, BGEVENT_DOWN, OlivineCantLeave

	db 1 ; object events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GroundGymLeader, -1
