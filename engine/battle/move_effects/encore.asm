BattleCommand_Encore:
; encore

	ld hl, wEnemyMonMoves
	ld de, wEnemyEncoreCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonMoves
	ld de, wPlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	and a
	jp z, PrintDidntAffect2
	cp STRUGGLE
	jp z, PrintDidntAffect2
	cp ENCORE
	jp z, PrintDidntAffect2
	cp MIRROR_MOVE
	jp z, PrintDidntAffect2
	ld b, a

.got_move
	ld a, [hli]
	cp b
	jr nz, .got_move

	ld bc, wBattleMonPP - wBattleMonMoves - 1
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jp z, PrintDidntAffect2
	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jp nz, PrintDidntAffect2
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
	inc a
	inc a
	inc a
	ld [de], a
	call CheckOpponentWentFirst
	jr nz, .finish_move
	ldh a, [hBattleTurn]
	and a
	jr z, .force_last_enemy_move

	push hl
	ld a, [wLastPlayerMove]
	ld b, a
	ld c, 0
	ld hl, wBattleMonMoves
.find_player_move
	ld a, [hli]
	cp b
	jr z, .got_player_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_player_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jp PrintDidntAffect2

.got_player_move
	pop hl
	ld a, c
	ld [wCurMoveNum], a
	ld a, b
	ld [wCurPlayerMove], a
	dec a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .finish_move

.force_last_enemy_move
	push hl
	ld a, [wLastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, wEnemyMonMoves
.find_enemy_move
	ld a, [hli]
	cp b
	jr z, .got_enemy_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_enemy_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jp PrintDidntAffect2

.got_enemy_move
	pop hl
	ld a, c
	ld [wCurEnemyMoveNum], a
	ld a, b
	ld [wCurEnemyMove], a
	dec a
	ld de, wEnemyMoveStruct
	call GetMoveData

.finish_move
	call AnimateCurrentMove
	ld hl, GotAnEncoreText
	jp StdBattleTextBox
