	const_def 2 ; object constants

GraveyardWorld3_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Gates

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

GraveyardWorld3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 19, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 27, 18, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 10, BGEVENT_UP, Graveyard3Switch

	db 1 ; object events
	object_event 39,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Move Reminder
