Script_BattleWhiteout::
	callasm BattleBGMap
	jump Script_Whiteout

Script_OverworldWhiteout::
	refreshscreen
	callasm OverworldBGMap

Script_Whiteout:
	writetext .WhitedOutText
	waitbutton
	special FadeOutPalettes
	pause 40
	special HealParty
;	checkflag ENGINE_SAFARI_GAME_ACTIVE
;	iftrue .safari_zone

	checkflag ENGINE_BATTLE_SIMULATION_ACTIVE
	iftrue .battle_sim

	callasm CheckTimeTravel
	iftrue .time_travel

	checkcode VAR_BATTLETYPE
	ifequal BATTLETYPE_NOCASH, .NoMoney
	callasm HalveMoney
	callasm GetWhiteoutSpawn
;	clearflag ENGINE_SAFARI_ZONE
	setevent EVENT_SS_MAKO_RESPAWN

	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
.NoMoney
	endall

;.safari_zone
;	jumpstd safarizonewarp

.battle_sim
	jumpstd battlesimexitwarp

.time_travel
	jumpstd timetravelwarp

.WhitedOutText:
	; is out of useable #MON!  whited out!
	text_far UnknownText_0x1c0a4e
	text_end

CheckTimeTravel:
	ld a, [wCurLandmark]
;	ld [wPrevLandmark], a
	cp THE_PAST
	ret nz
	ld de, SFX_WARP_FROM
	call PlaySFX
	ld a, TRUE
	ld [wScriptVar], a
	ret

OverworldBGMap:
	call ClearPalettes
	call ClearScreen
	call WaitBGMap2
	call HideSprites
	call RotateThreePalettesLeft
	ret

BattleBGMap:
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetPalettes
	ret

HalveMoney:
	farcall StubbedTrainerRankings_WhiteOuts

; Halve the player's money.
	ld hl, wMoney
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	ret

GetWhiteoutSpawn:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret
