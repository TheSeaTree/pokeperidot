	const_def 2 ; object constants

ArgentDepthsGateChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .OpenGates
	
.OpenGates:
	checkevent EVENT_ARGENT_DEPTHS_GATE_1
	iffalse .Gate2
	changeblock  4, 12, $a0
	changeblock  6, 12, $a1
.Gate2
	checkevent EVENT_ARGENT_DEPTHS_GATE_2
	iffalse .Gate3
	changeblock  4, 10, $a0
	changeblock  6, 10, $a1
.Gate3
	checkevent EVENT_ARGENT_DEPTHS_GATE_3
	iffalse .skip
	changeblock  4,  8, $a0
	changeblock  6,  8, $a1
.skip
	return

ArgentDepthsGateChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, LUGIA_LAIR, 1
	warp_event  5, 15, ARGENT_DEPTHS_B2F, 9

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
