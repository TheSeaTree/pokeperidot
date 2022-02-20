	const_def 2 ; object constants
	const RIDGEGYM_GYM_GUY

RidgeGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	showemote EMOTE_SHOCK, RIDGEGYM_GYM_GUY, 15
	opentext
	writetext RidgeGymGreeting
	waitbutton
	closetext
	applymovement RIDGEGYM_GYM_GUY, RidgeGymWalkToPlayer
	opentext
	writetext RidgeExplainGyms
	waitbutton
	setscene SCENE_FINISHED
	setevent EVENT_GYM_EXPLAINATION
	yesorno
	iftrue .deny
	writetext RidgeGymGoodLuck
	waitbutton
	closetext
	applymovement RIDGEGYM_GYM_GUY, RidgeGymWalkFromPlayer
	end
.deny
	writetext RidgeGymLeaveText
	waitbutton
	closetext
	applymovement PLAYER, RidgeLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, RIDGE_VILLAGE, 38,  7
	end
	
.DummyScene1:
	end

RidgeGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CECIL
	iftrue .RidgeGymGuyWinScript
	writetext RidgeGymGuyText
	waitbutton
	closetext
	end

.RidgeGymGuyWinScript:
	writetext RidgeGymGuyWinText
	waitbutton
	closetext
	end

RidgeGymStatue:
	trainertotext CECIL, CECIL1, MEM_BUFFER_1
	checkflag ENGINE_WAVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	checkflag ENGINE_COGBADGE
	iftrue .RivalBeaten
	jumpstd gymstatue2
.RivalBeaten
	jumpstd gymstatue3

RidgeCantLeave:
	checkflag ENGINE_WAVEBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end

.Leave
	opentext
	writetext RidgeGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, RidgeLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, RIDGE_VILLAGE, 38,  7
	end
	
RidgeLeaveGym:
	turn_step DOWN
	step_end
	
RidgeGymWalkToPlayer:
	step DOWN
	step LEFT
	step LEFT
	turn_step DOWN
	step_end
	
RidgeGymWalkFromPlayer:
	step RIGHT
	step RIGHT
	step UP
	turn_step DOWN
	step_resume
	
RidgeGymGuyText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "WATER-types do"
	line "not like GRASS one"
	cont "bit. Keep this in"
	cont "mind."
	done

RidgeGymGuyWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done
	
RidgeGymGreeting:
	text "Greetings,"
	line "challenger!"
	done

RidgeExplainGyms:	
	text "You should know"
	line "before you enter"
	cont "that you cannot"
	cont "exit a gym unless"
	cont "you win its BADGE"
	cont "or white out."
	
	para "Would you like a"
	line "chance to stock up"
	cont "on items before"
	cont "taking on this"
	cont "challenge?"
	done
	
RidgeGymLeaveText:
	text "Okay! Come back"
	line "whenever you are"
	cont "ready!"
	done
	
RidgeGymGoodLuck:
	text "Good luck on your"
	line "challenge,"
	cont "trainer!"
	done
	
RidgeGymHaveBadge:
	text "<PLAYER> used"
	line "the WAVEBADGE to"
	cont "unlock the door!"
	done

RidgeGym_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  3, RIDGE_GYM_B1, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  5, BGEVENT_READ, RidgeGymStatue
	bg_event  7,  5, BGEVENT_READ, RidgeGymStatue
	bg_event  4,  8, BGEVENT_READ, RidgeCantLeave
	bg_event  5,  8, BGEVENT_READ, RidgeCantLeave

	db 1 ; object events
	object_event   6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RidgeGymGuyScript, -1
