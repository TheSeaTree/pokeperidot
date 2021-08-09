	const_def 2 ; object constants
	const OLIVINEPORT_SAILOR1
	const OLIVINEPORT_SAILOR2
	const OLIVINEPORT_SAILOR3
	const OLIVINEPORT_FISHING_GURU1
	const OLIVINEPORT_FISHING_GURU2
	const OLIVINEPORT_YOUNGSTER
	const OLIVINEPORT_COOLTRAINER_F

RugosaPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_OLIVINEPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear OLIVINEPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod RUGOSA_COAST
	end

RugosaPortCaptainScript:
	opentext
	faceplayer
	checkcode VAR_BADGES
	ifequal 8, .Boarding
	writetext RugosaPortCaptainText
	waitbutton
	closetext
	end
	
.Boarding
	writetext RugosaPortCaptainBoardingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, .StepLeft
	applymovement OLIVINEPORT_SAILOR1, BoardShipMovementUp
	applymovement PLAYER, PlayerBoardShipRight
	jump .ContinueBoarding
.StepLeft
	applymovement OLIVINEPORT_SAILOR1, BoardShipMovementLeft
	applymovement PLAYER, PlayerBoardShipDown
.ContinueBoarding
	warpcheck
	end
	
RugosaPortCaptain2Script:
	opentext
	faceplayer
	checkitem PASS
	iftrue .HavePass
	writetext RugosaPortShipNotHereText
	waitbutton
	closetext
	end
	
.HavePass
	writetext RugosaPortHavePassText
	waitbutton
	closetext
	end

RugosaPortSailorAdmireScript:
	jumptextfaceplayer RugosaPortSailorAdmireText
	
RugosaPortSailorWorkingScript:
	jumptextfaceplayer RugosaPortSailorWorkingText
	
RugosaPortFishingGuruScript:
	jumptextfaceplayer RugosaPortFishingGuruText
	
RugosaPortCooltrainerMScript:
	jumptextfaceplayer RugosaPortCooltrainerMText

RugosaPortCooltrainerFScript:
	jumptextfaceplayer RugosaPortCooltrainerFText
	
RugosaPortYoungsterScript:
	jumptextfaceplayer RugosaPortYoungsterText

BoardShipMovementUp:
	step UP
	turn_head DOWN
	step_resume

BoardShipMovementLeft:
	step LEFT
	turn_head RIGHT
	step_resume
	
PlayerBoardShipRight:
	step RIGHT
	step DOWN
	turn_step DOWN
	step_end

PlayerBoardShipDown:
	step DOWN
	step DOWN
	turn_step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end
	
RugosaPortCaptainText:
	text "Sorry, trainer."
	
	para "This ship is only"
	line "for those who have"
	cont "won against every"
	cont "GYM LEADER in this"
	cont "region."
	
	para "Come back with all"
	line "8 BADGEs and I'll"
	cont "let you on board."
	done
	
RugosaPortCaptainBoardingText:
	text "Welcome aboard!"
	done
	
RugosaPortShipNotHereText:
	text "Aye, there be no"
	line "ship makin' her"
	cont "home at this dock."
	
	para "Maybe we will see"
	line "one in the near"
	cont "future."
	done
	
RugosaPortHavePassText:
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
	
RugosaPortPassDeclineText:
	text "Do ye' need more"
	line "time to prepare?"
	
	para "I will be docked"
	line "at this port for"
	cont "a little while"
	cont "longer."
	done
	
RugosaPortSailorAdmireText:
	text "Ain't that ship a"
	line "real beaut'?"
	
	para "I ain't never seen"
	line "nothing like her"
	cont "docked in this"
	cont "port before."
	done
	
RugosaPortSailorWorkingText:
	text "Loadin' supplies"
	line "onto ships is what"
	cont "I do all day."
	
	para "I like it. It's"
	line "some good, honest"
	cont "work."
	
	para "'Specially since I"
	line "get to do it in-"
	cont "doors!"
	done
	
RugosaPortFishingGuruText:
	text "Some day I will"
	line "win 8 BADGEs so"
	cont "I can travel to"
	cont "the #MON"
	cont "LEAGUE!"
	
	para "Imagine the kind"
	line "of WATER #MON"
	cont "that must surround"
	cont "the island!"
	done

RugosaPortCooltrainerMText:
	text "Some day I will"
	line "battle the ELITE"
	cont "FOUR."
	
	para "…But I promised my"
	line "girlfriend that I"
	cont "would take her"
	cont "along."
	
	para "Until she wins her"
	line "BADGEs, I will"
	cont "have to wait."
	done
	
RugosaPortCooltrainerFText:
	text "Only trainers who"
	line "have all 8 GYM"
	cont "BADGEs can board"
	cont "the S.S. MAKO."
	
	para "It is the only way"
	line "to reach the"
	cont "#MON LEAGUE."
	done
	
RugosaPortYoungsterText:
	text "My big sister left"
	line "to challenge the"
	cont "ELITE FOUR!"
	
	para "She said that I"
	line "couldn't come with"
	cont "her, so I'm going"
	cont "to wait until she"
	cont "gets back!"
	done

RugosaPort_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8, 25, RUGOSA_COAST, 6
	warp_event  9, 25, RUGOSA_COAST, 6
	warp_event 14, 15, SS_MAKO_1F, 1 ; Ship

	db 0 ; coord events
;	coord_event  2,  2, SCENE_DEFAULT, RugosaPortWalkUpToShipScript

	db 0 ; bg events
;	bg_event 15, 16, BGEVENT_ITEM, RugosaPortHiddenProtein

	db 9 ; object events
	object_event 14, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortCaptainScript, -1
	object_event 14,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortCaptain2Script, -1
	object_event 12, 21, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortSailorAdmireScript, -1
	object_event  3, 23, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortSailorWorkingScript, -1
	object_event 18, 24, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 24, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortFishingGuruScript, -1
	object_event  7, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaPortYoungsterScript, -1
	object_event  6, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortCooltrainerMScript, -1
	object_event  8, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaPortCooltrainerFScript, -1
