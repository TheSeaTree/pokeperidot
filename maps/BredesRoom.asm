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
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	writetext BredeScript_BredeBeforeText
	waitbutton
	closetext
	winlosstext BredeScript_BredeBeatenText, 0
	loadtrainer BREDE, BREDE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext BredeScript_BredeDefeatText
	waitbutton
	closetext
	jump .AfterBattle
.Rematch
	writetext BredeScript_BredeRematchBeforeText
	waitbutton
	closetext
	winlosstext BredeScript_RematchBeatenText, 0

	copybytetovar wEliteFourFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer BREDE, BREDE_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer BREDE, BREDE_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer BREDE, BREDE_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer BREDE, BREDE_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer BREDE, BREDE_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle
	opentext
	writetext BredeScript_RematchDefeatText
	waitbutton
	closetext

.AfterBattle
	applymovement PLAYER, E4AfterBattle
	disappear BREDESROOM_CHRIS
	disappear BREDESROOM_KRIS
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
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	jumptextfaceplayer BredeScript_BredeDefeatText
.Rematch:
	jumptextfaceplayer BredeScript_RematchDefeatText

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

BredeScript_BredeBeforeText:
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

BredeScript_BredeBeatenText:
	text "It is best I go"
	line "down with honor."

	para "I am proud of my"
	line "team for sharing"
	cont "in my belief."

	para "It was not until"
	line "my last #MON"
	cont "fainted that I"
	cont "accepted defeat."
	done

BredeScript_BredeDefeatText:
	text "In losing to you,"
	line "I have no right to"
	cont "give any advice."
	
	para "You have bested"
	line "me, and you have"
	cont "earned the right"
	cont "to progress."
	
	para "My training will"
	line "not end here, and"
	cont "I await my chance"
	cont "to meet you in"
	cont "battle once more."
	done

BredeScript_BredeRematchBeforeText:
	text "Pre-rematch text"
	line "goes here."
	done

BredeScript_RematchBeatenText:
	text "Rematch victory"
	line "text goes here."
	done

BredeScript_RematchDefeatText:
	text "After rematch text"
	line "goes here."
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
	object_event 10, 10, SPRITE_BREDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BredeScript_AfterBattle, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
