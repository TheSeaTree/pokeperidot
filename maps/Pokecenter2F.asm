	const_def 2 ; object constants
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TELEPORT_MAN
	const POKECENTER2F_ALAKAZAM

Pokecenter2F_MapScripts:
	db 3 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script .Scene2 ; SCENE_POKECENTER2F_LEAVE_COLOSSEUM

	db 0 ; callbacks

.Scene0:
	end

.Scene1:
	priorityjump Script_LeftCableTradeCenter
	end

.Scene2:
	priorityjump Script_LeftCableColosseum
	end

TeleportGuyScript:
	jumpstd teleportguy

AlakazamScript:
	opentext
	writetext AbraText
	cry ALAKAZAM
	waitbutton
	closetext
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	checkcode VAR_PARTYCOUNT
	ifless 2, .NotEnough
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	special CheckOtherPlayerGender
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end
	
.NotEnough:
	writetext Text_TradeReceptionistNotEnoughPokemon
	closetext
	end

LinkReceptionistScript_Battle:
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	checkcode VAR_PARTYCOUNT
	ifequal 0, .NoPokemon
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	special CheckOtherPlayerGender
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end
	
.NoPokemon:
	writetext Text_BattleReceptionistNoPokemon
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setscene SCENE_DEFAULT
	setmapscene TRADE_CENTER, SCENE_DEFAULT
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setscene SCENE_DEFAULT
	setmapscene COLOSSEUM, SCENE_DEFAULT
	special UpdatePartyStats
	special HealParty
	end

Pokecenter2F_CheckGender:
	applymovement2 Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	copybytetovar hLinkOtherPlayerGender
	iffalse .Male
	variablesprite SPRITE_LINK_TRAINER, SPRITE_JADE
	end
.Male
	variablesprite SPRITE_LINK_TRAINER, SPRITE_PERRY
	end

Script_WalkOutOfLinkTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Pokecenter2FLinkRecordSign:
	refreshscreen
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_resume

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_resume

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_ReceptionistLooksRight:
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
	step UP
	step_resume

Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_resume

Pokecenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_resume

Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2:
	step UP
	step UP
	step_resume

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_resume

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_resume

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_resume

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_resume

Pokecenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_resume

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_resume

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_resume

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_resume

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_resume

Pokecenter2FMovementData_PlayerTakesOneStepDown_2:
	step DOWN
	step_resume

Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2:
	step DOWN
	step DOWN
	step_resume

Pokecenter2FMovementData_PlayerTakesOneStepUp_2:
	step UP
	step_resume

Pokecenter2FMovementData_PlayerTakesOneStepRight:
	step RIGHT
	step_resume

Pokecenter2FMovementData_PlayerTakesOneStepLeft:
	step LEFT
	step_resume

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2:
	slow_step LEFT
	turn_head RIGHT
	step_resume

Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2:
	slow_step RIGHT
	turn_head LEFT
	step_resume

Text_BattleReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB COLOSSEUM."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to CABLE"
	line "TRADE CENTER."

	para "You may trade your"
	line "#MON here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done
	
Text_TradeReceptionistNotEnoughPokemon:
	text "…Oh, I'm sorry!"
	
	para "All trainers must"
	line "have at least 2"
	cont "#MON to enter"
	cont "the TRADE CENTER."
	
	para "Please do return"
	line "if you capture"
	cont "more #MON!"
	prompt
	
Text_BattleReceptionistNoPokemon:
	text "We cannot allow"
	line "you into the CABLE"
	cont "CLUB COLOSSEUM if"
	cont "you do not have a"
	cont "#MON."
	
	para "Please return if"
	line "you obtain a"
	cont "#MON."
	prompt

Text_FriendNotReady:
	text "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	text "Please wait…"
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	prompt

Text_TemporaryStagingInLinkRoom:
	text "We'll put you in"
	line "the link room for"
	cont "the time being."
	done

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseComeIn2:
	text "Please come in."
	done

Text_PleaseEnter:
	text "Please enter."
	prompt

Text_RejectNewMon:
	text "Sorry--@"
	text_ram wStringBuffer1
	text_start
	line "can't be taken."
	prompt

Text_RejectMonWithNewMove:
	text "You can't take the"
	line "@"
	text_ram wStringBuffer1
	text " with a"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "You can't take the"
	line "@"
	text_ram wStringBuffer1
	text " that"
	cont "has MAIL with you."
	prompt

Text_TradeRoomClosed:
	text "I'm sorry--the"
	line "TRADE MACHINE is"
	cont "being adjusted."
	done

Text_BattleRoomClosed:
	text "I'm sorry--the"
	line "BATTLE MACHINE is"
	cont "being adjusted."
	done

Text_OhPleaseWait:
	text "Oh, please wait."
	done

Text_ChangeTheLook:
	text "We need to change"
	line "the look here…"
	done

Text_LikeTheLook:
	text "How does this"
	line "style look to you?"
	done

Text_BrokeStadiumRules:
	text "Excuse me!"

	para "For STADIUM rules,"
	line "please bring six"

	para "different #MON,"
	line "excluding EGGS."

	para "The six #MON"
	line "must be different."

	para "Also, they must"
	line "not be holding"
	cont "identical items."

	para "Please come back"
	line "when you're ready."
	done

AbraText:
	text "ALAKAZAM: Kazam!"
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	db 4 ; object events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event  1,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_HIDE_TELEPORT_GUY
	object_event  0,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlakazamScript, EVENT_HIDE_TELEPORT_GUY
