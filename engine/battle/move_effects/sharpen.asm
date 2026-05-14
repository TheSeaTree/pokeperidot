BattleCommand_Sharpen:
; sharpen

	call BattleCommand_AttackUp
	ld a, [wFailedMessage]
	ld d, a
	call ResetMiss
	call BattleCommand_AttackUp2

	ld a, [wFailedMessage]
	and d
	ret nz
	call AnimateCurrentMove
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	xor a
    ld [wFailedMessage], a
	ld hl, .stat
	jp BattleTextBox

.stat
	text_far UnknownText_0x1c0cc6
	text_asm
	ld hl, .up
	ret

.up
	text_far Text_RoseDrastically
	text_end