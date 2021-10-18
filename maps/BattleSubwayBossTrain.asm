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
	loadtrainer MYSTICALMAN, EUSINE1
	jump .DoBattle
.Level20:
	loadtrainer MYSTICALMAN, EUSINE2
	jump .DoBattle
.Level30:
	loadtrainer MYSTICALMAN, EUSINE3
	jump .DoBattle
.Level40:
	loadtrainer MYSTICALMAN, EUSINE4
	jump .DoBattle
.Level50:
	loadtrainer MYSTICALMAN, EUSINE5
	jump .DoBattle
.Level60:
	loadtrainer MYSTICALMAN, EUSINE6
	jump .DoBattle
.Level70:
	loadtrainer MYSTICALMAN, EUSINE7
	jump .DoBattle
.Level80:
	loadtrainer MYSTICALMAN, EUSINE8
	jump .DoBattle
.Level90:
	loadtrainer MYSTICALMAN, EUSINE9
	jump .DoBattle
.Level100:
	loadtrainer MYSTICALMAN, EUSINE10
.DoBattle
	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH

	startbattle
	special LoadPokemonData
	reloadmap
	ifnotequal $0, Script_FailedBattleTowerChallenge
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain
	warpcheck
	end

Text_BattleSubwayBossIntro:
	text "You must be good"
	line "if you beat 35"
	cont "trainers in a"
	cont "row."

	para "Let's see exactly"
	line "how good you are."
	done

Text_BattleSubwayWinText:
	text "I lost."
	done

Text_BattleSubwayLossText:
	text "I won."
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
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
