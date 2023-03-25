	const_def 2 ; object constants

CastleWorld2_MapScripts:
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
	warpmod 1, BATTLE_SIM_ICE_3
	return

.WarpComputer:
	checkevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	iftrue .Reroll
;	warpmod 1, BATTLE_SIM_COMP_3
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

.WarpVolcano:
	checkevent EVENT_BATTLE_SIM_VISITED_VOLCANO
	iftrue .Reroll
;	warpmod 1, BATTLE_SIM_LAVA_3
	return

.WarpForest:
	checkevent EVENT_BATTLE_SIM_VISITED_FOREST
	iftrue .Reroll
;	warpmod 1, BATTLE_SIM_FOREST_3
	return

CastleWorld2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 27, BATTLE_SIMULATION, -1 ; Entrance
	warp_event  8,  6, BATTLE_SIMULATION, -1 ; Exit

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
