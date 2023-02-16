	const_def 2 ; object constants

CastleWorld1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetRandomWarps

.SetRandomWarps
	setevent EVENT_BATTLE_SIM_VISITED_CASTLE
.Reroll
	random 6
	ifequal 1, .WarpComputer
	ifequal 2, .WarpGraveyard
	ifequal 3, .WarpSky
	ifequal 4, .WarpVolcano
	ifequal 5, .WarpForest

	checkevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_ICE_2
	return

.WarpComputer:
	checkevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_COMP_1
;	warpmod 1, BATTLE_SIM_COMP_2
	return

.WarpGraveyard:
	checkevent EVENT_BATTLE_SIM_VISITED_GRAVEYARD
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_GRAVE_1
;	warpmod 1, BATTLE_SIM_GRAVE_2
	return

.WarpSky:
	checkevent EVENT_BATTLE_SIM_VISITED_SKY
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_SKY_2
	return

.WarpVolcano:
	checkevent EVENT_BATTLE_SIM_VISITED_VOLCANO
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_LAVA_1
;	warpmod 1, BATTLE_SIM_LAVA_2
	return

.WarpForest:
	checkevent EVENT_BATTLE_SIM_VISITED_FOREST
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_FOREST_1
;	warpmod 1, BATTLE_SIM_FOREST_2
	return

BattleSimMoveRelearner:
	faceplayer
	opentext
	special SpecialMoveRelearner
	waitbutton
	closetext
	end
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_FINISHED
	playsound SFX_WARP_FROM
	special FadeOutPalettes
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	warpfacing DOWN, BATTLE_SIMULATION, 8, 6
	end

CastleWorld1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 15, BATTLE_SIMULATION, -1 ; Entrance
	warp_event  8,  4, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 12, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimMoveRelearner, -1
