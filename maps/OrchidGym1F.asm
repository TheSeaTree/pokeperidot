	const_def 2 ; object constants
	const ORCHIDGYM_GYM_GUY
	const ORCHIDGYM_RIVAL

OrchidGym1F_MapScripts:
	db 3 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_ORCHIDGYM1F_FAINTED
	scene_script .Scene0 ; SCENE_ORCHIDGYM1F_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetSteps

.Scene1:
	turnobject ORCHIDGYM_GYM_GUY, LEFT
	opentext
	writetext BlackthornGymGuyFailureText
	closetext
	turnobject ORCHIDGYM_GYM_GUY, DOWN
	setscene SCENE_ORCHIDGYM1F_RIVAL
.Scene0:
	end

.SetSteps
	special SetFireGymSteps
	return

OrchidRivalBattle:
	setlasttalked ORCHIDGYM_RIVAL
	special FadeOutMusic
	playsound SFX_ENTER_DOOR
	moveobject ORCHIDGYM_RIVAL, 8, 2
	appear ORCHIDGYM_RIVAL
	showemote EMOTE_QUESTION, ORCHIDGYM_RIVAL, 15
	applymovement ORCHIDGYM_RIVAL, OrchidGymRivalStepDown
	faceobject PLAYER, ORCHIDGYM_RIVAL
	faceobject ORCHIDGYM_RIVAL, PLAYER
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OrchidGymRivalIntroText
	waitbutton
	closetext
	winlosstext OrchidGymRivalWinText, OrchidGymRivalLossText
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Squirtle
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Bulbasaur
	loadtrainer RIVAL1, RIVAL1_6_TOTODILE
	jump .DoBattle
.Squirtle
	loadtrainer RIVAL1, RIVAL1_6_CHIKORITA
	jump .DoBattle
.Bulbasaur
	loadtrainer RIVAL1, RIVAL1_6_CYNDAQUIL
.DoBattle
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext OrchidGymRivalAfterText
	waitbutton
	closetext	
	turnobject ORCHIDGYM_RIVAL, LEFT
;	wait 8
	opentext
	writetext OrchidRivalAngryText
	waitbutton
	writetext OrchidRivalKickingText
	disappear ORCHIDGYM_GYM_GUY
	applymovement ORCHIDGYM_RIVAL, OrchidGymRivalKickStatue
	playsound SFX_COMET_PUNCH
	earthquake 16
	waitsfx
	appear ORCHIDGYM_GYM_GUY
	closetext
;	wait 8
	checkcode VAR_YCOORD
	ifequal 4, .NoShove
	applymovement ORCHIDGYM_RIVAL, OrchidGymRivalStartLeave
	applymovement PLAYER, OrchidGymRivalShovePlayer
	playsound SFX_TACKLE
	applymovement ORCHIDGYM_RIVAL, OrchidGymRivalRunOut2
	jump .RivalLeave
.NoShove
	applymovement ORCHIDGYM_RIVAL, OrchidGymRivalRunOut
.RivalLeave
	playsound SFX_EXIT_BUILDING
	disappear ORCHIDGYM_RIVAL
	waitsfx
	playmapmusic
	setscene SCENE_ORCHIDGYM1F_RIVAL
	setmapscene BURGLAR_HIDEOUT_B1F, SCENE_BURGLARHIDEOUTB1F_RIVAL
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

BlackthornGymGuy:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustBeatRival
	jumptextfaceplayer BlackthornGymGuyText

.JustBeatRival
	faceplayer
	opentext
	writetext OrchidGymGuyQuestionRivalText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext OrchidGymGuyAfterHealText
	waitbutton
	closetext
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

BlackthornCantLeave:
	checkflag ENGINE_RISINGBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext BlackthornGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, BlackthornLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, ORCHID_CITY, 26,  7
	end

BlackthornGymStatue:
	trainertotext ENYA, ENYA1, MEM_BUFFER_1
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue4
.Beaten:
	jumpstd gymstatue3

OrchidGymPlayerApproachRival:
	step UP
	step UP
	step_end

BlackthornLeaveGym:
	turn_step DOWN
	step_end
	
OrchidGymRivalKickStatue:
	turn_step LEFT
	step_resume

