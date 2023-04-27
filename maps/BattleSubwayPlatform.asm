	const_def 2 ; object constants
	const BATTLESUBWAYPLATFORM_RECEPTIONIST1
	const BATTLESUBWAYPLATFORM_RECEPTIONIST2
	const BATTLESUBWAYPLATFORM_OFFICER1
	const BATTLESUBWAYPLATFORM_OFFICER2
	const BATTLESUBWAYPLATFORM_BUGCATCHER
	const BATTLESUBWAYPLATFORM_POKEFANF
	const BATTLESUBWAYPLATFORM_POKEFANM

BattleSubwayPlatform_MapScripts:
	db 3 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED
	scene_script .Scene2 ; SCENE_BATTLESUBWAYPLATFORM_SUSPEND

	db 0 ; callbacks

.Scene0:
	faceobject BATTLESUBWAYPLATFORM_OFFICER2, PLAYER
	writebyte BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .priorityjump1
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	turnobject BATTLESUBWAYPLATFORM_OFFICER1, LEFT
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	priorityjump Script_ResumeBattleTowerChallenge
	end

.priorityjump1
	priorityjump BattleTower_LeftWithoutSaving
;	writebyte BATTLETOWERACTION_CHALLENGECANCELED
;	special BattleTowerAction
;	writebyte BATTLETOWERACTION_06
;	special BattleTowerAction
.SkipEverything:
	checkcode VAR_XCOORD
	ifgreater 11, .QuitWithoutSaving
	setscene SCENE_FINISHED
.Scene1:
	end

.QuitWithoutSaving
	priorityjump BattleTower_LeftWithoutSaving2
	setscene SCENE_FINISHED
	end

.Scene2:
	turnobject BATTLESUBWAYPLATFORM_OFFICER2, LEFT
	applymovement PLAYER, MovementData_BattleTowerElevatorExitElevator
	setscene SCENE_DEFAULT
;	turnobject PLAYER, RIGHT
	opentext

	writebyte BATTLETOWERACTION_SAVELEVELGROUP ; save level group
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVEOPTIONS ; choose reward
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVE_AND_QUIT ; quicksave
	special BattleTowerAction

	special DoQuickSave
	special Reset
	end

BattleSubwayPrizeGirl:
	opentext
	pokemart MARTTYPE_SUBWAY, 0
	closetext
	end

BattleSubwayRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleSubwayCurStreak:
	jumptext BattleSubwayCurrentStreakText
	end

BattleSubwayBestStreak:
	jumptext BattleSubwayBestStreakText

Script_WalkTowardConductorTop:
	faceplayer
	opentext
	writetext Text_BattleTowerWelcomesYou
	buttonsound
	closetext
	turnobject PLAYER, UP
	opentext
	jump Script_Menu_ChallengeExplanationCancel
	
Script_WalkTowardConductorBottom:
	faceplayer
	opentext
	writetext Text_BattleTowerWelcomesYou
	buttonsound
	closetext
	applymovement PLAYER, MovementData_BattleTowerApproachConductor
	opentext
	jump Script_Menu_ChallengeExplanationCancel

Script_WalkTowardConductorRight:
	opentext
	writetext Text_BattleTowerStopPlayer
	buttonsound
	closetext
	applymovement PLAYER, MovementData_StepAwayFromTrain
	turnobject PLAYER, UP
	opentext
	jump Script_Menu_ChallengeExplanationCancel

Script_Conductor:
	faceplayer
;	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
;	special BattleTowerAction
;	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	buttonsound
Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	writebyte TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	jump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	writebyte BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writebyte BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext

	setflag ENGINE_BATTLE_SUBWAY_ACTIVE
	special UpdatePartyStats
	
	writebyte BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	jump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	writebyte BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_SUBWAY_TRAIN, SCENE_DEFAULT
	setmapscene BATTLE_SUBWAY_BOSS_TRAIN, SCENE_DEFAULT
	follow BATTLESUBWAYPLATFORM_OFFICER2, PLAYER
	applymovement BATTLESUBWAYPLATFORM_OFFICER2, MovementData_BattleTowerReEnterTrain
	turnobject BATTLESUBWAYPLATFORM_OFFICER2, DOWN
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_SUBWAY_TRAIN, SCENE_DEFAULT
	setmapscene BATTLE_SUBWAY_BOSS_TRAIN, SCENE_DEFAULT
	follow BATTLESUBWAYPLATFORM_OFFICER1, PLAYER
	applymovement BATTLESUBWAYPLATFORM_OFFICER1, MovementData_BattleTower1FWalkToElevator
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
;	warpsound
	variablesprite SPRITE_SUBWAY_BOSS, SPRITE_GREEN_JADE
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .GotGender
	variablesprite SPRITE_SUBWAY_BOSS, SPRITE_PURPLE_PERRY
