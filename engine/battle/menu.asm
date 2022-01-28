LoadBattleMenu:
	call DrawWeatherStatus

	ld hl, BattleMenuHeader
	jr _BattleMenuCommon

SafariBattleMenu:
	ld hl, MenuHeader_0x24f4e
	jr _BattleMenuCommon

SimulationBattleMenu:
	ld hl, MenuHeader_0x24f89

_BattleMenuCommon:
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	ld a, [wBattleType]
	cp BATTLETYPE_SAFARI
	jr z, .safari
	ld b, QUICK_START | QUICK_SELECT
	ld a, [wBattleMode]
	dec a
	ld a, QUICK_START | QUICK_SELECT
	jr nz, .ok2
	ld a, [wBattleType]
	cp BATTLETYPE_SIMULATION
	jr z, .simulation
.ok
	ld a, b
.ok2

	ld [wBattleMenuFlags], a
	call _2DMenu
.continue_battle_menu
	ld a, [wBattleMenuFlags]
	and QUICK_PACK
	ld [wBattleMenuFlags], a
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	jp ExitMenu

.safari
	ld [wBattleMenuFlags], a
	call _SafariSimulationMenu
	jp .continue_battle_menu

.simulation
	ld a, b
	ld [wBattleMenuFlags], a
	call _SafariSimulationMenu
	jp .continue_battle_menu

BattleMenuHeader:
	db $40 ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f34
	db 1 ; default option

MenuData_0x24f34:
	db $87 ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba Strings24f3d
	dbw BANK(MenuData_0x24f34), 0

Strings24f3d:
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"

MenuHeader_0x24f4e:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f56
	db 1 ; default option

MenuData_0x24f56:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f5f
	dba Function24f7c

Strings24f5f:
	db "BALL×　　@"
	db "BAIT@"
	db "THROW ROCK@"
	db "RUN@"

Function24f7c:
	hlcoord 7, 14
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

MenuHeader_0x24f89:
	db $40 ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f91
	db 1 ; default option

MenuData_0x24f91:
	db $87 ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f9a
	dba Function24fb2

Strings24f9a:
	db "FIGHT@"
	db "<PKMN>@"
	db "BALL×  @"
	db "RUN@"

Function24fb2:
	hlcoord 7, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

PlayerStatReadout:
	call StatDisplay_PlaceStatNames

	ld de, wBattleMonNick
	hlcoord 1, 12
	call PlaceString

	ld a, [wPlayerAtkLevel]
	hlcoord 10, 13
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerAtkLevel]
	cp $7
	jp z, .Def
	hlcoord 9, 13
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Def
	ld a, [wPlayerDefLevel]
	hlcoord 10, 14
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerDefLevel]
	cp $7
	jp z, .SpAtk
	hlcoord 9, 14
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.SpAtk
	ld a, [wPlayerSAtkLevel]
	hlcoord 10, 15
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerSAtkLevel]
	cp $7
	jp z, .SpDef
	hlcoord 9, 15
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.SpDef
	ld a, [wPlayerSDefLevel]
	hlcoord 10, 16
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerSDefLevel]
	cp $7
	jp z, .Speed
	hlcoord 9, 16
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Speed
	ld a, [wPlayerSpdLevel]
	hlcoord 18, 13
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerSpdLevel]
	cp $7
	jp z, .Accuracy
	hlcoord 17, 13
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Accuracy
	ld a, [wPlayerAccLevel]
	hlcoord 18, 15
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerAccLevel]
	cp $7
	jp z, .Evade
	hlcoord 17, 15
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Evade
	ld a, [wPlayerEvaLevel]
	hlcoord 18, 16
	call StatDisplay_PlaceStatLevel

	ld a, [wPlayerEvaLevel]
	cp $7
	jp z, .CheckScreens
	hlcoord 17, 16
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.CheckScreens
	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr nz, .Screens_Count
	bit SCREENS_LIGHT_SCREEN, a
	jr nz, .Screens_Count
	bit SCREENS_SAFEGUARD, a
	jp z, StatsDisplay_WaitButton
.Screens_Count
	call StatsDisplay_WaitButton

	call StatsDisplay_PlaceScreenNames

	hlcoord 13, 13
	ld de, wPlayerReflectCount
	lb bc, 1, 2
	call PrintNum
	hlcoord 13, 14
	ld de, wPlayerLightScreenCount
	lb bc, 1, 2
	call PrintNum
	hlcoord 13, 15
	ld de, wPlayerSafeguardCount
	lb bc, 1, 2
	call PrintNum
	jp StatsDisplay_WaitButton

