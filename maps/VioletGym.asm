	const_def 2 ; object constants
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareGym
	
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
	closetext
	applymovement PLAYER, VioletLeaveGym
	warpfacing DOWN, VIOLET_CITY, 40, 9
	end
	
.DummyScene1:
	end
	
.PrepareGym
	checkflag ENGINE_HIVEBADGE
	iftrue .end
	clearevent EVENT_BEAT_SWIMMERM_VINNY
	clearevent EVENT_BEAT_SWIMMERM_JIMMY
	clearevent EVENT_BEAT_SWIMMERF_VIVIAN
	clearevent EVENT_BEAT_SWIMMERM_RONNIE
.end
	return

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
	step_end
	
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

	para "The grass-type is"
	line "weak against the"

	para "flying-type. Keep"
	line "this in mind."
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
	cont "exit a gym"
	cont "unless you win"
	cont "a BADGE or white"
	cont "out."
	
	para "Would you like a"
	line "chance to stock up"
	cont "on items before"
	cont "taking on this"
	cont "challenge?"
	done
	
VioletGymGoodLuck:
	text "Good luck on your"
	line "challenge,"
	cont "trainer!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  7, VIOLET_CITY, 2
	warp_event  5,  7, VIOLET_CITY, 2
	warp_event  5,  3, VIOLET_GYM_B1, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  5, BGEVENT_READ, VioletGymStatue
	bg_event  7,  5, BGEVENT_READ, VioletGymStatue

	db 1 ; object events
	object_event   6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
