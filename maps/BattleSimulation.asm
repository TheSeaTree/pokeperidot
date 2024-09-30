	const_def 2 ; object constants
	const BATTLESIMULATION_SCIENTIST1
	const BATTLESIMULATION_SCIENTIST2
	const BATTLESIMULATION_SCIENTIST3
	const BATTLESIMULATION_SCIENTIST4
	const BATTLESIMULATION_SCIENTIST5
	const BATTLESIMULATION_SUPER_NERD

BattleSimulation_MapScripts:
	db 4 ; scene scripts
	scene_script .Scene0 ; SCENE_BATTLESIMULATION_DEFAULT
	scene_script .Scene1 ; SCENE_BATTLESIMULATION_CHALLENGE
	scene_script .Scene2 ; SCENE_BATTLESIMULATION_FINISHED
	scene_script .Scene3 ; SCENE_BATTLESIMULATION_RETURNED_TO_PRESENT

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Screen
	callback MAPCALLBACK_OBJECTS, .Scientist

.Scene0:
	end

.Scene1:
	opentext
	writetext BattleSimulationChallengeCancelled
	waitbutton
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.Scene2:
	playsound SFX_WARP_FROM
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_MENU
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special ReplaceKrisSprite

	clearevent EVENT_BATTLE_SIM_VISITED_SKY
	clearevent EVENT_BATTLE_SIM_VISITED_GRAVEYARD
	clearevent EVENT_BATTLE_SIM_VISITED_COMPUTER
	clearevent EVENT_BATTLE_SIM_VISITED_VOLCANO
	clearevent EVENT_BATTLE_SIM_VISITED_ICE_CAVE
	clearevent EVENT_BATTLE_SIM_VISITED_FOREST
	clearevent EVENT_BATTLE_SIM_VISITED_CASTLE
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_1
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_2
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_3
	clearevent EVENT_BATTLE_SIM_GRAVE_GATE_4
	clearevent EVENT_BATTLE_SIM_CLEARED_1
	clearevent EVENT_BATTLE_SIM_CLEARED_2
	clearevent EVENT_BATTLE_SIM_CLEARED_3
	applymovement PLAYER, BattleSimulationPlayerLeaveMachine
	applymovement BATTLESIMULATION_SCIENTIST1, BattleSimulationBlockEntrance
	special LoadPokemonData
	clearflag ENGINE_BATTLE_SIMULATION_ACTIVE
	setscene SCENE_BATTLESIMULATION_DEFAULT
	turnobject PLAYER, UP
; Reward the player BP depending on their final score
	scall BattleSimGrantBP
	loadvar wBlueCardBalance, 0
	opentext
	special DoQuickSave
	moveobject BATTLESIMULATION_SCIENTIST1, 8, 8
	writetext BattleSimulationComeAgainText
	waitbutton
	closetext
	clearevent EVENT_BATTLE_SIM_DEFEATED_BOSS
	end

.Scene3:
	playsound SFX_EXIT_BUILDING
	waitsfx
	moveobject BATTLESIMULATION_SCIENTIST1, 8, 8
	appear BATTLESIMULATION_SCIENTIST1
	applymovement PLAYER, BattleSimulationPlayerStepDown
	turnobject BATTLESIMULATION_SCIENTIST5, LEFT
	showemote EMOTE_SHOCK, BATTLESIMULATION_SCIENTIST5, 15
	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationBlockEntrance
	applymovement PLAYER, BattleSimulationPlayerLeaveTimeMachine
	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationTimeMachineBlock
	clearevent EVENT_FOUGHT_CHAMPION_IN_PAST
	checkevent EVENT_CAUGHT_CELEBI
	iftrue .AfterMaintenance
	checkevent EVENT_FOUGHT_BOSS_CELEBI
	iffalse .Fainted
	opentext
	writetext TimeMachineReturnFromCelebiText
	waitbutton
	writetext TimeMachineMaintenanceText
	waitbutton
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.Fainted:
	opentext
	writetext TimeMachineReturnFromPastText
	waitbutton
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.AfterMaintenance:
	opentext
	writetext TimeMachineReturnAfterMaintenanceText
	waitbutton
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.Screen
	checkevent EVENT_MACHINE_PART_USED
	iffalse .nothing
	changeblock 2, 8, $30
	return

