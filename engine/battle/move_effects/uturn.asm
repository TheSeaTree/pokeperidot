BattleCommand_UTurn:
; uturn

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	farcall CheckPlayerHasMonToSwitchTo
	jr z, .LastMon

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

	ld hl, UTurnOutEnemyText
	call StdBattleTextBox
	call BattleCommand_Teleport.random_loop_trainer
	ret
	
.LastMon:
	ld de, ANIM_SHOW_MON
	call FarPlayBattleAnimation
	ret
