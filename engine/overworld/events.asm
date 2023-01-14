INCLUDE "constants.asm"


SECTION "Events", ROMX

OverworldLoop::
	xor a ; MAPSTATUS_START
	ld [wMapStatus], a
.loop
	ld a, [wMapStatus]
	ld hl, .jumps
	rst JumpTable
	ld a, [wMapStatus]
	cp MAPSTATUS_DONE
	jr nz, .loop
.done
	ret

.jumps
; entries correspond to MAPSTATUS_* constants
	dw StartMap
	dw EnterMap
	dw HandleMap
	dw .done

DisableEvents:
	xor a
	ld [wScriptFlags3], a
	ret

EnableEvents::
	ld a, $ff
	ld [wScriptFlags3], a
	ret

CheckBit5_ScriptFlags3:
	ld hl, wScriptFlags3
	bit 5, [hl]
	ret

DisableWarpsConnxns:
	ld hl, wScriptFlags3
	res 2, [hl]
	ret

DisableCoordEvents:
	ld hl, wScriptFlags3
	res 1, [hl]
	ret

DisableStepCount:
	ld hl, wScriptFlags3
	res 0, [hl]
	ret

DisableWildEncounters:
	ld hl, wScriptFlags3
	res 4, [hl]
	ret

EnableWarpsConnxns:
	ld hl, wScriptFlags3
	set 2, [hl]
	ret

EnableCoordEvents:
	ld hl, wScriptFlags3
	set 1, [hl]
	ret

EnableStepCount:
	ld hl, wScriptFlags3
	set 0, [hl]
	ret

EnableWildEncounters:
	ld hl, wScriptFlags3
	set 4, [hl]
	ret

CheckWarpConnxnScriptFlag:
	ld hl, wScriptFlags3
	bit 2, [hl]
	ret

CheckCoordEventScriptFlag:
	ld hl, wScriptFlags3
	bit 1, [hl]
	ret

CheckStepCountScriptFlag:
	ld hl, wScriptFlags3
	bit 0, [hl]
	ret

CheckWildEncountersScriptFlag:
	ld hl, wScriptFlags3
	bit 4, [hl]
	ret

StartMap:
	xor a
	ld [wScriptVar], a
	xor a
	ld [wScriptRunning], a
	ld hl, wMapStatus
	ld bc, wMapStatusEnd - wMapStatus
	call ByteFill
	farcall InitCallReceiveDelay
	call ClearJoypad
EnterMap:
	xor a
	ld [wXYComparePointer], a
	ld [wXYComparePointer + 1], a
	call SetUpFiveStepWildEncounterCooldown
	farcall RunMapSetupScript
	call DisableEvents

	ldh a, [hMapEntryMethod]
	cp MAPSETUP_CONNECTION
	jr nz, .dont_enable
	call EnableEvents
.dont_enable

	ldh a, [hMapEntryMethod]
	cp MAPSETUP_RELOADMAP
	jr nz, .dontresetpoison
	xor a
	ld [wPoisonStepCount], a
.dontresetpoison

	xor a ; end map entry
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_HANDLE
	ld [wMapStatus], a
	ret

UnusedWait30Frames:
	ld c, 30
	call DelayFrames
	ret

HandleMap:
	call ResetOverworldDelay
	call HandleMapTimeAndJoypad
	farcall HandleCmdQueue ; no need to farcall
	call MapEvents

; Not immediately entering a connected map will cause problems.
	ld a, [wMapStatus]
	cp MAPSTATUS_HANDLE
	ret nz
	call DoBackgroundEvents
	
	
DoBackgroundEvents:
	call HandleMapObjects
	call NextOverworldFrame
	call HandleMapBackground
	call CheckPlayerState
	ret

MapEvents:
	ld a, [wMapEventStatus]
	and a
	ret nz
	call PlayerEvents
	call DisableEvents
	farcall ScriptEvents
	ret

ResetOverworldDelay:
	ld hl, wOverworldDelay
	bit 7, [hl]
	res 7, [hl]
	ret nz
	ld [hl], 2
	ret

NextOverworldFrame:
	ld a, [wOverworldDelay]
	and a
	jp nz, DelayFrame