.Scientist
	checkscene SCENE_BATTLESIMULATION_FINISHED
	iftrue .something
	checkscene SCENE_BATTLESIMULATION_RETURNED_TO_PRESENT
	iffalse .nothing
.something
	moveobject BATTLESIMULATION_SCIENTIST1, 9, 7
	turnobject BATTLESIMULATION_SCIENTIST1, RIGHT
.nothing
	return

BattleSimulationGuy:
	opentext
	writetext BattleSimulationIntroductionText
	waitbutton
.MenuLoop
	writetext BattleSimulationMenuText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Challenge
	ifequal 2, .Explain
	closetext
	end

.Challenge
	writebyte EGG
	special FindPartyMonThatSpecies
	iftrue .Decline
	writetext BattleSimulationPrepareSaveText
	yesorno
	iffalse .Decline
	setscene SCENE_BATTLESIMULATION_CHALLENGE
	special TryQuickSave
	iffalse .Decline
	writetext BattleSimulationTakeASeatText
	waitbutton
	closetext
	follow BATTLESIMULATION_SCIENTIST1, PLAYER
	applymovement BATTLESIMULATION_SCIENTIST1, BattleSimulationEntrance
	stopfollow
	applymovement PLAYER, BattleSimulationPlayerEnterMachine
	setflag ENGINE_BATTLE_SIMULATION_ACTIVE
	special DropOffParty
; 20% chance of getting the Porygon2 with a Trick Mirror
; Every other set gets Leftovers
	random 5
	ifequal 1, .TrickMirror
	givepoke PORYGON2, 50, LEFTOVERS, TRUE, SimPorygon2Name, SimPorygon2OT
	jump .GiveMoves
.TrickMirror
	givepoke PORYGON2, 50, TRICK_MIRROR, TRUE, SimPorygon2Name, SimPorygon2OT
.GiveMoves
	special BattleSimGiftMon
	special UpdatePartyStats
	loadvar wParkBallsRemaining, 30
	playsound SFX_MENU
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	special ReplaceKrisSprite
;	waitsfx
	wait 5
	applymovement BATTLESIMULATION_SCIENTIST1, BattleSimulationActivateComputer
	playsound SFX_BOOT_PC
	wait 15
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	scall .ChooseRandomSpawn
	warpcheck
	end

.Explain
	writetext BattleSimulationExplainationText
.ExplainMenuLoop
	loadmenu .ExplainationMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Stages
	ifequal 2, .Pokemon
	ifequal 3, .Rewards
	jump .MenuLoop

.Stages
	writetext BattleSimulationExplainStagesText
	waitbutton
	jump .KnowMore
.Pokemon
	writetext BattleSimulationExplainPokemonText
	waitbutton
	jump .KnowMore
.Rewards
	writetext BattleSimulationExplainRewardsText
	waitbutton
	jump .KnowMore

.KnowMore
	writetext BattleSimulationExplainKnowMoreText
	jump .ExplainMenuLoop

.Decline
	closetext
	setscene SCENE_BATTLESIMULATION_DEFAULT
	end

.ChooseRandomSpawn
	random 7
	ifequal 1, .WarpSky
	ifequal 2, .WarpComputer
	ifequal 3, .WarpGraveyard
	ifequal 4, .WarpIce
	ifequal 5, .WarpVolcano
	ifequal 6, .WarpForest

	warpmod 1, BATTLE_SIM_CASTLE_1
	return

.WarpSky:
	warpmod 1, BATTLE_SIM_SKY_1
	return

.WarpComputer:
	warpmod 1, BATTLE_SIM_COMP_1
	return

.WarpGraveyard:
	warpmod 1, BATTLE_SIM_GRAVE_1
	return

.WarpIce:
	warpmod 1, BATTLE_SIM_LAVA_1
	return

.WarpVolcano:
	warpmod 1, BATTLE_SIM_LAVA_1
	return

.WarpForest:
	warpmod 1, BATTLE_SIM_FOREST_1
	return

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8,4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "CHALLENGE@"
	db "EXPLAIN@"
	db "CANCEL@"

.ExplainationMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0 , 0, 9, 9
	dw .ExplainationMenuData
	db 1 ; default option

.ExplainationMenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "STAGES@"
	db "#MON@"
	db "REWARDS@"
	db "CANCEL@"

BattleSimulationBPExchange:
	faceplayer
	opentext
	pokemart MARTTYPE_SUBWAY, 0
	closetext
	end

BattleSimulationScientist1:
	jumptextfaceplayer BattleSimulationScientist1Text

BattleSimulationScientist2:
	jumptextfaceplayer BattleSimulationScientist2Text

BattleSimulationRocker:
	jumptextfaceplayer BattleSimulationRockerText

BattleSimulationTimeMachineGuy:
	opentext
	checkevent EVENT_FOUGHT_BOSS_CELEBI
	iffalse .CheckPart
	checkevent EVENT_CAUGHT_CELEBI
	iffalse .Maintenance
.CheckPart
	checkevent EVENT_MACHINE_PART_USED
	iftrue .AskTimeTravel
	checkitem MACHINE_PART
	iffalse .Unavailable

	writetext TimeMachineGiveMachinePart
	waitbutton
	closetext
	setevent EVENT_MACHINE_PART_USED
	takeitem MACHINE_PART
	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationTimeMachineInstallPart
	playsound SFX_MENU
	wait 5
	playsound SFX_BOOT_PC
	changeblock 2, 8, $30
	reloadmappart
	wait 15
	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationTimeMachineReturnInstallation
	opentext
	writetext TimeMachineFirstTimeText
	yesorno
	iftrue .TryUseTimeMachine
	jump .Decline

.AskTimeTravel
	writetext TimeMachineReadyText
	yesorno
	iffalse .Decline
	checkevent EVENT_GIVEN_POKE_PDA
	iffalse .TryUseTimeMachine
	checkitem POKE_PDA
	iffalse .No_PDA

.TryUseTimeMachine
	writetext TimeMachineAcceptText
	waitbutton
	writebyte PAST_LEVEL
	special FindPartyMonAboveLevel
	iffalse .PartyTooHigh
	writetext TimeMachinePartyElligibleText
	waitbutton
	closetext

	follow BATTLESIMULATION_SCIENTIST5, PLAYER
	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationTimeMachineInstallPart
	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationTimeMachineApproachDoors
	stopfollow

	opentext
	checkevent EVENT_GIVEN_POKE_PDA
	iftrue .NotFirstTime
	writetext TimeMachineGivePokePDAText
	waitbutton
	verbosegiveitem POKE_PDA
	setevent EVENT_GIVEN_POKE_PDA
	writetext TimeMachineExplainPokePDAText
	waitbutton
.NotFirstTime
	writetext TimeMachineSafeVoyageText
	waitbutton
	closetext

	applymovement PLAYER, BattleSimulationTimeMachineEnterMovement
	playsound SFX_ENTER_DOOR
	waitsfx

	applymovement BATTLESIMULATION_SCIENTIST5, BattleSimulationTimeMachineActivate
	playsound SFX_BOOT_PC
	wait 15
	playsound SFX_WARP_TO
	waitsfx
	special FadeOutPalettes
	playsound SFX_WARP_FROM
	waitsfx
	warpfacing DOWN, PAST_HIDDEN_POWER_CAVE, 4, 4
	end

.Decline
	writetext TimeMachineDeclineText
	jump .Finish

.No_PDA
	writetext TimeMachineNoPokePDAText
	jump .Finish

.PartyTooHigh
	writetext TimeMachinePartyTooStrongText
	jump .Finish

.Maintenance
	writetext TimeMachineMaintenanceText
	jump .Finish

.Unavailable
	writetext BattleSimulationTimeMachineGuyUnavailableText
.Finish
	waitbutton
	closetext
	end

BattleSimComputerScreen:
	jumptext BattleSimComputerScreenText

BattleSimItemball:
	random 15
	ifgreater 10, .WildEncounter
	ifgreater  4, .Found5Balls
	ifgreater  6, .Found10Balls
	ifequal 7, .Found20Balls
	writetext BattleSimFoundSacredAshText
	special HealParty
	playsound SFX_FULL_HEAL
	waitsfx
	writetext BattleSimPlayerUsedSacredAshText
	waitbutton
	jump .Done
.Found5Balls
	copybytetovar wParkBallsRemaining
	addvar 5
	copyvartobyte wParkBallsRemaining
	writetext BattleSimFound5CyberBallsText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	jump .Done
