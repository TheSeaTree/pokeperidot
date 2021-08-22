	const_def 2 ; object constants
	const SSMAKO2F_FANGIRL
	const SSMAKO2F_RECEPTIONIST
	const SSMAKO2F_OFFICER

SSMako2F_MapScripts:
	db 5 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKO2F_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKO2F_BLOCKED
	scene_script .DummyScene2 ; SCENE_SSMAKO2F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKO2F_UNLOCKED
	scene_script .DummyScene2 ; SCENE_SSMAKO2F_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnlockDoors
	
.DummyScene0:
	setmapscene SS_MAKO_2F_ROOMS, SCENE_SSMAKO2FROOMS_DEFAULT
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_FOLLOWING
	setmapscene SS_MAKO_STERN, SCENE_SSMAKOSTERN_DEFAULT
	end

.DummyScene1:
	checkevent EVENT_ACCESS_TO_SS_MAKO_2F
	iffalse .DummyScene2
	setscene SCENE_SSMAKO2F_FOLLOWING
.DummyScene2:
	end

.UnlockDoors:
	checkevent EVENT_SS_MAKO_UNLOCK_2F_DOORS
	iftrue .Change
	return

.Change:
	changeblock   4,  0, $19
	changeblock   8,  0, $19
	changeblock  12,  0, $19
	return

Fangirl2FTeleport1:
	moveobject SSMAKO2F_FANGIRL, 17, 11
	appear SSMAKO2F_FANGIRL
	follow PLAYER, SSMAKO2F_FANGIRL
	setscene SCENE_SSMAKO2F_BLOCKED
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_DEFAULT
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
	end
	
Fangirl2FTeleport2:
	moveobject SSMAKO2F_FANGIRL,  5,  1
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport3:
	moveobject SSMAKO2F_FANGIRL,  9,  1
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport4:
	moveobject SSMAKO2F_FANGIRL, 13,  1
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport5:
	moveobject SSMAKO2F_FANGIRL, 17,  1
	jump Fangirl2FContinueFolow

Fangirl2FTeleport6:
	moveobject SSMAKO2F_FANGIRL,  5,  8
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport7:
	moveobject SSMAKO2F_FANGIRL,  9,  8
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport8:
	moveobject SSMAKO2F_FANGIRL, 13,  8
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport9:
	moveobject SSMAKO2F_FANGIRL,  2,  4
	jump Fangirl2FContinueFolow
	
Fangirl2FTeleport10:
	moveobject SSMAKO2F_FANGIRL,  2,  5

Fangirl2FContinueFolow:
	appear SSMAKO2F_FANGIRL
	follow PLAYER, SSMAKO2F_FANGIRL
	setscene SCENE_SSMAKO2F_UNLOCKED
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_DEFAULT
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
	end
	
SSMako2FFangirl:
	jumpstd emilycompanion
	
SSMako2FOfficer:
	setevent EVENT_SS_MAKO_DECK_CLEARED
	setevent EVENT_HIDE_SS_MAKO_FANGIRL
	jumptextfaceplayer SSMako2FOfficerText
	
Check2FPass:
	turnobject PLAYER, LEFT
	opentext
	checkitem VIP_TICKET
	iffalse .NoPass
	writetext SSMako2FHavePassText
	waitbutton
	closetext
	setevent EVENT_ACCESS_TO_SS_MAKO_2F
	setscene SCENE_SSMAKO2F_FOLLOWING
	end
	
.NoPass
	writetext SSMako2FNoPassText
	waitbutton
	closetext
	applymovement PLAYER, SSMako2FPlayerStepDown
	turnobject SSMAKO2F_FANGIRL, DOWN
	setevent EVENT_SS_MAKO_TRIED_GOING_UPSTAIRS
	end
	
SSMako2FUpperDoorsLocked:
	conditional_event EVENT_SS_MAKO_UNLOCK_2F_DOORS, .Script

.Script:
	jumptext SSMako2FLockedDoorText
	
