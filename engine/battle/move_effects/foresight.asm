BattleCommand_Foresight:
; foresight

	ld a, [wAttackMissed]
	and a
	jp nz, FailMove

	call CheckHiddenOpponent
	jp nz, FailMove

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IDENTIFIED, [hl]
	jp nz, FailMove

	set SUBSTATUS_IDENTIFIED, [hl]
	call AnimateCurrentMove
	ld hl, IdentifiedText
	jp StdBattleTextBox