.Found10Balls
	copybytetovar wParkBallsRemaining
	addvar 10
	copyvartobyte wParkBallsRemaining
	writetext BattleSimFound10CyberBallsText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	jump .Done
.Found20Balls	
	copybytetovar wParkBallsRemaining
	addvar 20
	copyvartobyte wParkBallsRemaining
	writetext BattleSimFound20CyberBallsText
	playsound SFX_KEY_ITEM
	waitsfx
	waitbutton
.Done
	closetext
	end

.WildEncounter:
	writetext BattleSimItemballEncounterText
	waitbutton
	closetext
	jumpstd battlesimencounter

BattleSimMoveRelearner:
	faceplayer
	opentext
	special SpecialMoveRelearner
	waitbutton
	closetext
	end

BattleSimHealer:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .NotFirstTime
	writetext BattleSimHealerFirstTimeText
	yesorno
	iffalse .Decline
.DoHeal
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext BattleSimHealerAllSetText
	waitbutton
	writetext BattleSimHealerDeclineText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	end

.NotFirstTime
	writetext BattleSimHealerCostText
	yesorno
	iffalse .Decline
	copybytetovar wBlueCardBalance
	ifless 5, .NotEnoughPoints
	copybytetovar wBlueCardBalance
	addvar -5
	copyvartobyte wBlueCardBalance
	jump .DoHeal

.NotEnoughPoints
	writetext BattleSimHealerNotEnoughPointsText
	waitbutton
	closetext
	end

.Decline
	writetext BattleSimHealerDeclineText
	waitbutton
	closetext
	end

BattleSimGrantBP:
	opentext
	copybytetovar wBlueCardBalance
	ifequal 1, .SinglePoint
	writetext BattleSimulationChallengeEndedText
	waitbutton
	ifless 40, .Check35
	givecoins 9
	writebyte 9
	jump .CheckBoss
.Check35
	ifless 35, .Check30
	givecoins 8
	writebyte 8
	jump .CheckBoss
.Check30
	ifless 30, .Check25
	givecoins 7
	writebyte 7
	jump .CheckBoss
.Check25
	ifless 25, .Check20
	givecoins 6
	writebyte 6
	jump .CheckBoss
.Check20
	ifless 20, .Check15
	givecoins 5
	writebyte 5
	jump .CheckBoss
.Check15
	ifless 15, .Check10
	givecoins 4
	writebyte 4
	jump .CheckBoss
.Check10
	ifless 10, .Check5
	givecoins 3
	writebyte 3
	jump .CheckBoss
.Check5
	ifless  5, .LessThan5
	givecoins 2
	writebyte 2
	jump .CheckBoss
.SinglePoint
	writetext BattleSimulationChallengeEndedSinglePointText
	waitbutton
.LessThan5
	givecoins 1
	writebyte 1
.CheckBoss
	writetext BattleSimulationRewardText
	waitbutton
	writetext BattleSimPlayerGotBPText
	checkevent EVENT_BATTLE_SIM_DEFEATED_BOSS
	iffalse .End
	writetext BattleSimulationBossRewardText
	waitbutton
	writetext BattleSimPlayerGotBossBPText
	givecoins 11
.End
	closetext
	end

SimulationStage1TrainerCheck:
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .SinglePoint
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .SinglePoint
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalse .SinglePoint
	setevent EVENT_BATTLE_SIM_CLEARED_1
	writetext BattleSimDefeatedAllTrainersText
	waitbutton
	closetext
	copybytetovar wBlueCardBalance
	addvar 5
	copyvartobyte wBlueCardBalance
	end

.SinglePoint
	writetext BattleSimTrainerRewardText
	waitbutton
	closetext
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance
	end

SimulationStage2TrainerCheck:
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .SinglePoint
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .SinglePoint
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalse .SinglePoint
	setevent EVENT_BATTLE_SIM_CLEARED_2
	writetext BattleSimDefeatedAllTrainersText
	waitbutton
	closetext
	copybytetovar wBlueCardBalance
	addvar 5
	copyvartobyte wBlueCardBalance
	end

.SinglePoint
	writetext BattleSimTrainerRewardText
	waitbutton
	closetext
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance
	end

