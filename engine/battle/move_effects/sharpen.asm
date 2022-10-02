BattleCommand_Sharpen:
; sharpen

	call BattleCommand_AttackUp
	call ResetMiss
	call BattleCommand_AttackUp2
BattleCommand_SharpenMessage:
	ld a, [wFailedMessage]
	and a
	ret nz
	call AnimateCurrentMove
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
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