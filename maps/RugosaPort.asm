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

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HideShip

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.HideShip
	checkevent EVENT_COMING_FROM_LEAGUE
	iffalse .Nope
	changeblock 10,  8, $27
	changeblock 12,  8, $27
	changeblock 14,  8, $27
	changeblock 16,  8, $0a
	changeblock 10, 10, $0a
	changeblock 12, 10, $0a
	changeblock 14, 10, $0a
	changeblock 16, 10, $0a
.Nope
	return

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear OLIVINEPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_SS_MAKO_DOCKED
	blackoutmod RUGOSA_COAST
	end

RugosaPortCaptainScript:
	faceplayer
	opentext
	checkcode VAR_BADGES
	ifequal 8, .Boarding
	writetext RugosaPortCaptainText
	waitbutton
	closetext
	end

.Boarding
	checkevent EVENT_COMING_FROM_LEAGUE
	iftrue .ShipAtVictoryPort
	writetext RugosaPortCaptainBoardingText
	yesorno
	iffalse .Decline
	writetext RugosaPortAcceptBoardingText
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

;	follow OLIVINEPORT_SAILOR1, PLAYER
	applymovement OLIVINEPORT_SAILOR1, RugosaPortSailorBoardShipMovement
	playsound SFX_EXIT_BUILDING
;	stopfollow
	disappear OLIVINEPORT_SAILOR1
	applymovement PLAYER, RugosaPortPlayerBoardShipMovement
	warpcheck
	end

.Decline
	writetext RugosaPortDeclineBoardingText
	waitbutton
	closetext
	end
	
.ShipAtVictoryPort:
	writetext RugosaPortSSMakoNotHereText
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

RugosaPortSailorBoardShipMovement:
	turn_step DOWN
	step_resume

RugosaPortPlayerBoardShipMovement:
	step DOWN
	step_resume

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
	text "Sorry, trainer."
	
	para "This ship is only"
	line "for those who-"
	
	para "Oh! There are your"
	line "BADGEs."
	
	para "And right on time,"
	line "the ship will be"
	cont "departing soon."
	
	para "Are you coming"
	line "with us?"
	done
	
RugosaPortAcceptBoardingText:
	text "Please, come on"
	line "board!"
	done

RugosaPortDeclineBoardingText:
	text "Okay, but I hope"
	line "whatever you're"
	cont "doing won't take"
	cont "too long…"
	
	para "You're really"
	line "cutting it close."
	done

RugosaPortSSMakoNotHereText:
	text "Sorry to say, but"
	line "the S.S.MAKO has"
	cont "already set sail."
	
	para "It must be docked"
	line "at VICTORY PORT."
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
	cont "the S.S.MAKO."
	
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
	warp_event  8, 17, RUGOSA_COAST, 6
	warp_event  9, 17, RUGOSA_COAST, 6
	warp_event 14,  7, SS_MAKO_1F, 1 ; Ship

	db 0 ; coord events
;	coord_event  2,  2, SCENE_DEFAULT, RugosaPortWalkUpToShipScript

	db 0 ; bg events
;	bg_event 15, 16, BGEVENT_ITEM, RugosaPortHiddenProtein

	db 8 ; object events
	object_event 14,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortCaptainScript, EVENT_SS_MAKO_DOCKED
	object_event 12, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortSailorAdmireScript, EVENT_COMING_FROM_LEAGUE
	object_event  3, 15, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortSailorWorkingScript, -1
	object_event 18, 16, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 16, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortFishingGuruScript, -1
	object_event  7, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaPortYoungsterScript, -1
	object_event  6,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaPortCooltrainerMScript, -1
	object_event  8,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaPortCooltrainerFScript, -1
