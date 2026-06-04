	const_def 2 ; object constants
	const PVPARENA_RANDOM_BATTLE_RECEPTIONIST
	const PVPARENA_OPPONENT

PVPArenaRandomBattleRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Arena_RandomBattle:
	opentext
	setflag ENGINE_BATTLE_SUBWAY_LEVELS
	writetext ArenaRandomBattleIntroText
	yesorno
	iffalse .Decline
	special BattleTowerRoomMenu
	ifequal $a, .Decline
	writebyte BATTLETOWERACTION_11
	special BattleTowerAction
	writetext ArenaRandomBattleRightThisWayText
	waitbutton
	closetext

	setflag ENGINE_BATTLE_SUBWAY_ACTIVE
	special UpdatePartyStats
	
	writebyte BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction

	follow PVPARENA_RANDOM_BATTLE_RECEPTIONIST, PLAYER
	applymovement PVPARENA_RANDOM_BATTLE_RECEPTIONIST, MovementData_EnterRandomBattle
	stopfollow
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	applymovement PLAYER, MovementData_PlayerApproachRandomBattle
	applymovement PVPARENA_RANDOM_BATTLE_RECEPTIONIST, MovementData_RandomBattleReceptionistLeave
	disappear PVPARENA_RANDOM_BATTLE_RECEPTIONIST

.BattleLoop
	moveobject PVPARENA_OPPONENT, 5, 11
	writebyte PVPARENA_OPPONENT
	special LoadOpponentTrainerAndPokemonWithOTSprite
	appear PVPARENA_OPPONENT
	playsound SFX_ENTER_DOOR
	special BattleSubway_LoadSpritePalette

	applymovement PVPARENA_OPPONENT, MovementData_OpponentApproachRandomBattle
	turnobject PVPARENA_OPPONENT, LEFT
	opentext
	battletowertext BATTLETOWERTEXT_INTRO
	buttonsound
.Retry
	closetext
	special BattleTowerBattle ; calls predef startbattle
	special FadeOutPalettes
	reloadmap
	special LoadPokemonData
	playsound SFX_FULL_HEAL
	waitsfx
	opentext
.MenuLoop
	writetext ArenaRandomBattleRetryText

	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .No_Retry
	ifequal 2, .Retry
	ifequal 3, .Exit

.No_Retry
	scall .Opponent_Leaving
	jump .BattleLoop

.Exit
	writetext ArenaRandomBattleAskExitText
	yesorno
	iffalse .MenuLoop
	scall .Opponent_Leaving
	appear PVPARENA_RANDOM_BATTLE_RECEPTIONIST
	turnobject PVPARENA_RANDOM_BATTLE_RECEPTIONIST, DOWN
	applymovement PLAYER, MovementData_OpponentApproachRandomBattle

	applymovement PVPARENA_RANDOM_BATTLE_RECEPTIONIST, MovementData_EnterRandomBattle
	applymovement PLAYER, MovementData_PlayerLeaveRandomBattle
	applymovement PVPARENA_RANDOM_BATTLE_RECEPTIONIST, MovementData_RandomBattleReceptionistLeave
	clearflag ENGINE_BATTLE_SUBWAY_ACTIVE
	opentext
.Decline
	writetext ArenaRandomBattleLeaveText
	waitbutton
	closetext
	end

.Opponent_Leaving
	closetext
	applymovement PVPARENA_OPPONENT, MovementData_OpponentLeavesRandomBattle
	playsound SFX_EXIT_BUILDING
	disappear PVPARENA_OPPONENT
	wait 6
	end

.MenuHeader
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "NEXT@"
	db "RETRY@"
	db "EXIT@"

ArenaRandomBattleIntroText:
	text "Welcome to"
	line "RANDOM BATTLE."

	para "Would you like to"
	line "battle?"
	done

ArenaRandomBattleRightThisWayText:
	text "Your opponent will"
	line "arrive shortly."
	done

ArenaRandomBattleLeaveText:
	text "We hope to see"
	line "you again."
	done

ArenaRandomBattleRetryText:
	text "What will you do?"
	done

ArenaRandomBattleAskExitText:
	text "Ready to exit?"
	done

MovementData_EnterRandomBattle:
	step DOWN
	step RIGHT
	turn_head LEFT
	step_end

MovementData_RandomBattleReceptionistLeave:
	step LEFT
	step UP
	step_resume

MovementData_PlayerApproachRandomBattle:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

MovementData_OpponentApproachRandomBattle:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

MovementData_OpponentLeavesRandomBattle:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	turn_step DOWN
	step_end

MovementData_PlayerLeaveRandomBattle:
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end

PVPArenaRandomBattleRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  0, PVP_ARENA, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Arena_RandomBattle, -1
	object_event 10, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