; reset overworld delay to leak into the next frame
	ld a, $82
	ld [wOverworldDelay], a
	ret

HandleMapTimeAndJoypad:
	ld a, [wMapEventStatus]
	cp MAPEVENTS_OFF
	ret z

	call UpdateTime
	call GetJoypad
	call TimeOfDayPals
	ret

HandleMapObjects:
	farcall HandleNPCStep ; engine/map_objects.asm
	farcall _HandlePlayerStep
	call _CheckObjectEnteringVisibleRange
	ret

HandleMapBackground:
	farcall _UpdateSprites
	farcall ScrollScreen
	farcall PlaceMapNameSign
	ret

CheckPlayerState:
	ld a, [wPlayerStepFlags]
	bit PLAYERSTEP_CONTINUE_F, a
	jr z, .events
	bit PLAYERSTEP_STOP_F, a
	jr z, .noevents
	bit PLAYERSTEP_MIDAIR_F, a
	jr nz, .noevents
	call EnableEvents
.events
	ld a, MAPEVENTS_ON
	ld [wMapEventStatus], a
	ret

.noevents
	ld a, MAPEVENTS_OFF
	ld [wMapEventStatus], a
	ret

_CheckObjectEnteringVisibleRange:
	ld hl, wPlayerStepFlags
	bit PLAYERSTEP_STOP_F, [hl]
	ret z
	farcall CheckObjectEnteringVisibleRange
	ret

PlayerEvents:
	xor a
; If there's already a player event, don't interrupt it.
	ld a, [wScriptRunning]
	and a
	ret nz

	call CheckTrainerBattle_GetPlayerEvent
	jr c, .ok

	call CheckTileEvent
	jr c, .ok

	call RunMemScript
	jr c, .ok

	call RunSceneScript
	jr c, .ok

	call CheckTimeEvents
	jr c, .ok

	call OWPlayerInput
	jr c, .ok

	xor a
	ret

.ok
	push af
	farcall EnableScriptMode
	pop af

	ld [wScriptRunning], a
	call DoPlayerEvent
	ld a, [wScriptRunning]
	cp PLAYEREVENT_CONNECTION
	jr z, .ok2
	cp PLAYEREVENT_JOYCHANGEFACING
	jr z, .ok2

	xor a
	ld [wLandmarkSignTimer], a

.ok2
	scf
	ret

CheckTrainerBattle_GetPlayerEvent:
	nop
	nop
	call CheckTrainerBattle
	jr nc, .nope

	ld a, PLAYEREVENT_SEENBYTRAINER
	scf
	ret

.nope
	xor a
	ret

CheckTileEvent:
; Check for warps, coord events, or wild battles.

	call CheckWarpConnxnScriptFlag
	jr z, .connections_disabled

	farcall CheckMovingOffEdgeOfMap
	jr c, .map_connection

	call CheckWarpTile
	jr c, .warp_tile

.connections_disabled
	call CheckCoordEventScriptFlag
	jr z, .coord_events_disabled

	call CheckCurrentMapCoordEvents
	jr c, .coord_event

.coord_events_disabled
	call CheckStepCountScriptFlag
	jr z, .step_count_disabled

	call CountStep
	ret c

.step_count_disabled
	call CheckWildEncountersScriptFlag
	jr z, .ok

	call RandomEncounter
	ret c
	jr .ok ; pointless

.ok
	xor a
	ret

.map_connection
	ld a, PLAYEREVENT_CONNECTION
	scf
	ret

.warp_tile
	ld a, [wPlayerStandingTile]
	call CheckPitTile
	jr nz, .not_pit
	ld a, PLAYEREVENT_FALL
	scf
	ret

.not_pit
	ld a, PLAYEREVENT_WARP
	scf
	ret

.coord_event
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	ret

CheckWildEncounterCooldown::
	ld hl, wWildEncounterCooldown
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret z
	scf
	ret

SetUpFiveStepWildEncounterCooldown:
	ld a, 5
	ld [wWildEncounterCooldown], a
	ret

ret_968d7:
	ret

SetMinTwoStepWildEncounterCooldown:
	ld a, [wWildEncounterCooldown]
	cp 2
	ret nc
	ld a, 2
	ld [wWildEncounterCooldown], a
	ret