OrchidGymRivalRunOut:
	run_step DOWN
OrchidGymRivalRunOut2:
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_end

OrchidGymRivalStepDown:
	step DOWN
OrchidGymRivalStartLeave:
	step DOWN
	step_end

OrchidGymRivalShovePlayer:
	turn_head LEFT
	fix_facing
	run_step RIGHT
	remove_fixed_facing
	step_end

OrchidGymRivalIntroText:
	text "Heh! You've finally"
	line "fallen behind."

	para "That #MON you"
	line "got from PROF."
	cont "MAPLE must not be"
	cont "carrying you as"
	cont "much now."

	para "I had no trouble"
	line "with ENYA."

	para "And with this"
	line "WYRMBADGE, I am"
	cont "ready for the"
	cont "#MON LEAGUE."

	para "Beating you will"
	line "be effortless!"
	done

OrchidGymRivalWinText:
	text "I can't stand"
	line "this!"
	
	para "You got a lucky"
	line "handout at the"
	cont "start of your"
	cont "journey!"
	
	para "I had to catch my"
	line "own #MON!"
	done

OrchidGymRivalLossText:
	text "I knew your luck"
	line "wouldn't last"
	cont "forever."

	para "Get out of here."

	para "Your #MON don't"
	line "deserve to chall-"
	cont "enge this GYM!"
	done

OrchidGymRivalAfterText:
	text "Fine! Go challenge"
	line "this GYM!"
	
	para "Do whatever you"
	line "want! I don't care!"
	
	para "Clearly you are"
	line "the only trainer I"
	cont "simply can't beat!"
	done

OrchidRivalAngryText:
	text "I just feel so…"
	done

OrchidRivalKickingText:
	text "ARGH!"
	done

OrchidGymGuyQuestionRivalText:
	text "Yo, what was that"
	line "guy's problem?"

	para "Do you two have a"
	line "history or some-"
	cont "thing?"

	para "Either way, he"
	line "wasn't part of the"
	cont "GYM challenge."

	para "It wouldn't be fair"
	line "to make you go"
	cont "downstairs with"
	cont "the state your"
	cont "#MON are in."

	para "Here, let me see"
	line "them for a sec."
	done

OrchidGymGuyAfterHealText:
	text "Don't tell ENYA I"
	line "did this for you."

	para "She's scary when"
	line "she gets angry."
	done

BlackthornGymGuyText:
	text "Yo! Champ in the"
	line "making!"

	para "This GYM on top of"
	line "a volcano is too"
	cont "hot to handle!"

	para "Careful down in"
	line "the basement."

	para "The trainers down"
	line "there are used to"
	cont "the extreme heat,"
	cont "bur you're not!"

	para "Plan your steps"
	line "carefully, or else"
	cont "you might pass out"
	cont "and have to start"
	cont "from back here."

	para "ENYA only wants to"
	line "battle the best of"
	cont "the best."

	para "Don't worry, you"
	line "got this!"
	done
	
BlackthornGymGuyFailureText:
	text "Woah there! You"
	line "gave me quite the"
	cont "scare!"
	
	para "You need to be"
	line "more careful in"
	cont "that extreme heat!"

	para "I don't like having"
	line "to go down into"
	cont "that basement!"
	done

BlackthornGymHaveBadge:
	text "<PLAYER> used"
	line "the WYRMBADGE to"
	cont "unlock the door!"
	done

OrchidGym1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8,  2, ORCHID_GYM_B1F, 1

	db 2 ; coord events
	coord_event  8,  5, SCENE_DEFAULT, OrchidRivalBattle
	coord_event  9,  4, SCENE_DEFAULT, OrchidRivalBattle

	db 4 ; bg events
	bg_event  6,  7, BGEVENT_READ, BlackthornGymStatue
	bg_event 11,  7, BGEVENT_READ, BlackthornGymStatue
	bg_event  8, 10, BGEVENT_DOWN, BlackthornCantLeave
	bg_event  9, 10, BGEVENT_DOWN, BlackthornCantLeave

	db 2 ; object events
	object_event 10,  7, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, BlackthornGymGuy, -1
	object_event  0,  0, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
