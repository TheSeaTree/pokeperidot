BattleCommand_Growth:
;growth

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

; Special Attack
	ld a, c
	add 3
	ld c, a
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
	call AnimateCurrentMove
	call BattleCommand_GrowthAttack
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_GrowthSpecial
	jp   BattleCommand_StatUpMessage

.cantraise
	jp CantRaiseStats
	