Dummy_CheckScriptFlags3Bit5:
	call CheckBit5_ScriptFlags3
	ret z
	call ret_2f3e
	ret

RunSceneScript:
	ld a, [wCurMapSceneScriptCount]
	and a
	jr z, .nope

	ld c, a
	call CheckScenes
	cp c
	jr nc, .nope

	ld e, a
	ld d, 0
	ld hl, wCurMapSceneScriptsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	add hl, de
endr

	call GetMapScriptsBank
	call GetFarHalfword
	call GetMapScriptsBank
	call CallScript

	ld hl, wScriptFlags
	res 3, [hl]

	farcall EnableScriptMode
	farcall ScriptEvents

	ld hl, wScriptFlags
	bit 3, [hl]
	jr z, .nope

	ld hl, wPriorityScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPriorityScriptBank]
	call CallScript
	scf
	ret

.nope
	xor a
	ret

CheckTimeEvents:
	ld a, [wLinkMode]
	and a
	jr nz, .nothing

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_FORCE_SHINY_ENCOUNTERS_F, [hl]
	jr z, .do_daily

	farcall CheckShinyEncounterTimer
	jr c, .end_shiny_encounters
	xor a
	ret

.do_daily
	farcall CheckDailyResetTimer
	farcall CheckPokerusTick
	farcall CheckPhoneCall
	ret c

.nothing
	xor a
	ret
	
.end_shiny_encounters
	ld a, BANK(ShinyEncountersOverScript)
	ld hl, ShinyEncountersOverScript
	call CallScript
	scf
	ret
	
ShinyEncountersOverScript:
	clearflag ENGINE_FORCE_SHINY_ENCOUNTERS
	end

OWPlayerInput:
	call PlayerMovement
	ret c
	and a
	jr nz, .NoAction

; Can't perform button actions while sliding on ice.
	farcall CheckStandingOnIce
	jr c, .NoAction

	call CheckAPressOW
	jr c, .Action

	call CheckMenuOW
	jr c, .Action

.NoAction:
	xor a
	ret

.Action:
	push af
	farcall StopPlayerForEvent
	pop af
	scf
	ret

CheckAPressOW:
	ldh a, [hJoyPressed]
	and A_BUTTON
	ret z
	call TryObjectEvent
	ret c
	call TryBGEvent
	ret c
	call TryTileCollisionEvent
	ret c
	xor a
	ret

PlayTalkObject:
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

TryObjectEvent:
	farcall CheckFacingObject
	jr c, .IsObject
	xor a
	ret

.IsObject:
	call PlayTalkObject
	ldh a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a

	ldh a, [hLastTalked]
	call GetMapObject
	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ld a, [hl]
	and %00001111

; Bug: If IsInArray returns nc, data at bc will be executed as code.
	push bc
	ld de, 3
	ld hl, .pointers
	call IsInArray
	jr nc, .nope_bugged
	pop bc

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nope_bugged
	; pop bc
	xor a
	ret

.pointers
	dbw OBJECTTYPE_SCRIPT, .script
	dbw OBJECTTYPE_ITEMBALL, .itemball
	dbw OBJECTTYPE_TRAINER, .trainer
	; the remaining four are dummy events
	dbw OBJECTTYPE_3, .three
	dbw OBJECTTYPE_4, .four
	dbw OBJECTTYPE_5, .five
	dbw OBJECTTYPE_6, .six
	db -1

.script
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	ret

.itemball
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	ld de, wEngineBuffer1
	ld bc, 2
	call FarCopyBytes
	ld a, PLAYEREVENT_ITEMBALL
	scf
	ret

.trainer
	call TalkToTrainer
	ld a, PLAYEREVENT_TALKTOTRAINER
	scf
	ret

.three
	xor a
	ret

.four
	xor a
	ret

.five
	xor a
	ret

.six
	xor a
	ret

TryBGEvent:
	call CheckFacingBGEvent
	jr c, .is_bg_event
	xor a
	ret

.is_bg_event:
	ld a, [wEngineBuffer3]
	ld hl, .bg_events
	rst JumpTable
	ret

