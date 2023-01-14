	const_def 2 ; object constants

CastleWorld3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CastleWorld3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 15, BATTLE_SIMULATION, -1 ; Entrance
	warp_event  8,  4, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
