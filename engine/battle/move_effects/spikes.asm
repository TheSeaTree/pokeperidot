BattleCommand_Spikes:
; spikes

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerScreens
.asm_3768e
	set SCREENS_SPIKES, [hl]

	ld hl, wPlayerSpikesCount
	ldh a, [hBattleTurn]
	and a
	jr z, .do_spike
	ld hl, wEnemySpikesCount

; Spikes cap at 3
	ld a, [hl]
	ld b, a
	cp 3
	jp z, FailMove

.do_spike
	inc [hl]

; Nothing else stops it from working.

;	set SCREENS_SPIKES, [hl]

	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextBox
