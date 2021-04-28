	const_def 2 ; object constants
	const BREDESROOM_BREDE
	const BREDESROOM_CHRIS
	const BREDESROOM_KRIS

BredesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear BREDESROOM_BREDE
	end

.DummyScene:
	end
	
ApproachBredeLeft:
	applymovement PLAYER, BredesRoom_EnterMovementLeft
	jump ContinueApproachBrede

ApproachBredeRight:
	applymovement PLAYER, BredesRoom_EnterMovementRight
ContinueApproachBrede:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject BREDESROOM_CHRIS, 5, 10
	appear BREDESROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject BREDESROOM_KRIS, 5, 10
	appear BREDESROOM_KRIS
.ContinueBattle
	applymovement PLAYER, E4StartBattle

	refreshscreen $86
	playsound SFX_THIEF
	changeblock 10, 10, $24 ; wall
	reloadmappart
	waitsfx
	earthquake 32
	refreshscreen $86
	playsound SFX_COMET_PUNCH
	changeblock 10, 10, $23 ; wall
	reloadmappart
	appear BREDESROOM_BREDE
	applymovement BREDESROOM_BREDE, BredeApproach
	moveobject BREDESROOM_BREDE, 8, 10
	setscene SCENE_FINISHED

BredeScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BREDE
	iftrue BredeScript_AfterBattle
	writetext BredeScript_BREDEBeforeText
	waitbutton
	closetext
	winlosstext BredeScript_BREDEBeatenText, 0
	loadtrainer BREDE, BREDE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BREDE
	opentext
	writetext BredeScript_BREDEDefeatText
	waitbutton
	closetext
	
	applymovement PLAYER, E4AfterBattle
	disappear BREDESROOM_CHRIS
	disappear BREDESROOM_KRIS
	
	setevent EVENT_BREDES_ROOM_EXIT_OPEN
	end
	
BredeNoTurningBack:
	jumptext BredeCantProgress

CantPassBrede:
	opentext
	writetext BredeCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

BredeScript_AfterBattle:
	writetext BredeScript_BREDEDefeatText
	waitbutton
	closetext
	end

FreezingColdWater:
	jumptext FreezingColdWaterText

BredeApproach:
	jump_step LEFT
	step_resume

BredesRoom_EnterMovementLeft:
	step UP
	step UP
	step LEFT
	slide_step LEFT
	step_sleep 4
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

BredesRoom_EnterMovementRight:
	step UP
	step UP
	step LEFT
	step LEFT
	slide_step LEFT
	step_sleep 4
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

BredeScript_BREDEBeforeText:
	text "Greetings,"
	line "challenger!"

	para "My name is BREDE."
	
	para "I come from lands"
	line "far away in search"
	cont "of greater chall-"
	cont "enge."

	para "My harsh frozen "
	line "homeland has honed"
	cont "my abilities."

	para "You stand no"
	line "match against me!"

	para "Come now,"
	line "challenger."
	
	para "Bring out your"
	line "#MON so that I"
	cont "may strike them"
	cont "down in battle!"
	done

BredeScript_BREDEBeatenText:
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done

BredeScript_BREDEDefeatText:
	text "I subjected you to"
	line "everything I could"
	cont "muster."

	para "But my efforts"
	line "failed. I must"
	cont "hone my skills."

	para "Go on to the next"
	line "room, and put your"
	cont "abilities to test!"
	done
	
BredeCantProgress:
	text "There is no"
	line "turning back now."
	done
	
FreezingColdWaterText:
	text "This water is"
	line "freezing cold!"
	done

BredesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, REGANS_ROOM, 2
	warp_event  7, 19, REGANS_ROOM, 3
	warp_event  6,  1, AMBERS_ROOM, 1
	warp_event  7,  1, AMBERS_ROOM, 2

	db 4 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachBredeLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachBredeRight
	coord_event  6, 16, SCENE_FINISHED, CantPassBrede
	coord_event  7, 16, SCENE_FINISHED, CantPassBrede

	db 3 ; bg events
	bg_event	10, 10, BGEVENT_READ, FreezingColdWater
	bg_event  6, 20, BGEVENT_READ, BredeNoTurningBack
	bg_event  7, 20, BGEVENT_READ, BredeNoTurningBack

	db 3 ; object events
	object_event 10, 10, SPRITE_BREDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BredeScript_Battle, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
