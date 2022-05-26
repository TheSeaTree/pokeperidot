	const_def 2 ; object constants
	const AMBERSROOM_AMBER
	const AMBERSROOM_PLAYER

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
	moveobject AMBERSROOM_PLAYER, 5, 10
	appear AMBERSROOM_PLAYER

	applymovement PLAYER, AmbersRoom_CameraPan
	setscene SCENE_FINISHED

AmberScript_Battle:
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	writetext AmberScript_AmberBeforeText
	waitbutton
	closetext
	winlosstext AmberScript_AmberBeatenText, 0
	loadtrainer AMBER, AMBER1
	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmapafterbattle
	opentext
	writetext AmberScript_AmberDefeatText
	waitbutton
	closetext
	jump .AfterBattle
.Rematch
	writetext AmberScript_RematchBeforeText
	waitbutton
	closetext
	winlosstext AmberScript_RematchBeatenText, 0

	copybytetovar wEliteFourFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

	loadtrainer AMBER, AMBER_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer AMBER, AMBER_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer AMBER, AMBER_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer AMBER, AMBER_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer AMBER, AMBER_REMATCH5
.DoRematch
	writecode VAR_BATTLETYPE, BATTLETYPE_LEAGUE
	startbattle
	reloadmapafterbattle
	opentext
	copybytetovar wEliteFourFightCount
	ifgreater 0, .FirstRematch
	writetext AmberScript_RematchDefeatText
	waitbutton
	closetext

.AfterBattle
	applymovement PLAYER, AmbersRoom_CenterCamera
	disappear AMBERSROOM_PLAYER
	end

.FirstRematch
	writetext AmberScript_FirstRematchDefeatText
	waitbutton
	closetext
	jump .AfterBattle


ChampionDoorLeft:
	checkflag ENGINE_CREDITS_SKIP
	iftrue .Rematch
	warpmod 1, VICTORS_ROOM
	end

.Rematch
	warpmod 1, EMILYS_ROOM
	end

ChampionDoorRight:
	checkflag ENGINE_CREDITS_SKIP
	iftrue .Rematch
	warpmod 2, VICTORS_ROOM
	end

.Rematch
	warpmod 2, EMILYS_ROOM
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
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	jumptextfaceplayer AmberScript_AmberDefeatText
.Rematch:
	jumptextfaceplayer AmberScript_RematchDefeatText

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
	cont "you have not won"
	cont "the #MON LEAGUE"
	cont "CHALLENGE yet."

	para "There is one other"
	line "trainer who has"
	cont "defeated me--your"
	cont "next battle."

	para "The CHAMPION"
	line "awaits, <PLAYER>."

	para "Don't embarass me"
	line "by losing now!"
	done

AmberScript_RematchBeforeText:
	text "Pre-rematch text"
	line "goes here."
	done

AmberScript_RematchBeatenText:
	text "Rematch victory"
	line "text goes here."
	done

AmberScript_RematchDefeatText:
	text "After rematch text"
	line "goes here."
	done

AmberScript_FirstRematchDefeatText:
	text "After 1st rematch"
	line "text goes here."
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

	db 9 ; object events
	object_event  8, 10, SPRITE_AMBER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmberScript_AfterBattle, -1
	object_event  0,  0, SPRITE_LEAGUE_PLAYER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
