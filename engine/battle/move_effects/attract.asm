BattleCommand_Attract:
; attract
	ld a, [wAttackMissed]
	and a
	jp nz, FailMove
	farcall CheckOppositeGender
	jp c, PrintDidntAffect2
	call CheckHiddenOpponent
	jp nz, FailMove
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOVE, [hl]
	jp nz, FailMove

	set SUBSTATUS_IN_LOVE, [hl]
	call AnimateCurrentMove

; 'fell in love!'
	ld hl, FellInLoveText
	jp StdBattleTextBox
