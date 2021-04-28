	const_def 2 ; object constants
	const ORVILLESROOM_ORVILLE
	const ORVILLESROOM_BOMB
	const ORVILLESROOM_BOMB2
	const ORVILLESROOM_BOMB3
	const ORVILLESROOM_BOMB4
	const ORVILLESROOM_BOMB5
	const ORVILLESROOM_CHRIS
	const ORVILLESROOM_KRIS

OrvillesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear ORVILLESROOM_ORVILLE
	disappear ORVILLESROOM_BOMB
	disappear ORVILLESROOM_BOMB2
	disappear ORVILLESROOM_BOMB3
	disappear ORVILLESROOM_BOMB4
	disappear ORVILLESROOM_BOMB5
	end

.DummyScene:
	end


ApproachOrvilleLeft:
	applymovement PLAYER, OrvillesRoom_EnterMovementLeft
	jump ContinueApproachOrville

ApproachOrvilleRight:
	applymovement PLAYER, OrvillesRoom_EnterMovementRight
ContinueApproachOrville:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject ORVILLESROOM_CHRIS, 5, 10
	appear ORVILLESROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject ORVILLESROOM_KRIS, 5, 10
	appear ORVILLESROOM_KRIS
.ContinueBattle
	applymovement PLAYER, OrvillesRoom_StartBattle
	
;	appear ORVILLESROOM_BOMB2
;	playsound SFX_KINESIS
;	applymovement ORVILLESROOM_BOMB2, OrvilleFalling
;	playsound SFX_EGG_BOMB
;	applymovement ORVILLESROOM_BOMB2, OrvilleExplode
;	disappear ORVILLESROOM_BOMB2

;	appear ORVILLESROOM_BOMB3
;	playsound SFX_KINESIS
;	applymovement ORVILLESROOM_BOMB3, OrvilleFalling
;	playsound SFX_EGG_BOMB
;	applymovement ORVILLESROOM_BOMB3, OrvilleExplode
;	disappear ORVILLESROOM_BOMB3

;	appear ORVILLESROOM_BOMB4
;	playsound SFX_KINESIS
;	applymovement ORVILLESROOM_BOMB4, OrvilleFalling
;	playsound SFX_EGG_BOMB
;	applymovement ORVILLESROOM_BOMB4, OrvilleExplode
;	disappear ORVILLESROOM_BOMB4

;	appear ORVILLESROOM_BOMB5
;	playsound SFX_KINESIS
;	applymovement ORVILLESROOM_BOMB5, OrvilleFalling
;	playsound SFX_EGG_BOMB
;	applymovement ORVILLESROOM_BOMB5, OrvilleExplode
;	disappear ORVILLESROOM_BOMB5
	
	appear ORVILLESROOM_BOMB
	playsound SFX_KINESIS
	applymovement ORVILLESROOM_BOMB, OrvilleFalling
	waitsfx
	playsound SFX_EGG_BOMB
	appear ORVILLESROOM_ORVILLE
	applymovement ORVILLESROOM_BOMB, OrvilleExplode
	earthquake 8
	waitsfx
	setscene SCENE_FINISHED

	opentext
	writetext OrvilleScript_OrvilleBeforeText
	waitbutton
	closetext
	winlosstext OrvilleScript_OrvilleBeatenText, 0
	loadtrainer ORVILLE, ORVILLE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_ORVILLE
	opentext
	writetext OrvilleScript_OrvilleDefeatText
	waitbutton
	closetext
	
	setevent EVENT_ORVILLES_ROOM_EXIT_OPEN
	waitsfx
	end
	
OrvilleNoTurningBack:
	jumptext OrvilleCantProgress
	
CantPassOrville:
	opentext
	writetext OrvilleCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

OrvilleScript_AfterBattle:
	writetext OrvilleScript_OrvilleDefeatText
	waitbutton
	closetext
	end

OrvillesRoom_EnterMovementLeft:
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

OrvillesRoom_EnterMovementRight:
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
	
OrvillesRoom_StartBattle:
	hide_person
	slow_step RIGHT
	step_end

OrvillesRoom_ReturnFromBattle:
	step LEFT
	turn_head RIGHT
	show_person
	step_end
	
OrvillesRoom_StepAway:
	step UP
	step_end
	
OrvilleFalling:
	skyfall
	step_end

OrvilleExplode:
;	skyfall_top
	turn_step RIGHT
	turn_step RIGHT
;	turn_step RIGHT
;	turn_step RIGHT
	hide_person
	step_end

OrvilleScript_OrvilleBeforeText:
	text "Welcome to #MON"
	line "LEAGUE, <PLAYER>."

	para "Allow me to intro-"
	line "duce myself. I am"
	cont "WILL."

	para "I have trained all"
	line "around the world,"

	para "making my psychic"
	line "#MON powerful."

	para "And, at last, I've"
	line "been accepted into"
	cont "the ELITE FOUR."

	para "I can only keep"
	line "getting better!"

	para "Losing is not an"
	line "option!"
	done

OrvilleScript_OrvilleBeatenText:
	text "I… I can't…"
	line "believe it…"
	done

OrvilleScript_OrvilleDefeatText:
	text "Even though I was"
	line "defeated, I won't"
	cont "change my course."

	para "I will continue"
	line "battling until I"

	para "stand above all"
	line "trainers!"

	para "Now, <PLAYER>, move"
	line "on and experience"

	para "the true ferocity"
	line "of the ELITE FOUR."
	done
	
OrvilleCantProgress:
	text "There is no"
	line "turning back now."
	done
	
OrvillesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  7, 19, INDIGO_PLATEAU_POKECENTER_1F, 5
	warp_event  6,  1, REGANS_ROOM, 1
	warp_event  7,  1, REGANS_ROOM, 2

	db 4 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachOrvilleLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachOrvilleRight
	coord_event  6, 16, SCENE_FINISHED, CantPassOrville
	coord_event  7, 16, SCENE_FINISHED, CantPassOrville

	db 2 ; bg events
	bg_event  6, 20, BGEVENT_READ, OrvilleNoTurningBack
	bg_event  7, 20, BGEVENT_READ, OrvilleNoTurningBack

	db 8 ; object events
	object_event  8, 10, SPRITE_ORVILLE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrvilleScript_AfterBattle, -1
	object_event  8, 10, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9, 11, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  9, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 11, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  9, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
