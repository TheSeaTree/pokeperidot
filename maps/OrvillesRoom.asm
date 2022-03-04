	const_def 2 ; object constants
	const ORVILLESROOM_ORVILLE
	const ORVILLESROOM_BOMB
	const ORVILLESROOM_SHADOW1
	const ORVILLESROOM_SHADOW2
	const ORVILLESROOM_PLAYER

OrvillesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear ORVILLESROOM_ORVILLE
	disappear ORVILLESROOM_BOMB
	end

.DummyScene:
	end

ApproachOrvilleLeft:
	applymovement PLAYER, OrvillesRoom_EnterMovementLeft
	jump ContinueApproachOrville

ApproachOrvilleRight:
	applymovement PLAYER, OrvillesRoom_EnterMovementRight
ContinueApproachOrville:
	
	moveobject ORVILLESROOM_PLAYER, 5, 10
	appear ORVILLESROOM_PLAYER

	applymovement PLAYER, OrvillesRoom_StartBattle

	moveobject ORVILLESROOM_BOMB, 11, 10
	moveobject ORVILLESROOM_SHADOW1, 11, 10
	moveobject ORVILLESROOM_SHADOW2, 11, 11
	scall OrvillesRoomDropBombs

	moveobject ORVILLESROOM_BOMB, 10, 10
	moveobject ORVILLESROOM_SHADOW1, 10, 10
	moveobject ORVILLESROOM_SHADOW2, 10, 11
	scall OrvillesRoomDropBombs

	moveobject ORVILLESROOM_BOMB, 9, 10
	moveobject ORVILLESROOM_SHADOW1, 9, 10
	moveobject ORVILLESROOM_SHADOW2, 9, 11
	scall OrvillesRoomDropBombs

	moveobject ORVILLESROOM_BOMB, 8, 10
	appear ORVILLESROOM_BOMB
	playsound SFX_KINESIS
	moveobject ORVILLESROOM_SHADOW1, 8, 10
	moveobject ORVILLESROOM_SHADOW2, 8, 11
	appear ORVILLESROOM_SHADOW1
	appear ORVILLESROOM_SHADOW2
	wait 1
	applymovement ORVILLESROOM_BOMB, OrvilleFalling
	playsound SFX_EGG_BOMB
	appear ORVILLESROOM_ORVILLE
	applymovement ORVILLESROOM_BOMB, OrvilleExplode2
	disappear ORVILLESROOM_SHADOW1
	disappear ORVILLESROOM_SHADOW2
	disappear ORVILLESROOM_BOMB
	waitsfx

	setscene SCENE_FINISHED

	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	writetext OrvilleScript_OrvilleBeforeText
	waitbutton
	closetext
	winlosstext OrvilleScript_OrvilleBeatenText, 0
	loadtrainer ORVILLE, ORVILLE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext OrvilleScript_OrvilleDefeatText
	waitbutton
	closetext
	jump .AfterBattle
.Rematch
	writetext OrvilleScript_RematchBeforeText
	waitbutton
	closetext
	winlosstext OrvilleScript_RematchBeatenText, 0

	copybytetovar wEliteFourFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer ORVILLE, ORVILLE_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer ORVILLE, ORVILLE_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer ORVILLE, ORVILLE_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer ORVILLE, ORVILLE_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer ORVILLE, ORVILLE_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle
	opentext
	writetext OrvilleScript_RematchDefeatText
	waitbutton
	closetext

.AfterBattle
	wait 4

	applymovement PLAYER, OrvillesRoom_ReturnFromBattle
	disappear ORVILLESROOM_PLAYER
	end

OrvillesRoomDropBombs:
	appear ORVILLESROOM_BOMB
	appear ORVILLESROOM_SHADOW1
	appear ORVILLESROOM_SHADOW2
	playsound SFX_KINESIS
	wait 1
	applymovement ORVILLESROOM_BOMB, OrvilleFalling
	playsound SFX_EGG_BOMB
	applymovement ORVILLESROOM_BOMB, OrvilleExplode
	disappear ORVILLESROOM_BOMB
	disappear ORVILLESROOM_SHADOW1
	disappear ORVILLESROOM_SHADOW2
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
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	jumptextfaceplayer OrvilleScript_OrvilleDefeatText
.Rematch
	jumptextfaceplayer OrvilleScript_RematchDefeatText

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
	slow_step LEFT
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
	step_shake 8
	turn_step RIGHT
	turn_step RIGHT
	turn_step RIGHT
	turn_step RIGHT
	hide_person
	step_end

OrvilleExplode2:
	step_shake 16
	turn_step RIGHT
	turn_step RIGHT
	hide_person
	step_end

OrvilleScript_OrvilleBeforeText:
	text "The #MON LEAGUE"
	line "welcomes you."

	para "My name is"
	line "ORVILLE, the first"
	cont "member of the"
	cont "ELITE FOUR."

	para "Air superiority is"
	line "my specialty."

	para "I have risen"
	line "through the ranks"
	cont "as both a trainer"
	cont "and soldier with"
	cont "my mastery over"
	cont "FLYING #MON."

	para "Can your #MON"
	line "withstand my stra-"
	cont "fing runs?"

	para "Only one way to"
	line "find out."

	para "Let's go!"
	done

OrvilleScript_OrvilleBeatenText:
	text "All of my years"
	line "training, and I"
	cont "was defeated by a"
	cont "child."

	para "I am not disappoi-"
	line "nted. In fact, I"
	cont "am glad."
	
	para "You have shown"
	line "what it takes to"
	cont "compete in the"
	cont "#MON LEAGUE."

	para "I salute you,"
	line "<PLAYER>."
	
	para "Best of luck on"
	line "your next battles."
	done

OrvilleScript_OrvilleDefeatText:
	text "I may have fallen,"
	line "but the ELITE FOUR"
	cont "will only get"
	cont "stronger from this"
	cont "point forward."

	para "Go on, <PLAYER>."

	para "Meet your next"
	line "opponent."
	done

OrvilleScript_RematchBeforeText:
	text "Pre-rematch text"
	line "goes here."
	done

OrvilleScript_RematchBeatenText:
	text "Rematch victory"
	line "text goes here."
	done

OrvilleScript_RematchDefeatText:
	text "After rematch text"
	line "goes here."
	done

OrvilleCantProgress:
	text "There is no"
	line "turning back now."
	done
	
OrvillesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, POKEMON_LEAGUE_POKECENTER_1F, 4
	warp_event  7, 19, POKEMON_LEAGUE_POKECENTER_1F, 5
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

	db 5 ; object events
	object_event  8, 10, SPRITE_ORVILLE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrvilleScript_AfterBattle, -1
	object_event 11, 10, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_SHADOW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_SHADOW, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_LEAGUE_PLAYER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
