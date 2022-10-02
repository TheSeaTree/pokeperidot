BattleCommand_QuiverDance:
;quiverdance

	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go

; Speed
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Attack
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Attack
	call AnimateCurrentMove
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpeedUp
	jp   BattleCommand_StatUpMessage
	
.cantraise
	jp CantRaiseStats
	