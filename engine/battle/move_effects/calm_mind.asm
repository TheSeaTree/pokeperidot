BattleCommand_CalmMind:
;calmmind

	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go
; Special Attack
	ld a, c
	add 3
	ld c, a
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	inc c
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
	call AnimateCurrentMove
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage

.cantraise
	jp CantRaiseStats