.bg_events
	dw .read
	dw .up
	dw .down
	dw .right
	dw .left
	dw .ifset
	dw .ifnotset
	dw .itemifset
	dw .copy

.up
	ld b, OW_UP
	jr .checkdir
.down
	ld b, OW_DOWN
	jr .checkdir
.right
	ld b, OW_RIGHT
	jr .checkdir
.left
	ld b, OW_LEFT
	jr .checkdir

.checkdir
	ld a, [wPlayerDirection]
	and %1100
	cp b
	jp nz, .dontread

.read
	call PlayTalkObject
	ld hl, wEngineBuffer4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.itemifset
	call CheckBGEventFlag
	jp nz, .dontread
	call PlayTalkObject
	call GetMapScriptsBank
	ld de, wEngineBuffer1
	ld bc, 3
	call FarCopyBytes
	ld a, BANK(HiddenItemScript)
	ld hl, HiddenItemScript
	call CallScript
	scf
	ret

.copy
	call CheckBGEventFlag
	jr nz, .dontread
	call GetMapScriptsBank
	ld de, wEngineBuffer1
	ld bc, 3
	call FarCopyBytes
	jr .dontread

.ifset
	call CheckBGEventFlag
	jr z, .dontread
	jr .thenread

.ifnotset
	call CheckBGEventFlag
	jr nz, .dontread

.thenread
	push hl
	call PlayTalkObject
	pop hl
	inc hl
	inc hl
	call GetMapScriptsBank
	call GetFarHalfword
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.dontread
	xor a
	ret

CheckBGEventFlag:
	ld hl, wEngineBuffer4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetMapScriptsBank
	call GetFarHalfword
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	ret

PlayerMovement:
	farcall DoPlayerMovement
	ld a, c
	ld hl, .pointers
	rst JumpTable
	ld a, c
	ret

.pointers
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven

.zero
.four
	xor a
	ld c, a
	ret

.seven
	call ret_968d7 ; mobile
	xor a
	ld c, a
	ret

.one
	ld a, 5
	ld c, a
	scf
	ret

.two
	ld a, 9
	ld c, a
	scf
	ret

.three
; force the player to move in some direction
	ld a, BANK(Script_ForcedMovement)
	ld hl, Script_ForcedMovement
	call CallScript
;	ld a, -1
	ld c, a
	scf
	ret

.five
.six
	ld a, -1
	ld c, a
	and a
	ret

CheckMenuOW:
	xor a
	ldh [hMenuReturn], a
	ldh [hMenuReturn + 1], a
	ldh a, [hJoyPressed]

	bit SELECT_F, a
	jr nz, .Select

	bit START_F, a
	jr z, .NoMenu

	ld a, BANK(StartMenuScript)
	ld hl, StartMenuScript
	call CallScript
	scf
	ret

.NoMenu:
	xor a
	ret

.Select:
	call PlayTalkObject
	ld a, BANK(SelectMenuScript)
	ld hl, SelectMenuScript
	call CallScript
	scf
	ret

StartMenuScript:
	callasm StartMenu
	jump StartMenuCallback

SelectMenuScript:
	callasm SelectMenu
	jump SelectMenuCallback

StartMenuCallback:
SelectMenuCallback:
	copybytetovar hMenuReturn
	ifequal HMENURETURN_SCRIPT, .Script
	ifequal HMENURETURN_ASM, .Asm
	end

.Script:
	ptjump wQueuedScriptBank

.Asm:
	ptcallasm wQueuedScriptBank
	end

CountStep:
	; Don't count steps in link communication rooms.
	ld a, [wLinkMode]
	and a
	jr nz, .done
	
	call DoSafariStep
	jr c, .doscript
	
	call DoFireGymStep
	jr c, .doscript

	; If Repel wore off, don't count the step.
	call DoRepelStep
	jr c, .doscript

	; Count the step for poison and total steps
	ld hl, wPoisonStepCount
	inc [hl]
	ld hl, wStepCount
	inc [hl]
	; Every 256 steps, increase the happiness of all your Pokemon.
	jr nz, .skip_happiness

	farcall StepHappiness

