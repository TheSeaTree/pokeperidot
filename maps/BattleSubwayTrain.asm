	const_def 2 ; object constants
	const BATTLETOWERBATTLEROOM_YOUNGSTER

BattleSubwayTrain_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterBattleRoom ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SetTrainerSprite

.EnterBattleRoom:
	priorityjump Script_BoardTrain
	setscene SCENE_FINISHED
	end

.DummyScene:
	priorityjump Script_BattleRoom
	end
	
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
	ifequal BATTLETOWER_STREAK_LENGTH, Script_BeatenAllTrainers
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksOut
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist
	playsound SFX_FULL_HEAL
	waitsfx
	opentext
	writetext Text_Got1BP
	givecoins 1
;	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
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
	writebyte BATTLETOWERACTION_SAVELEVELGROUP ; save level group
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVEOPTIONS ; choose reward
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVE_AND_QUIT ; quicksave
	special BattleTowerAction
	playsound SFX_SAVE
	waitsfx
	special FadeOutPalettes
	special Reset
Script_DontSaveAndEndTheSession:
	writetext Text_CancelYourBattleRoomChallenge
	yesorno
	iffalse Script_ContinueAndBattleNextOpponent
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	closetext
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain
	special FadeOutPalettes
	warpfacing RIGHT, BATTLE_SUBWAY_PLATFORM, 9, 7
	opentext
	jump Script_BattleTowerHopeToServeYouAgain

Script_FailedBattleTowerChallenge:
	warpfacing RIGHT, BATTLE_SUBWAY_PLATFORM, 9, 7
	pause 60
	special BattleTowerFade
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_ThanksForVisiting
	waitbutton
	closetext
	end

Script_BeatenAllTrainers:
	setmapscene BATTLE_SUBWAY_PLATFORM, SCENE_FINISHED
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain
	warpcheck
	end

Text_Got1BP:
	text "<PLAYER> got 1BP."
	done

BattleSubwayTrain_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  1,  5, BATTLE_SUBWAY_PLATFORM, 3
	warp_event  7,  3, BATTLE_SUBWAY_TRAIN, 3
	warp_event  0,  3, BATTLE_SUBWAY_TRAIN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
