	const_def 2 ; object constants

GraveyardWorld3_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .GrantPoints
	callback MAPCALLBACK_TILES, .Gates

.GrantPoints
	; Make sure this only gives points once.
	; Adjust the amount of points gained later.
	copybytetovar wBlueCardBalance
	addvar 5
	copyvartobyte wBlueCardBalance
	return

.Gates:
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iffalse .NoGates
	changeblock 12, 10, $6f
	changeblock 30,  2, $35
.NoGates
	return

Graveyard3Switch:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iftrue .Reset
	changeblock 12, 10, $6f
	changeblock 30,  2, $35
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_1
.Decline
	end

.Reset
	changeblock 12, 10, $6e
	changeblock 30,  2, $6c
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	end

BattleSimGraveyard3Trainer1:
	trainer MEDIUM, GRAVE3_TRAINER1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage3TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard3Trainer2:
	trainer OFFICER, GRAVE3_TRAINER2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage3TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard3Trainer3:
	trainer POKEMANIAC, GRAVE3_TRAINER3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage3TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard3BonusTrainer:
	trainer GUITARIST, GRAVE3_BONUS, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	; Text telling the player they gained points
	; Alternatively, this text should be shown in the victory screen.
	copybytetovar wBlueCardBalance
	addvar 10
	copyvartobyte wBlueCardBalance
	end
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard3Itemball1:
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

BattleSimGraveyard3Itemball2:
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

BattleSimGraveyard3Itemball3:
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

BattleSimGraveyard3Itemball4:
	opentext
	writetext BattleSimItemBallText
	yesorno
	iffalse .No
	scall BattleSimItemball
	disappear LAST_TALKED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
.No
	closetext
	end

GraveyardWorld3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 19, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 27, 18, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 10, BGEVENT_UP, Graveyard3Switch

	db 9 ; object events
	object_event  9, 30, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, BattleSimGraveyard3Trainer1, -1
	object_event 20, 22, SPRITE_OFFICER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, BattleSimGraveyard3Trainer2, -1
	object_event 52, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, BattleSimGraveyard3Trainer3, -1
	object_event 37, 31, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, BattleSimGraveyard3BonusTrainer, -1
	object_event  9, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard3Itemball1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 26, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard3Itemball2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event 46, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard3Itemball3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	object_event 33, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard3Itemball4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	object_event 39,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BattleSimMoveRelearner, -1