.skip_happiness
	; Every 256 steps, offset from the happiness incrementor by 128 steps,
	; decrease the hatch counter of all your eggs until you reach the first
	; one that is ready to hatch.
	ld a, [wStepCount]
	cp $80
	jr nz, .skip_egg

	farcall DoEggStep
	jr nz, .hatch

.skip_egg
	; Increase the EXP of (both) DayCare Pokemon by 1.
	farcall DayCareStep

	; Every four steps, deal damage to all Poisoned Pokemon
	ld hl, wPoisonStepCount
	ld a, [hl]
	cp 4
	jr c, .done
	ld [hl], 0

	farcall DoPoisonStep
	jr c, .doscript

.done
	xor a
	ret

.doscript
	ld a, -1
	scf
	ret

.hatch
	ld a, 8
	scf
	ret

; unused
.unreferenced
	ld a, 7
	scf
	ret

DoRepelStep:
	ld a, [wRepelEffect]
	and a
	ret z

	dec a
	ld [wRepelEffect], a
	ret nz

	ld a, [wRepelType]
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	ld a, BANK(RepelWoreOffScript)
	ld hl, RepelWoreOffScript
	jr nc, .got_script
	ld a, BANK(UseAnotherRepelScript)
	ld hl, UseAnotherRepelScript
.got_script
	call CallScript
	scf
	ret
	
DoSafariStep:
	call GetMapEnvironment
	cp INDOOR
	jr z, .NoCall

	ld hl, wSafariFlag
	bit SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	jr z, .NoCall

	ld a, [wSafariStepsRemaining]
	ld b, a
	ld a, [wSafariStepsRemaining + 1]
	ld c, a
	or b

	dec bc
	ld a, b   
	or c   
	jr z, .returntogate

	ld a, b
	ld [wSafariStepsRemaining], a
	ld a, c
	ld [wSafariStepsRemaining + 1], a
	ret

.returntogate
	ld a, BANK(SafariGameOverScript)
	ld hl, SafariGameOverScript
	call CallScript
	scf
	ret
	
.NoCall
	xor a
	ret

DoFireGymStep:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	ret nz

	ld a, [wMapGroup]
	cp GROUP_ORCHID_GYM_B1F
	jr nz, .NoCall

	ld a, [wMapNumber]
	cp MAP_ORCHID_GYM_B1F
	jr nz, .NoCall

	ld a, [wFireGymStepsRemaining]
	and a
	ret z

	dec a
	ld [wFireGymStepsRemaining], a
	ret nz

	ld a, BANK(FireGymWarpScript)
	ld hl, FireGymWarpScript
	call CallScript
	scf
	ret
	
.NoCall
	xor a
	ret

DoPlayerEvent:
	ld a, [wScriptRunning]
	and a
	ret z

	cp PLAYEREVENT_MAPSCRIPT ; run script
	ret z

	cp NUM_PLAYER_EVENTS
	ret nc

	ld c, a
	ld b, 0
	ld hl, PlayerEventScriptPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wScriptBank], a
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hl]
	ld [wScriptPos + 1], a
	ret

PlayerEventScriptPointers:
; entries correspond to PLAYEREVENT_* constants
	dba Invalid_0x96c2d          ; PLAYEREVENT_NONE
	dba SeenByTrainerScript      ; PLAYEREVENT_SEENBYTRAINER
	dba TalkToTrainerScript      ; PLAYEREVENT_TALKTOTRAINER
	dba FindItemInBallScript     ; PLAYEREVENT_ITEMBALL
	dba EdgeWarpScript           ; PLAYEREVENT_CONNECTION
	dba WarpToNewMapScript       ; PLAYEREVENT_WARP
	dba FallIntoMapScript        ; PLAYEREVENT_FALL
	dba Script_OverworldWhiteout ; PLAYEREVENT_WHITEOUT
	dba HatchEggScript           ; PLAYEREVENT_HATCH
	dba ChangeDirectionScript    ; PLAYEREVENT_JOYCHANGEFACING
	dba Invalid_0x96c2d          ; (NUM_PLAYER_EVENTS)

Invalid_0x96c2d:
	end

; unused
	end

HatchEggScript:
	callasm OverworldHatchEgg
	end

