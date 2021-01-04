	const_def 2 ; object constants
	const BATTLESUBWAYPLATFORM_RECEPTIONIST1
	const BATTLESUBWAYPLATFORM_RECEPTIONIST2
	const BATTLESUBWAYPLATFORM_OFFICER1
	const BATTLESUBWAYPLATFORM_OFFICER2

BattleSubwayPlatform_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	writebyte BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .priorityjump1
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	priorityjump Script_ResumeBattleTowerChallenge
	end

.priorityjump1
	priorityjump BattleTower_LeftWithoutSaving
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
	end

BattleSubwayPrizeGirl:
	opentext
	pokemart MARTTYPE_SUBWAY, 0
	closetext
	end
	
BattleSubwayPointGirl:
	opentext
	special DisplayCoinCaseBalance
	writetext Text_PlayerGotFive
	givecoins 30
	special DisplayCoinCaseBalance
	waitbutton
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
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
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
	writebyte BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	jump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	writebyte BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_SUBWAY_TRAIN, SCENE_DEFAULT
;	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
;	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
	follow BATTLESUBWAYPLATFORM_OFFICER1, PLAYER
	applymovement BATTLESUBWAYPLATFORM_OFFICER1, MovementData_BattleTower1FWalkToElevator
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
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

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
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
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

Script_BeatenAllTrainers2:
	disappear BATTLESUBWAYPLATFORM_OFFICER1
	turnobject PLAYER, LEFT
	opentext
	writetext Text_CongratulationsYouveBeatenAllTheTrainers
	waitbutton
	closetext
	follow BATTLESUBWAYPLATFORM_OFFICER2, PLAYER
	applymovement BATTLESUBWAYPLATFORM_OFFICER2, MovementData_BattleSubwayPlayerReturnsToPlatform
	stopfollow
	applymovement PLAYER, MovementData_BattleSubwayPlayerReturnsToPlatform2
	writebyte BATTLETOWERACTION_1C
	special BattleTowerAction
	appear BATTLESUBWAYPLATFORM_OFFICER1
	givecoins 10
	opentext
	writetext Text_PlayerGotFive
	writebyte BATTLETOWERACTION_1D
	special BattleTowerAction
	setscene SCENE_FINISHED
	disappear BATTLESUBWAYPLATFORM_OFFICER2
	jump Script_BattleTowerHopeToServeYouAgain

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
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

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
	
MovementData_BattleSubwayTrainPlayerBoardsTrain:
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
	turn_head UP
	step_end
	
MovementData_StepAwayFromTrain:
	step LEFT
	step_end

Text_BattleTowerWelcomesYou:
	text "Welcome to the"
	line "BATTLE SUBWAY!"
	done

Text_WantToGoIntoABattleRoom:
	text "Want to go into a"
	line "BATTLE ROOM?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Right this way to"
	line "your BATTLE ROOM."
	done

Text_BattleTowerIntroduction_1:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "If you defeat the"
	line "seven in a ROOM,"

	para "and you have a"
	line "good record, you"

	para "could become the"
	line "ROOM's LEADER."

	para "All LEADERS will"
	line "be recorded in the"

	para "HONOR ROLL for"
	line "posterity."

	para "You may challenge"
	line "in up to five"

	para "BATTLE ROOMS each"
	line "day."

	para "However, you may"
	line "battle only once a"

	para "day in any given"
	line "ROOM."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "Beat them all, and"
	line "win a prize."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Received a list of"
	line "LEADERS on the"
	cont "HONOR ROLL."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Please confirm on"
	line "this monitor."
	done

Text_ThanksForVisiting:
	text "Thanks for"
	line "visiting!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "Your feat may be"
	line "worth registering,"

	para "<PLAYER>. With your"
	line "results, you may"

	para "be chosen as a"
	line "ROOM LEADER."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "Follow me for your"
	line "prize."
	done

Text_AskRegisterRecord_Mobile:
	text "Would you like to"
	line "register your"

	para "record with the"
	line "CENTER?"
	done

Text_PlayerGotFive:
	text "<PLAYER> got 10"
	line "BP!@"
	sound_item
	text_waitbutton
	db "@"