.GotGender
	turnobject BATTLESUBWAYPLATFORM_OFFICER1, LEFT
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	jump Script_Menu_ChallengeExplanationCancel

Script_DontSaveAndEndTheSession:
	writetext Text_CancelYourBattleRoomChallenge
	yesorno
	iffalse Script_ContinueAndBattleNextOpponent
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	closetext
	applymovement PLAYER, MovementData_BattleSubwayTrainPlayerLeavesTrain2
	special FadeOutPalettes
Script_BattleTowerChallengeEnded:
	warpfacing RIGHT, BATTLE_SUBWAY_PLATFORM, 9, 7
	turnobject BATTLESUBWAYPLATFORM_OFFICER1, LEFT
	opentext

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext

	clearflag ENGINE_BATTLE_SUBWAY_ACTIVE
	special UpdatePartyStats
	special HealParty

	turnobject BATTLESUBWAYPLATFORM_OFFICER1, DOWN
	checkcode VAR_FACING
	ifequal UP, .StepAway
	end

.StepAway
	applymovement PLAYER, MovementData_StepAwayFromTrain
	end

Script_WaitButton:
	waitbutton
	closetext
	end

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	checkcode VAR_XCOORD
	ifgreater 11, BattleTower_LeftWithoutSaving2
	setlasttalked BATTLESUBWAYPLATFORM_OFFICER1
	faceplayer
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	special BattleSubway_CompareStreaks
	special BattleSubway_ResetCurrentStreak
	writecode VAR_SUBWAY_SET, 0
	jump Script_BattleTowerHopeToServeYouAgain
	

BattleTower_LeftWithoutSaving2:
	disappear BATTLESUBWAYPLATFORM_OFFICER1
	setlasttalked BATTLESUBWAYPLATFORM_OFFICER2
	faceplayer
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	closetext
	
	follow BATTLESUBWAYPLATFORM_OFFICER2, PLAYER
	applymovement BATTLESUBWAYPLATFORM_OFFICER2, MovementData_BattleSubwayPlayerReturnsToPlatform
	stopfollow
	applymovement PLAYER, MovementData_BattleSubwayPlayerReturnsToPlatform2
	appear BATTLESUBWAYPLATFORM_OFFICER1
	turnobject BATTLESUBWAYPLATFORM_OFFICER1, LEFT
	turnobject BATTLESUBWAYPLATFORM_OFFICER2, LEFT
	opentext
	disappear BATTLESUBWAYPLATFORM_OFFICER2

	special BattleSubway_CompareStreaks
	special BattleSubway_ResetCurrentStreak
	writecode VAR_SUBWAY_SET, 0
	special DoQuickSave
	jump Script_BattleTowerHopeToServeYouAgain

Script_BeatenAllTrainers2:
	disappear BATTLESUBWAYPLATFORM_OFFICER1
	faceobject BATTLESUBWAYPLATFORM_OFFICER2, PLAYER
	turnobject PLAYER, LEFT
	opentext
	checkflag ENGINE_BATTLE_SUBWAY_LEVELS
	iffalse .FirstTime
	writetext Text_CongratulationsYouveBeatenAllTheTrainers
.Continue
	waitbutton
	closetext
	follow BATTLESUBWAYPLATFORM_OFFICER2, PLAYER
	applymovement BATTLESUBWAYPLATFORM_OFFICER2, MovementData_BattleSubwayPlayerReturnsToPlatform
	stopfollow
	applymovement PLAYER, MovementData_BattleSubwayPlayerReturnsToPlatform2
	writebyte BATTLETOWERACTION_1C
	special BattleTowerAction
	appear BATTLESUBWAYPLATFORM_OFFICER1
	turnobject BATTLESUBWAYPLATFORM_OFFICER1, LEFT
	turnobject BATTLESUBWAYPLATFORM_OFFICER2, LEFT

	special BattleSubway_CompareStreaks

	checkcode VAR_SUBWAY_SET
	ifequal 5, .DefeatedBoss

	callasm CheckLevelGroup
 	ifgreater  4, .HardMode
	givecoins 10
	writebyte 10
	jump .GetBPReward
.HardMode
	givecoins 20
	writebyte 20
.GetBPReward
	opentext
	writetext Text_PlayerGotBP
	writebyte BATTLETOWERACTION_1D
	special BattleTowerAction
	setscene SCENE_FINISHED
	disappear BATTLESUBWAYPLATFORM_OFFICER2
	jump Script_BattleTowerHopeToServeYouAgain

