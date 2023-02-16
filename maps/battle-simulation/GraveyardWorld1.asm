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
	warpmod 1, BATTLE_SIM_CASTLE_1
;	warpmod 1, BATTLE_SIM_CASTLE_2
	return

.WarpComputer:
	checkevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_COMP_1
;	warpmod 1, BATTLE_SIM_COMP_2
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

.WarpIceCave:
	checkevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_ICE_2
	return

.WarpForest:
	checkevent EVENT_BATTLE_SIM_VISITED_FOREST
	iftrue .Reroll
	warpmod 1, BATTLE_SIM_FOREST_1
;	warpmod 1, BATTLE_SIM_FOREST_2
	return

.Gates:
	checkevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	iffalse .Gate2
	changeblock 14, 16, $1e
	changeblock 16, 18, $6f
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
	changeblock 16, 18, $6f
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_1
.Decline
	end

.Reset
	changeblock 14, 16, $38
	changeblock 16, 18, $6e
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
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_2
.Decline
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
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_3
.Decline
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
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_4
.Decline
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

	db 0 ; object events
