	const_def 2 ; object constants

IceWorld3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IceWorld3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 21, 25, BATTLE_SIMULATION, -1 ; Entrance
	warp_event 21,  2, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 12, 24, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Move Reminder
