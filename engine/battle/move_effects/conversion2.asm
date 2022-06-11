BattleCommand_Conversion2:
; conversion2

	ld a, [wAttackMissed]
	and a
	jp nz, FailMove
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jp z, FailMove
	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	ld d, a
	pop hl
	cp CURSE_T
	jp z, FailMove
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

.loop
	call BattleRandom
	maskbits NUM_TYPES
	cp UNUSED_TYPES
	jr c, .okay
	cp UNUSED_TYPES_END
	jr c, .loop
	cp TYPES_END
	jr nc, .loop
.okay
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	push af
	push hl
	ld a, d
	ld [hl], a
	call BattleCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop
	call BattleCommand_SwitchTurn

	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	predef GetTypeName
	ld hl, TransformedTypeText
	jp StdBattleTextBox