SSMako2FLowerDoorsLocked:
	turnobject SSMAKO2F_FANGIRL, DOWN
	opentext
	writetext SSMako2FLowerDoorsLockedText
	waitbutton
	closetext
	applymovement PLAYER, SSMako2FPlayerStepUp
	turnobject SSMAKO2F_FANGIRL, UP
	end

SSMako2FPlayerStepUp:
	step UP
	step_resume

SSMako2FPlayerStepDown:
	step DOWN
	step_resume
	
SSMako2FOfficerText:
	text "This is the"
	line "CHAMPION's cabin."
	
	para "You are not permi-"
	line "tted to enter."
	done
	
SSMako2FOfficerAfterText:
	text "You're <PLAYER>,"
	line "right?"
	
	para "CHAMPION VICTOR"
	line "would be happy for"
	cont "you to visit."
	done

SSMako2FHavePassText:
	text "Oh, there is your"
	line "VIP TICKET!"
	
	para "Go right ahead!"
	done

SSMako2FNoPassText:
	text "I'm terribly sorry,"
	line "but only those who"
	cont "have a VIP TICKET"
	cont "may be up on this"
	cont "level of the ship."
	
	para "I will have to ask"
	line "you to please go"
	cont "back downstairs."
	done
	
SSMako2FLockedDoorText:
	text "There is a sign"
	line "hanging on the"
	cont "doorknob."
	
	para "It reads 'DO NOT"
	line "DISTURB.'"
	done
	
SSMako2FLowerDoorsLockedText:
	text "EMILY: Let's not"
	line "bother whoever is"
	cont "in that room right"
	cont "now, <PLAYER>."
	done

SSMako2F_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 17, 11, SS_MAKO_1F, 9
	warp_event  5,  1, SS_MAKO_2F_ROOMS, 1
	warp_event  9,  1, SS_MAKO_2F_ROOMS, 3
	warp_event 13,  1, SS_MAKO_2F_ROOMS, 5
	warp_event 17,  1, SS_MAKO_2F_ROOMS, 7
	warp_event  5,  8, SS_MAKO_2F_ROOMS, 9
	warp_event  9,  8, SS_MAKO_2F_ROOMS, 10
	warp_event 13,  8, SS_MAKO_2F_ROOMS, 11
	warp_event  2,  4, SS_MAKO_STERN, 1
	warp_event  2,  5, SS_MAKO_STERN, 2

	db 20 ; coord events
	coord_event 17, 10, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport1
	coord_event 16, 11, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport1
	coord_event  5,  2, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport2
	coord_event  9,  2, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport3
	coord_event 13,  2, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport4
	coord_event 17,  2, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport5
	coord_event  5,  7, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport6
	coord_event  9,  7, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport7
	coord_event 13,  7, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport8
	coord_event  2,  3, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport9
	coord_event  3,  4, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport9
	coord_event  2,  5, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport9
	coord_event  2,  4, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport10
	coord_event  3,  5, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport10
	coord_event  2,  6, SCENE_SSMAKO2F_DEFAULT, Fangirl2FTeleport10
	coord_event 16,  7, SCENE_SSMAKO2F_BLOCKED, Check2FPass
	coord_event 17,  7, SCENE_SSMAKO2F_BLOCKED, Check2FPass
	coord_event  5,  8, SCENE_SSMAKO2F_FOLLOWING, SSMako2FLowerDoorsLocked
	coord_event  9,  8, SCENE_SSMAKO2F_FOLLOWING, SSMako2FLowerDoorsLocked
	coord_event 13,  8, SCENE_SSMAKO2F_FOLLOWING, SSMako2FLowerDoorsLocked

	db 3 ; bg events
	bg_event 13,  1, BGEVENT_IFNOTSET, SSMako2FUpperDoorsLocked
	bg_event  9,  1, BGEVENT_IFNOTSET, SSMako2FUpperDoorsLocked
	bg_event  5,  1, BGEVENT_IFNOTSET, SSMako2FUpperDoorsLocked

	db 3 ; object events
	object_event  0, 13, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako2FFangirl, -1
	object_event 15,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako2FOfficer, EVENT_SS_MAKO_DEFEATED_BURGLAR