.FirstTime
	setflag ENGINE_BATTLE_SUBWAY_LEVELS
	writetext Text_CongratulationsYouveBeatenAllTheTrainersFirstTime
	jump .Continue

.DefeatedBoss:
	checkflag EVENT_DECO_PERIDOT_TROPHY
	iftrue .GotTrophy
	writetext Text_PeridotTrophyGift
	playsound SFX_DEX_FANFARE_50_79
	setflag EVENT_DECO_PERIDOT_TROPHY
	waitsfx
	writetext Text_SentPeridotTrophyHome
	waitbutton
.GotTrophy
	callasm CheckLevelGroup
 	ifgreater  4, .HardModeBossReward
	givecoins 50
	writebyte 50
	jump .GetBPReward
.HardModeBossReward
	givecoins 100
	writebyte 100
	opentext
	writetext Text_PlayerGotBP
	writebyte BATTLETOWERACTION_1D
	special BattleTowerAction
	setscene SCENE_FINISHED
	disappear BATTLESUBWAYPLATFORM_OFFICER2
	writecode VAR_SUBWAY_SET, 0
	jump Script_BattleTowerHopeToServeYouAgain

CheckLevelGroup:
	ldh a, [rSVBK]
	push af

	ld a, BANK(wBTChoiceOfLvlGroup)
	ldh [rSVBK], a
	ld a, [wBTChoiceOfLvlGroup]
	ld [wScriptVar], a

	pop af
	ldh [rSVBK], a
	ret

Script_FailedBattleTowerChallenge:
	pause 60
	special BattleTowerFade
	warpfacing RIGHT, BATTLE_SUBWAY_PLATFORM, 9, 7
	turnobject BATTLESUBWAYPLATFORM_OFFICER1, LEFT
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_ThanksForVisiting
	waitbutton
	closetext

	clearflag ENGINE_BATTLE_SUBWAY_ACTIVE
	special UpdatePartyStats
	special HealParty

	special BattleSubway_CompareStreaks
	special BattleSubway_ResetCurrentStreak
	writecode VAR_SUBWAY_SET, 0
	end

BattleSubwayPlatformBugCatcherScript:
	jumptextfaceplayer BattleSubwayPlatformBugCatcherText

BattleSubwayPlatformPokefanFScript:
	jumptextfaceplayer BattleSubwayPlatformPokefanFText

MovementData_BattleTower1FWalkToElevator:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step_end

MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	hide_person
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	turn_head RIGHT
	step_resume
	
MovementData_BattleTowerApproachConductor:
	step UP
	step_end

MovementData_BattleTowerReEnterTrain:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_resume

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	slow_step UP
	slow_step UP
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	step DOWN
	step DOWN
	turn_step RIGHT
	step_end
	
MovementData_BattleSubwayTrainPlayerLeavesTrain:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end
	
MovementData_BattleSubwayTrainPlayerLeavesTrain2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_BattleSubwayTrainPlayerBoardsTrain:
	show_person
	step_sleep 1
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end
	
MovementData_BattleSubwayPlayerReturnsToPlatform:
	step DOWN 
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_resume
	
MovementData_BattleSubwayPlayerReturnsToPlatform2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	turn_head RIGHT
	step_end
	
MovementData_StepAwayFromTrain:
	step LEFT
	step_end

MovementData_BattleSubwayPlayerWalkToBoss:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "Welcome to the"
	line "BATTLE SUBWAY!"
	done

Text_BattleTowerStopPlayer:
	text "Excuse me!"
	
	para "BATTLE SUBWAY reg-"
	line "istration is back"
	cont "here."
	done

Text_WantToGoIntoABattleRoom:
	text "Would you like to"
	line "board a train?"
	done

Text_RightThisWayToYourBattleRoom:
	text "All aboard!"
	done

Text_BattleTowerIntroduction_2:
	text "BATTLE SUBWAY is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"
	cont "from all over to"
	cont "hold battles in"
	cont "specially designed"
	cont "BATTLE TRAINS."

	para "There are many"
	line "BATTLE TRAINS on"
	cont "the BATTLE SUBWAY."

	para "Each TRAIN carries"
	line "six trainers."

	para "Beat them all, and"
	line "win a prize."

	para "To interrupt a"
	line "session, you must"
	cont "SAVE. If not, you"
	cont "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_ThanksForVisiting:
	text "Thanks for"
	line "visiting!"
	
	para "Better luck next"
	line "time."
	done