WarpToNewMapScript:
	warpsound
	newloadmap MAPSETUP_DOOR
	end

FallIntoMapScript:
	newloadmap MAPSETUP_FALL
	playsound SFX_KINESIS
	applymovement PLAYER, MovementData_0x96c48
	playsound SFX_STRENGTH
	scall LandAfterPitfallScript
	end

MovementData_0x96c48:
	skyfall
	step_resume

LandAfterPitfallScript:
	earthquake 16
	end

EdgeWarpScript: ; 4
	reloadandreturn MAPSETUP_CONNECTION

ChangeDirectionScript: ; 9
	callasm ReleaseAllMapObjects
	callasm EnableWildEncounters
	end

INCLUDE "engine/overworld/scripting.asm"

WarpToSpawnPoint::
	ld hl, wSafariFlag
	res SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	ret

RunMemScript::
; If there is no script here, we don't need to be here.
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret z
; Execute the script at (wMapReentryScriptBank):(wMapReentryScriptAddress).
	ld hl, wMapReentryScriptAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapReentryScriptBank]
	call CallScript
	scf
; Clear the buffer for the next script.
	push af
	xor a
	ld hl, wMapReentryScriptQueueFlag
	ld bc, 8
	call ByteFill
	pop af
	ret

LoadScriptBDE::
; If there's already a script here, don't overwrite.
	ld hl, wMapReentryScriptQueueFlag
	ld a, [hl]
	and a
	ret nz
; Set the flag
	ld [hl], 1
	inc hl
; Load the script pointer b:de into (wMapReentryScriptBank):(wMapReentryScriptAddress)
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

TryTileCollisionEvent::
	call GetFacingTileCoord
	ld [wEngineBuffer1], a
	ld c, a
	farcall CheckFacingTileForStdScript
	jr c, .done

	call CheckCutTreeTile
	jr nz, .smashwall
	farcall TryCutOW
	jr .done

.smashwall
	ld a, [wEngineBuffer1]
	call CheckWallSmashTile
	jr nz, .whirlpool
	farcall TrySmashWallOW
	jr .done

.whirlpool
	ld a, [wEngineBuffer1]
	call CheckWhirlpoolTile
	jr nz, .waterfall
	farcall TryWhirlpoolOW
	jr .done

.waterfall
	ld a, [wEngineBuffer1]
	call CheckWaterfallTile
	jr nz, .headbutt
	farcall TryWaterfallOW
	jr .done

.headbutt
	ld a, [wEngineBuffer1]
	call CheckHeadbuttTreeTile
	jr nz, .tallgrass
	farcall TryHeadbuttOW
	jr c, .done

.tallgrass
	ld a, [wEngineBuffer1]
	call CheckTallGrassTile
	jr nz, .surf
	farcall TryCutGrassOW
	jr c, .done
	jr .noevent

.surf
	farcall TrySurfOW
	jr nc, .noevent
	jr .done

.noevent
	xor a
	ret

.done
	call PlayClickSFX
	ld a, $ff
	scf
	ret

RandomEncounter::
; Random encounter

	call CheckWildEncounterCooldown
	jr c, .nope
	call CanUseSweetScent
	jr nc, .nope
	ld hl, wSafariFlag
	bit SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	jr nz, .safari_zone
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_FORCE_SHINY_ENCOUNTERS_F, [hl]
	jr nz, .forced_shiny
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	jr nz, .simulation
	farcall TryWildEncounter
	jr nz, .nope
	jr .ok

.forced_shiny
	farcall TryWildEncounter
	jr nz, .nope
	ld a, BANK(ForcedShinyEncounterScript)
	ld hl, ForcedShinyEncounterScript
	jr .done

.safari_zone
	farcall TryWildEncounter
	jr nz, .nope
	ld a, BANK(SafariZoneEncounterScript)
	ld hl, SafariZoneEncounterScript
	jr .done

.simulation
	farcall TryWildEncounter
	jr nz, .nope
	ld a, BANK(SimulationEncounterScript)
	ld hl, SimulationEncounterScript
	jr .done

.nope
	ld a, 1
	and a
	ret

