	const_def 2 ; object constants
	const EMILYSROOM_EMILY
	const EMILYSROOM_PLAYER

EmilysRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_EMILYSROOM_APPROACH_EMILY

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .EmilysRoomDoors

.LockDoor:
	priorityjump .EmilysDoorLocksBehindYou
	end

.DummyScene:
	end

.EmilysRoomDoors:
	return

.EmilysDoorLocksBehindYou:
	applymovement PLAYER, EmilysRoom_EnterMovement
	setscene SCENE_EMILYSROOM_APPROACH_EMILY
;	setevent EVENT_EMILYS_ROOM_ENTRANCE_CLOSED
	variablesprite SPRITE_HOF_CHAMPION, SPRITE_FANGIRL
	end

Script_ApproachEmilyFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachEmilyFromLeft
	jump EmilysRoomEmilyScript

Script_ApproachEmilyFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachEmilyFromRight

EmilysRoomEmilyScript:
	moveobject EMILYSROOM_PLAYER, 5, 8
	appear EMILYSROOM_PLAYER

	applymovement PLAYER, EmilysRoom_CameraPan

;	applymovement EMILYSROOM_EMILY, EmilysRoom_EmilyApproachPlayer
	opentext
	copybytetovar wEliteFourFightCount
	ifgreater 0, .RematchIntro
	writetext EmilyBattleIntroText
	jump .LoadParty
.RematchIntro
	writetext EmilyRematchIntroText
.LoadParty
	waitbutton
	closetext
;	setlasttalked EMILYSROOM_EMILY
	winlosstext EmilyBattleWinText, 0

	copybytetovar wEliteFourFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

	loadtrainer CHAMPIONF, EMILY_CHAMPION1
	jump .DoBattle
.RematchTeam2:
	loadtrainer CHAMPIONF, EMILY_CHAMPION2
	jump .DoBattle
.RematchTeam3:
	loadtrainer CHAMPIONF, EMILY_CHAMPION3
	jump .DoBattle
.RematchTeam4:
	loadtrainer CHAMPIONF, EMILY_CHAMPION4
	jump .DoBattle
.FinalRematch:
	loadtrainer CHAMPIONF, EMILY_CHAMPION5
.DoBattle
	writecode VAR_BATTLETYPE, BATTLETYPE_LEAGUE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_EMILY

	copybytetovar wEliteFourFightCount
	addvar 1
	copyvartobyte wEliteFourFightCount

	opentext
	writetext EmilyBattleAfterText
	waitbutton
	closetext

	applymovement EMILYSROOM_EMILY, EmilysRoomMovementData_EmilyLeadsPlayerToHallOfFame

	applymovement EMILYSROOM_PLAYER, EmilysRoom_CenterCamera
	applymovement PLAYER, EmilysRoom_AppearPlayer
	disappear EMILYSROOM_PLAYER
	applymovement PLAYER, EmilysRoom_PlayerJoinsEmily

	follow EMILYSROOM_EMILY, PLAYER
	applymovement EMILYSROOM_EMILY, EmilysRoomMovementData_EmilyExitsToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear EMILYSROOM_EMILY
	applymovement PLAYER, EmilysRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	warpcheck
	end

EmilyNoTurningBack:
	opentext
	writetext EmilyCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

EmilysRoom_EnterMovement:
	step UP
	step UP
	step_end

MovementData_ApproachEmilyFromLeft:
	step UP
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachEmilyFromRight:
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	turn_head RIGHT
	step_end

EmilysRoom_CameraPan:
	hide_person
	slow_step RIGHT
	step_end

EmilysRoom_CenterCamera:
	step RIGHT
	step_end

EmilysRoom_AppearPlayer:
	show_person
	step_end

EmilysRoom_PlayerJoinsEmily:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

EmilysRoom_EmilyApproachPlayer:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	step_end

EmilysRoomMovementData_EmilyLeadsPlayerToHallOfFame:
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	turn_head DOWN
	step_end

EmilysRoomMovementData_EmilyExitsToHallOfFame:
	step UP
	step_end

EmilysRoomMovementData_PlayerExits:
	step UP
	step_end

EmilyBattleIntroText:
	text "Hey, <PLAYER>! Can"
	line "you believe it?"
	
	para "I finally made it!"

	para "Thanks to every-"
	line "thing you and"
	cont "<RIVAL> taught me,"
	cont "I am one of the"
	cont "best trainers in"
	cont "this region!"

	para "I won't go easy on"
	line "you because you're"
	cont "my friend."

	para "I don't want you to"
	line "hold back, either!"

	para "Let's make this a"
	line "memorable battle!"
	done

EmilyRematchIntroText:
	text "Hey, <PLAYER>!"
	
	para "I'm glad you made"
	line "it!"

	para "I can't wait to see"
	line "what you have done"
	cont "with your #MON!"

	para "Okay, are you"
	line "ready?"

	para "Let's make this"
	line "battle as memorab-"
	cont "le as our last!"
	done

EmilyBattleWinText:
	text "No! Really?"

	para "I made it so far,"
	line "but you got the"
	cont "upper hand one"
	cont "last time."

	para "I, CHAMPION EMILY,"
	line "concede this"
	cont "battle to you."
	done

EmilyBattleAfterText:
	text "While my reign as"
	line "CHAMPION was short"
	cont "lived, I couldn't"
	cont "imagine a better"
	cont "person to lose it"
	cont "to than you."

	para "<PLAYER>,"
	line "congratulations!"

	para "Now come on, I'll"
	line "race you to the"
	cont "HALL OF FAME!"
	done

EmilyCantProgress:
	text "There is no"
	line "turning back now."
	done

EmilysRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 29, AMBERS_ROOM, 3
	warp_event  7, 29, AMBERS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	db 4 ; coord events
	coord_event  6, 11, SCENE_EMILYSROOM_APPROACH_EMILY, Script_ApproachEmilyFromLeft
	coord_event  7, 11, SCENE_EMILYSROOM_APPROACH_EMILY, Script_ApproachEmilyFromRight
	coord_event  6, 28, SCENE_EMILYSROOM_APPROACH_EMILY, EmilyNoTurningBack
	coord_event  7, 28, SCENE_EMILYSROOM_APPROACH_EMILY, EmilyNoTurningBack

	db 0 ; bg events

	db 3 ; object events
	object_event  8,  8, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EmilysRoomEmilyScript, -1
	object_event  0,  0, SPRITE_LEAGUE_PLAYER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
