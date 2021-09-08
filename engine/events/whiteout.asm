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
	checkflag ENGINE_SAFARI_ZONE
	checkcode VAR_BATTLETYPE
	ifequal BATTLETYPE_NOCASH, .NoMoney
	iftrue .safari_zone
	callasm HalveMoney
	callasm GetWhiteoutSpawn
;	clearflag ENGINE_SAFARI_ZONE
	setevent EVENT_SS_MAKO_RESPAWN

	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
.NoMoney
	endall

.safari_zone
	jumpstd safarizonewarp

.WhitedOutText:
	; is out of useable #MON!  whited out!
	text_far UnknownText_0x1c0a4e
	text_end

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
