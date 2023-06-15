	const_def 2 ; object constants
	const BATTLESIMULATION_SCIENTIST1
	const BATTLESIMULATION_SCIENTIST2
	const BATTLESIMULATION_SCIENTIST3
	const BATTLESIMULATION_SCIENTIST4
	const BATTLESIMULATION_SCIENTIST5
	const BATTLESIMULATION_SUPER_NERD

BattleSimulation_MapScripts:
	db 4 ; scene scripts
	scene_script .Scene0 ; SCENE_BATTLESIMULATION_DEFAULT
	scene_script .Scene1 ; SCENE_BATTLESIMULATION_CHALLENGE
	scene_script .Scene2 ; SCENE_BATTLESIMULATION_FINISHED
	scene_script .Scene3 ; SCENE_BATTLESIMULATION_RETURNED_TO_PRESENT

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Scientist

.Scene0:
	end

.Scene1:
	opentext
	writetext BattleSimulationChallengeCancelled
	waitbutton
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end
	
.Scene2:
	playsound SFX_WARP_FROM
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_MENU
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special ReplaceKrisSprite
	applymovement PLAYER, BattleSimulationPlayerLeaveMachine
	applymovement BATTLESIMULATION_SCIENTIST1, BattleSimulationBlockEntrance
	special LoadPokemonData
	clearflag ENGINE_BATTLE_SIMULATION_ACTIVE
	setscene SCENE_BATTLESIMULATION_DEFAULT
	special UpdatePartyStats
;	special DoQuickSave
	; Check the player's score an issue a reward.
	end

.Scene3:
	applymovement PLAYER, BattleSimulationPlayerStepDown
	turnobject BATTLESIMULATION_SCIENTIST4, LEFT
	showemote EMOTE_SHOCK, BATTLESIMULATION_SCIENTIST4, 15
	applymovement BATTLESIMULATION_SCIENTIST4, BattleSimulationBlockEntrance
	applymovement PLAYER, BattleSimulationPlayerLeaveTimeMachine
	applymovement BATTLESIMULATION_SCIENTIST4, BattleSimulationTimeMachineBlock
	; Do the re-entry scene after the Celebi boss.
	checkevent EVENT_FOUGHT_BOSS_CELEBI
	iffalse .Fainted
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.Fainted:
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.Scientist
	checkscene SCENE_BATTLESIMULATION_FINISHED
	iffalse .nothing
	moveobject BATTLESIMULATION_SCIENTIST1, 9, 7
	turnobject BATTLESIMULATION_SCIENTIST1, RIGHT
.nothing
	return

BattleSimulationGuy:
	opentext
	writebyte EGG
	special FindPartyMonThatSpecies
	iftrue .Decline
	setscene SCENE_BATTLESIMULATION_CHALLENGE
;	special TryQuickSave
;	iffalse .Decline
	writetext BattleSimulationTakeASeatText
	waitbutton
	closetext
	follow BATTLESIMULATION_SCIENTIST1, PLAYER
	applymovement BATTLESIMULATION_SCIENTIST1, BattleSimulationEntrance
	stopfollow
	applymovement PLAYER, BattleSimulationPlayerEnterMachine
	setflag ENGINE_BATTLE_SIMULATION_ACTIVE
	special UpdatePartyStats
	special DropOffParty
;	givepoke MEWTWO, 100
	special GiveShuckle
	loadvar wParkBallsRemaining, 30
	playsound SFX_MENU
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	special ReplaceKrisSprite
;	waitsfx
	wait 5
	applymovement BATTLESIMULATION_SCIENTIST1, BattleSimulationActivateComputer
	playsound SFX_BOOT_PC
	wait 15
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	clearevent EVENT_BATTLE_SIM_VISITED_SKY
	clearevent EVENT_BATTLE_SIM_VISITED_GRAVEYARD
	clearevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	clearevent EVENT_BATTLE_SIM_VISITED_VOLCANO
	clearevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
	clearevent EVENT_BATTLE_SIM_VISITED_FOREST
	clearevent EVENT_BATTLE_SIM_VISITED_CASTLE
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	scall .ChooseRandomSpawn
;	warpfacing UP, BATTLE_SIMULATION_FINAL_ROOM, 2, 7
	warpcheck
	end

.Decline
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.ChooseRandomSpawn
	random 7
	ifequal 1, .WarpSky
	ifequal 2, .WarpComputer
	ifequal 3, .WarpGraveyard
	ifequal 4, .WarpIce
	ifequal 5, .WarpVolcano
	ifequal 6, .WarpForest

	warpmod 1, BATTLE_SIM_CASTLE_1
	return

.WarpSky:
	warpmod 1, BATTLE_SIM_SKY_1
	return

.WarpComputer:
	warpmod 1, BATTLE_SIM_COMP_1
	return

.WarpGraveyard:
	warpmod 1, BATTLE_SIM_GRAVE_1
	return

.WarpIce:
	warpmod 1, BATTLE_SIM_LAVA_1
	return

.WarpVolcano:
	warpmod 1, BATTLE_SIM_LAVA_1
	return

.WarpForest:
	warpmod 1, BATTLE_SIM_FOREST_1
	return

BattleSimulationBPExchange:
	faceplayer
	opentext
	pokemart MARTTYPE_SUBWAY, 0
	closetext
	end

BattleSimItemball:
	random 15
	ifgreater 10, .WildEncounter
	ifgreater  4, .Found5Balls
	ifgreater  6, .Found10Balls
	ifequal 7, .Found20Balls
	writetext BattleSimFoundSacredAshText
	special HealParty
	playsound SFX_FULL_HEAL
	waitsfx
	writetext BattleSimPlayerUsedSacredAshText
	waitbutton
	jump .Done
