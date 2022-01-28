	const_def 2 ; object constants
	const REGANSROOM_REGAN
	const REGANSROOM_CHRIS
	const REGANSROOM_KRIS

RegansRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.LockDoor:
	disappear REGANSROOM_REGAN
	end

.DummyScene:
	end

ApproachReganLeft:
	applymovement PLAYER, RegansRoom_EnterMovementLeft
	jump ContinueApproachRegan

ApproachReganRight:
	applymovement PLAYER, RegansRoom_EnterMovementRight	
ContinueApproachRegan:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	moveobject REGANSROOM_CHRIS, 5, 10
	appear REGANSROOM_CHRIS
	jump .ContinueBattle
.Girl
	moveobject REGANSROOM_KRIS, 5, 10
	appear REGANSROOM_KRIS
.ContinueBattle
	applymovement PLAYER, E4StartBattle
	
	refreshscreen $86
	playsound SFX_ENTER_DOOR
	changeblock 4,  8, $09 ; wall
	changeblock 6,  8, $0a ; wall
	changeblock 8,  8, $0b ; wall
	changeblock 4, 10, $0d ; wall
	changeblock 6, 10, $0e ; wall
	changeblock 8, 10, $0f ; wall
	reloadmappart
	closetext
	wait 4

	appear REGANSROOM_REGAN
	playsound SFX_WARP_TO
	applymovement REGANSROOM_REGAN, ReganAppearance
	setscene SCENE_FINISHED
	waitsfx

	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch

	writetext ReganScript_ReganBeforeText
	waitbutton
	closetext
	winlosstext ReganScript_ReganBeatenText, 0
	loadtrainer REGAN, REGAN1
	startbattle
	changeblock 8,  8, $44
	changeblock 8, 10, $45
	reloadmapafterbattle
	opentext
	writetext ReganScript_ReganDefeatText
	waitbutton
	closetext
	jump .AfterBattle

.Rematch
	writetext ReganScript_RematchBeforeText
	waitbutton
	closetext

	winlosstext ReganScript_RematchBeatenText, 0

	copybytetovar wEliteFourFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer REGAN, REGAN_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer REGAN, REGAN_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer REGAN, REGAN_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer REGAN, REGAN_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer REGAN, REGAN_REMATCH5
.DoRematch
	startbattle
	changeblock 8,  8, $44
	changeblock 8, 10, $45
	reloadmapafterbattle
	opentext
	writetext ReganScript_RematchDefeatText
	waitbutton
	closetext

.AfterBattle
	playsound SFX_POWDER
	applymovement REGANSROOM_REGAN, ReganVanishingAct
	disappear REGANSROOM_REGAN
	waitsfx
	wait 4
	applymovement PLAYER, E4AfterBattle
	disappear REGANSROOM_CHRIS
	disappear REGANSROOM_KRIS

	wait 2
	refreshscreen $86
	playsound SFX_ENTER_DOOR
	changeblock 4,  8, $01 ; wall
	changeblock 6,  8, $02 ; wall
	changeblock 8,  8, $03 ; wall
	changeblock 4, 10, $05 ; wall
	changeblock 6, 10, $06 ; wall
	changeblock 8, 10, $07 ; wall
	changeblock 8,  8, $42
	changeblock 8, 10, $43
	reloadmappart
	closetext
	wait 2
	waitsfx
	end
	
ReganHasDisappeared:
	jumptext ReganHasDisappearedText
	
ReganDroppedCards:
	jumptext ReganDroppedCardsText
	
ReganNoTurningBack:
	jumptext ReganCantProgress
	
CantPassRegan:
	opentext
	writetext ReganCantProgress
	waitbutton
	closetext
	applymovement PLAYER, StepAwayE4
	end

ReganAppearance:
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
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	step_end

ReganVanishingAct:
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_end

E4StartBattle:
	hide_person
	slow_step RIGHT
	step_end

E4AfterBattle:
	slow_step LEFT
	turn_head RIGHT
	show_person
	step_end

RegansRoom_EnterMovementLeft:
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

RegansRoom_EnterMovementRight:
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

StepAwayE4:
	step UP
	step_end

ReganScript_ReganBeforeText:
	text "Ta-da!"
	
	para "Pleased to meet"
	line "you! I am REGAN of"
	cont "the ELITE FOUR."
	
	para "Do you believe"
	line "that there are"
	cont "spirits among us?"
	
	para "Ever since I was a"
	line "child, I've had a"
	cont "strong connection"
	cont "with them."
	
	para "It has given me an"
	line "advantage when"
	cont "raising my GHOST-"
	cont "type #MON."

	para "With their help, I"
	line "can perform mirac-"
	cont "ulous feats and"
	cont "illusions!"
	
	para "Let's not make the"
	line "crowd wait any"
	cont "longer, <PLAYER>."

	para "It's showtime!"
	done

ReganScript_ReganBeatenText:
	text "Bravo, bravo!"

	para "That was a marvel-"
	line "ous performance!"

	para "The crowd loves"
	line "you, <PLAYER>!"
	done

ReganScript_ReganDefeatText:
	text "I can sense you're"
	line "still skeptical"
	cont "over the existence"
	cont "of spirits…"

	para "Hehe!"

	para "You'll be a belie-"
	line "ver some day."

	para "I promise!"
	done

ReganScript_RematchBeforeText:
	text "<PLAYER>! What a"
	line "pleasant surprise!"

	para "Have you come to"
	line "give the audience"
	cont "an encore?"

	para "Let's give them a"
	line "show they will"
	cont "never forget!"
	done

ReganScript_RematchBeatenText:
	text "I can tell you are"
	line "more of a believer"
	cont "since the last"
	cont "time we battled."
	
	para "It makes me happy"
	line "to know you've"
	cont "started to accept"
	cont "the existance of"
	cont "spirits in our"
	cont "world!"
	done

ReganScript_RematchDefeatText:
	text "My, my!"

	para "You haven't been"
	line "slacking with your"
	cont "training either!"

	para "I'll train even"
	line "harder for our"
	cont "next performance!"

	para "Until then,"
	line "au revoir!"
	done

ReganHasDisappearedText:
	text "REGAN has complet-"
	line "ely disappeared!"
	
	para "…How did she do"
	line "that?"
	done
	
ReganDroppedCardsText:
	text "REGAN scattered"
	line "these cards before"
	cont "the battle."
	done
	
ReganCantProgress:
	text "There is no"
	line "turning back now."
	done

RegansRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 19, ORVILLES_ROOM, 1
	warp_event  7, 19, ORVILLES_ROOM, 2
	warp_event  6,  1, BREDES_ROOM, 1
	warp_event  7,  1, BREDES_ROOM, 2

	db 4 ; coord events
	coord_event  6, 16, SCENE_DEFAULT, ApproachReganLeft
	coord_event  7, 16, SCENE_DEFAULT, ApproachReganRight
	coord_event  6, 16, SCENE_FINISHED, CantPassRegan
	coord_event  7, 16, SCENE_FINISHED, CantPassRegan

	db 5 ; bg events
	bg_event  6, 20, BGEVENT_READ, ReganNoTurningBack
	bg_event  7, 20, BGEVENT_READ, ReganNoTurningBack
	bg_event  8, 10, BGEVENT_READ, ReganHasDisappeared
	bg_event  9,  9, BGEVENT_READ, ReganDroppedCards
	bg_event  9, 10, BGEVENT_READ, ReganDroppedCards

	db 9 ; object events
	object_event  8, 10, SPRITE_REGAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
