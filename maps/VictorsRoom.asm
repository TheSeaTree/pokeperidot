	const_def 2 ; object constants
	const VICTORSROOM_LANCE
	const VICTORSROOM_PLAYER

VictorsRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_VICTORSROOM_APPROACH_LANCE

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .VictorsRoomDoors

.LockDoor:
	priorityjump .VictorsDoorLocksBehindYou
	end

.DummyScene:
	end

.VictorsRoomDoors:
	return

.VictorsDoorLocksBehindYou:
	applymovement PLAYER, VictorsRoom_EnterMovement
	setscene SCENE_VICTORSROOM_APPROACH_LANCE
;	setevent EVENT_VICTORS_ROOM_ENTRANCE_CLOSED
	variablesprite SPRITE_HOF_CHAMPION, SPRITE_LANCE
	end

Script_ApproachVictorFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachVictorFromLeft
	jump VictorsRoomVictorScript

Script_ApproachVictorFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachVictorFromRight

VictorsRoomVictorScript:
	moveobject VICTORSROOM_PLAYER, 5, 8
	appear VICTORSROOM_PLAYER

	applymovement PLAYER, VictorsRoom_CameraPan

	applymovement VICTORSROOM_LANCE, VictorsRoom_VictorApproachPlayer
	opentext
	writetext VictorBattleIntroText
	waitbutton
	closetext
	winlosstext VictorBattleWinText, 0
	setlasttalked VICTORSROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_VICTOR

	copybytetovar wEliteFourFightCount
	addvar 1
	copyvartobyte wEliteFourFightCount

	opentext
	writetext VictorBattleAfterText
	waitbutton
	closetext

	applymovement VICTORSROOM_LANCE, VictorsRoomMovementData_VictorLeadsPlayerToHallOfFame

	applymovement VICTORSROOM_PLAYER, VictorsRoom_CenterCamera

	applymovement PLAYER, VictorsRoom_AppearPlayer
	disappear VICTORSROOM_PLAYER
	applymovement PLAYER, VictorsRoom_PlayerJoinsVictor

	follow VICTORSROOM_LANCE, PLAYER
	applymovement VICTORSROOM_LANCE, VictorsRoomMovementData_VictorExitsToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear VICTORSROOM_LANCE
	applymovement PLAYER, VictorsRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	warpcheck
	end

VictorNoTurningBack:
	opentext
	writetext VictorCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

VictorsRoom_EnterMovement:
	step UP
	step UP
	step_end

MovementData_ApproachVictorFromLeft:
	step UP
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachVictorFromRight:
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	turn_head RIGHT
	step_end

VictorsRoom_CameraPan:
	hide_person
	slow_step RIGHT
	step_end

VictorsRoom_CenterCamera:
	step RIGHT
	step_end

VictorsRoom_AppearPlayer:
	show_person
	step_end

VictorsRoom_PlayerJoinsVictor:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

VictorsRoom_VictorApproachPlayer:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	step_end

VictorsRoomMovementData_VictorLeadsPlayerToHallOfFame:
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

VictorsRoomMovementData_VictorExitsToHallOfFame:
	step UP
	step_end

VictorsRoomMovementData_PlayerExits:
	step UP
	step_end

VictorBattleIntroText:
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

VictorBattleWinText:
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

VictorBattleAfterText:
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

VictorCantProgress:
	text "There is no"
	line "turning back now."
	done

VictorsRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 29, AMBERS_ROOM, 3
	warp_event  7, 29, AMBERS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	db 4 ; coord events
	coord_event  6, 11, SCENE_VICTORSROOM_APPROACH_LANCE, Script_ApproachVictorFromLeft
	coord_event  7, 11, SCENE_VICTORSROOM_APPROACH_LANCE, Script_ApproachVictorFromRight
	coord_event  6, 28, SCENE_VICTORSROOM_APPROACH_LANCE, VictorNoTurningBack
	coord_event  7, 28, SCENE_VICTORSROOM_APPROACH_LANCE, VictorNoTurningBack

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictorsRoomVictorScript, -1
	object_event  0,  0, SPRITE_LEAGUE_PLAYER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
