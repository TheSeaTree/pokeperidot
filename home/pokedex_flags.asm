SetSeenAndCaughtMon::
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	ret nz

	push af
	ld c, a
	ld hl, wPokedexCaught
	ld b, SET_FLAG
	call PokedexFlagAction
	pop af
	; fallthrough

_SetSeenMon::
	ld c, a
	ld hl, wPokedexSeen
	ld b, SET_FLAG
	jr PokedexFlagAction

CheckCaughtMon::
	ld c, a
	ld hl, wPokedexCaught
	ld b, CHECK_FLAG
	jr PokedexFlagAction

CheckSeenMon::
	ld c, a
	ld hl, wPokedexSeen
	ld b, CHECK_FLAG
	; fallthrough

PokedexFlagAction::
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	and a
	ret
