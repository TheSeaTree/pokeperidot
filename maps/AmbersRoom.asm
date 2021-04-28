	const_def 2 ; object constants
	const AMBERSROOM_AMBER
	const AMBERSROOM_CHRIS
	const AMBERSROOM_KRIS

AmbersRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	end

.DummyScene:
	end

ApproachAmberLeft:
	applymovement PLAYER, AmbersRoom_EnterMovementLeft
	jump ContinueApporachAmber
	
ApproachAmberRight:
	applymovement PLAYER, AmbersRoom_EnterMovementRight
ContinueApporachAmber:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject AMBERSROOM_CHRIS, 5, 10
	appear AMBERSROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject AMBERSROOM_KRIS, 5, 10
	appear AMBERSROOM_KRIS
.ContinueBattle
	applymovement PLAYER, AmbersRoom_CameraPan

	applymovement AMBERSROOM_AMBER, AmberApproachPlayer
	moveobject AMBERSROOM_AMBER, 8, 10
	setscene SCENE_FINISHED

AmberScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_AMBER
	iftrue AmberScript_AfterBattle
	writetext AmberScript_AmberBeforeText
	waitbutton
	closetext
	winlosstext AmberScript_AmberBeatenText, 0
	loadtrainer AMBER, AMBER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_AMBER
	opentext
	writetext AmberScript_AmberDefeatText
	waitbutton
	closetext

	applymovement PLAYER, AmbersRoom_CenterCamera
	disappear AMBERSROOM_CHRIS
	disappear AMBERSROOM_KRIS

	setevent EVENT_AMBERS_ROOM_EXIT_OPEN
	waitsfx
	end
	
AmberNoTurningBack:
	jumptext AmberCantProgress
	
CantPassAmber:
	opentext
	writetext AmberCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

AmberScript_AfterBattle:
	writetext AmberScript_AmberDefeatText
	waitbutton
	closetext
	end

AmbersRoom_EnterMovementLeft:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

AmbersRoom_EnterMovementRight:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

AmberApproachPlayer:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step LEFT
	step_resume
	
AmbersRoom_CameraPan:
	hide_person
	slow_step RIGHT
	step_end
	
AmbersRoom_CenterCamera:
	slow_step LEFT
	turn_head RIGHT
	show_person
	step_end

AmbersRoom_CameraPanDown:
	slow_step DOWN
	slow_step DOWN
	step_end

AmberScript_AmberBeforeText:
	text "The ELITE FOUR has"
	line "saved its best for"
	cont "last."
	
	para "My name is AMBER."

	para "ROCKs are my fav-"
	line "orite thing in"
	cont "this world. The"
	cont "more expensive,"
	cont "the better!"
	
	para "This extends to my"
	line "#MON as well."
	
	para "You may look at"
	line "them, but you may"
	cont "not touch."
	
	para "…Not that I will"
	line "let you get that"
	cont "close!"

	para "You will soon see"
	line "that I am more"
	cont "than just a pretty"
	cont "face!"
	done

AmberScript_AmberBeatenText:
	text "Well, aren't you"
	line "good. I like that"
	cont "in a trainer."
	done

AmberScript_AmberDefeatText:
	text "Strong #MON."

	para "Weak #MON."

	para "That is only the"
	line "selfish perception"
	cont "of people."

	para "Truly skilled"
	line "trainers should"

	para "try to win with"
	line "their favorites."

	para "I like your style."
	line "You understand"
	cont "what's important."

	para "Go on--the CHAM-"
	line "PION is waiting."
	done
	
AmberCantProgress:
	text "There is no"
	line "turning back now."
	done

AmbersRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, BREDES_ROOM, 3
	warp_event  7, 19, BREDES_ROOM, 4
	warp_event  6,  1, LANCES_ROOM, 1
	warp_event  7,  1, LANCES_ROOM, 2

	db 4 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachAmberLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachAmberRight
	coord_event  6, 16, SCENE_FINISHED, CantPassAmber
	coord_event  7, 16, SCENE_FINISHED, CantPassAmber

	db 2 ; bg events
	bg_event  6, 20, BGEVENT_READ, AmberNoTurningBack
	bg_event  7, 20, BGEVENT_READ, AmberNoTurningBack

	db 6 ; object events
	object_event 12, 14, SPRITE_AMBER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  1, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  8, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  1,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event 11,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  9,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  6,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event 10,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event 12,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
