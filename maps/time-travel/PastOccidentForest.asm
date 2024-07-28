	const_def 2 ; object constants
	const PASTOCCIDENTFOREST_FISHER
	const PASTOCCIDENTFOREST_SUPERNERD1
	const PASTOCCIDENTFOREST_SUPERNERD2
	const PASTOCCIDENTFOREST_SWIMMER
	const PASTOCCIDENTFOREST_CHAMPION
	const PASTOCCIDENTFOREST_CELEBI

PastOccidentForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Restless

.Restless
	setflag ENGINE_FOREST_IS_RESTLESS
	return

TrainerFirebreatherRush:
	trainer FIREBREATHER, RUSH, EVENT_BEAT_FIREBREATHER_RUSH, FirebreatherRushText, FirebreatherRushWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRushAfterText
	waitbutton
	closetext
	end

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewText, PokemaniacAndrewWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterText
	waitbutton
	closetext
	end

TrainerPsychicLenny:
	trainer PSYCHIC_T, LENNY, EVENT_BEAT_PSYCHIC_LENNY, PsychicLennyText, PsychicLennyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicLennyAfterText
	waitbutton
	closetext
	end

TrainerSwimmerFMorgan:
	trainer SWIMMERF, MORGAN, EVENT_BEAT_SWIMMERF_MORGAN, SwimmerFMorganText, SwimmerFMorganWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerFMorganAfterText
	waitbutton
	closetext
	end

PastOccidentForestChampion:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_CHAMPION_IN_PAST
	iftrue .Battled
	checkevent EVENT_CAUGHT_CELEBI
	iftrue .Caught
	writetext PastOccidentForestChampionIntroText
	waitbutton
	closetext
	end

.Caught
	writetext PastOccidentForestChampionAfterCelebiText
	waitbutton
	playmusic MUSIC_RIVAL_ENCOUNTER
	writetext PastOccidentForestChampionChallengeText
	waitbutton
	closetext
	winlosstext PastOccidentForestChampionWinText, -1
	loadtrainer YOUNG_CHAMPION, JOSEPH_PAST
	startbattle
	reloadmapafterbattle
	setevent EVENT_FOUGHT_CHAMPION_IN_PAST
	opentext 
.Battled
	writetext PastOccidentForestChampionAfterText
	waitbutton
	closetext
	end

PastOccidentForestShrine:
	opentext
	writetext PastOccidentForestShrineText
	waitbutton
	checkevent EVENT_FOUGHT_BOSS_CELEBI
	iftrue No_TimeBell
	checkitem TIME_BELL
	iffalse No_TimeBell
	writetext UseTimeBellText
	yesorno
	iffalse No_TimeBell
	writetext PlayerPlayedTimeBellText
	playsound SFX_MORNING_SUN
	waitsfx
	closetext
CelebiBoss4::
	moveobject PASTOCCIDENTFOREST_CELEBI, 48, 2
	special CelebiShrineEvent
	appear PASTOCCIDENTFOREST_CELEBI
	setlasttalked PASTOCCIDENTFOREST_CELEBI
	scall CelebiBoss4Intro
	loadwildmon CELEBI, 25
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	scall .PitchBlack
	opentext
	writetext PastCelebiEnergyText
	playsound SFX_PSYBEAM
	waitsfx
	closetext
	setevent EVENT_FOUGHT_BOSS_CELEBI
	jumpstd timetravelwarp

.PitchBlack
	jumpstd darkenroom
	end

CelebiBoss4Intro:
	jumpstd bosscelebiintro
	end

No_TimeBell:
	closetext
	end

PastOccidentForestBarbedSpear:
	itemball BARBED_SPEAR

PastOccidentForestRock:
	jumpstd smashrock

FirebreatherRushText:
	text "If I could learn"
	line "to breathe fire,"
	cont "so can my #MON!"
	done

FirebreatherRushWinText:
	text "We need to pract-"
	line "ice more, team!"
	done

