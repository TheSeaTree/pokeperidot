BattleCommand_UTurn:
; uturn

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	farcall CheckPlayerHasMonToSwitchTo
	jr z, .LastMon

	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld hl, UTurnOutPlayerText
	call StdBattleTextBox

	call BattleCommand_Teleport.PlayerUTurn
	callfar PursuitSwitch
	ret

.enemy_turn:	
	farcall FindAliveEnemyMons
	jr c, .LastMon

	ld a, [wBattleMode]
	dec a
	jr z, .LastMon

	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	
	ld hl, UTurnOutEnemyText
	call StdBattleTextBox
	
	call BattleCommand_Teleport.enemy_uturn
	ret

.LastMon:
	ld de, ANIM_SHOW_MON
	call FarPlayBattleAnimation
	ret
