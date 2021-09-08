	const_def 2 ; object constants
	const VICTORYPORT_SAILOR1

VictoryPortInside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_VICTORYPORT_LEAVE_SHIP

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .HideShip
	
.DummyScene0:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_POKEMON_LEAGUE
	return

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, VictoryPortPlayerLeaveShipMovement
	appear VICTORYPORT_SAILOR1
	setscene SCENE_DEFAULT
;	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod RUGOSA_COAST
	end
	
.HideShip
	checkevent EVENT_COMING_FROM_LEAGUE
	iftrue .Nope
	changeblock  0, 16, $0a
	changeblock  2, 16, $85
	changeblock  4, 16, $27
	changeblock  6, 16, $27
	changeblock  0, 18, $0a
	changeblock  2, 18, $0a
	changeblock  4, 18, $0a
	changeblock  6, 18, $0a
.Nope
	return

VictoryPortCaptainScript:
	faceplayer
	opentext
	writetext VictoryPortCaptainText
	yesorno
	iffalse .Boarding
	writetext VictoryPortCaptainStayText
	waitbutton
	closetext
	end

.Boarding:
	checkevent EVENT_COMING_FROM_LEAGUE
	iffalse .ShipAtRugosaPort
	writetext VictoryPortCaptainBoardText
	waitbutton
	closetext
	setevent EVENT_HIDE_SS_MAKO_FANGIRL
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME

; SS Mako B1F Trainers
	clearevent EVENT_BEAT_SAILOR_DARIUS
	clearevent EVENT_BEAT_SAILOR_NATHAN
	clearevent EVENT_BEAT_SAILOR_GENE
	clearevent EVENT_BEAT_SAILOR_ROSCOE
	clearevent EVENT_BEAT_SAILOR_HERMAN
	clearevent EVENT_BEAT_ENGINEER_ROCCO
	clearevent EVENT_BEAT_ENGINEER_RUDOLPH
	clearevent EVENT_BEAT_ENGINEER_BERNARD
	clearevent EVENT_BEAT_ENGINEER_ARNIE
	clearevent EVENT_BEAT_SAILOR_TAYLOR

	applymovement VICTORYPORT_SAILOR1, VictoryPortSailorBoardShipMovement
	playsound SFX_EXIT_BUILDING
	disappear VICTORYPORT_SAILOR1
	applymovement PLAYER, VictoryPortPlayerBoardShipMovement
	warpcheck
	end

.ShipAtRugosaPort:
	writetext VictoryPortSSMakoNotHereText
	waitbutton
	closetext
	end

VictoryPortCaptain2Script:
	opentext
	faceplayer
	checkitem PASS
	iftrue .HavePass
	writetext VictoryPortInsideShipNotHereText
	waitbutton
	closetext
	end

.HavePass
	writetext VictoryPortInsideHavePassText
	yesorno
	iffalse .Decline
	waitbutton
	closetext
	end

.Decline
	writetext VictoryPortInsidePassDeclineText
	waitbutton
	closetext
	end

VictoryPortSailorBoardShipMovement:
	turn_step DOWN
	step_resume

VictoryPortPlayerBoardShipMovement:
	step DOWN
	step_resume

VictoryPortPlayerLeaveShipMovement:
	step UP
	step_resume
	
VictoryPortCaptainText:
	text "Don't think you can"
	line "handle the #MON"
	cont "LEAGUE?"
	done

VictoryPortCaptainBoardText:
	text "Alright, I'll take"
	line "you home so you"
	cont "can train more."
	done
	
VictoryPortCaptainStayText:
	text "I like your attit-"
	line "ude! Get out there"
	cont "and win!"
	done

VictoryPortSSMakoNotHereText:
	text "Sorry to say, but"
	line "the S.S.MAKO has"
	cont "already set sail."
	
	para "It must be docked"
	line "at RUGOSA PORT."
	done

VictoryPortInsideShipNotHereText:
	text "Aye, there be no"
	line "ship makin' her"
	cont "home at this dock."

	para "Maybe we will see"
	line "one in the near"
	cont "future."
	done

VictoryPortInsideHavePassText:
	text "That PASS you have"
	line "there…"
	
	para "Could it be?"
	line "No…"
	
	para "I hadn't seen one"
	line "of those since I"
	cont "was a wee lad."
	
	para "Wherever did you"
	line "find it?"
	
	para "Ah, that doesn't"
	line "matter!"
	
	para "Shall I ferry ye'"
	line "to the island?"
	done

VictoryPortInsidePassDeclineText:
	text "Do ye' need more"
	line "time to prepare?"

	para "I will be docked"
	line "at this port for"
	cont "a little while"
	cont "longer."
	done

VictoryPortInside_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 25, VICTORY_PORT, 1
	warp_event 11, 25, VICTORY_PORT, 1
	warp_event  4, 15, SS_MAKO_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryPortCaptainScript, EVENT_HIDE_PORT_SAILORS
	object_event  6,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryPortCaptain2Script, -1
