	const_def 2 ; object constants
	const REGANSROOM_REGAN
	const REGANSROOM_CHRIS
	const REGANSROOM_KRIS

RegansRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear REGANSROOM_REGAN
	end

.DummyScene:
	end

ApproachReganLeft:
	applymovement PLAYER, RegansRoom_EnterMovementLeft
	jump ContinueApproachRegan

ApproachReganRight:
	applymovement PLAYER, RegansRoom_EnterMovementRight	
ContinueApproachRegan:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject REGANSROOM_CHRIS, 5, 10
	appear REGANSROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject REGANSROOM_KRIS, 5, 10
	appear REGANSROOM_KRIS
.ContinueBattle
	applymovement PLAYER, E4StartBattle
	
	refreshscreen $86
	playsound SFX_ENTER_DOOR
	changeblock 4,  8, $09 ; wall
	changeblock 6,  8, $0a ; wall
	changeblock 8,  8, $0b ; wall
	changeblock 4, 10, $0d ; wall
	changeblock 6, 10, $0e ; wall
	changeblock 8, 10, $0f ; wall
	reloadmappart
	closetext
	wait 4

	appear REGANSROOM_REGAN
	applymovement REGANSROOM_REGAN, ReganVanishingAct
	setlasttalked REGANSROOM_REGAN
	setscene SCENE_FINISHED

	faceplayer
	opentext
	writetext ReganScript_ReganBeforeText
	waitbutton
	closetext
	winlosstext ReganScript_ReganBeatenText, 0
	loadtrainer REGAN, REGAN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_REGAN
	opentext
	writetext ReganScript_ReganDefeatText
	waitbutton
	closetext

	applymovement REGANSROOM_REGAN, ReganVanishingAct
	disappear REGANSROOM_REGAN
	wait 8

	applymovement PLAYER, E4AfterBattle
	disappear REGANSROOM_CHRIS
	disappear REGANSROOM_KRIS

	setevent EVENT_REGANS_ROOM_EXIT_OPEN
	waitsfx
	end
	
ReganNoTurningBack:
	jumptext ReganCantProgress
	
CantPassRegan:
	opentext
	writetext ReganCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

ReganScript_AfterBattle:
	writetext ReganScript_ReganDefeatText
	waitbutton
	closetext
	end
	
ReganVanishingAct:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
E4StartBattle:
	hide_person
	slow_step RIGHT
	step_end

E4AfterBattle:
	step LEFT
	turn_head RIGHT
	show_person
	step_end

RegansRoom_EnterMovementLeft:
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

RegansRoom_EnterMovementRight:
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

StepAwayE4:
	step UP
	step_end

ReganScript_ReganBeforeText:
	text "I am BRUNO of the"
	line "ELITE FOUR."

	para "I always train to"
	line "the extreme be-"
	cont "cause I believe in"
	cont "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "Ready, <PLAYER>?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "It's showtime!"
	done

ReganScript_ReganBeatenText:
	text "Why? How could we"
	line "lose?"
	done

ReganScript_ReganDefeatText:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go face your next"
	line "challenge!"
	done
	
ReganCantProgress:
	text "There is no"
	line "turning back now."
	done

RegansRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, ORVILLES_ROOM, 1
	warp_event  7, 19, ORVILLES_ROOM, 2
	warp_event  6,  1, BREDES_ROOM, 1
	warp_event  7,  1, BREDES_ROOM, 2

	db 4 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachReganLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachReganRight
	coord_event  6, 16, SCENE_FINISHED, CantPassRegan
	coord_event  7, 16, SCENE_FINISHED, CantPassRegan

	db 2 ; bg events
	bg_event  6, 20, BGEVENT_READ, ReganNoTurningBack
	bg_event  7, 20, BGEVENT_READ, ReganNoTurningBack

	db 9 ; object events
	object_event  8, 10, SPRITE_REGAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ReganScript_AfterBattle, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
