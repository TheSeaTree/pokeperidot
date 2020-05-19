	const_def 2 ; object constants
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	showemote EMOTE_SHOCK, VIOLETGYM_GYM_GUY, 15
	opentext
	writetext VioletGymGreeting
	waitbutton
	closetext
	applymovement VIOLETGYM_GYM_GUY, VioletGymWalkToPlayer
	opentext
	writetext VioletExplainGyms
	waitbutton
	setscene SCENE_FINISHED
	setevent EVENT_GYM_EXPLAINATION
	yesorno
	iftrue .deny
	writetext VioletGymGoodLuck
	waitbutton
	closetext
	applymovement VIOLETGYM_GYM_GUY, VioletGymWalkFromPlayer
	end
.deny
	writetext VioletGymLeaveText
	waitbutton
	closetext
	applymovement PLAYER, VioletLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, VIOLET_CITY, 38,  7
	end
	
.DummyScene1:
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd gymstatue2
	
VioletCantLeave:
	checkflag ENGINE_HIVEBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end

.Leave
	opentext
	writetext VioletGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, VioletLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, VIOLET_CITY, 38,  7
	end
	
VioletLeaveGym:
	turn_step DOWN
	step_end
	
VioletGymWalkToPlayer:
	step DOWN
	step LEFT
	step LEFT
	turn_step DOWN
	step_end
	
VioletGymWalkFromPlayer:
	step RIGHT
	step RIGHT
	step UP
	turn_step DOWN
	step_resume
	
VioletGymGuyText:
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

VioletGymGuyWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done
	
VioletGymGreeting:
	text "Greetings,"
	line "challenger!"
	done

VioletExplainGyms:	
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
	
VioletGymLeaveText:
	text "Okay! Come back"
	line "whenever you are"
	cont "ready!"
	done
	
VioletGymGoodLuck:
	text "Good luck on your"
	line "challenge,"
	cont "trainer!"
	done
	
VioletGymHaveBadge:
	text "<PLAYER> used"
	line "the WAVEBADGE to"
	cont "unlock the door!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  3, VIOLET_GYM_B1, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  5, BGEVENT_READ, VioletGymStatue
	bg_event  7,  5, BGEVENT_READ, VioletGymStatue
	bg_event  4,  8, BGEVENT_READ, VioletCantLeave
	bg_event  5,  8, BGEVENT_READ, VioletCantLeave

	db 1 ; object events
	object_event   6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
