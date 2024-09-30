	const_def 2 ; object constants

GraveyardWorld2_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetRandomWarps
	callback MAPCALLBACK_TILES, .Gates

.SetRandomWarps
	; Make sure this only gives points once.
	; Adjust the amount of points gained later.
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance

	setevent EVENT_BATTLE_SIM_VISITED_GRAVEYARD
.Reroll
	random 6
	ifequal 1, .WarpComputer
	ifequal 2, .WarpSky
	ifequal 3, .WarpVolcano
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

.WarpSky:
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

.Gates:
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iffalse .Gate2
	changeblock 22, 22, $71
	changeblock 30, 18, $6f
.Gate2
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	iffalse .Gate3
	changeblock 20, 12, $71
	changeblock 14, 12, $38
	changeblock 14, 14, $38
	changeblock  4, 20, $6f
.Gate3
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	iffalse .Gate4
	changeblock 14, 14, $1e
	changeblock 20, 12, $70
	changeblock  4,  4, $6f
.Gate4
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	iffalse .NoGates
	changeblock 14, 12, $1e
	changeblock 14,  4, $6c
	changeblock 28,  8, $6f
.NoGates
	return

Graveyard2Switch1:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iftrue .Reset
	changeblock 22, 22, $71 ; open gate 1
	changeblock 30, 18, $6f ; switch
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_1
.Decline
	closetext
	end

.Reset
	changeblock 22, 22, $70 ; close gate 1
	changeblock 30, 18, $6e ; switch
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	end

Graveyard2Switch2:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	iftrue .Reset
	changeblock 20, 12, $71 ; open gate 2
	changeblock 14, 12, $38 ; close gate 4
	changeblock 14, 14, $38 ; close gate 5
	changeblock  4, 20, $6f ; switch
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_2
.Decline
	closetext
	end

.Reset
	changeblock 20, 12, $70 ; close gate 2
	changeblock 14, 12, $38 ; close gate 4
	changeblock 14, 14, $38 ; close gate 5
	changeblock  4, 20, $6e ; switch
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	end

Graveyard2Switch3:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	iftrue .Reset
	changeblock 14, 14, $1e ; open gate 4
	changeblock 20, 12, $70 ; close gate 2
	changeblock  4,  4, $6f ; switch
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_3
.Decline
	closetext
	end

.Reset
	changeblock 14, 14, $38 ; close gate 4
	changeblock 20, 12, $71 ; open gate 2
	changeblock  4,  4, $6e ; switch
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	end

Graveyard2Switch4:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	iftrue .Reset
	changeblock 14, 12, $1e ; open gate 5
	changeblock 14,  4, $6c ; close gate 3
	changeblock 28,  8, $6f ; switch
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_4
.Decline
	closetext
	end

.Reset
	changeblock 14, 12, $38 ; close gate 5
	changeblock 14,  4, $35 ; open gate 3
	changeblock 28,  8, $6e ; switch
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	end

BattleSimGraveyard2Trainer1:
	trainer MEDIUM, GRAVE2_TRAINER1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage2TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard2Trainer2:
	trainer OFFICER, GRAVE2_TRAINER2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage2TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard2Trainer3:
	trainer POKEMANIAC, GRAVE2_TRAINER3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage2TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard2Itemball1:
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

BattleSimGraveyard2Itemball2:
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

BattleSimGraveyard2Itemball3:
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

GraveyardWorld2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 26, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 15, 10, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 4 ; bg events
	bg_event 30, 18, BGEVENT_UP, Graveyard2Switch1
	bg_event  4, 20, BGEVENT_UP, Graveyard2Switch2
	bg_event  4,  4, BGEVENT_UP, Graveyard2Switch3
	bg_event 28,  8, BGEVENT_UP, Graveyard2Switch4

	db 7 ; object events
	object_event 21, 14, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, BattleSimGraveyard2Trainer1, -1
	object_event  2, 15, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, BattleSimGraveyard2Trainer2, -1
	object_event  9, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, BattleSimGraveyard2Trainer3, -1
	object_event  5, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 3, BattleSimGraveyard2Itemball1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event  0, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 3, BattleSimGraveyard2Itemball2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event  5,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 3, BattleSimGraveyard2Itemball3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	object_event 10,  2, SPRITE_SIM_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSimHealer, -1
