	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_BURGLAR

GoldenrodGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearFlash
	callback MAPCALLBACK_TILES, .GoldenrodDoorCallback
	
.GoldenrodDoorCallback
	checkevent GOLDENROD_GYM_DOOR_1
	iffalse .incomplete
	changeblock  8 , 8, $4F
	checkevent GOLDENROD_LEADER_DOOR_1
	iffalse .incomplete
	checkevent GOLDENROD_LEADER_DOOR_2
	iffalse .incomplete
	checkevent GOLDENROD_LEADER_DOOR_3
	iffalse .incomplete
	changeblock 8, 4, $27
.incomplete
	return

.ClearFlash
	clearflag ENGINE_FLASH
	return

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .Team3
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .Team2
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	jump .After

.Team3:
	loadtrainer MORTY, MORTY3
	startbattle
	reloadmapafterbattle	

.After:
	setevent EVENT_BEAT_MORTY
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
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
.FightDone:
	opentext
	special HealParty
	checkevent EVENT_GOT_TM_SWAGGER
	iftrue .GotSwagger
	writetext WhitneyPlainBadgeText
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
	
GoldenrodGymDoorGuard:
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
	changeblock  8 , 8, $4F ; open door
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	end
	
.NotEnoughMoney
	writetext GoldenrodNotEnough
	waitbutton
	jump .Battle
	
.Battle
	writetext DoorGuard1Challenge
	waitbutton
	closetext
	winlosstext BurglarAllenWinText, 0
	loadtrainer BURGLAR, ALLEN
	startbattle
	reloadmapafterbattle
	setevent GOLDENROD_GYM_DOOR_1
	changeblock  8 , 8, $4F ; open door
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

GoldenrodGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MORTY, MORTY1, MEM_BUFFER_1
	jumpstd gymstatue2

GoldenrodCantLeave:
	checkflag ENGINE_FOGBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end

.Leave
	opentext
	writetext GoldenrodGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, GoldenrodLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, CIANWOOD_CITY, 20, 15
	end
	
GoldenrodLeaveGym:
	turn_step DOWN
	step_end
	
GoldenrodGymHaveBadge:
	text "<PLAYER> used"
	line "the SKULLBADGE to"
	cont "unlock the door!"
	done
	
WhitneyBeforeText:
	text "Hi! I'm WHITNEY!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Sob…"

	para "…Waaaaaaah!"
	line "You're mean!"

	para "You shouldn't be"
	line "so serious! You…"
	cont "you child, you!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> received"
	line "SKULLBADGE."
	done

WhitneyPlainBadgeText:
	text "Oh, you can have"
	line "this too!"
	done

WhitneySwaggerText:
	text "That is SWAGGER!"
	
	para "It will boost a"
	line "#MON's ATTACK."
	
	para "Then hopefully"
	line "hit themselves"
	cont "hard."
	done

WhitneyGoodCryText:
	text "Ah, that was a"
	line "good cry!"

	para "Come for a visit"
	line "again! Bye-bye!"
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
	text "Hehe, thanks kid!"
	
	para "You can go now."
	done

GoldenrodNotEnough:
	text "Looks like you"
	line "don't have enough"
	cont "cash, stranger."
	done
	
DoorGuard1Challenge:
	text "If you can't pay,"
	line "a battle will"
	cont "suffice."
	done
	
GuitaristAndyAfterText:
	text "I lost."
	done

GuitaristLeeAfterText:
	text "I lost."
	done
	
Door2or3AlreadyOpen:
	text "Use the other door"
	line "that was opened."
	done
	
BurglarAllenWinText:
	text "I lost."
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
	
Door2OpenedText:
	text "What else do you"
	line "want? The door is"
	cont "already opened!"
	done
	
DoorGuard2Text:
	text "There are two"
	line "choices ahead now."
	
	para "You didn't hear it"
	line "from me, but the"
	cont "leader's room is"
	cont "to the left of"
	cont "where we currently"
	cont "are standing."
	done
	
GuitaristAndyText:
	text "You didn't hear it"
	line "from me, but the"
	cont "leader's room is"
	cont "to the left of"
	cont "here."
	
	para "Should I open the"
	line "door for you?"
	done
	
DoorGuard2BeforeText:
	text "Fine, but only if"
	line "you can beat me!"
	done
	
GuitaristLeeText:
	text "This door may be"
	line "the wrong way."
	
	para "Want me to open"
	line "it anyway?"
	done
	
GuitaristTrevorText:
	text "I am a #MON"
	line "trainer."
	done
	
GuitaristTrevorWinText:
	text "I lost."
	done

DoorGuard3Text:
	text "In this next room,"
	line "your challenge is"
	cont "to find the odd"
	cont "one out."
	
	para "Remember, he is"
	line "one of us. He will"
	cont "not be standing"
	cont "out too much."
	done
	
GuitaristColinText:
	text "My pal ANDY fooled"
	line "you pretty bad,"
	cont "didn't he?"
	
	para "Now you need to"
	line "battle me!"
	done
	
GuitaristColinWinText:
	text "I lost."
	done
	
GuitaristColinAfterText:
	text "I lost."
	done
	
WrongGuitaristText:
	text "Wrong choice!"
	
	para "Now we battle!"
	done
	
PokemaniacCharlieText:
	text "I am your last"
	line "obstacle."
	
	para "Defeat me, and I"
	line "will allow you to"
	cont "select a portal."
	done
	
PokemaniacCharlieWinText:
	text "Ah! You are worthy"
	line "to move on and"
	cont "face the leader!"
	done
	
CharlieYouAreUnworthy:
	text "You…"
	
	para "…Are unworthy."
	done
	
CharlieExplainsGates:
	text "And so it has come"
	line "to this."
	
	para "Two portals await."
	
	para "One gate will lead"
	line "you to your goal."
	
	para "The Gym Leader."
	
	para "One gate will"
	line "bring your"
	cont "challenge to a"
	cont "pause."
	
	para "Ejecting you from"
	line "this gym."
	
	para "This finale"
	line "decision is yours"
	cont "alone."
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5,  3, GOLDENROD_GYM_NORTH_CHAMBER, 1
	warp_event 12,  3, GOLDENROD_GYM_NORTH_CHAMBER, 2
	warp_event  1,  7, GOLDENROD_GYM_WEST_CHAMBER, 1
	warp_event 16,  7, GOLDENROD_GYM_EAST_CHAMBER, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  7, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event 10, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  8, 18, BGEVENT_DOWN, GoldenrodCantLeave
	bg_event  9, 18, BGEVENT_DOWN, GoldenrodCantLeave

	db 2 ; object events
	object_event  9,  3, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  8, 11, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGymDoorGuard, -1