.ok
	ld a, BANK(WildBattleScript)
	ld hl, WildBattleScript

.done
	call CallScript
	scf
	ret

SimulationEncounterScript
	writecode VAR_BATTLETYPE, BATTLETYPE_SIMULATION
	jump WildBattleScript

ForcedShinyEncounterScript:
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
WildBattleScript:
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

CanUseSweetScent::
	ld hl, wStatusFlags
	bit STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	jr nz, .no
	ld a, [wEnvironment]
	cp CAVE
	jr z, .ice_check
	cp DUNGEON
	jr z, .bounce_check
	cp GYM_CAVE
	jr z, .ice_check
	farcall CheckGrassCollision
	jr nc, .no

.bounce_check
	ld a, [wPlayerStandingTile]
	call CheckBounceTile
	jr z, .no
.ice_check
	ld a, [wPlayerStandingTile]
	call CheckIceTile
	jr z, .no
	scf
	ret

.no
	and a
	ret

_TryWildEncounter_BugContest:
	call TryWildEncounter_BugContest
	ret nc
	call ChooseWildEncounter_BugContest
	farcall CheckRepelEffect
	ret

ChooseWildEncounter_BugContest::
; Pick a random mon out of ContestMons.

.loop
	call Random
	cp 100 << 1
	jr nc, .loop
	srl a

	ld hl, ContestMons
	ld de, 4
.CheckMon:
	sub [hl]
	jr c, .GotMon
	add hl, de
	jr .CheckMon

.GotMon:
	inc hl

; Species
	ld a, [hli]
	ld [wTempWildMonSpecies], a

; Min level
	ld a, [hli]
	ld d, a

; Max level
	ld a, [hl]

	sub d
	jr nz, .RandomLevel

; If min and max are the same.
	ld a, d
	jr .GotLevel

.RandomLevel:
; Get a random level between the min and max.
	ld c, a
	inc c
	call Random
	ldh a, [hRandomAdd]
	call SimpleDivide
	add d

.GotLevel:
	ld [wCurPartyLevel], a

	xor a
	ret

TryWildEncounter_BugContest:
	ld a, [wPlayerStandingTile]
	call CheckSuperTallGrassTile
	ld b, 40 percent
	jr z, .ok
	ld b, 20 percent

.ok
	farcall ApplyCleanseTagEffectOnEncounterRate
	call Random
	ldh a, [hRandomAdd]
	cp b
	ret c
	ld a, 1
	and a
	ret

INCLUDE "data/wild/bug_contest_mons.asm"

ClearCmdQueue::
	ld hl, wCmdQueue
	ld de, CMDQUEUE_ENTRY_SIZE
	ld c, CMDQUEUE_CAPACITY
	xor a
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

HandleCmdQueue::
	ld hl, wCmdQueue
	xor a
.loop
	ldh [hMapObjectIndexBuffer], a
	ld a, [hl]
	and a
	jr z, .skip
	push hl
	ld b, h
	ld c, l
	call HandleQueuedCommand
	pop hl

.skip
	ld de, CMDQUEUE_ENTRY_SIZE
	add hl, de
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp CMDQUEUE_CAPACITY
	jr nz, .loop
	ret

Unreferenced_GetNthCmdQueueEntry:
	ld hl, wCmdQueue
	ld bc, CMDQUEUE_ENTRY_SIZE
	call AddNTimes
	ld b, h
	ld c, l
	ret

WriteCmdQueue::
	push bc
	push de
	call .GetNextEmptyEntry
	ld d, h
	ld e, l
	pop hl
	pop bc
	ret c
	ld a, b
	ld bc, CMDQUEUE_ENTRY_SIZE - 1
	call FarCopyBytes
	xor a
	ld [hl], a
	ret

.GetNextEmptyEntry:
	ld hl, wCmdQueue
	ld de, CMDQUEUE_ENTRY_SIZE
	ld c, CMDQUEUE_CAPACITY
.loop
	ld a, [hl]
	and a
	jr z, .done
	add hl, de
	dec c
	jr nz, .loop
	scf
	ret

.done
	ld a, CMDQUEUE_CAPACITY
	sub c
	and a
	ret

