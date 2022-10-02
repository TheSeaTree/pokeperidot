BattleCommand_Counter:
; counter

	call CounterMirrorCoat1
	cp EFFECT_COUNTER
	ret z
	call CounterMirrorCoat2
	cp SPECIAL
	ret nc
	jp FinishCounterMirrorCoat

BattleCommand_MirrorCoat:
; mirrorcoat
	call CounterMirrorCoat1
	cp EFFECT_MIRROR_COAT
	ret z
	call CounterMirrorCoat2
	cp SPECIAL
	ret c

FinishCounterMirrorCoat:
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	jr z, .failed

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

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret

CounterMirrorCoat1:
	ld a, 1
	ld [wAttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callfar GetMoveEffect
	ld a, b
	ret

CounterMirrorCoat2:
	call BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ret z

	call CheckOpponentWentFirst
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, wStringBuffer1
	call GetMoveData

	ld a, [wStringBuffer1 + MOVE_POWER]
	and a
	ret z

	ld a, [wStringBuffer1 + MOVE_TYPE]
	ret
