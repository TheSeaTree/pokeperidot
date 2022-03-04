BattleCommand_BrickBreak:
; brickbreak
	call BrickBreak_Anim
	
	call BrickBreak_CheckEnemyScreens

	bit SCREENS_LIGHT_SCREEN, [hl]
	jp nz, .Shattered
	bit SCREENS_REFLECT, [hl]
	ret z
.Shattered
; For switching the animation, currently broken.
	res SCREENS_LIGHT_SCREEN, [hl]
	res SCREENS_REFLECT, [hl]
	ld hl, BattleText_MonsBarrierShattered
	jp StdBattleTextBox


BrickBreak_Anim:
	call BrickBreak_CheckEnemyScreens

	bit SCREENS_LIGHT_SCREEN, [hl]
	jp nz, .Shattered
	bit SCREENS_REFLECT, [hl]
	jp z, BattleCommand_MoveAnim
.Shattered
	ld a, 1
	ld [wBattleAnimParam], a
	jp PlayDamageAnim

BrickBreak_CheckEnemyScreens:
	ld hl, wEnemyScreens
	ld de, wEnemyLightScreenCount
	ldh a, [hBattleTurn]
	and a
	ret z
	ld hl, wPlayerScreens
	ld de, wPlayerLightScreenCount
	ret