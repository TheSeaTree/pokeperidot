BattleCommand_Growth:
;growth

	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go

; Attack
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Attack
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Attack
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call BattleCommand_GrowthAttack
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_GrowthSpecial
	jp   BattleCommand_StatUpMessage
	
.cantraise
	call CantRaiseStats
	ret
	