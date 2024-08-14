	const_def 2 ; object constants
	const FAVIAGYM_CELESTE

FaviaGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Ledge

.Ledge
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .Nothing
	changeblock 14, 18, $84
	changeblock 16, 18, $85
	changeblock 14, 30, $84
	changeblock 16, 30, $85
.Nothing
	return

FaviaGymCelesteScript:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	opentext
	checkevent EVENT_BEAT_CELESTE
	iftrue .AlreadyGotTM
	writetext CelesteIntroText1
	waitbutton
	closetext
	winlosstext CelesteLossText, 0
	loadtrainer CELESTE, CELESTE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CELESTE
	opentext
	writetext GetMysticBadgeText
	playsound SFX_GET_BADGE
	setmapscene FAVIA_TOWN, SCENE_FINISHED
	waitsfx
	setflag ENGINE_MYSTICBADGE
	checkcode VAR_BADGES
.FightDone:
	setevent EVENT_BEAT_SCIENTIST_ADRIAN
	setevent EVENT_BEAT_PSYCHIC_PARKER
	setevent EVENT_BEAT_PSYCHIC_CHRISTIAN
	setevent EVENT_BEAT_PSYCHIC_DAMIEN
	setevent EVENT_BEAT_SCIENTIST_MELVIN
	setevent EVENT_BEAT_GUITARIST_XAVIER
	writetext CelesteExplainBadgeText
	buttonsound
	verbosegiveitem TM_TELEPORT
	iffalse .BagFull
	setevent EVENT_GOT_TM_TELEPORT
	writetext CelesteExplainTMText
	waitbutton
	closetext
	special HealParty
	changeblock 14 , 34, $40
	changeblock 16 , 34, $40
	end

.AlreadyGotTM:
	writetext CelesteAfterText
	waitbutton
.BagFull:
	closetext
	end

.Rematch:
	checkflag ENGINE_REMATCH_CELESTE
	iftrue .DoneRematch
	
	opentext
	writetext CelesteRematchText
	waitbutton
	closetext
	
	winlosstext CelesteRematchWinText, 0

	copybytetovar wCelesteFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer CELESTE, CELESTE_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer CELESTE, CELESTE_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer CELESTE, CELESTE_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer CELESTE, CELESTE_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer CELESTE, CELESTE_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle

	setflag ENGINE_REMATCH_CELESTE
	copybytetovar wCelesteFightCount
	addvar 1
	copyvartobyte wCelesteFightCount

.DoneRematch
	jumptext CelesteAfterRematchText

TrainerScientistAdrian:
	trainer SCIENTIST, ADRIAN, EVENT_BEAT_SCIENTIST_ADRIAN, ScientistAdrianText, ScientistAdrianWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistAdrianAfterText
	waitbutton
	closetext
	end
	
TrainerScientistMelvin:
	trainer SCIENTIST, MELVIN, EVENT_BEAT_SCIENTIST_MELVIN, ScientistMelvinText, ScientistMelvinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMelvinAfterText
	waitbutton
	closetext
	end

TrainerPsychicParker:
	trainer PSYCHIC_T, PARKER, EVENT_BEAT_PSYCHIC_PARKER, PsychicParkerText, PsychicParkerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicParkerAfterText
	waitbutton
	closetext
	end
	
TrainerPsychicChristian:
	trainer PSYCHIC_T, CHRISTIAN, EVENT_BEAT_PSYCHIC_CHRISTIAN, PsychicChristianText, PsychicChristianWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicChristianAfterText
	waitbutton
	closetext
	end

TrainerPsychicDamien:
	trainer PSYCHIC_T, DAMIEN, EVENT_BEAT_PSYCHIC_DAMIEN, PsychicDamienText, PsychicDamienWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicDamienAfterText
	waitbutton
	closetext
	end
	

TrainerGuitaristXavier:
	trainer GUITARIST, XAVIER, EVENT_BEAT_GUITARIST_XAVIER, GuitaristXavierText, GuitaristXavierWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristXavierAfterText
	waitbutton
	closetext
	end
	
FaviaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_CELESTE
	iftrue .FaviaGymGuyWinScript
	opentext
	writetext FaviaGymGuyText
	waitbutton
	closetext
	end

.FaviaGymGuyWinScript:
	opentext
	writetext FaviaGymGuyWinText
	waitbutton
	closetext
	end

FaviaGymStatue:
	trainertotext CELESTE, CELESTE1, MEM_BUFFER_1
	checkflag ENGINE_MYSTICBADGE
	iftrue .Beaten
	opentext 
	writetext FaviaGymStatueWinningTrainers1Text
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext FaviaGymStatueNoWinnersText
	waitbutton
	closetext
	end