SimulationStage3TrainerCheck:
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .SinglePoint
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .SinglePoint
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalse .SinglePoint
	setevent EVENT_BATTLE_SIM_CLEARED_3
	writetext BattleSimDefeatedAllTrainersText
	waitbutton
	closetext
	copybytetovar wBlueCardBalance
	addvar 5
	copyvartobyte wBlueCardBalance
	end

.SinglePoint
	writetext BattleSimTrainerRewardText
	waitbutton
	closetext
	copybytetovar wBlueCardBalance
	addvar 1
	copyvartobyte wBlueCardBalance
	end

SimulationMoveReminder:
	faceplayer
	opentext
	special SimulationMoveRelearner
	waitbutton
	closetext
	end

BattleSimulationEntrance:
	step UP
	step RIGHT
	turn_head LEFT
	step_end

BattleSimulationActivateComputer:
	step RIGHT
	turn_head UP
	step_end

BattleSimulationPlayerEnterMachine:
	step UP
	turn_head DOWN
	step_sleep 10
	step_resume

BattleSimulationBlockEntrance:
	step LEFT
	step DOWN
	step_resume

BattleSimulationPlayerLeaveMachine:
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

BattleSimulationPlayerStepDown:
	step DOWN
	step_resume

BattleSimulationPlayerLeaveTimeMachine:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

BattleSimulationTimeMachineBlock:
	step UP
	step RIGHT
	step_resume

BattleSimulationTimeMachineInstallPart:
	step LEFT
	step LEFT
	step UP
	step_end

BattleSimulationTimeMachineReturnInstallation:
	step DOWN
	step RIGHT
	step RIGHT
	step_resume

BattleSimulationTimeMachineApproachDoors:
	step LEFT
	step LEFT
	turn_head RIGHT
	step_resume

BattleSimulationTimeMachineEnterMovement:
	step UP
	hide_person
	step_resume

BattleSimulationTimeMachineActivate:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

SimPorygon2Name:
	db "PORYGON2@"

SimPorygon2OT:
	db "BTTLSIM@"

BattleSimulationIntroductionText:
	text "Welcome to the"
	line "BATTLE SIMULATION."
	done

BattleSimulationMenuText:
	text "Would you like to"
	line "log in?"
	done

BattleSimulationExplainationText:
	text "What would you"
	line "like to know?"
	done

BattleSimulationExplainStagesText:
	text "Players will expl-"
	line "ore 3 randomly-"
	cont "selected stages in"
	cont "each run, with"
	cont "each stage becom-"
	cont "ing more difficult"
	cont "than the last."

	para "If a player has no"
	line "more #MON to"
	cont "battle with, their"
	cont "run will end and"
	cont "their final score"
	cont "tallied up."
	done

BattleSimulationExplainPokemonText:
	text "Players will be"
	line "loaned a PORYGON2"
	cont "for each BATTLE"
	cont "SIMULATION run."

	para "Players can catch"
	line "more #MON with"
	cont "their CYBER BALLs"
	cont "given at the start"
	cont "of a run."

	para "Do note that all"
	line "#MON will be"
	cont "returned at the"
	cont "end of a run."
	done

BattleSimulationExplainRewardsText:
	text "BP will be awarded"
	line "for each completed"
	cont "stage, with a"
	cont "bonus for defeat-"
	cont "ing every trainer"
	cont "within that stage."
	done

BattleSimulationExplainKnowMoreText:
	text "Would you like to"
	line "know more?"
	done

BattleSimulationPrepareSaveText:
	text "Would you like to"
	line "save before we"
	cont "get you set up?"
	done

BattleSimulationTakeASeatText:
	text "Please take a seat"
	line "at the terminal"
	cont "and put on the"
	cont "headset."
	done

BattleSimulationChallengeEndedText:
	text "Your run ended"
	line "with you gaining"
	cont "@"
	text_decimal wBlueCardBalance, 1, 2
	text " POINTs."
	done

BattleSimulationChallengeEndedSinglePointText:
	text "Your run ended"
	line "with you gaining"
	cont "@"
	text_decimal wBlueCardBalance, 1, 2
	text " POINT."
	done

BattleSimulationRewardText:
	text "Meaning you have"
	line "earned @"
	text_decimal wScriptVar, 1, 3
	text " BP."
	done