FirebreatherRushAfterText:
	text "I always need to"
	line "be careful around"
	cont "all of the trees."
	done

PokemaniacAndrewText:
	text "My #MON"
	line "evolved!"

	para "Now it looks"
	line "totally different!"
	done

PokemaniacAndrewWinText
	text "#MON should get"
	line "stronger when"
	cont "they evolve!"
	done

PokemaniacAndrewAfterText:
	text "I caught my two"
	line "SCYTHER on the"
	cont "same day."

	para "I wonder why one"
	line "evolved but not"
	cont "the other."
	done

PsychicLennyText:
	text "My old #MON"
	line "need training."

	para "Care to assist me?"
	done

PsychicLennyWinText:
	text "That's all I've"
	line "got for now!"
	done

PsychicLennyAfterText:
	text "These BUG #MON"
	line "are so bothersome."

	para "My new #MON"
	line "are seeing so much"
	cont "more use here."

	para "The old ones are"
	line "inadequate."
	done

SwimmerFMorganText:
	text "EEK!"

	para "Nobody is supposed"
	line "to be here!"
	done

SwimmerFMorganWinText:
	text "I left my best"
	line "#MON at home!"
	done

SwimmerFMorganAfterText:
	text "I get shy when"
	line "people see me in"
	cont "my swimsuit."

	para "That's why I go"
	line "swimming here!"

	para "Now could you"
	line "please go?"
	done

PastOccidentForestChampionIntroText:
	text "I heard there's"
	line "been a powerful"
	cont "#MON spotted"
	cont "in this forest."

	para "Don't bother me"
	line "while I am looking"
	cont "for it."
	done

PastOccidentForestChampionAfterCelebiText:
	text "Hmph!"

	para "That powerful"
	line "#MON that I"
	cont "heard rumors about"
	cont "hasn't been seen in"
	cont "a long time."

	para "…………………………"

	para "You captured it?"
	done

PastOccidentForestChampionChallengeText:
	text "You must be a"
	line "strong trainer."

	para "Show me how strong"
	line "your #MON are!"
	done

PastOccidentForestChampionWinText:
	text "So there are"
	line "better trainers"
	cont "out there."
	done

PastOccidentForestChampionAfterText:
	text "Losing will not be"
	line "an option in my"
	cont "future battles."

	para "I'll find people"
	line "even stronger than"
	cont "you to train my"
	cont "#MON against."
	done

PastOccidentForestShrineText:
	text "It seems to be a"
	line "shrine dedicated"
	cont "to the guardian of"
	cont "the forest."
	done

UseTimeBellText:
	text "Try ringing the"
	line "TIME BELL?"
	done

PlayerPlayedTimeBellText:
	text "<PLAYER> rang the"
	line "TIME BELL."
	done

PastCelebiEnergyText:
	text "CELEBI unleashed"
	line "a huge amount of"
	cont "PSYCHIC power!"
	done

PastOccidentForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 67, 34, PAST_FOREST_GATE, 1 ; Forest Gate
	warp_event 67, 35, PAST_FOREST_GATE, 2 ; Forest Gate

	db 0 ; coord events

	db 1 ; bg events
	bg_event 48,  2, BGEVENT_UP, PastOccidentForestShrine

	db 10 ; object events
	object_event 39, 18, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherRush, -1
	object_event 47, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacAndrew, -1
	object_event 20, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, TrainerPsychicLenny, -1
	object_event  3, 13, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerFMorgan, -1
	object_event 26, 15, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastOccidentForestChampion, -1
	object_event -1, -1, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FOUGHT_BOSS_CELEBI
	object_event  1,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastOccidentForestBarbedSpear, EVENT_OCCIDENT_FOREST_PAST_BARBED_SPEAR
	object_event 26, 31, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastOccidentForestRock, -1
	object_event 24, 34, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastOccidentForestRock, -1
	object_event 23, 32, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastOccidentForestRock, -1
