	const_def 2 ; object constants
	const SSMAKO_BURGLAR
	const SSMAKO_FANGIRL
	const SSMAKO_RECEPTIONIST1
	const SSMAKO_RECEPTIONIST2
	const SSMAKO_SAILOR

SSMako1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKO1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKO1F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKO1F_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_DEFAULT
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	setmapscene SS_MAKO_LOWER_DECK, SCENE_SSMAKOLOWERDECK_DEFAULT
	end

.DummyScene1:
	end

.DummyScene2:
	moveobject SSMAKO_SAILOR, 15, 2
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
	blackoutmod SS_MAKO_1F_ROOMS
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
	jump FangirlContinueFolow
	
FangirlTeleport9:
	moveobject SSMAKO_FANGIRL,  3,  8
	jump FangirlContinueFolow
	
FangirlTeleport10:
	moveobject SSMAKO_FANGIRL,  3,  9

FangirlContinueFolow:
	appear SSMAKO_FANGIRL
	follow PLAYER, SSMAKO_FANGIRL
	setscene SCENE_SSMAKO1F_FOLLOWING
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_DEFAULT
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
	setmapscene SS_MAKO_LOWER_DECK, SCENE_SSMAKOLOWERDECK_DEFAULT
	end

SSMako1FFangirl:
	jumpstd emilycompanion

PlayerBoardSSMako:
	applymovement PLAYER, ShipPlayerStepDown
	applymovement SSMAKO_SAILOR, ShipSailorStepRight
	clearevent EVENT_SS_MAKO_DOCKED
	end

SSMako1FSailor:
	faceplayer
	opentext
	checkevent EVENT_SS_MAKO_DOCKED
	iftrue .Leave
	checkevent EVENT_SS_MAKO_DEFEATED_BURGLAR
	iffalse .FirstTime
	writetext SSMako1FSailorAfterText
	waitbutton
	closetext
	end
	
.FirstTime
	writetext SSMako1FSailorText
	waitbutton
	closetext
	end

.Leave
	writetext SSMako1FSailorLeaveText
	waitbutton
	closetext
	scall .CheckFacing
;	follow SSMAKO_SAILOR, PLAYER
;	applymovement SSMAKO_SAILOR, SSMakoSailorLeaveMovement
;	stopfollow
;	playsound SFX_EXIT_BUILDING
;	disappear SSMAKO_SAILOR
;	waitsfx
;	applymovement PLAYER, SSMakoSailorLeaveMovement
	checkevent EVENT_COMING_FROM_LEAGUE
	iftrue .Rugosa
	setmapscene VICTORY_PORT, SCENE_VICTORYPORT_LEAVE_SHIP
	warpmod 3, VICTORY_PORT
	setevent EVENT_COMING_FROM_LEAGUE
	warpcheck
	end

.Rugosa
	setmapscene RUGOSA_PORT, SCENE_RUGOSAPORT_LEAVE_SHIP
	warpmod 3, RUGOSA_PORT
	clearevent EVENT_COMING_FROM_LEAGUE
	warpcheck
	end

.CheckFacing
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	applymovement SSMAKO_SAILOR, SSMakoSailorStepDown
	applymovement PLAYER, SSMakoSailorLeaveRightMovement
	end

.FacingUp:
	applymovement SSMAKO_SAILOR, SSMakoSailorStepLeft
	applymovement PLAYER, SSMakoSailorLeaveUpMovement
	end

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
	
SSMako1FSailorText:
	text "The S.S.MAKO is"
	line "about to depart."
	cont "If you leave now,"
	cont "you may not be"
	cont "able to re-board."
	done
	
SSMako1FSailorAfterText:
	text "The S.S.MAKO has"
	line "already departed,"
	cont "I cannot let you"
	cont "off the ship."

	para "Maybe visit your"
	line "cabin and try to"
	cont "get some sleep."
	done

SSMako1FSailorLeaveText:
	text "Right this way,"
	line "please."
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
	
ShipSailorStepRight:
	step RIGHT
	turn_head DOWN
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

SSMakoSailorStepDown:
	step DOWN
	turn_head UP
	step_resume

SSMakoSailorStepLeft:
	step LEFT
	turn_head RIGHT
	step_resume

SSMakoSailorLeaveRightMovement:
	step RIGHT
	step UP
	step_resume

SSMakoSailorLeaveUpMovement:
	step UP
	step UP
	step_resume

SSMako1F_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 15,  1, SS_MAKO_1F, -1
	warp_event 20, 16, SS_MAKO_B1F, 1
	warp_event  9, 10, SS_MAKO_1F_ROOMS, 1
	warp_event 13, 10, SS_MAKO_1F_ROOMS, 2
	warp_event 17, 10, SS_MAKO_1F_ROOMS, 3
	warp_event  9, 17, SS_MAKO_1F_ROOMS, 4
	warp_event 13, 17, SS_MAKO_1F_ROOMS, 5
	warp_event 17, 17, SS_MAKO_1F_ROOMS, 6
	warp_event  2, 16, SS_MAKO_2F, 1
	warp_event  3,  8, SS_MAKO_LOWER_DECK, 1
	warp_event  3,  9, SS_MAKO_LOWER_DECK, 2

	db 22 ; coord events
	coord_event 15,  2, SCENE_SSMAKO1F_DEFAULT, PlayerBoardSSMako
	coord_event 15,  2, SCENE_SSMAKO1F_FINISHED, PlayerBoardSSMako
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
	coord_event  4,  8, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport9
	coord_event  3,  9, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport9
	coord_event  4,  9, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport10
	coord_event  3,  8, SCENE_SSMAKO1F_DEFAULT, FangirlTeleport10

	db 0 ; bg events

	db 5 ; object events
	object_event  0,  0, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako1FFangirl, -1
	object_event  8,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipReceptionist1, -1
	object_event 12, 18, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipReceptionist2, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 14,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako1FSailor, -1