DelCmdQueue::
	ld hl, wCmdQueue
	ld de, CMDQUEUE_ENTRY_SIZE
	ld c, CMDQUEUE_CAPACITY
.loop
	ld a, [hl]
	cp b
	jr z, .done
	add hl, de
	dec c
	jr nz, .loop
	and a
	ret

.done
	xor a
	ld [hl], a
	scf
	ret

_DelCmdQueue:
	ld hl, CMDQUEUE_TYPE
	add hl, bc
	ld [hl], 0
	ret

HandleQueuedCommand:
	ld hl, CMDQUEUE_TYPE
	add hl, bc
	ld a, [hl]
	cp NUM_CMDQUEUE_TYPES
	jr c, .okay
	xor a

.okay
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	ret

.Jumptable:
	dba CmdQueue_Null
	dba CmdQueue_Null2
	dba CmdQueue_StoneTable
	dba CmdQueue_Type3
	dba CmdQueue_Type4

CmdQueueAnonymousJumptable:
	ld hl, CMDQUEUE_05
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

CmdQueueAnonJT_Increment:
	ld hl, CMDQUEUE_05
	add hl, bc
	inc [hl]
	ret

CmdQueueAnonJT_Decrement:
	ld hl, CMDQUEUE_05
	add hl, bc
	dec [hl]
	ret

CmdQueue_Null:
	ret

CmdQueue_Null2:
	call ret_2f3e
	ret

CmdQueue_Type4:
	call CmdQueueAnonymousJumptable
	; anonymous dw
	dw .zero
	dw .one

.zero
	ldh a, [hSCY]
	ld hl, 4
	add hl, bc
	ld [hl], a
	call CmdQueueAnonJT_Increment
.one
	ld hl, 1
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	jr z, .finish
	and $1
	jr z, .add
	ld hl, 2
	add hl, bc
	ldh a, [hSCY]
	sub [hl]
	ldh [hSCY], a
	ret

.add
	ld hl, 2
	add hl, bc
	ldh a, [hSCY]
	add [hl]
	ldh [hSCY], a
	ret

.finish
	ld hl, 4
	add hl, bc
	ld a, [hl]
	ldh [hSCY], a
	call _DelCmdQueue
	ret

CmdQueue_Type3:
	call CmdQueueAnonymousJumptable
	; anonymous dw
	dw .zero
	dw .one
	dw .two

.zero
	call .IsPlayerFacingDown
	jr z, .PlayerNotFacingDown
	call CmdQueueAnonJT_Increment
.one
	call .IsPlayerFacingDown
	jr z, .PlayerNotFacingDown
	call CmdQueueAnonJT_Increment

	ld hl, 2
	add hl, bc
	ld a, [hl]
	ld [wd173], a
	ret

.two
	call .IsPlayerFacingDown
	jr z, .PlayerNotFacingDown
	call CmdQueueAnonJT_Decrement

	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld [wd173], a
	ret

.PlayerNotFacingDown:
	ld a, $7f
	ld [wd173], a
	ld hl, 5
	add hl, bc
	ld [hl], 0
	ret

.IsPlayerFacingDown:
	push bc
	ld bc, wPlayerStruct
	call GetSpriteDirection
	and a
	pop bc
	ret

CmdQueue_StoneTable:
	ld de, wPlayerStruct
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af

	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next

	ld hl, OBJECT_MOVEMENTTYPE
	add hl, de
	ld a, [hl]
	cp SPRITEMOVEDATA_STRENGTH_BOULDER
	jr nz, .next

	ld hl, OBJECT_NEXT_TILE
	add hl, de
	ld a, [hl]
	call CheckPitTile
	jr nz, .next

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	cp STANDING
	jr nz, .next
	call HandleStoneQueue
	jr c, .fall_down_hole

.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l

	pop af
	dec a
	jr nz, .loop
	ret

.fall_down_hole
	pop af
	ret

CheckBounceTile:
	cp COLL_BOUNCE_UP
	ret z
	cp COLL_BOUNCE_DOWN
	ret z
	cp COLL_BOUNCE_LEFT
	ret z
	cp COLL_BOUNCE_RIGHT
	ret z
	scf
	ret
