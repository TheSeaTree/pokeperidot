	const_def 2 ; object constants
	const BATTLETOWERBATTLEROOM_YOUNGSTER

BattleSubwayTrain_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterBattleRoom ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetPartyDVs
	callback MAPCALLBACK_OBJECTS, .SetTrainerSprite

.EnterBattleRoom:
	priorityjump Script_BoardTrain
	setscene SCENE_FINISHED
	end

.DummyScene:
	priorityjump Script_BattleRoom
	end

.SetPartyDVs:
	special UpdatePartyStats
	warpmod 3, BATTLE_SUBWAY_TRAIN
	return
	
.SetTrainerSprite:
	writebyte BATTLETOWERBATTLEROOM_YOUNGSTER
	special LoadOpponentTrainerAndPokemonWithOTSprite
	appear BATTLETOWERBATTLEROOM_YOUNGSTER
	return

HidePlayerSprite:
	hide_person
	step_end

Script_BoardTrain:
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerBoardsTrain
	jump Script_BattleRoomLoop
	
; Try calling SavePlayerData when ending the challenge. See if it breaks anything. If so, try and get the current wCoins amount to write to the save file so that BP isn't lost when quitting out.

Script_BattleRoom:
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerWalksIn
; beat all 7 opponents in a row
Script_BattleRoomLoop:
	opentext
	battletowertext BATTLETOWERTEXT_INTRO
	buttonsound
	closetext
	special BattleTowerBattle ; calls predef startbattle
	special FadeOutPalettes
	reloadmap
	ifnotequal $0, Script_FailedBattleTowerChallenge
	copybytetovar wNrOfBeatenBattleTowerTrainers
;	ifequal 1, Script_BeatenAllTrainers
	ifequal BATTLETOWER_STREAK_LENGTH, Script_BeatenAllTrainers
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksOut
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist
	playsound SFX_FULL_HEAL
	waitsfx
	opentext
	writetext Text_Got1BP
	waitbutton
	givecoins 1
	writetext Text_NextUpOpponentNo
	yesorno
	iffalse Script_DontBattleNextOpponent
Script_ContinueAndBattleNextOpponent:
	closetext
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent
	warpcheck
	end

Script_DontBattleNextOpponent:
	writetext Text_SaveAndEndTheSession
	yesorno
	iffalse Script_DontSaveAndEndTheSession
	closetext
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain2
	setmapscene BATTLE_SUBWAY_PLATFORM, SCENE_BATTLESUBWAYPLATFORM_SUSPEND
	
	writebyte BATTLETOWERACTION_SAVELEVELGROUP ; save level group
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVEOPTIONS ; choose reward
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVE_AND_QUIT ; quicksave
	special BattleTowerAction
	
	warpcheck
	end

Script_BeatenAllTrainers:
;	jump Script_SubwayBossFight
	setmapscene BATTLE_SUBWAY_PLATFORM, SCENE_FINISHED
	
	checkcode VAR_SUBWAY_SET
	addvar 1
	writevarcode VAR_SUBWAY_SET

	checkcode VAR_SUBWAY_SET
	ifequal 5, Script_SubwayBossFight

	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain
	warpcheck
	end

Script_SubwayBossFight:
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksOut
	applymovement PLAYER, MovementData_BattleSubwayPlayerWalkToBoss
	warpmod 3, BATTLE_SUBWAY_BOSS_TRAIN
	warpcheck
	end

Text_Got1BP:
	text "<PLAYER> got 1BP."
	done

BattleSubwayTrain_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1,  5, BATTLE_SUBWAY_PLATFORM, 3
	warp_event  7,  3, BATTLE_SUBWAY_TRAIN, -1
	warp_event  0,  3, BATTLE_SUBWAY_TRAIN, 2
	warp_event  6,  5, BATTLE_SUBWAY_PLATFORM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
