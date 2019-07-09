	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_ROCKER1
	const GOLDENRODGYM_ROCKER2
	const GOLDENRODGYM_ROCKER3
	const GOLDENRODGYM_ROCKER4
	const GOLDENRODGYM_ROCKER5
	const GOLDENRODGYM_BIKER
	const GOLDENRODGYM_ROCKER6
	const GOLDENRODGYM_SUPER_NERD

GoldenrodGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareGym
	callback MAPCALLBACK_TILES, .GoldenrodDoorCallback
	
.GoldenrodDoorCallback
	checkevent GOLDENROD_GYM_DOOR_1
	iffalse .skip1
	changeblock  22 , 32, $4F ; open door
.skip1
	checkevent GOLDENROD_GYM_DOOR_2
	iffalse .skip2
	changeblock  26 , 26, $4F ; open door
.skip2
	checkevent GOLDENROD_GYM_DOOR_3
	iffalse .skip3
	changeblock  18 , 26, $4F ; open door
.skip3
	checkevent GOLDENROD_GYM_DOOR_4
	iffalse .skip4
	changeblock  18 , 20, $4F ; open door
.skip4
	checkevent GOLDENROD_GYM_DOOR_5
	iffalse .skip5
	changeblock  6 , 10, $4F ; open door
.skip5
	return
	
.PrepareGym
	checkflag ENGINE_FOGBADGE
	iftrue .end
	clearevent GOLDENROD_GYM_DOOR_1
	clearevent GOLDENROD_GYM_DOOR_2
	clearevent GOLDENROD_GYM_DOOR_3
	clearevent EVENT_BEAT_GUITARIST_JOEL
	clearevent EVENT_BEAT_GUITARIST_TREVOR	
	clearevent EVENT_BEAT_BIKER_JERRY
	clearevent EVENT_BEAT_GUITARIST_MARCEL
	clearevent EVENT_BEAT_GUITARIST_IVAN
	clearevent EVENT_BEAT_GUITARIST_CONRAD
	clearevent GOLDENROD_GYM_DOOR_5
	clearevent EVENT_BEAT_POKEMANIAC_CHARLIE
.end
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
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	setevent GOLDENROD_GYM_DOOR_1
	setevent GOLDENROD_GYM_DOOR_2
	setevent GOLDENROD_GYM_DOOR_3
	setevent EVENT_BEAT_GUITARIST_JOEL
	setevent EVENT_BEAT_GUITARIST_TREVOR	
	setevent EVENT_BEAT_BIKER_JERRY
	setevent EVENT_BEAT_GUITARIST_MARCEL
	setevent EVENT_BEAT_GUITARIST_IVAN
	setevent EVENT_BEAT_GUITARIST_CONRAD
	setevent GOLDENROD_GYM_DOOR_5
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
	
DoorGuard1:
	faceplayer
	opentext
	checkevent GOLDENROD_GYM_DOOR_1
	iftrue .Opened
	writetext DoorGuard1TextBefore
	waitbutton
	closetext
	showemote EMOTE_QUESTION, GOLDENRODGYM_ROCKER1, 15
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
	changeblock  22 , 32, $4F ; open door
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
	changeblock  22 , 32, $4F ; open door
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
	
; Door Set 2
	
TrainerGuitaristAndy:
	faceplayer
	checkevent GOLDENROD_GYM_DOOR_2
	iftrue .Door2
	checkevent GOLDENROD_GYM_DOOR_3
	iftrue .FightDone
	opentext
	writetext GuitaristAndyText
	waitbutton
	yesorno
	iffalse .End
	writetext DoorGuard2BeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, ANDY
	startbattle
	reloadmapafterbattle
	setevent GOLDENROD_GYM_DOOR_3
	changeblock  18 , 26, $4F ; open door
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	end
	
.Door2
	opentext
	writetext Door2or3AlreadyOpen
	waitbutton
	closetext
	end
	
.FightDone
	opentext
	writetext Door2OpenedText
	waitbutton
	closetext
	end
	
.End
	closetext
	end
	
TrainerGuitaristLee:
	faceplayer
	checkevent GOLDENROD_GYM_DOOR_3
	iftrue .Door3
	checkevent GOLDENROD_GYM_DOOR_2
	iftrue .FightDone
	opentext
	writetext GuitaristLeeText
	waitbutton
	yesorno
	iffalse .End
	writetext DoorGuard2BeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, LEE
	startbattle
	reloadmapafterbattle
	setevent GOLDENROD_GYM_DOOR_2
	changeblock  26 , 26, $4F ; open door
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	end
	
.Door3
	opentext
	writetext Door2or3AlreadyOpen
	waitbutton
	closetext
	end
	
.FightDone
	opentext
	writetext Door2OpenedText
	waitbutton
	closetext
	end
	
.End
	closetext
	end

TrainerGuitaristJoel:
	trainer GUITARIST, JOEL, EVENT_BEAT_GUITARIST_JOEL, GuitaristJoelText, GuitaristJoelWinText, 0, .Script

.Script:
	setevent GOLDENROD_GYM_DOOR_4
	changeblock  18 , 20, $4F ; open door
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	endifjustbattled
	opentext
	writetext GuitaristJoelAfterText
	waitbutton
	closetext
	end	
	
; Mosh Pit	

TrainerGuitaristTrevor:
	trainer GUITARIST, TREVOR, EVENT_BEAT_GUITARIST_TREVOR, GuitaristTrevorText, GuitaristTrevorWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DoorGuard3Text
	waitbutton
	closetext
	end	
	