BattleSimPlayerGotBPText:
	text "<PLAYER> received"
	line "@"
	deciram wScriptVar, 1, 3
	text " BP!@"
	sound_item
	text_waitbutton
	text_end

BattleSimulationBossRewardText:
	text "And for clearing"
	line "the battle against"
	cont "PROF. MAPLE, you"
	cont "have earned 11"
	cont "additional BP!"
	done

BattleSimPlayerGotBossBPText:
	text "<PLAYER> received"
	line "11 BP!"
	sound_item
	text_waitbutton
	text_end

BattleSimulationComeAgainText:
	text "We hope you take"
	line "on the BATTLE"
	cont "SIMULATION again."
	done

BattleSimulationChallengeCancelled:
	text "The connection to"
	line "virtual reality"
	cont "was lost."

	para "We're sorry, but"
	line "your challenge has"
	cont "been forfeit."
	done

BattleSimItemBallText:
	text "It's an ITEM"
	line "CAPSULE."

	para "Open it?"
	done

BattleSimFoundSacredAshText:
	text "<PLAYER> found"
	line "some SACRED ASH!"
	done

BattleSimPlayerUsedSacredAshText:
	text "<PLAYER>'s #MON"
	line "were restored to"
	cont "full health!"
	done

BattleSimFound5CyberBallsText:
	text "<PLAYER> found"
	line "5 CYBER BALLs!"
	done

BattleSimFound10CyberBallsText:
	text "<PLAYER> found"
	line "10 CYBER BALLs!"
	done

BattleSimFound20CyberBallsText:
	text "<PLAYER> found"
	line "20 CYBER BALLs!"
	done

BattleSimFound5PointsText:
	text "<PLAYER> found"
	line "5 points!"
	done

BattleSimHealerFirstTimeText:
	text "Would you like to"
	line "heal your #MON?"

	para "The first time is"
	line "free."
	done

BattleSimHealerCostText:
	text "Would you like to"
	line "heal your #MON?"

	para "It will cost you"
	line "5 points."
	done

BattleSimHealerDeclineText:
	text "Good luck,"
	line "<PLAYER>!"
	done

BattleSimHealerNotEnoughPointsText:
	text "Oh, I'm sorry…"

	para "You don't have"
	line "enough points to"
	cont "heal your #MON."
	done

BattleSimHealerAllSetText:
	text "All done!"

	para "Your #MON are"
	line "fighting fit!"
	done

BattleSimItemballEncounterText:
	text "There is a wild"
	line "#MON inside!"

	para "The wild #MON"
	line "attacked!"
	done

BattleSimTrainerText:
	text "Battle protocol"
	line "initiated."
	done

BattleSimTrainerWinText:
	text "Battle complete."
	
	para "Winner: <PLAYER>."
	done

BattleSimTrainerRewardText:
	text "For defeating a"
	line "trainer, you have"
	cont "gained 1 point."
	done

BattleSimTrainerAfterText:
	text "Unable to battle."
	done

BattleSimDefeatedAllTrainersText:
	text "For defeating all"
	line "trainers on this"
	cont "stage, you have"
	cont "won an additional"
	cont "5 points!"
	done

BattleSimulationScientist1Text:
	text "This is PROF."
	line "MAPLE's dream!"

	para "A way to teach"
	line "people about"
	cont "#MON in a safe,"
	cont "controlled envi-"
	cont "ronment."
	done

BattleSimulationScientist2Text:
	text "We have been work-"
	line "ing diligently to"
	cont "get the BATTLE"
	cont "SIMULATION online."
	done

BattleSimulationRockerText:
	text "I can't get past"
	line "the second stage"
	cont "of the BATTLE"
	cont "SIMULATION."

	para "I heard there is"
	line "a good reward if"
	cont "you can beat all"
	cont "3 stages."
	done

BattleSimulationTimeMachineGuyUnavailableText:
	text "The TIME MACHINE"
	line "is still missing a"
	cont "key component."

	para "Without it, this"
	line "MACHINE is not"
	cont "safe to use."
	done

TimeMachineGiveMachinePart:
	text "Is that…?"

	para "Yes, it is!"

	para "That is the"
	line "MACHINE PART we"
	cont "need to complete"
	cont "the TIME MACHINE's"
	cont "TETHER SYSTEM!"

	para "Allow me a moment"
	line "to install it."
	cont "Wait here please."
	done

