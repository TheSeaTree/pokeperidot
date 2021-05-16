BattleCommand_Attract:
; attract
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	farcall CheckOppositeGender
	jr c, .failed
	call CheckHiddenOpponent
	jr nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOVE, [hl]
	jr nz, .failed

	set SUBSTATUS_IN_LOVE, [hl]
	call AnimateCurrentMove

; 'fell in love!'
	ld hl, FellInLoveText
	jp StdBattleTextBox

.failed
	jp FailMove
