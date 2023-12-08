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
	writetext BattleSimulationMapleChallengeText
	winlosstext BattleSimulationMapleWinText, 0
	loadtrainer PROFESSOR, MAPLE
	startbattle
	reloadmap
	ifnotequal $0, .Loss
	copybytetovar wBlueCardBalance
	addvar 25
	copyvartobyte wBlueCardBalance
.Loss
	special FadeOutPalettes
	warpfacing DOWN, BATTLE_SIMULATION, 8, 6
	end

BattleSimulationMapleChallengeText:
	text "MAPLE: Oh!"
	line "You made it!"

	para "I'm not the real"
	line "PROF. MAPLE, I am"
	cont "an AI used to"
	cont "battle."

	para "If you can defeat"
	line "me, you will have"
	cont "won the BATTLE"
	cont "SIMULATION!"
	done

BattleSimulationMapleWinText:
	text "Congratulations,"
	line "<PLAYER>!"

	para "You have won the"
	line "BATTLE SIMULATION!"
	done

BattleSimulationFinalRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  2,  7, BATTLE_SIMULATION_FINAL_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  2, SPRITE_PROFESSOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimulationMaple, -1
