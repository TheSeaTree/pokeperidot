	const_def 2 ; object constants

IceWorld1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetRandomWarps

.SetRandomWarps
	setevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
.Reroll
	random 6
	ifequal 1, .WarpComputer
	ifequal 2, .WarpGraveyard
	ifequal 3, .WarpSky
	ifequal 4, .WarpVolcano
	ifequal 5, .WarpForest

	checkevent EVENT_BATTLE_SIM_VISITED_CASTLE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_CASTLE_2
	return

.WarpComputer:
	checkevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_COMP_2
	return

.WarpGraveyard:
	checkevent EVENT_BATTLE_SIM_VISITED_GRAVEYARD
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_GRAVE_2
	return

.WarpSky:
	checkevent EVENT_BATTLE_SIM_VISITED_SKY
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_SKY_2
	return

.WarpVolcano:
	checkevent EVENT_BATTLE_SIM_VISITED_VOLCANO
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_LAVA_2
	return

.WarpForest:
	checkevent EVENT_BATTLE_SIM_VISITED_FOREST
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_FOREST_2
	return

BattleSimIce1Trainer1:
	trainer SKIER, ICE1_TRAINER1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	; Text telling the player they gained points
	; Alternatively, this text should be shown in the victory screen.
	copybytetovar wSimulationPoints
	addvar 1
	copyvartobyte wSimulationPoints
	end
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimIce1Trainer2:
	trainer BOARDER, ICE1_TRAINER2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	; Text telling the player they gained points
	; Alternatively, this text should be shown in the victory screen.
	copybytetovar wSimulationPoints
	addvar 1
	copyvartobyte wSimulationPoints
	end
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

IceWorld1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16, 16, BATTLE_SIMULATION, -1 ; Entrance
	warp_event  9,  2, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, BattleSimIce1Trainer1, -1
	object_event 15, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, BattleSimIce1Trainer2, -1