.Beaten:
	checkflag ENGINE_SKULLBADGE
	iftrue .RivalBeaten
	checkevent EVENT_FIRST_FANGIRL_FIGHT
	iftrue .FangirlBeaten
	jumptext FaviaGymStatueWinningTrainers2Text
.FangirlBeaten
	jumpstd gymstatue2
.RivalBeaten
	jumpstd gymstatue3

FaviaCantLeave:
	checkflag ENGINE_MYSTICBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext FaviaGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, FaviaLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, FAVIA_TOWN, 12, 7
	end
	
FaviaLeaveGym:
	turn_step DOWN
	step_end
	
FaviaGymHaveBadge:
	text "<PLAYER> used"
	line "the MYSTICBADGE to"
	cont "unlock the door!"
	done

CelesteIntroText1:
	text "Ah, you have dis-"
	line "covered the path"
	cont "through my laby-"
	cont "rinth of tele-"
	cont "porters."

	para "You have not yet"
	line "proven your worth."
	
	para "To claim my BADGE,"
	line "defeat me in"
	cont "battle!"
	done

CelesteLossText:
	text "Miraculous!"
	
	para "Never have I seen"
	line "such a masterful"
	cont "command over"
	cont "#MON."
	
	para "I, CELESTE,"
	line "leader of the"
	cont "FAVIA GYM, bestow"
	cont "upon you the"
	cont "MYSTICBADGE!"
	done

GetMysticBadgeText:
	text "<PLAYER> received"
	line "MYSTICBADGE."
	done

CelesteExplainBadgeText:
	text "The MYSTICBADGE"
	line "will allow #MON"
	cont "up to Lv40 to"
	cont "follow your lead"
	cont "without question."

	para "Here, you have"
	line "earned this as"
	cont "well."
	done

CelesteExplainTMText:
	text "That is TELEPORT."

	para "As you observed,"
	line "it will allow the"
	cont "user to retreat,"
	cont "and ensure its"
	cont "replacement enter"
	cont "safely."
	done

CelesteAfterText:
	text "I will use our"
	line "battle as inspira-"
	cont "tion."
	
	para "I assure you, the"
	line "outcome will not"
	cont "be the same next"
	cont "time."
	done

CelesteRematchText:
	text "I foresaw your"
	line "return, <PLAYER>."

	para "Have you come to"
	line "see how my"
	cont "#MON have grown"
	cont "since you earned"
	cont "the MYSTICBADGE?"

	para "I cannot predict"
	line "the outcome of"
	cont "this battle, but"
	cont "I promise I will"
	cont "not go down as"
	cont "easily this time!"
	done

CelesteRematchWinText:
	text "The stars were not"
	line "aligned in my"
	cont "favor today."
	done

CelesteAfterRematchText:
	text "I have learned"
	line "much from our"
	cont "battle today."

	para "I will use this"
	line "knowledge to"
	cont "change the out-"
	cont "come next time."
	done

ScientistAdrianText:
	text "I see you have"
	line "discovered the"
	cont "teleporters that I"
	cont "helped design."
	done
	
ScientistAdrianWinText:
	text "This was an unfor-"
	line "unate loss, but it"
	cont "was unavoidable."
	done

ScientistAdrianAfterText:
	text "We developed this"
	line "technology by"
	cont "studying ABRA."
	done
	
ScientistMelvinText:
	text "I helped build"
	line "these teleporters,"
	cont "and even I don't"
	cont "know where they"
	cont "all go."
	done
	
ScientistMelvinWinText:
	text "…We still haven't"
	line "tested if they are"
	cont "safe."
	done
	
ScientistMelvinAfterText:
	text "The leader of this"
	line "GYM commissioned"
	cont "myself and one"
	cont "other to develop"
	cont "the technology"
	cont "behind these tele-"
	cont "porters."
	done
	
PsychicParkerText:
	text "Please, allow me"
	line "to read your"
	cont "fortune."
	done
	
PsychicParkerWinText:
	text "“You will be met"
	line "with great victory"
	cont "before you know"
	cont "it.”"
	done
	
PsychicParkerAfterText:
	text "…Fine, I can't see"
	line "the future."
	
	para "You're just a good"
	line "trainer."
	done
	
PsychicChristianText:
	text "My power is other-"
	line "wordly."
	done
	
PsychicChristianWinText:
	text "Ah! Such power!"
	done
	
PsychicChristianAfterText:
	text "Perhaps I should"
	line "master this"
	cont "world's #MON"
	cont "before I look to-"
	cont "ward the stars."
	done

PsychicDamienText:
	text "The stars have"
	line "aligned. Now it is"
	cont "time for battle."
	done
	
PsychicDamienWinText:
	text "I await the next"
	line "time I may see you"
	cont "in battle."
	done
	