.Found5Balls
	copybytetovar wParkBallsRemaining
	addvar 5
	copyvartobyte wParkBallsRemaining
	writetext BattleSimFound5CyberBallsText
	waitbutton
	jump .Done
.Found10Balls
	copybytetovar wParkBallsRemaining
	addvar 10
	copyvartobyte wParkBallsRemaining
	writetext BattleSimFound10CyberBallsText
	waitbutton
	jump .Done
.Found20Balls	
	copybytetovar wParkBallsRemaining
	addvar 20
	copyvartobyte wParkBallsRemaining
	writetext BattleSimFound20CyberBallsText
	waitbutton
.Done
	closetext
	end

.WildEncounter:
	writetext BattleSimItemballEncounterText
	waitbutton
	closetext
	jumpstd battlesimencounter

BattleSimMoveRelearner:
	faceplayer
	opentext
	special SpecialMoveRelearner
	waitbutton
	closetext
	end

BattleSimHealer:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .NotFirstTime
	writetext BattleSimHealerFirstTimeText
	yesorno
	iffalse .Decline
.DoHeal
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext BattleSimHealerAllSetText
	waitbutton
	writetext BattleSimHealerDeclineText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	end

.NotFirstTime
	writetext BattleSimHealerCostText
	yesorno
	iffalse .Decline
	copybytetovar wSimulationPoints
	ifless 10, .NotEnoughPoints
	copybytetovar wSimulationPoints
	addvar -10
	copyvartobyte wSimulationPoints
	jump .DoHeal

.NotEnoughPoints
	writetext BattleSimHealerNotEnoughPointsText
	waitbutton
	closetext
	end

.Decline
	writetext BattleSimHealerDeclineText
	waitbutton
	closetext
	end

SimulationMoveReminder:
	faceplayer
	opentext
	special SimulationMoveRelearner
	waitbutton
	closetext
	end

BattleSimulationEntrance:
	step UP
	step RIGHT
	turn_head LEFT
	step_end

BattleSimulationActivateComputer:
	step RIGHT
	turn_head UP
	step_end

BattleSimulationPlayerEnterMachine:
	step UP
	turn_head DOWN
	step_sleep 10
	step_resume

BattleSimulationBlockEntrance:
	step LEFT
	step DOWN
	step_resume

BattleSimulationPlayerLeaveMachine:
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

BattleSimulationPlayerStepDown:
	step DOWN
	step_resume

BattleSimulationPlayerLeaveTimeMachine:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

BattleSimulationTimeMachineBlock:
	step UP
	step RIGHT
	step_end

BattleSimulationTakeASeatText:
	text "Please take a seat"
	line "at the terminal"
	cont "and put on the"
	cont "headset."
	done

BattleSimulationChallengeCancelled:
	text "The connection to"
	line "virtual reality"
	cont "was lost."

	para "We're sorry, but"
	line "your challenge has"
	cont "been forfeit."
	done

BattleSimItemBallText:
	text "It's an ITEM"
	line "CAPSULE."

	para "Open it?"
	done

BattleSimFoundSacredAshText:
	text "<PLAYER> found"
	line "some SACRED ASH!"
	done

BattleSimPlayerUsedSacredAshText:
	text "<PLAYER>'s #MON"
	line "were restored to"
	cont "full health!"
	done

BattleSimFound5CyberBallsText:
	text "<PLAYER> found"
	line "5 CYBER BALLs!"
	done

BattleSimFound10CyberBallsText:
	text "<PLAYER> found"
	line "10 CYBER BALLs!"
	done

BattleSimFound20CyberBallsText:
	text "<PLAYER> found"
	line "20 CYBER BALLs!"
	done

BattleSimFound5PointsText:
	text "<PLAYER> found"
	line "5 points!"
	done

BattleSimHealerFirstTimeText:
	text "Would you like to"
	line "heal your #MON?"

	para "The first time is"
	line "free."
	done

BattleSimHealerCostText:
	text "Would you like to"
	line "heal your #MON?"

	para "It will cost you"
	line "10 points."
	done

BattleSimHealerDeclineText:
	text "Good luck,"
	line "<PLAYER>!"
	done

BattleSimHealerNotEnoughPointsText:
	text "Oh, I'm sorry…"

	para "You don't have"
	line "enough points to"
	cont "heal your #MON."
	done

BattleSimHealerAllSetText:
	text "All done!"

	para "Your #MON are"
	line "fighting fit!"
	done

BattleSimItemballEncounterText:
	text "There is a wild"
	line "#MON inside!"

	para "The wild #MON"
	line "attacked!"
	done

BattleSimTrainerText:
	text "Battle protocol"
	line "initiated."
	done

BattleSimTrainerWinText:
	text "Battle complete."
	
	para "Winner: <PLAYER>."
	done

BattleSimTrainerAfterText:
	text "Unable to battle."
	done

;	setflag ENGINE_BATTLE_SIMULATION_ACTIVE
;	special DropOffParty
;	special GiveShuckle
;	loadvar wParkBallsRemaining, 30

; When leaving...
;	special LoadPokemonData

; For the interior maps, make sure to set a random warp with a callback.
; 1F-4F will be randomized between 4 different maps each time.
; 5F will contain a boss battle and always be the same.

BattleSimulation_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  1, MAPLES_LAB_ELEVATOR, 1
	warp_event  8,  6, BATTLE_SIMULATION, -1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  8,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BattleSimulationGuy, -1
	object_event 16,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimulationBPExchange, -1
	object_event  6, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
