	const_def 2 ; object constants

BattleSimulationTestRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ReturnToReality:
	opentext
	writetext ReturnToRealityText
	yesorno
	iffalse .Decline
	closetext
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_FINISHED
	playsound SFX_WARP_FROM
	special FadeOutPalettes
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	warpfacing DOWN, BATTLE_SIMULATION, 8, 5
	end
	
.Decline
	closetext
	end

ReturnToRealityText:
	text "Return to reality?"
	done

BattleSimulationTestRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 34, 15, BATTLE_SIMULATION, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13,  5, BGEVENT_READ, ReturnToReality

	db 0 ; object events
