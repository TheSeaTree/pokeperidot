	const_def 2 ; object constants

LavaWorld2_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetRandomWarps

.SetRandomWarps
	; Make sure this only gives points once.
	; Adjust the amount of points gained later.
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance

	setevent EVENT_BATTLE_SIM_VISITED_VOLCANO
.Reroll
	random 6
	ifequal 1, .WarpComputer
	ifequal 2, .WarpGraveyard
	ifequal 3, .WarpSky
	ifequal 4, .WarpIceCave
	ifequal 5, .WarpForest

	checkevent EVENT_BATTLE_SIM_VISITED_CASTLE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_CASTLE_3
	return

.WarpComputer:
	checkevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_COMP_3
	return

.WarpGraveyard:
	checkevent EVENT_BATTLE_SIM_VISITED_GRAVEYARD
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_GRAVE_3
	return

.WarpSky:
	checkevent EVENT_BATTLE_SIM_VISITED_SKY
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_SKY_3
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

BattleSimLava2Trainer1:
	trainer FIREBREATHER, LAVA2_TRAINER1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	; Text telling the player they gained points
	; Alternatively, this text should be shown in the victory screen.
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance
	end
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimLava2Trainer2:
	trainer BIKER, LAVA2_TRAINER2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	; Text telling the player they gained points
	; Alternatively, this text should be shown in the victory screen.
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance
	end
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimLava2Trainer3:
	trainer HIKER, LAVA2_TRAINER3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	; Text telling the player they gained points
	; Alternatively, this text should be shown in the victory screen.
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance
	end
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimLava2Itemball1:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
.No
	closetext
	end

BattleSimLava2Itemball2:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
.No
	closetext
	end

BattleSimLava2Itemball3:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
.No
	closetext
	end

LavaWorld2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16, 10, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 29,  1, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 24,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, BattleSimLava2Trainer1, -1
	object_event 28, 25, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, BattleSimLava2Trainer2, -1
	object_event 13, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, BattleSimLava2Trainer3, -1
	object_event 32, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 3, BattleSimLava2Itemball1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 23, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 3, BattleSimLava2Itemball2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event  8,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 3, BattleSimLava2Itemball3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	object_event 28, 19, SPRITE_SIM_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSimHealer, -1
