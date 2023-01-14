	const_def 2 ; object constants
	const BATTLESIMULATION_MAPLE

BattleSimulationFinalRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Callback

.Callback
	return

BattleSimulationMaple:
	opentext
	faceplayer
	loadtrainer PROFESSOR, MAPLE
	startbattle
	closetext
	end

BattleSimulationFinalRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  2,  7, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  2, SPRITE_PROFESSOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimulationMaple, -1