Text_CongratulationsYouveBeatenAllTheTrainersFirstTime:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers in"
	cont "this set!"
	
	para "Now you may select"
	line "more level groups"
	cont "to challenge."

	para "Please follow me"
	line "for your prize."
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers in"
	cont "this set!"

	para "Please follow me"
	line "for your prize."
	done

Text_PlayerGotBP:
	text "<PLAYER> received"
	line "@"
	deciram wScriptVar, 1, 3
	text " BP!@"
	sound_item
	text_waitbutton
	text_end

Text_WeHopeToServeYouAgain:
	text "We hope to serve"
	line "you again."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Excuse me!"
	
	para "You didn't SAVE"
	line "before exiting the"
	cont "BATTLE TRAIN."

	para "I'm awfully sorry,"
	line "but your challenge"
	cont "will be declared"
	cont "invalid."
	done

Text_NextUpOpponentNo:
	text "Next up, opponent"
	line "no.@"
	text_from_ram wStringBuffer3
	text ". Ready?"
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Before boarding"
	line "the BATTLE TRAIN,"
	cont "your progress will"
	cont "be saved. Okay?"
	done

Text_SaveAndEndTheSession:
	text "SAVE and end the"
	line "session?"
	done

Text_CancelYourBattleRoomChallenge:
	text "Cancel your BATTLE"
	line "SUBWAY challenge?"
	done

Text_WeveBeenWaitingForYou:
	text "We've been waiting"
	line "for you."

	para "You may board the"
	line "BATTLE TRAIN from"
	cont "here."
	done

Text_AMonLevelExceeds:
	text "One or more of"
	line "your #MON's"
	cont "levels exceeds @"
	deciram wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_from_ram wcd49
	text " may not"
	line "enter a BATTLE"
	cont "ROOM under L70."

	para "This BATTLE ROOM"
	line "is for L@"
	deciram wScriptVar, 1, 3
	text "."
	done

Text_ReadBattleTowerRules:
	text "BATTLE TOWER rules"
	line "are written here."

	para "Read the rules?"
	done

Text_BattleTowerRules:
	text "Three #MON may"
	line "enter battles."

	para "All three must be"
	line "different."

	para "The items they"
	line "hold must also be"
	cont "different."

	para "Certain #MON"
	line "may also have"

	para "level restrictions"
	line "placed on them."
	done
	
BattleSubwayPlatformBugCatcherText:
	text "I am going to save"
	line "up all the BP that"
	cont "I earn for some-"
	cont "thing good!"
	done
	
BattleSubwayPlatformPokefanFText:
	text "The BATTLE SUBWAY"
	line "has lots of tough"
	cont "competition."
	
	para "The trainers who"
	line "ride it take batt-"
	cont "les very serious."
	done

Text_PeridotTrophyGift:
	text "For defeating the"
	line "SUBWAY ACE, you"
	cont "have earned the"
	cont "PERIDOT TROPHY."
	done

Text_SentPeridotTrophyHome:
	text "I will just send"
	line "home for you."
	done

BattleSubwayCurrentStreakText:
	text "Current streak:"
	line "@"
	deciram wBattleSubwayCurStreak, 2, 5
	text " battles."
	done

BattleSubwayBestStreakText:
	text "Best streak:"
	line "@"
	deciram wBattleSubwayBestStreak, 2, 5
	text " battles."
	done

BattleSubwayPlatform_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  3, PECTINIA_MALL, 3
	warp_event 14,  5, BATTLE_SUBWAY_TRAIN, 1
	warp_event 24,  5, BATTLE_SUBWAY_TRAIN, 1
	warp_event 22,  5, BATTLE_SUBWAY_TRAIN, 1

	db 4 ; coord events
	coord_event 24,  6, SCENE_FINISHED, Script_BeatenAllTrainers2
	coord_event 10,  8, SCENE_FINISHED, Script_WalkTowardConductorTop
	coord_event 10,  9, SCENE_FINISHED, Script_WalkTowardConductorBottom
	coord_event 11,  8, SCENE_FINISHED, Script_WalkTowardConductorRight

	db 3 ; bg events
	bg_event  6,  6, BGEVENT_READ, BattleSubwayRulesSign
	bg_event  0,  3, BGEVENT_READ, BattleSubwayBestStreak
	bg_event  1,  3, BGEVENT_READ, BattleSubwayCurStreak

	db 7 ; object events
	object_event  7,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSubwayPrizeGirl, -1
	object_event  8,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleSubwayPrizeGirl, -1
	object_event 10,  7, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_Conductor, -1
	object_event 23,  6, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSubwayPlatformBugCatcherScript, -1
	object_event  4,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSubwayPlatformPokefanFScript, -1
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
