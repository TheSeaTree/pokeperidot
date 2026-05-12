BattleCommand_Coil:
;coil

	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Accuracy
	ld a, c
	add 4
	ld c, a
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
	call AnimateCurrentMove
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_AccuracyUp
	jp   BattleCommand_StatUpMessage

.cantraise
	jp CantRaiseStats
