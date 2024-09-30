	const_def 2 ; object constants

GraveyardWorld1_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetRandomWarps
	callback MAPCALLBACK_TILES, .Gates

.SetRandomWarps
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
	warpmod 1, BATTLE_SIM_CASTLE_2
	return

.WarpComputer:
	checkevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_COMP_2
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

.WarpIceCave:
	checkevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_ICE_2
	return

.WarpForest:
	checkevent EVENT_BATTLE_SIM_VISITED_FOREST
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_FOREST_2
	return

.Gates:
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iffalse .Gate2
	changeblock 14, 16, $1e
	changeblock  0, 14, $6f
.Gate2
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	iffalse .Gate3
	changeblock 14,  4, $71
	changeblock  6,  6, $6f
.Gate3
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	iffalse .Gate4
	changeblock  6, 12, $35
	changeblock 10, 10, $6f
.Gate4
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	iffalse .NoGates
	changeblock 12,  2, $1e
	changeblock  6, 16, $6f
.NoGates
	return

BattleSimGraveyard1Trainer1:
	trainer MEDIUM, GRAVE1_TRAINER1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage1TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard1Trainer2:
	trainer OFFICER, GRAVE1_TRAINER2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage1TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard1Trainer3:
	trainer POKEMANIAC, GRAVE1_TRAINER3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3, BattleSimTrainerText, BattleSimTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	jump SimulationStage1TrainerCheck
.After
	opentext
	writetext BattleSimTrainerAfterText
	waitbutton
	closetext
	end

BattleSimGraveyard1Itemball1:
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

BattleSimGraveyard1Itemball2:
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

BattleSimGraveyard1Itemball3:
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

GraveyardSwitch1:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iftrue .Reset
	changeblock 14, 16, $1e
	changeblock  0, 14, $6f
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_1
.Decline
	closetext
	end

.Reset
	changeblock 14, 16, $38
	changeblock  0, 14, $6e
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	end

GraveyardSwitch2:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	iftrue .Reset
	changeblock 14,  4, $71
	changeblock  6,  6, $6f
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_2
.Decline
	closetext
	end

.Reset
	changeblock 14,  4, $70
	changeblock  6,  6, $6e
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	end
	

GraveyardSwitch3:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	iftrue .Reset
	changeblock  6, 12, $35
	changeblock 10, 10, $6f
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_3
.Decline
	closetext
	end

.Reset
	changeblock  6, 12, $6c
	changeblock 10, 10, $6e
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	end

GraveyardSwitch4:
	opentext
	writetext GraveyardGateAskText
	yesorno
	iffalse .Decline
	writetext GraveyardGateConfirmText
	waitbutton
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	iftrue .Reset
	changeblock 12,  2, $1e
	changeblock  6, 16, $6f
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	reloadmappart
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_4
.Decline
	closetext
	end

.Reset
	changeblock 12,  2, $38
	changeblock  6, 16, $6e
	reloadmappart
	closetext
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	end

GraveyardGateAskText:
	text "There's a switch on"
	line "this headstone."

	para "Flip it?"
	done

GraveyardGateConfirmText:
	text "Who wouldn't?"
	done

GraveyardWorld1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 14, 19, BATTLE_SIMULATION, -1 ; Entrance
	warp_event  5,  0, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0, 14, BGEVENT_UP, GraveyardSwitch1
	bg_event  6,  6, BGEVENT_UP, GraveyardSwitch2
	bg_event 10, 10, BGEVENT_UP, GraveyardSwitch3
	bg_event  6, 16, BGEVENT_UP, GraveyardSwitch4

	db 6 ; object events
	object_event  8,  7, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, BattleSimGraveyard1Trainer1, -1
	object_event 12, 11, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, BattleSimGraveyard1Trainer2, -1
	object_event  4, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, BattleSimGraveyard1Trainer3, -1
	object_event  3, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard1Itemball1, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 18,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard1Itemball2, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event  3,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimGraveyard1Itemball3, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
