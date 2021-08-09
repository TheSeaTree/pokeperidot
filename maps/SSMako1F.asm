	const_def 2 ; object constants
	const SSMAKO_BURGLAR
	const SSMAKO_FANGIRL

SSMako1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKO1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKO1F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKO1F_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_DEFAULT
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

FangirlBagStolenLeft:
	opentext
	writetext EmilyStopThief
	waitbutton
	closetext
	moveobject SSMAKO_BURGLAR, 14, 2
	appear SSMAKO_BURGLAR	
	moveobject SSMAKO_FANGIRL, 14, 2
	appear SSMAKO_FANGIRL
	
	applymovement SSMAKO_BURGLAR, ShipBurglarCrash
	applymovement PLAYER, ShipPlayerCrashLeft
	applymovement SSMAKO_BURGLAR, ShipBurglarGetaway
	jump ContinueFangirlBagStolen

FangirlBagStolenRight:
	opentext
	writetext EmilyStopThief
	waitbutton
	closetext
	moveobject SSMAKO_BURGLAR, 15, 2
	appear SSMAKO_BURGLAR	
	moveobject SSMAKO_FANGIRL, 15, 2
	appear SSMAKO_FANGIRL
	
	applymovement SSMAKO_BURGLAR, ShipBurglarCrash
	applymovement PLAYER, ShipPlayerCrashRight
	applymovement SSMAKO_BURGLAR, ShipBurglarGetaway
	
ContinueFangirlBagStolen:
	disappear SSMAKO_BURGLAR
	applymovement SSMAKO_FANGIRL, ShipFangirlApproach
	showemote EMOTE_SHOCK, SSMAKO_FANGIRL, 15
	opentext
	writetext ShipEmilyNoticesPlayer
	waitbutton
	closetext
	applymovement SSMAKO_FANGIRL, ShipFangirlApproach2
	setlasttalked SSMAKO_FANGIRL
	faceplayer
	opentext
	writetext ShipEmilyExplainBagStolen
	waitbutton
	closetext
	follow PLAYER, SSMAKO_FANGIRL
	setscene SCENE_SSMAKO1F_FOLLOWING
	end

SSMakoNoTurningBack:
	turnobject SSMAKO_FANGIRL, UP
	opentext
	writetext SSMakoNoTurningBackText
	waitbutton
	closetext
	applymovement PLAYER, ShipPlayerStepDown
	turnobject SSMAKO_FANGIRL, DOWN
	end
	
FangirlTeleport1:
	moveobject SSMAKO_FANGIRL, 20, 16
	jump FangirlContinueFolow
	
FangirlTeleport2:
	moveobject SSMAKO_FANGIRL,  9, 10
	jump FangirlContinueFolow
	
FangirlTeleport3:
	moveobject SSMAKO_FANGIRL, 13, 10
	jump FangirlContinueFolow
	
FangirlTeleport4:
	moveobject SSMAKO_FANGIRL, 17, 10
	jump FangirlContinueFolow
	
FangirlTeleport5:
	moveobject SSMAKO_FANGIRL,  9, 17
	jump FangirlContinueFolow
	
FangirlTeleport6:
	moveobject SSMAKO_FANGIRL, 13, 17
	jump FangirlContinueFolow

FangirlTeleport7:
	moveobject SSMAKO_FANGIRL, 17, 17
	jump FangirlContinueFolow
	
FangirlTeleport8:
	moveobject SSMAKO_FANGIRL,  2, 16

FangirlContinueFolow:
	appear SSMAKO_FANGIRL
	follow PLAYER, SSMAKO_FANGIRL
	setscene SCENE_SSMAKO1F_FOLLOWING
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_DEFAULT
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
	end
	
SSMako1FFangirl:
	jumpstd emilycompanion

ShipReceptionist1:
	faceplayer
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .female
	writetext ShipReceptionist1MaleText
	waitbutton
	closetext
	end

.female
	writetext ShipReceptionist1FemaleText
	waitbutton
	closetext
	end

ShipReceptionist2:
	jumptextfaceplayer ShipReceptionist2Text
	
EmilyStopThief:
	text "Stop! Thief!"
	done

ShipEmilyNoticesPlayer:	
	text "<PLAYER>!"
	done
	
ShipEmilyExplainBagStolen:
	text "That creep who ran"
	line "by stole my PACK!"

	para "It had all of my"
	line "#BALLS and"
	cont "BADGES in it!"
	
	para "Can you please"
	line "help me track him"
	cont "down and get it"
	cont "back?"

	para "I can't do it"
	line "alone."
	done

SSMakoNoTurningBackText:
	text "Where are you"
	line "going, <PLAYER>?"
	
	para "That thief must"
	line "still be on the"
	cont "ship somewhere!"
	done
	
ShipReceptionist1MaleText:
	text "This is your room"
	line "here, Mr. <PLAYER>."
	done

ShipReceptionist1FemaleText:
	text "This is your room"
	line "here, Ms. <PLAYER>."
	done
	
ShipReceptionist2Text:
	text "This is Ms. EMILY's"
	line "room."
	done
	
ShipPlayerStepDown:
	step DOWN
	step_end

ShipBurglarCrash:
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_end
	
ShipBurglarGetaway:
	run_step DOWN
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_end

ShipPlayerCrashLeft:
	turn_step LEFT
	fix_facing
	run_step RIGHT
	remove_fixed_facing
	step_end

ShipPlayerCrashRight:
	turn_step RIGHT
	fix_facing
	run_step LEFT
	remove_fixed_facing
	step_end
	
ShipFangirlApproach:
	step DOWN
	step DOWN
	step DOWN
	step_resume
	
ShipFangirlApproach2:
	run_step DOWN
	run_step DOWN
	step_resume

SSMako1F_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 15,  1, SS_MAKO_1F, 1
	warp_event 20, 16, SS_MAKO_B1F, 1
	warp_event  9, 10, SS_MAKO_1F_ROOMS, 1
	warp_event 13, 10, SS_MAKO_1F_ROOMS, 2
	warp_event 17, 10, SS_MAKO_1F_ROOMS, 3
	warp_event  9, 17, SS_MAKO_1F_ROOMS, 4
	warp_event 13, 17, SS_MAKO_1F_ROOMS, 5
	warp_event 17, 17, SS_MAKO_1F_ROOMS, 6
	warp_event  2, 16, SS_MAKO_2F, 1

	db 16 ; coord events
	coord_event 14,  7, SCENE_SSMAKO1F_DEFAULT, FangirlBagStolenLeft
	coord_event 15,  7, SCENE_SSMAKO1F_DEFAULT, FangirlBagStolenRight
	coord_event 14,  7, SCENE_SSMAKO1F_FOLLOWING, SSMakoNoTurningBack
	coord_event 15,  7, SCENE_SSMAKO1F_FOLLOWING, SSMakoNoTurningBack
	coord_event 20, 17, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport1
	coord_event 21, 16, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport1
	coord_event 20, 15, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport1
	coord_event  9,  9, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport2
	coord_event 13,  9, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport3
	coord_event 17,  9, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport4
	coord_event  9, 18, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport5
	coord_event 13, 18, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport6
	coord_event 17, 18, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport7
	coord_event  2, 15, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport8
	coord_event  2, 17, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport8
	coord_event  3, 16, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport8

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  0, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako1FFangirl, -1
	object_event  8,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipReceptionist1, -1
	object_event 12, 18, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipReceptionist2, -1
