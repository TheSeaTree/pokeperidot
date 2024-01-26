_ResetStats:
; resetstats
	ld a, 7 ; neutral
	ld hl, wPlayerStatLevels
	call .Fill
	ld hl, wEnemyStatLevels
	call .Fill

	ldh a, [hBattleTurn]
	push af

	farcall SetPlayerTurn
	farcall CalcPlayerStats
	farcall SetEnemyTurn
	farcall CalcEnemyStats

	pop af
	ldh [hBattleTurn], a

	farcall AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextBox

.Fill:
	ld b, wPlayerStatLevelsEnd - wPlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret
	
.fail
	jp BattleEffect_ButItFailed