EnemyStatReadout:
	call StatDisplay_PlaceStatNames
	
	ld de, wEnemyMonNick
	hlcoord 9, 12
	call PlaceString

	ld a, [wEnemyAtkLevel]
	hlcoord 10, 13
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemyAtkLevel]
	cp $7
	jp z, .Def
	hlcoord 9, 13
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Def
	ld a, [wEnemyDefLevel]
	hlcoord 10, 14
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemyDefLevel]
	cp $7
	jp z, .SpAtk
	hlcoord 9, 14
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.SpAtk
	ld a, [wEnemySAtkLevel]
	hlcoord 10, 15
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemySAtkLevel]
	cp $7
	jp z, .SpDef
	hlcoord 9, 15
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.SpDef
	ld a, [wEnemySDefLevel]
	hlcoord 10, 16
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemySDefLevel]
	cp $7
	jp z, .Speed
	hlcoord 9, 16
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Speed
	ld a, [wEnemySpdLevel]
	hlcoord 18, 13
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemySpdLevel]
	cp $7
	jp z, .Accuracy
	hlcoord 17, 13
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Accuracy
	ld a, [wEnemyAccLevel]
	hlcoord 18, 15
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemyAccLevel]
	cp $7
	jp z, .Evade
	hlcoord 17, 15
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.Evade
	ld a, [wEnemyEvaLevel]
	hlcoord 18, 16
	call StatDisplay_PlaceStatLevel

	ld a, [wEnemyEvaLevel]
	cp $7
	jp z, .CheckScreens
	hlcoord 17, 16
	call nc, StatsDisplay_Up_Arrow
	call c, StatsDisplay_Down_Arrow
.CheckScreens
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr nz, .Screens_Count
	bit SCREENS_LIGHT_SCREEN, a
	jr nz, .Screens_Count
	bit SCREENS_SAFEGUARD, a
	jp z, StatsDisplay_WaitButton
.Screens_Count
	call StatsDisplay_WaitButton

	call StatsDisplay_PlaceScreenNames

	hlcoord 13, 13
	ld de, wEnemyReflectCount
	lb bc, 1, 2
	call PrintNum
	hlcoord 13, 14
	ld de, wEnemyLightScreenCount
	lb bc, 1, 2
	call PrintNum
	hlcoord 13, 15
	ld de, wEnemySafeguardCount
	lb bc, 1, 2
	call PrintNum

StatsDisplay_WaitButton:	
	ld c, 10
	call DelayFrames

	jp JoyWaitFaceButton

StatsDisplay_PlaceScreenNames:
	call PlayClickSFX

	hlcoord 1, 13
	lb bc, 4, 18
	call ClearBox

	ld de, ReflectString
	hlcoord 1, 13
	call PlaceString
	ld de, LightScreenString
	hlcoord 1, 14
	call PlaceString
	ld de, SafeguardString
	hlcoord 1, 15
	jp PlaceString

StatDisplay_PlaceStatNames:
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call TextBox

;	hlcoord 1, 13
;	lb bc, 4, 18
;	call ClearBox

	hlcoord 1, 13
	ld de, .AttackSpeed
	call PlaceString
	hlcoord 1, 14
	ld de, .Defense
	call PlaceString
	hlcoord 1, 15
	ld de, .SpAtkAccuracy
	call PlaceString
	hlcoord 1, 16
	ld de, .SpDefEvade
	jp PlaceString

.AttackSpeed:
	db "ATTACK     SPEED@"

.Defense:
	db "DEFENSE@"

.SpAtkAccuracy:
	db "SPCL.ATK   ACC.@"

.SpDefEvade:
	db "SPCL.DEF   EVADE@"

.SunString:
	db " SUN/@"

.RainString:
	db "RAIN/@"

.SandString:
	db "SAND/@"

StatDisplay_PlaceStatLevel:
	ld de, .Six
	cp $d
	jr z, .Done
	cp $1
	jr z, .Done
	ld de, .Five
	cp $c
	jr z, .Done
	cp $2
	jr z, .Done
	ld de, .Four
	cp $b
	jr z, .Done
	cp $3
	jr z, .Done
	ld de, .Three
	cp $a
	jr z, .Done
	cp $4
	jr z, .Done
	ld de, .Two
	cp $9
	jr z, .Done
	cp $5
	jr z, .Done
	ld de, .One
	cp $8
	jr z, .Done
	cp $6
	jr z, .Done
	ld de, .Zero
.Done
	jp PlaceString

.Six
	db "6@"
.Five
	db "5@"
.Four
	db "4@"
.Three
	db "3@"
.Two
	db "2@"
.One
	db "1@"
.Zero
	db "-@"

DrawWeatherStatus:
	ld a, [wBattleWeather]
	and a
	ret z
	hlcoord 1, 14
	ld a, [wBattleWeather]
	ld de, .RainString
	dec a
	jp z, .Done
	ld de, .SunString
	dec a
	jp z, .Done
	ld de, .SandString
	dec a
	jp z, .Done
.Done
	call PlaceString
	hlcoord 5, 14
	ld de, wWeatherCount
	lb bc, 1, 2
	jp PrintNum

.SunString:
	db " SUN/@"

.RainString:
	db "RAIN/@"

.SandString:
	db "SAND/@"

ReflectString:
	db "REFLECT/@"

LightScreenString:
	db "LIGHT SCREEN/@"

SafeguardString:
	db "SAFEGUARD/@"

StatsDisplay_Up_Arrow:
	ld [hl], $7c
	ret

StatsDisplay_Down_Arrow:
	ld [hl], $7d
	ret
