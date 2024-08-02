BattleCommand_UTurn:
; uturn

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	farcall CheckPlayerHasMonToSwitchTo
	ret z

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
	ret c

	ld a, [wBattleMode]
	dec a
	ret z

	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	
	ld hl, UTurnOutEnemyText
	call StdBattleTextBox
	
	jp BattleCommand_Teleport.enemy_uturn
	
BattleCommand_UTurnAnim:
; uturnanim

; Play a unique animation if the user is the last in its party
;	ld a, [wBattleMode]
;	dec a
;	jr nz, .reappear

	ld a, [wAttackMissed]
	and a
	ret nz

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	farcall CheckPlayerHasMonToSwitchTo
	jp nz, BattleCommand_MoveAnim
	jr .reappear

.enemy_turn:	
	farcall FindAliveEnemyMons
	jp nc, BattleCommand_MoveAnim
.reappear
	ld a, 1
	ld [wBattleAnimParam], a
	jp PlayDamageAnim