PsychicDamienAfterText:
	text "You have a power"
	line "exceeding that of"
	cont "a star."
	done
	
GuitaristXavierText:
	text "I've been having"
	line "writer's block, so"
	cont "I came to this gym"
	cont "for inspiration."
	done
	
GuitaristXavierWinText:
	text "You are just the"
	line "inspiration I was"
	cont "looking for!"
	done
	
GuitaristXavierAfterText:
	text "Go on, the leader"
	line "awaits. I will"
	cont "begin writing my"
	cont "new song."
	done
	
FaviaGymGuyText:
	text "Yo! CHAMP in"
	line "making!"

	para "This GYM is a real"
	line "trip, right?"
	
	para "Well the fact that"
	line "we're in space"
	cont "isn't the only un-"
	cont "usual thing about"
	cont "this GYM."
	
	para "The leader CELESTE"
	line "specializes in two"
	cont "types of #MON,"
	cont "PSYCHIC and FAIRY-"
	cont "types."
	
	para "You're gonna need"
	line "a well-balanced"
	cont "team to make it in"
	cont "this GYM."
	done

FaviaGymGuyWinText:
	text "Good job on your"
	line "victory!"
	
	para "I have never seen"
	line "CELESTE smile"
	cont "before."
	done

FaviaGymStatueWinningTrainers1Text:
	text "LEADER: @"
	text_ram wStringBuffer4
	text_start
	para "WINNING TRAINERS:"
	line "…"
	done

FaviaGymStatueNoWinnersText:
	text "There are no"
	line "winners listed!"
	done

FaviaGymStatueWinningTrainers2Text:
	text "LEADER: @"
	text_ram wStringBuffer4
	text_start
	para "WINNING TRAINERS:"
	cont "<PLAYER>"
	done

FaviaGym_MapEvents:
	db 0, 0 ; filler

	db 29 ; warp events
	warp_event 15, 39, FAVIA_TOWN, 3
	warp_event 16, 39, FAVIA_TOWN, 3
	warp_event 15, 34, FAVIA_GYM, 5
	warp_event 16, 34, FAVIA_GYM, 5
	warp_event 22, 22, FAVIA_GYM, 3 ; 5 red
	warp_event 25, 25, FAVIA_GYM, 10; 6
	warp_event 20, 27, FAVIA_GYM, 28; 7
	warp_event 27, 20, FAVIA_GYM, 23; 8
	warp_event 28, 17, FAVIA_GYM, 29; 9 green
	warp_event 31, 17, FAVIA_GYM, 6 ; 10
	warp_event 28, 10, FAVIA_GYM, 25; 11
	warp_event 31, 10, FAVIA_GYM, 5 ; 12
	warp_event 27,  7, FAVIA_GYM, 23; 13 white
	warp_event 15, 15, FAVIA_GYM, 1 ; 14 leader
	warp_event 22,  5, FAVIA_GYM, 3; 15
	warp_event 25,  2, FAVIA_GYM, 11; 16
	warp_event 20,  0, FAVIA_GYM, 18; 17
	warp_event 11,  0, FAVIA_GYM, 3; 18 orange
	warp_event  6,  2, FAVIA_GYM, 22; 19
	warp_event  9,  5, FAVIA_GYM, 3; 20
	warp_event  4,  7, FAVIA_GYM, 14; 21
	warp_event  0, 10, FAVIA_GYM, 6; 22 purple
	warp_event  3, 10, FAVIA_GYM, 8; 23
	warp_event  0, 17, FAVIA_GYM, 27; 24
	warp_event  3, 17, FAVIA_GYM, 15; 25
	warp_event  4, 20, FAVIA_GYM, 25; 26 blue
	warp_event  6, 25, FAVIA_GYM, 20; 27
	warp_event  9, 22, FAVIA_GYM, 8; 28
	warp_event 11, 27, FAVIA_GYM, 11; 29

	db 0 ; coord events

	db 4 ; bg events
	bg_event 14, 37, BGEVENT_READ, FaviaGymStatue
	bg_event 17, 37, BGEVENT_READ, FaviaGymStatue
	bg_event 15, 40, BGEVENT_DOWN, FaviaCantLeave
	bg_event 16, 40, BGEVENT_DOWN, FaviaCantLeave

	db 8 ; object events
	object_event 16, 15, SPRITE_CELESTE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FaviaGymCelesteScript, -1
	object_event 18, 37, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FaviaGymGuyScript, -1
	object_event 25, 22, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerScientistAdrian, EVENT_BEAT_ELITE_FOUR
	object_event  1, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerScientistMelvin, -1
	object_event  6,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristXavier, -1
	object_event 22,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicDamien, -1
	object_event 29, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicChristian, -1
	object_event  9, 25, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicParker, -1