TimeMachineFirstTimeText:
	text "Finally! We have a"
	line "way to bring"
	cont "people back to the"
	cont "present day!"

	para "Would you like to"
	line "visit the past,"
	cont "CHAMPION <PLAYER>?"
	done

TimeMachineReadyText:
	text "Finally! The"
	line "TIME MACHINE is"
	cont "fully functional!"

	para "Would you like to"
	line "return to the"
	cont "past, <PLAYER>?"
	done

TimeMachineReturnFromPastText:
	text "It's good to see"
	line "our tether system"
	cont "is successful!"

	para "Whenever you are"
	line "ready to jump back"
	cont "in, let me know."
	done

TimeMachineReturnFromCelebiText:
	text "<PLAYER>! We're glad"
	line "you've returned!"

	para "There was a sudden"
	line "power surge and we"
	cont "weren't sure the"
	cont "TIME MACHINE would"
	cont "be functional!"
	done

TimeMachineMaintenanceText:
	text "I'm sorry, but we"
	line "will need to run"
	cont "thorough diagnost-"
	cont "ics on the TIME"
	cont "MACHINE before we"
	cont "can allow it to be"
	cont "used once again."
	done

TimeMachineReturnAfterMaintenanceText:
	text "Welcome back,"
	line "<PLAYER>."

	para "Whenever you are"
	line "ready to jump back"
	cont "into the past,"
	cont "let me know."
	done

TimeMachineAcceptText:
	text "Great!"

	para "I will just need"
	line "to quickly inspect"
	cont "your #MON…"
	done

TimeMachineDeclineText:
	text "Not now?"
	line "Understood."

	para "You are always"
	line "welcome to use"
	cont "the TIME MACHINE."
	done

TimeMachinePartyElligibleText:
	text "I see no anomalies"
	line "with your #MON."

	para "I will begin prep-"
	line "arations for your"
	cont "trip now."

	para "Please, follow me."
	done

TimeMachineGivePokePDAText:
	text "First, you will be"
	line "needing this."
	done

TimeMachineExplainPokePDAText:
	text "Here is the"
	line "# PDA."

	para "This will allow"
	line "you to access the"
	cont "#MON STORAGE"
	cont "system when there"
	cont "is no PC access."

	para "It will also allow"
	line "us to keep track"
	cont "of your #MON"
	cont "while in the past"
	cont "and pull you back"
	cont "if need be."
	done

TimeMachineNoPokePDAText:
	text "You do not seem to"
	line "have your # PDA"
	cont "on you."

	para "It would be impos-"
	line "sible to bring you"
	cont "back to the pres-"
	cont "ent without one."
	done

TimeMachineSafeVoyageText:
	text "I wish you well on"
	line "your journey to"
	cont "the past, <PLAYER>!"
	done

TimeMachinePartyTooStrongText:
	text "I'm sorry, <PLAYER>."

	para "I cannot let you"
	line "into the TIME"
	cont "MACHINE with your"
	cont "current #MON."

	para "We cannot risk"
	line "you bringing"
	cont "#MON that"
	cont "greatly over-"
	cont "power anything in"
	cont "the past."

	para "No #MON beyond"
	line "this point can"
	cont "be higher than"
	cont "level 20!"
	done

BattleSimComputerScreenText:
	text "There's an opened"
	line "document about the"
	cont "potential exist-"
	cont "ence of a #MON"
	cont "that can travel"
	cont "through time."

	para "It seems to be an"
	line "article from many"
	cont "years ago."
	done

BattleSimulation_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8,  6, BATTLE_SIMULATION, -1
	warp_event 13,  1, MAPLES_LAB_ELEVATOR, 1
	warp_event  3,  9, BATTLE_SIMULATION, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 15,  7, BGEVENT_UP, BattleSimComputerScreen

	db 6 ; object events
	object_event  8,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BattleSimulationGuy, -1
	object_event 16,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleSimulationScientist1, -1
	object_event 19,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleSimulationScientist2, -1
	object_event 19,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimulationBPExchange, -1
	object_event  6, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimulationTimeMachineGuy, -1
	object_event 11, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSimulationRocker, -1
