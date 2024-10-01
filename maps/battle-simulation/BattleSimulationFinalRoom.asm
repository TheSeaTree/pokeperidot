	const_def 2 ; object constants
	const BATTLESIMULATION_MAPLE

BattleSimulationFinalRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BattleSimulationMaple:
	opentext
	faceplayer
	special HealParty
	writetext BattleSimulationMapleChallengeText
	waitbutton
	winlosstext BattleSimulationMapleWinText, 0
	random 4
	ifequal 1, .Maple2
	ifequal 2, .Maple3
	ifequal 3, .Maple4
	loadtrainer PROFESSOR, MAPLE1
	jump .DoBattle
.Maple2
	loadtrainer PROFESSOR, MAPLE2
	jump .DoBattle
.Maple3
	loadtrainer PROFESSOR, MAPLE3
	jump .DoBattle
.Maple4
	loadtrainer PROFESSOR, MAPLE4
.DoBattle
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	ifnotequal $0, .Loss
	setevent EVENT_BATTLE_SIM_DEFEATED_BOSS
.Loss
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_FINISHED
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	special ReplaceKrisSprite
	playsound SFX_WARP_FROM
	waitsfx
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

	para "Get ready!"
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