Text_YourRegistrationIsComplete:
	text "Your registration"
	line "is complete."

	para "Please come again!"
	done

Text_WeHopeToServeYouAgain:
	text "We hope to serve"
	line "you again."
	done

Text_PleaseStepThisWay:
	text "Please step this"
	line "way."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Would you like to"
	line "hear about the"
	cont "BATTLE TOWER?"
	done

Text_CantBeRegistered:
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered. OK?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered."

	para "Also, the existing"
	line "record will be"
	cont "deleted. OK?"
	done

Text_CheckTheLeaderHonorRoll:
	text "Check the LEADER"
	line "HONOR ROLL?"
	done

Text_BattleTower_LeftWithoutSaving:
	text "Excuse me!"
	line "You didn't SAVE"

	para "before exiting"
	line "the BATTLE ROOM."

	para "I'm awfully sorry,"
	line "but your challenge"

	para "will be declared"
	line "invalid."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Your #MON will"
	line "be healed to full"
	cont "health."
	done

Text_NextUpOpponentNo:
	text "Next up, opponent"
	line "no.@"
	text_from_ram wStringBuffer3
	text ". Ready?"
	done

Text_SaveBeforeConnecting_Mobile:
	text "Your session will"
	line "be SAVED before"

	para "connecting with"
	line "the CENTER."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Before entering"
	line "the BATTLE ROOM,"

	para "your progress will"
	line "be saved."
	done

Text_SaveAndEndTheSession:
	text "SAVE and end the"
	line "session?"
	done

Text_SaveBeforeReentry:
	text "Your record will"
	line "be SAVED before"

	para "you go back into"
	line "the previous ROOM."
	done

Text_CancelYourBattleRoomChallenge:
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done

Text_RegisterRecordOnFile_Mobile:
	text "We have your"
	line "previous record on"

	para "file. Would you"
	line "like to register"
	cont "it at the CENTER?"
	done

Text_WeveBeenWaitingForYou:
	text "We've been waiting"
	line "for you. This way"

	para "to a BATTLE ROOM,"
	line "please."
	done

Text_FiveDayBattleLimit_Mobile:
	text "You may enter only"
	line "five BATTLE ROOMS"
	cont "each day."

	para "Please come back"
	line "tomorrow."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Sorry, but it's"
	line "not possible to"

	para "register your"
	line "current record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done

; a dupe?
Text_RegisterRecordTimedOut_Mobile:
	text "Sorry, but it's"
	line "not possible to"

	para "register your most"
	line "recent record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
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

Text_BattleTowerYoungster:
	text "Destroyed by the"
	line "first opponent in"

	para "no time at all…"
	line "I'm no good…"
	done

Text_BattleTowerCooltrainerF:
	text "There are lots of"
	line "BATTLE ROOMS, but"

	para "I'm going to win"
	line "them all!"
	done

Text_BattleTowerGranny:
	text "It's a grueling"
	line "task, not being"

	para "able to use items"
	line "in battle."

	para "Making your"
	line "#MON hold items"

	para "is the key to"
	line "winning battles."
	done

Text_BattleTowerBugCatcher:
	text "I'm trying to see"
	line "how far I can go"

	para "using just bug"
	line "#MON."

	para "Don't let there be"
	line "any fire #MON…"
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

BattleSubwayPlatform_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  3, AZALEA_TOWN, 2
	warp_event 14,  5, BATTLE_SUBWAY_TRAIN, 1
	warp_event 24,  5, BATTLE_SUBWAY_TRAIN, 1

	db 3 ; coord events
	coord_event 24,  6, SCENE_FINISHED, Script_BeatenAllTrainers2
	coord_event 10,  8, SCENE_FINISHED, Script_WalkTowardConductorTop
	coord_event 10,  9, SCENE_FINISHED, Script_WalkTowardConductorBottom

	db 1 ; bg events
	bg_event  5,  6, BGEVENT_READ, BattleSubwayRulesSign
	
	db 4 ; object events
	object_event  7,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleSubwayPointGirl, -1
	object_event  6,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleSubwayPrizeGirl, -1
	object_event 10,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_Conductor, -1
	object_event 23,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
