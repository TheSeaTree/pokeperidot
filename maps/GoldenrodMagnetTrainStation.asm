	const_def 2 ; object constants
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN

GoldenrodMagnetTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .MagnetTrainToSaffron
	writetext UnknownText_0x55160
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext UnknownText_0x551b7
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext UnknownText_0x551ed
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x55146
	applymovement PLAYER, MovementData_0x5514f
	writebyte FALSE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext UnknownText_0x5522c
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext UnknownText_0x5524f
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x55146
	applymovement PLAYER, MovementData_0x55158
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x5514b
	opentext
	writetext UnknownText_0x5526a
	waitbutton
	closetext
	end

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText
	
Script_EscalatorUp:
	applymovement PLAYER, EscalatorMovementUp
	end
	
Script_EscalatorDown:
	checkcode VAR_FACING
	ifequal UP, .clearflag
	setflag ENGINE_DOWNHILL
	end
	
.clearflag
	clearflag ENGINE_DOWNHILL
	end
	
Script_EscalatorDown2:
	checkcode VAR_FACING
	ifequal UP, .setflag
	clearflag ENGINE_DOWNHILL
	end
	
.setflag
	setflag ENGINE_DOWNHILL
	end
	
Script_EscalatorWrongWay:
	jumptext EscalatorWrongWayText
	
EscalatorMovementUp:
	slow_slide_step UP
	slow_slide_step UP
	step_end
	
EscalatorMovementDown:
	slow_slide_step DOWN
	slow_slide_step DOWN
	step_end
	
EscalatorMovementWrongWayDown:
	step DOWN
	step_end
	
EscalatorMovementWrongWayUp:
	step UP
	step_end

MovementData_0x55146:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_resume

MovementData_0x5514b:
	step LEFT
	step DOWN
	step DOWN
	step_resume

MovementData_0x5514f:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	hide_person
	step_resume

MovementData_0x55158:
	show_person
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_resume

UnknownText_0x55160:
	text "The train hasn't"
	line "come in…"

	para "I know! I'll carry"
	line "the passengers on"
	cont "my back!"

	para "That won't work."
	done

UnknownText_0x551b7:
	text "We'll soon depart"
	line "for SAFFRON."

	para "Are you coming"
	line "aboard?"
	done

UnknownText_0x551ed:
	text "May I see your"
	line "rail PASS, please?"

	para "OK. Right this"
	line "way, please."
	done

UnknownText_0x5522c:
	text "Sorry. You don't"
	line "have a rail PASS."
	done

UnknownText_0x5524f:
	text "We hope to see you"
	line "again!"
	done

UnknownText_0x5526a:
	text "We have arrived in"
	line "GOLDENROD."

	para "We hope to see you"
	line "again."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "I'm the PRESIDENT."

	para "My dream was to"
	line "build a train that"

	para "is faster than any"
	line "#MON."

	para "It really brings"
	line "JOHTO much closer"
	cont "to KANTO."
	done
	
EscalatorWrongWayText:
	text "Please use the"
	line "other escalator."
	done

GoldenrodMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8, 17, AZALEA_TOWN, 2
	warp_event  9, 17, AZALEA_TOWN, 2
	warp_event  9,  8, BATTLE_SUBWAY_PLATFORM, 1

	db 1 ; coord events
	coord_event 18,  8, SCENE_DEFAULT, Script_ArriveFromSaffron

	db 2 ; bg events
	bg_event 17,  6, BGEVENT_READ, Script_EscalatorWrongWay
	bg_event 17,  5, BGEVENT_READ, Script_EscalatorWrongWay

	db 2 ; object events
	object_event  9,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 10, 13, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
