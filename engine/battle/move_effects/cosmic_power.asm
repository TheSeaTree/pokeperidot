BattleCommand_CosmicPower:
;cosmicpower

	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go
; Defense
    inc c
    ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	ld a, c
    add 3
    ld c, a
    ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
	call AnimateCurrentMove
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage
	
.cantraise
	call CantRaiseStats
	ret
	