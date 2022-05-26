	const_def 2 ; object constants
	const WILBURSROOM_WILBUR
	const WILBURSROOM_BOMB
	const WILBURSROOM_SHADOW1
	const WILBURSROOM_SHADOW2
	const WILBURSROOM_PLAYER

WilbursRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear WILBURSROOM_WILBUR
	disappear WILBURSROOM_BOMB
	end

.DummyScene:
	end

ApproachWilburLeft:
	applymovement PLAYER, WilbursRoom_EnterMovementLeft
	jump ContinueApproachWilbur

ApproachWilburRight:
	applymovement PLAYER, WilbursRoom_EnterMovementRight
ContinueApproachWilbur:
	
	moveobject WILBURSROOM_PLAYER, 5, 10
	appear WILBURSROOM_PLAYER

	applymovement PLAYER, WilbursRoom_StartBattle

	moveobject WILBURSROOM_BOMB, 11, 10
	moveobject WILBURSROOM_SHADOW1, 11, 10
	moveobject WILBURSROOM_SHADOW2, 11, 11
	scall WilbursRoomDropBombs

	moveobject WILBURSROOM_BOMB, 10, 10
	moveobject WILBURSROOM_SHADOW1, 10, 10
	moveobject WILBURSROOM_SHADOW2, 10, 11
	scall WilbursRoomDropBombs

	moveobject WILBURSROOM_BOMB, 9, 10
	moveobject WILBURSROOM_SHADOW1, 9, 10
	moveobject WILBURSROOM_SHADOW2, 9, 11
	scall WilbursRoomDropBombs

	moveobject WILBURSROOM_BOMB, 8, 10
	appear WILBURSROOM_BOMB
	playsound SFX_KINESIS
	moveobject WILBURSROOM_SHADOW1, 8, 10
	moveobject WILBURSROOM_SHADOW2, 8, 11
	appear WILBURSROOM_SHADOW1
	appear WILBURSROOM_SHADOW2
	wait 1
	applymovement WILBURSROOM_BOMB, WilburFalling
	playsound SFX_EGG_BOMB
	appear WILBURSROOM_WILBUR
	applymovement WILBURSROOM_BOMB, WilburExplode2
	disappear WILBURSROOM_SHADOW1
	disappear WILBURSROOM_SHADOW2
	disappear WILBURSROOM_BOMB
	waitsfx

	setscene SCENE_FINISHED

	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	writetext WilburScript_WilburBeforeText
	waitbutton
	closetext
	winlosstext WilburScript_WilburBeatenText, 0
	loadtrainer WILBUR, WILBUR1
	writecode VAR_BATTLETYPE, BATTLETYPE_LEAGUE
	startbattle
	reloadmapafterbattle
	opentext
	writetext WilburScript_WilburDefeatText
	waitbutton
	closetext
	jump .AfterBattle
.Rematch
	writetext WilburScript_RematchBeforeText
	waitbutton
	closetext
	winlosstext WilburScript_RematchBeatenText, 0

	copybytetovar wEliteFourFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer WILBUR, WILBUR_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer WILBUR, WILBUR_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer WILBUR, WILBUR_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer WILBUR, WILBUR_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer WILBUR, WILBUR_REMATCH5
.DoRematch
	writecode VAR_BATTLETYPE, BATTLETYPE_LEAGUE
	startbattle
	reloadmapafterbattle
	opentext
	writetext WilburScript_RematchDefeatText
	waitbutton
	closetext

.AfterBattle
	wait 4

	applymovement PLAYER, WilbursRoom_ReturnFromBattle
	disappear WILBURSROOM_PLAYER
	end

WilbursRoomDropBombs:
	appear WILBURSROOM_BOMB
	appear WILBURSROOM_SHADOW1
	appear WILBURSROOM_SHADOW2
	playsound SFX_KINESIS
	wait 1
	applymovement WILBURSROOM_BOMB, WilburFalling
	playsound SFX_EGG_BOMB
	applymovement WILBURSROOM_BOMB, WilburExplode
	disappear WILBURSROOM_BOMB
	disappear WILBURSROOM_SHADOW1
	disappear WILBURSROOM_SHADOW2
	end
	
WilburNoTurningBack:
	jumptext WilburCantProgress

CantPassWilbur:
	opentext
	writetext WilburCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

WilburScript_AfterBattle:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	jumptextfaceplayer WilburScript_WilburDefeatText
.Rematch
	jumptextfaceplayer WilburScript_RematchDefeatText

WilbursRoom_EnterMovementLeft:
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

WilbursRoom_EnterMovementRight:
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
	
WilbursRoom_StartBattle:
	hide_person
	slow_step RIGHT
	step_end

WilbursRoom_ReturnFromBattle:
	slow_step LEFT
	turn_head RIGHT
	show_person
	step_end
	
WilbursRoom_StepAway:
	step UP
	step_end
	
WilburFalling:
	skyfall
	step_end

WilburExplode:
	step_shake 8
	turn_step RIGHT
	turn_step RIGHT
	turn_step RIGHT
	turn_step RIGHT
	hide_person
	step_end

WilburExplode2:
	step_shake 16
	turn_step RIGHT
	turn_step RIGHT
	hide_person
	step_end

WilburScript_WilburBeforeText:
	text "The #MON LEAGUE"
	line "welcomes you."

	para "My name is"
	line "WILBUR, the first"
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

	para "There's only one"
	line "way to find out."

	para "Let's go!"
	done

WilburScript_WilburBeatenText:
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

WilburScript_WilburDefeatText:
	text "I may have fallen,"
	line "but the ELITE FOUR"
	cont "will only get"
	cont "stronger from this"
	cont "point forward."

	para "Go on, <PLAYER>."

	para "Meet your next"
	line "opponent."
	done

WilburScript_RematchBeforeText:
	text "Pre-rematch text"
	line "goes here."
	done

WilburScript_RematchBeatenText:
	text "Rematch victory"
	line "text goes here."
	done

WilburScript_RematchDefeatText:
	text "After rematch text"
	line "goes here."
	done

WilburCantProgress:
	text "There is no"
	line "turning back now."
	done
	
WilbursRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, POKEMON_LEAGUE_POKECENTER_1F, 4
	warp_event  7, 19, POKEMON_LEAGUE_POKECENTER_1F, 5
	warp_event  6,  1, REGANS_ROOM, 1
	warp_event  7,  1, REGANS_ROOM, 2

	db 4 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachWilburLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachWilburRight
	coord_event  6, 16, SCENE_FINISHED, CantPassWilbur
	coord_event  7, 16, SCENE_FINISHED, CantPassWilbur

	db 2 ; bg events
	bg_event  6, 20, BGEVENT_READ, WilburNoTurningBack
	bg_event  7, 20, BGEVENT_READ, WilburNoTurningBack

	db 5 ; object events
	object_event  8, 10, SPRITE_WILBUR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WilburScript_AfterBattle, -1
	object_event 11, 10, SPRITE_BOMB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_SHADOW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_SHADOW, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_LEAGUE_PLAYER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
