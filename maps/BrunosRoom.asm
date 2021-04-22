	const_def 2 ; object constants
	const BRUNOSROOM_BRUNO
	const BRUNOSROOM_CHRIS
	const BRUNOSROOM_KRIS

BrunosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear BRUNOSROOM_BRUNO
	end

.DummyScene:
	end

ApproachRegan:
	applymovement PLAYER, BrunosRoom_EnterMovement
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject BRUNOSROOM_CHRIS, 5, 4
	appear BRUNOSROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject BRUNOSROOM_KRIS, 5, 4
	appear BRUNOSROOM_KRIS
.ContinueBattle
	applymovement PLAYER, E4StartBattle
	
	refreshscreen $86
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $09 ; wall
	changeblock 6, 2, $0a ; wall
	changeblock 8, 2, $0b ; wall
	changeblock 4, 4, $0d ; wall
	changeblock 6, 4, $0e ; wall
	changeblock 8, 4, $0f ; wall
	reloadmappart
	closetext
	waitsfx

	appear BRUNOSROOM_BRUNO
	applymovement BRUNOSROOM_BRUNO, ReganVanishingAct
	setlasttalked BRUNOSROOM_BRUNO
	setscene SCENE_FINISHED

	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext

	applymovement BRUNOSROOM_BRUNO, ReganVanishingAct
	disappear BRUNOSROOM_BRUNO
	wait 8

	applymovement PLAYER, E4AfterBattle
	disappear BRUNOSROOM_CHRIS
	disappear BRUNOSROOM_KRIS

	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end
	
ReganVanishingAct:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
E4StartBattle:
	hide_person
	step RIGHT
	step_end
	
E4AfterBattle:
	step LEFT
	turn_head RIGHT
	show_person
	step_end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step RIGHT
	step_end

BrunoScript_BrunoBeforeText:
	text "I am BRUNO of the"
	line "ELITE FOUR."

	para "I always train to"
	line "the extreme be-"
	cont "cause I believe in"
	cont "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "Ready, <PLAYER>?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "Hoo hah!"
	done

BrunoScript_BrunoBeatenText:
	text "Why? How could we"
	line "lose?"
	done

BrunoScript_BrunoDefeatText:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go face your next"
	line "challenge!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, KARENS_ROOM, 1
	warp_event  5, 11, KARENS_ROOM, 2

	db 1 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, ApproachRegan

	db 0 ; bg events

	db 3 ; object events
	object_event  8,  4, SPRITE_REGAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BrunoScript_AfterBattle, -1
	object_event -5, -3, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -5, -3, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