TrainerBikerJerry:
	faceplayer
	checkevent EVENT_BEAT_BIKER_JERRY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer BIKER, JERRY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BIKER_JERRY
	end

.FightDone
	opentext
	writetext GuitaristAndyAfterText
	waitbutton
	closetext
	end
	
TrainerGuitaristMarcel:
	faceplayer
	checkevent EVENT_BEAT_GUITARIST_MARCEL
	iftrue .FightDone
	opentext
	writetext WrongGuitaristText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, MARCEL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUITARIST_MARCEL
	end

.FightDone
	opentext
	writetext GuitaristAndyAfterText
	waitbutton
	closetext
	end
	
TrainerGuitaristIvan:
	faceplayer
	checkevent EVENT_BEAT_GUITARIST_IVAN
	iftrue .FightDone
	opentext
	writetext WrongGuitaristText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, IVAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUITARIST_IVAN
	end

.FightDone
	opentext
	writetext GuitaristAndyAfterText
	waitbutton
	closetext
	end
	
TrainerGuitaristConrad:
	faceplayer
	checkevent EVENT_BEAT_GUITARIST_CONRAD
	iftrue .FightDone
	opentext
	writetext WrongGuitaristText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, CONRAD
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUITARIST_CONRAD
	end

.FightDone
	opentext
	writetext GuitaristAndyAfterText
	waitbutton
	closetext
	end
	
TrainerGuitaristBobby:
	faceplayer
	checkevent GOLDENROD_GYM_DOOR_5
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, BOBBY
	startbattle
	reloadmapafterbattle
	setevent GOLDENROD_GYM_DOOR_5
	changeblock  6 , 10, $4F ; open door
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	end

.FightDone
	opentext
	writetext GuitaristAndyAfterText
	waitbutton
	closetext
	end	
	
; End Mosh Pit
	
CharlieExplainsGatesLeft:
	checkevent EVENT_BEAT_POKEMANIAC_CHARLIE
	iftrue .End
	showemote EMOTE_SHOCK, GOLDENRODGYM_SUPER_NERD, 15
	turnobject GOLDENRODGYM_SUPER_NERD, LEFT
	turnobject PLAYER, RIGHT
	jump TrainerPokemaniacCharlie
	
.End
	end

CharlieExplainsGatesRight:
	checkevent EVENT_BEAT_POKEMANIAC_CHARLIE
	iftrue .End
	showemote EMOTE_SHOCK, GOLDENRODGYM_SUPER_NERD, 15
	turnobject GOLDENRODGYM_SUPER_NERD, RIGHT
	turnobject PLAYER, LEFT
	jump TrainerPokemaniacCharlie
	
.End
	end

TrainerPokemaniacCharlie:
	faceplayer
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	opentext
	writetext PokemaniacCharlieText
	winlosstext PokemaniacCharlieWinText, CharlieYouAreUnworthy
	loadtrainer POKEMANIAC, CHARLIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEMANIAC_CHARLIE
	faceplayer
	opentext
	writetext CharlieExplainsGates
	waitbutton
	closetext
	turnobject GOLDENRODGYM_SUPER_NERD, DOWN
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
	text "Not enough cash?"
	done
	
DoorGuard1Challenge:
	text "If you can't pay,"
	line "then a battle will"
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
	text "Up ahead are two"
	line "doors to choose"
	cont "from."
	
	para "One trainer is"
	line "lying. The other"
	cont "tells half-truths."
	
	para "Which one is"
	line "which?"
	
	para "What fun would it"
	line "be if I told you?"
	cont "Ehehehe."
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
	
GuitaristJoelText:
	text "My pal ANDY fooled"
	line "you pretty bad,"
	cont "didn't he?"
	
	para "Now you need to"
	line "battle me!"
	done
	
GuitaristJoelWinText:
	text "I lost."
	done
	
GuitaristJoelAfterText:
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

	db 6 ; warp events
	warp_event 22, 39, CIANWOOD_CITY, 2
	warp_event 23, 39, CIANWOOD_CITY, 2
	warp_event 17,  4, CIANWOOD_CITY, 2
	warp_event  5, 36, CIANWOOD_CITY, 2
	warp_event 19,  4, GOLDENROD_GYM, 6
	warp_event  4, 35, GOLDENROD_GYM, 2

	db 2 ; coord events
	coord_event 17, 5, -1, CharlieExplainsGatesLeft
	coord_event 19, 5, -1, CharlieExplainsGatesRight

	db 4 ; bg events
	bg_event 21, 37, BGEVENT_READ, GoldenrodGymStatue
	bg_event 24, 37, BGEVENT_READ, GoldenrodGymStatue
	bg_event 22, 40, BGEVENT_DOWN, GoldenrodCantLeave
	bg_event 23, 40, BGEVENT_DOWN, GoldenrodCantLeave

	db 12 ; object events
	object_event  5, 34, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event 22, 33, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DoorGuard1, -1
	object_event 12, 23, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristJoel, -1
	object_event 12, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGuitaristTrevor, -1
	object_event 20, 27, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGuitaristAndy, -1
	object_event 26, 27, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGuitaristLee, -1
	object_event  4, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerBikerJerry, -1
	object_event  8, 16, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGuitaristBobby, -1
	object_event 18,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 3, TrainerPokemaniacCharlie, -1
	object_event  7, 13, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGuitaristMarcel, -1 ; Dupe
	object_event  3, 12, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGuitaristIvan, -1 ; Dupe
	object_event  2, 17, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGuitaristConrad, -1 ; Dupe
