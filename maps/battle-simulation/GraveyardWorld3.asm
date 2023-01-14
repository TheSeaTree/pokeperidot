	const_def 2 ; object constants

GraveyardWorld3_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Gates

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

Graveyard3Switch1:
	opentext
	changeblock 14, 16, $1e
	changeblock 16, 18, $6f
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	end

Graveyard3Switch2:
	opentext
	changeblock 14,  4, $71
	changeblock  6,  6, $6f
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	end

Graveyard3Switch3:
	opentext
	changeblock  6, 12, $35
	changeblock 10, 10, $6f
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	end

Graveyard3Switch4:
	opentext
	changeblock 12,  2, $1e
	changeblock  6, 16, $6f
	reloadmappart
	closetext
	setevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	end

GraveyardWorld3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 14, 19, BATTLE_SIMULATION, -1 ; Entrance
	warp_event  5,  0, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 16, 18, BGEVENT_UP, Graveyard2Switch1
	bg_event  6,  6, BGEVENT_UP, Graveyard2Switch2
	bg_event 10, 10, BGEVENT_UP, Graveyard2Switch3
	bg_event  6, 16, BGEVENT_UP, Graveyard2Switch4

	db 0 ; object events
