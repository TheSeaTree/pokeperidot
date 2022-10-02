	const_def 2 ; object constants
	const BATTLESUBWAYBOSSROOM_BOSS

BattleSubwayBossTrain_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterBattleRoom ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetPartyDVs

.EnterBattleRoom:
	priorityjump Script_BossBoardTrain
	setscene SCENE_FINISHED
	end

.DummyScene:
	end

.SetPartyDVs:
	special UpdatePartyStats
	special HealParty
	return

Script_BossBoardTrain:
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerWalksIn

	opentext
	writetext Text_BattleSubwayBossIntro
	waitbutton
	closetext
	setlasttalked BATTLESUBWAYBOSSROOM_BOSS

	winlosstext Text_BattleSubwayWinText, Text_BattleSubwayLossText
	callasm CheckLevelGroup
 	ifequal  2, .Level20
 	ifequal  3, .Level30
 	ifequal  4, .Level40
 	ifequal  5, .Level50
 	ifequal  6, .Level60
 	ifequal  7, .Level70
 	ifequal  8, .Level80
 	ifequal  9, .Level90
 	ifequal 10, .Level100
	loadtrainer PERRY, BOSS_LV10
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV10
	jump .DoBattle
.Level20:
	loadtrainer PERRY, BOSS_LV20
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV20
	jump .DoBattle
.Level30:
	loadtrainer PERRY, BOSS_LV30
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV30
	jump .DoBattle
.Level40:
	loadtrainer PERRY, BOSS_LV40
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV40
	jump .DoBattle
.Level50:
	loadtrainer PERRY, BOSS_LV50
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV50
	jump .DoBattle
.Level60:
	loadtrainer PERRY, BOSS_LV60
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV60
	jump .DoBattle
.Level70:
	loadtrainer PERRY, BOSS_LV70
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV70
	jump .DoBattle
.Level80:
	loadtrainer PERRY, BOSS_LV80
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV80
	jump .DoBattle
.Level90:
	loadtrainer PERRY, BOSS_LV90
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV90
	jump .DoBattle
.Level100:
	loadtrainer PERRY, BOSS_LV100
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DoBattle
	loadtrainer JADE, BOSS_LV100
.DoBattle
	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH

	startbattle
	special LoadPokemonData
	reloadmap
	ifnotequal $0, Script_FailedBattleTowerChallenge
	special BattleSubway_IncreaseCurrentStreak
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain
	warpcheck
	end

Text_BattleSubwayBossIntro:
	text "You must be good"
	line "if you beat 25"
	cont "trainers in a row."

	para "Show me exactly"
	line "how good you are."
	done

Text_BattleSubwayWinText:
	text "I'm impressed, that"
	line "was my first diff-"
	cont "icult battle I had"
	cont "in this challenge."

	para "I hope we can meet"
	line "each other again."
	done

Text_BattleSubwayLossText:
	text "How disappointing."

	para "You're good, but"
	line "I expected a more"
	cont "difficult battle."
	done

BattleSubwayBossTrain_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1,  5, BATTLE_SUBWAY_PLATFORM, 3
	warp_event  7,  3, BATTLE_SUBWAY_TRAIN, 3
	warp_event  0,  3, BATTLE_SUBWAY_TRAIN, 2
	warp_event  6,  5, BATTLE_SUBWAY_PLATFORM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_SUBWAY_BOSS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
