	const_def 2 ; object constants

CyberspaceWorld2_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetRandomWarps

.SetRandomWarps
	; Make sure this only gives points once.
	; Adjust the amount of points gained later.
	copybytetovar wSimulationPoints
	addvar 1
	copyvartobyte wSimulationPoints

	setevent EVENT_BATTLE_SIM_VISITED_COMPUTER
.Reroll
	random 6
	ifequal 1, .WarpSky
	ifequal 2, .WarpGraveyard
	ifequal 3, .WarpVolcano
	ifequal 4, .WarpIceCave
	ifequal 5, .WarpForest

	checkevent EVENT_BATTLE_SIM_VISITED_CASTLE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_CASTLE_3
	return

.WarpSky:
	checkevent EVENT_BATTLE_SIM_VISITED_SKY
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_SKY_3
	return

.WarpGraveyard:
	checkevent EVENT_BATTLE_SIM_VISITED_SKY
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_SKY_3
	return

.WarpVolcano:
	checkevent EVENT_BATTLE_SIM_VISITED_VOLCANO
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_LAVA_3
	return

.WarpIceCave:
	checkevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_ICE_3
	return

.WarpForest:
	checkevent EVENT_BATTLE_SIM_VISITED_FOREST
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_FOREST_3
	return

BattleSimCyberspace2Trainer1:
	trainer SCIENTIST, COMP2_TRAINER1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

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

BattleSimCyberspace2Trainer2:
	trainer ENGINEER, COMP2_TRAINER2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

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

BattleSimCyberspace2Trainer3:
	trainer SUPER_NERD, COMP2_TRAINER3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

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

BattleSimCyberspace2Itemball1:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
.No
	end

BattleSimCyberspace2Itemball2:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
.No
	end

BattleSimCyberspace2Itemball3:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
.No
	end

CyberspaceWorld2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 13, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 14, 13, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  2, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, BattleSimCyberspace2Trainer1, -1
	object_event 21, 16, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, BattleSimCyberspace2Trainer2, -1
	object_event  7, 12, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, BattleSimCyberspace2Trainer3, -1
	object_event 23, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimCyberspace2Itemball1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 14, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimCyberspace2Itemball2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event 16, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimCyberspace2Itemball3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	object_event  7,  3, SPRITE_SIM_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSimHealer, -1
