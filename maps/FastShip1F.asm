	const_def 2 ; object constants
	const FASTSHIP_BURGLAR
	const FASTSHIP_FANGIRL

FastShip1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIP1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIP1F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIP1F_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene FAST_SHIP_1F_ROOMS, SCENE_FASTSHIP1FROOMS_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

FangirlBagStolenLeft:
	opentext
	writetext EmilyStopThief
	waitbutton
	closetext
	moveobject FASTSHIP_BURGLAR, 14, 2
	appear FASTSHIP_BURGLAR	
	moveobject FASTSHIP_FANGIRL, 14, 2
	appear FASTSHIP_FANGIRL
	
	applymovement FASTSHIP_BURGLAR, ShipBurglarCrash
	applymovement PLAYER, ShipPlayerCrashLeft
	applymovement FASTSHIP_BURGLAR, ShipBurglarGetaway
	jump ContinueFangirlBagStolen

FangirlBagStolenRight:
	opentext
	writetext EmilyStopThief
	waitbutton
	closetext
	moveobject FASTSHIP_BURGLAR, 15, 2
	appear FASTSHIP_BURGLAR	
	moveobject FASTSHIP_FANGIRL, 15, 2
	appear FASTSHIP_FANGIRL
	
	applymovement FASTSHIP_BURGLAR, ShipBurglarCrash
	applymovement PLAYER, ShipPlayerCrashRight
	applymovement FASTSHIP_BURGLAR, ShipBurglarGetaway
	
ContinueFangirlBagStolen:
	disappear FASTSHIP_BURGLAR
	applymovement FASTSHIP_FANGIRL, ShipFangirlApproach
	setlasttalked FASTSHIP_FANGIRL
	showemote EMOTE_SHOCK, FASTSHIP_FANGIRL, 15
	faceplayer
	opentext
	writetext ShipEmilyExplainBagStolen
	waitbutton
	closetext
	follow PLAYER, FASTSHIP_FANGIRL
	setscene SCENE_FASTSHIP1F_FOLLOWING
	end
	
FangirlTeleport1:
	moveobject FASTSHIP_FANGIRL, 20, 16
	jump FangirlContinueFolow
	
FangirlTeleport2:
	moveobject FASTSHIP_FANGIRL,  9, 10
	jump FangirlContinueFolow
	
FangirlTeleport3:
	moveobject FASTSHIP_FANGIRL, 13, 10
	jump FangirlContinueFolow
	
FangirlTeleport4:
	moveobject FASTSHIP_FANGIRL, 17, 10
	jump FangirlContinueFolow
	
FangirlTeleport5:
	moveobject FASTSHIP_FANGIRL,  9, 17
	jump FangirlContinueFolow
	
FangirlTeleport6:
	moveobject FASTSHIP_FANGIRL, 13, 17
	jump FangirlContinueFolow
	
FangirlTeleport7:
	moveobject FASTSHIP_FANGIRL, 17, 17

FangirlContinueFolow:
	appear FASTSHIP_FANGIRL
	follow PLAYER, FASTSHIP_FANGIRL
	setscene SCENE_FASTSHIP1F_FOLLOWING
	setmapscene FAST_SHIP_1F_ROOMS, SCENE_FASTSHIP1FROOMS_DEFAULT
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_DEFAULT
	end
	
ShipFangirl:
	jumptextfaceplayer ShipFangirlFollowingText
	
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
	
ShipEmilyExplainBagStolen:
	text "<PLAYER>!"
	
	para "That creep who ran"
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
	
ShipFangirlFollowingText:
	text "He couldn't have"
	line "gotten far."
	
	para "Let's go!"
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
	step DOWN
	step DOWN
	step_resume

FastShip1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15,  1, FAST_SHIP_1F, 1
	warp_event 20, 16, FAST_SHIP_B1F, 1
	warp_event  9, 10, FAST_SHIP_1F_ROOMS, 1
	warp_event 13, 10, FAST_SHIP_1F_ROOMS, 2
	warp_event 17, 10, FAST_SHIP_1F_ROOMS, 3
	warp_event  9, 17, FAST_SHIP_1F_ROOMS, 4
	warp_event 13, 17, FAST_SHIP_1F_ROOMS, 5
	warp_event 17, 17, FAST_SHIP_1F_ROOMS, 6

	db 11 ; coord events
	coord_event 14,  7, SCENE_FASTSHIP1F_DEFAULT, FangirlBagStolenLeft
	coord_event 15,  7, SCENE_FASTSHIP1F_DEFAULT, FangirlBagStolenRight
	coord_event 20, 17, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport1
	coord_event 21, 16, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport1
	coord_event 20, 15, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport1
	coord_event  9,  9, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport2
	coord_event 13,  9, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport3
	coord_event 17,  9, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport4
	coord_event  9, 18, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport5
	coord_event 13, 18, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport6
	coord_event 17, 18, SCENE_FASTSHIP1F_DEFAULT, FangirlTeleport7

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  0, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipFangirl, -1
	object_event  8,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipReceptionist1, -1
	object_event 12, 18, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShipReceptionist2, -1
