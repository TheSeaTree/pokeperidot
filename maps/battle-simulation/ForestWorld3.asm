	const_def 2 ; object constants

ForestWorld3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForestWorld3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 16, 14, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
