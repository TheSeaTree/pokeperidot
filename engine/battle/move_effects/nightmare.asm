BattleCommand_Nightmare:
; nightmare

; Can't hit an absent opponent.

	call CheckHiddenOpponent
	jp nz, BattleEffect_ButItFailed

; Can't hit a substitute.

	call CheckSubstituteOpp
	jp nz, BattleEffect_ButItFailed

; Only works on a sleeping opponent.

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and SLP
	jp z, BattleEffect_ButItFailed

; Bail if the opponent is already having a nightmare.

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jp nz, BattleEffect_ButItFailed

; Otherwise give the opponent a nightmare.

	set SUBSTATUS_NIGHTMARE, [hl]
	call AnimateCurrentMove
	ld hl, StartedNightmareText
	jp StdBattleTextBox
