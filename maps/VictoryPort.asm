	const_def 2 ; object constants
	const VICTORYPORT_SAILOR1
	const VICTORYPORT_CAPTAIN

VictoryPort_MapScripts:
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
	clearevent EVENT_SS_MAKO_DOCKED
	blackoutmod POKEMON_LEAGUE
	end

.HideShip
	checkevent EVENT_COMING_FROM_LEAGUE
	iftrue .CheckSeaMap
	changeblock  0, 16, $0a
	changeblock  2, 16, $85
	changeblock  4, 16, $27
	changeblock  6, 16, $27
	changeblock  0, 18, $0a
	changeblock  2, 18, $0a
	changeblock  4, 18, $0a
	changeblock  6, 18, $0a
.CheckSeaMap
	checkevent EVENT_SHOWED_SEA_MAP_TO_CAPTAIN
	iftrue .ShowShip
	checkevent EVENT_FOUND_SEA_MAP
	iffalse .Nope
	checkitem SEA_MAP
	iffalse .Nope
.ShowShip
	changeblock  4,  8, $8c
	changeblock  6,  8, $8d
;	reloadmappart
.Nope
	return

VictoryPortCaptainScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
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
	jump .ContinueBoarding

.Postgame
	writetext VictoryPortPostgameCaptainText
	yesorno
	iftrue .PostgameBoarding
	writetext VictoryPortPostgameCaptainStayText
	waitbutton
	closetext
	end
.PostgameBoarding
	checkevent EVENT_COMING_FROM_LEAGUE
	iffalse .ShipAtRugosaPort
	writetext VictoryPortPostgameCaptainBoardText
	waitbutton
	closetext
.ContinueBoarding
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	setevent EVENT_HIDE_SS_MAKO_FANGIRL

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
	faceplayer
	opentext
	checkevent EVENT_FOUND_SEA_MAP
	iffalse .NoShip
	checkevent EVENT_SHOWED_SEA_MAP_TO_CAPTAIN
	iftrue .AlreadyMet
	checkitem SEA_MAP
	iffalse .NoShip
	writetext VictoryPortCaptainIntroText
	waitbutton
	setevent EVENT_SHOWED_SEA_MAP_TO_CAPTAIN
.AlreadyMet
	writetext VictoryPortSetSailText
	yesorno
	iffalse .Decline
	checkitem SEA_MAP
	iffalse .NoMap
	writetext VictoryPortMapAcceptText
	waitbutton
	closetext
	follow VICTORYPORT_CAPTAIN, PLAYER
	applymovement VICTORYPORT_CAPTAIN, VictoryPortBoardSmallShipMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_RAIN_DANCE
	waitsfx
	warpfacing LEFT, GENESIS_ISLAND, 33, 31
	end

.Decline
	writetext VictoryPortMapDeclineText
	waitbutton
	closetext
	end

.NoShip
	writetext VictoryPortShipNotHereText
	waitbutton
	closetext
	end

.NoMap
	writetext VictoryPortNoMapText
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

VictoryPortBoardSmallShipMovement:
	step DOWN
	hide_person
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

VictoryPortPostgameCaptainText:
	text "Greetings,"
	line "CHAMPION."

	para "Will you be retur-"
	line "ning to RUGOSA"
	cont "COAST from here?"
	done

VictoryPortPostgameCaptainBoardText:
	text "Welcome aboard!"
	done

VictoryPortPostgameCaptainStayText:
	text "Going to continue"
	line "your visit to the"
	cont "LEAGUE? Alright."
	done

VictoryPortSSMakoNotHereText:
	text "Sorry to say, but"
	line "the S.S.MAKO has"
	cont "already set sail."
	
	para "It must be docked"
	line "at RUGOSA PORT."
	done

VictoryPortShipNotHereText:
	text "Aye, there be no"
	line "ship makin' her"
	cont "home at this dock."

	para "Maybe we will see"
	line "one in the near"
	cont "future."
	done

VictoryPortCaptainIntroText:
	text "That MAP you have"
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
	done

VictoryPortSetSailText:
	text "Shall I ferry ye'"
	line "to GENESIS ISLAND?"
	done

VictoryPortNoMapText:
	text "Where did ye' map"
	line "go?"

	para "Me memory ain't"
	line "it used to be."

	para "I need a map to"
	line "get you over to"
	cont "GENESIS ISLAND."
	done

VictoryPortMapAcceptText:
	text "Aye, aye! Off we"
	line "go!"

	para "To GENESIS ISLAND!"
	done

VictoryPortMapDeclineText:
	text "Do ye' need more"
	line "time to prepare?"

	para "I will be docked"
	line "at this port for"
	cont "a little while"
	cont "longer."
	done

VictoryPort_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 25, VICTORY_COAST, 1
	warp_event 11, 25, VICTORY_COAST, 1
	warp_event  4, 15, SS_MAKO_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryPortCaptainScript, EVENT_SS_MAKO_DOCKED
	object_event  6,  7, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VictoryPortCaptain2Script, -1
