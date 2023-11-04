BattleCommand_Counter:
; counter

	call CounterMirrorCoat1
	cp EFFECT_COUNTER
	ret z
	call CounterMirrorCoat2
	ret nc
	jr FinishCounterMirrorCoat

BattleCommand_MirrorCoat:
; mirrorcoat

	call CounterMirrorCoat1
	cp EFFECT_MIRROR_COAT
	ret z
	call CounterMirrorCoat2
	ret c

FinishCounterMirrorCoat:
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	jp z, BattleCommand_EndMoveEffect

	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped
	xor a
	ld [wAttackMissed], a
	ret

CounterMirrorCoat1:
	ld a, 1
	ld [wAttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jp z, BattleCommand_EndMoveEffect

	ld b, a
	callfar GetMoveEffect
	ld a, b
	ret

CounterMirrorCoat2:
	call BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	jp z, BattleCommand_EndMoveEffect

	call CheckOpponentWentFirst
	jp z, BattleCommand_EndMoveEffect

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, wStringBuffer1
	call GetMoveData

	ld a, [wStringBuffer1 + MOVE_POWER]
	and a
	jp z, BattleCommand_EndMoveEffect

	ld a, [wStringBuffer1 + MOVE_TYPE]
	cp SPECIAL
	ret
