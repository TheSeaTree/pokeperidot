BattleCommand_LeechSeed:
; leechseed
	ld a, [wTypeModifier]
	and $7f
	jp z, BattleEffect_DoesntAffect

	ld a, [wAttackMissed]
	and a
	jr nz, .evaded
	call CheckSubstituteOpp
	jr nz, .evaded

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr nz, .evaded
	set SUBSTATUS_LEECH_SEED, [hl]
	call AnimateCurrentMove
	ld hl, WasSeededText
	jp StdBattleTextBox

.evaded
	call AnimateFailedMove
	ld hl, EvadedText
	jp StdBattleTextBox
