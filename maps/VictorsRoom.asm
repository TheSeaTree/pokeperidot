	const_def 2 ; object constants
	const VICTORSROOM_LANCE
	const VICTORSROOM_CHRIS
	const VICTORSROOM_KRIS
	const VICTORSROOM_MARY
	const VICTORSROOM_OAK

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
	setevent EVENT_VICTORS_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachVictorFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachVictorFromLeft
	jump VictorsRoomVictorScript

Script_ApproachVictorFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachVictorFromRight

VictorsRoomVictorScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject VICTORSROOM_CHRIS, 5, 8
	appear VICTORSROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject VICTORSROOM_KRIS, 5, 8
	appear VICTORSROOM_KRIS
.ContinueBattle
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
	opentext
	writetext VictorBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_VICTORS_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, VICTORSROOM_LANCE, 15
	turnobject VICTORSROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear VICTORSROOM_MARY
	applymovement VICTORSROOM_MARY, VictorsRoomMovementData_MaryRushesIn
	opentext
	writetext UnknownText_0x1811dd
	waitbutton
	closetext
	appear VICTORSROOM_OAK
	applymovement VICTORSROOM_OAK, VictorsRoomMovementData_OakWalksIn
	follow VICTORSROOM_MARY, VICTORSROOM_OAK
	applymovement VICTORSROOM_MARY, VictorsRoomMovementData_MaryYieldsToOak
	stopfollow
	turnobject VICTORSROOM_OAK, UP
	turnobject VICTORSROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18121b
	waitbutton
	closetext
	applymovement VICTORSROOM_MARY, VictorsRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, LEFT
	opentext
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement VICTORSROOM_LANCE, VictorsRoomMovementData_VictorPositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow VICTORSROOM_LANCE, PLAYER
	turnobject VICTORSROOM_MARY, UP
	turnobject VICTORSROOM_OAK, UP
	applymovement VICTORSROOM_LANCE, VictorsRoomMovementData_VictorLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear VICTORSROOM_LANCE
	applymovement PLAYER, VictorsRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement VICTORSROOM_MARY, VictorsRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, VICTORSROOM_MARY, 15
	opentext
	writetext UnknownText_0x1813c5
	pause 30
	closetext
	applymovement VICTORSROOM_MARY, VictorsRoomMovementData_MaryRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
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
	slow_step LEFT
	turn_head RIGHT
	show_person
	step_end
	
VictorsRoom_VictorApproachPlayer:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	step_end

VictorsRoomMovementData_MaryRushesIn:
	run_step UP
	run_step UP
	run_step UP
	turn_head DOWN
	step_end

VictorsRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

VictorsRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

VictorsRoomMovementData_MaryInterviewChampion:
	run_step UP
	turn_head RIGHT
	step_end

VictorsRoomMovementData_VictorPositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

VictorsRoomMovementData_VictorLeadsPlayerToHallOfFame:
	step UP
	step_end

VictorsRoomMovementData_PlayerExits:
	step UP
	step_end

VictorsRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

VictorsRoomMovementData_MaryRunsBackAndForth:
	run_step RIGHT
	run_step RIGHT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step LEFT
	run_step LEFT
	turn_head UP
	step_end

VictorBattleIntroText:
	text "LANCE: I've been"
	line "waiting for you."

	para "<PLAY_G>!"

	para "I knew that you,"
	line "with your skills,"

	para "would eventually"
	line "reach me here."

	para "There's no need"
	line "for words now."

	para "We will battle to"
	line "determine who is"

	para "the stronger of"
	line "the two of us."

	para "As the most power-"
	line "ful trainer and as"

	para "the #MON LEAGUE"
	line "CHAMPION…"

	para "I, LANCE the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

VictorBattleWinText:
	text "…It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "witnessed the rise"

	para "of a great new"
	line "CHAMPION!"
	done

VictorBattleAfterText:
	text "…Whew."

	para "You have become"
	line "truly powerful,"
	cont "<PLAY_G>."

	para "Your #MON have"
	line "responded to your"

	para "strong and up-"
	line "standing nature."

	para "As a trainer, you"
	line "will continue to"

	para "grow strong with"
	line "your #MON."
	done

UnknownText_0x1811dd:
	text "MARY: Oh, no!"
	line "It's all over!"

	para "PROF.OAK, if you"
	line "weren't so slow…"
	done

UnknownText_0x18121b:
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "It's been a long"
	line "while."

	para "You certainly look"
	line "more impressive."

	para "Your conquest of"
	line "the LEAGUE is just"
	cont "fantastic!"

	para "Your dedication,"
	line "trust and love for"

	para "your #MON made"
	line "this happen."

	para "Your #MON were"
	line "outstanding too."

	para "Because they be-"
	line "lieved in you as a"

	para "trainer, they per-"
	line "severed."

	para "Congratulations,"
	line "<PLAY_G>!"
	done

UnknownText_0x18134b:
	text "MARY: Let's inter-"
	line "view the brand new"
	cont "CHAMPION!"
	done

UnknownText_0x18137b:
	text "LANCE: This is"
	line "getting to be a"
	cont "bit too noisy…"

	para "<PLAY_G>, could you"
	line "come with me?"
	done

UnknownText_0x1813c5:
	text "MARY: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
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

	db 5 ; object events
	object_event  9,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictorsRoomVictorScript, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_VICTORS_ROOM_OAK_AND_MARY
	object_event  0,  0, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_VICTORS_ROOM_OAK_AND_MARY
