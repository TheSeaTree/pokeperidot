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
	setscene SCENE_FINISHED

AmberScript_Battle:
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
	
	
ChampionDoorLeft:
	checkflag ENGINE_CREDITS_SKIP
	iftrue .Rematch
	warpmod 1, VICTORS_ROOM
	end

.Rematch
	warpmod 1, ELKHORN_TOWN ; Placeholder for EMILYS_ROOM
	end

ChampionDoorRight:
	checkflag ENGINE_CREDITS_SKIP
	iftrue .Rematch
	warpmod 2, VICTORS_ROOM
	end

.Rematch
	warpmod 2, ELKHORN_TOWN ; Placeholder for EMILYS_ROOM
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
	cont "last!"
	
	para "My name is AMBER."

	para "Do you like my"
	line "jewelry, <PLAYER>?"

	para "There's nothing in"
	line "this world I love"
	cont "more than an expe-"
	cont "nsive ROCK."

	para "My #MON are"
	line "also quite rare"
	cont "and costly."
	
	para "I don't expect a"
	line "child to appreci-"
	cont "ate their value."

	para "You may look, but"
	line "don't touch!"

	para "…Not that I will"
	line "let you get that"
	cont "close!"

	para "I hope that you're"
	line "ready, challenger."

	para "I didn't get to"
	line "this position with"
	cont "my looks alone!"
	done	

AmberScript_AmberBeatenText:
	text "Sigh…"
	
	para "I am disappointed"
	line "to be defeated by"
	cont "someone with such"
	cont "little class."
	
	para "But I will lose"
	line "with dignity."
	
	para "Congratulations."
	
	para "You have defeated"
	line "the ELITE FOUR!"
	done

AmberScript_AmberDefeatText:
	text "Don't celebrate so"
	line "soon, trainer."

	para "While your battles"
	line "against the ELITE"
	cont "FOUR are over,"
	cont "your #MON"
	cont "LEAGUE challenge is"
	cont "not over yet."

	para "There is one other"
	line "trainer who has"
	cont "defeated me--your"
	cont "next challenge."

	para "The CHAMPION awaits"
	line "you, <PLAYER>."

	para "Don't embarass me"
	line "by losing now."
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
	warp_event  6,  1, VICTORS_ROOM, -1
	warp_event  7,  1, VICTORS_ROOM, -1

	db 6 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachAmberLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachAmberRight
	coord_event  6, 16, SCENE_FINISHED, CantPassAmber
	coord_event  7, 16, SCENE_FINISHED, CantPassAmber
	coord_event  6,  2, SCENE_FINISHED, ChampionDoorLeft
	coord_event  7,  2, SCENE_FINISHED, ChampionDoorRight

	db 2 ; bg events
	bg_event  6, 20, BGEVENT_READ, AmberNoTurningBack
	bg_event  7, 20, BGEVENT_READ, AmberNoTurningBack

	db 3 ; object events
	object_event  8, 10, SPRITE_AMBER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmberScript_Battle, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
