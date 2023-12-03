_AnimateCurrentMoveEitherSide:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	farcall BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	farcall PlayDamageAnim
	farcall BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

_AnimateCurrentMove:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	farcall BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	farcall LoadMoveAnim
	farcall BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret
