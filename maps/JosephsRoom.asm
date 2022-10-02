	const_def 2 ; object constants
	const JOSEPHSROOM_JOSEPH
	const JOSEPHSROOM_PLAYER

JosephsRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_JOSEPHSROOM_APPROACH_JOSEPH

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .JosephsRoomDoors

.LockDoor:
	priorityjump .JosephsDoorLocksBehindYou
	end

.DummyScene:
	end

.JosephsRoomDoors:
	return

.JosephsDoorLocksBehindYou:
	applymovement PLAYER, JosephsRoom_EnterMovement
	setscene SCENE_JOSEPHSROOM_APPROACH_JOSEPH
	variablesprite SPRITE_HOF_CHAMPION, SPRITE_JOSEPH
	end

Script_ApproachJosephFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachJosephFromLeft
	jump JosephsRoomJosephScript

Script_ApproachJosephFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachJosephFromRight

JosephsRoomJosephScript:
	moveobject JOSEPHSROOM_PLAYER, 5, 8
	appear JOSEPHSROOM_PLAYER

	applymovement PLAYER, JosephsRoom_CameraPan

	applymovement JOSEPHSROOM_JOSEPH, JosephsRoom_JosephApproachPlayer
	opentext
	writetext JosephBattleIntroText
	waitbutton
	closetext
	winlosstext JosephBattleWinText, 0
;	setlasttalked JOSEPHSROOM_JOSEPH
	loadtrainer CHAMPION, JOSEPH
	writecode VAR_BATTLETYPE, BATTLETYPE_LEAGUE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_JOSEPH

	opentext
	writetext JosephBattleAfterText
	waitbutton
	closetext

	applymovement JOSEPHSROOM_JOSEPH, JosephsRoomMovementData_JosephLeadsPlayerToHallOfFame

	applymovement JOSEPHSROOM_PLAYER, JosephsRoom_CenterCamera

	applymovement PLAYER, JosephsRoom_AppearPlayer
	disappear JOSEPHSROOM_PLAYER
	applymovement PLAYER, JosephsRoom_PlayerJoinsJoseph

	follow JOSEPHSROOM_JOSEPH, PLAYER
	applymovement JOSEPHSROOM_JOSEPH, JosephsRoomMovementData_JosephExitsToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear JOSEPHSROOM_JOSEPH
	applymovement PLAYER, JosephsRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	warpcheck
	end

JosephNoTurningBack:
	opentext
	writetext JosephCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

JosephsRoom_EnterMovement:
	step UP
	step UP
	step_end

MovementData_ApproachJosephFromLeft:
	step UP
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachJosephFromRight:
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	turn_head RIGHT
	step_end

JosephsRoom_CameraPan:
	hide_person
	slow_step RIGHT
	step_end

JosephsRoom_CenterCamera:
	step RIGHT
	step_end

JosephsRoom_AppearPlayer:
	show_person
	step_end

JosephsRoom_PlayerJoinsJoseph:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

JosephsRoom_JosephApproachPlayer:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	step_end

JosephsRoomMovementData_JosephLeadsPlayerToHallOfFame:
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

JosephsRoomMovementData_JosephExitsToHallOfFame:
	step UP
	step_end

JosephsRoomMovementData_PlayerExits:
	step UP
	step_end

JosephBattleIntroText:
	text "So, you're the"
	line "<PLAYER> who has"
	cont "been making waves"
	cont "here?"

	para "I expected more…"

	para "I hope you are"
	line "stronger than you"
	cont "look."

	para "I will not hold"
	line "back, not even"
	cont "against a child!"

	para "I, JOSEPH, the"
	line "standing #MON"
	cont "LEAGUE CHAMPION,"
	cont "accept your"
	cont "challenge."

	para "Witness how a pro-"
	line "fessional battles!"
	done

JosephBattleWinText:
	text "I…"
	line "Lost…?"

	para "All the time I"
	line "spent training…"

	para "The #MON I"
	line "caught…"

	para "All for naught."

	para "You win, <PLAYER>."

	para "I am reluctant to"
	line "admit this, but I"
	cont "forfeit my title"
	cont "to you."

	para "You are the new"
	line "#MON LEAGUE"
	cont "CHAMPION!"
	done

JosephBattleAfterText:
	text "It was bound to"
	line "happen eventually…"

	para "It has been so"
	line "long since I have"
	cont "claimed the title"
	cont "of CHAMPION."

	para "You have reminded"
	line "me of what losing"
	cont "means."

	para "Please, CHAMPION."
	line "Follow me."
	done

JosephCantProgress:
	text "There is no"
	line "turning back now."
	done

JosephsRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 29, AMBERS_ROOM, 3
	warp_event  7, 29, AMBERS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	db 4 ; coord events
	coord_event  6, 11, SCENE_JOSEPHSROOM_APPROACH_JOSEPH, Script_ApproachJosephFromLeft
	coord_event  7, 11, SCENE_JOSEPHSROOM_APPROACH_JOSEPH, Script_ApproachJosephFromRight
	coord_event  6, 28, SCENE_JOSEPHSROOM_APPROACH_JOSEPH, JosephNoTurningBack
	coord_event  7, 28, SCENE_JOSEPHSROOM_APPROACH_JOSEPH, JosephNoTurningBack

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  6, SPRITE_JOSEPH, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JosephsRoomJosephScript, -1
	object_event  0,  0, SPRITE_LEAGUE_PLAYER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
