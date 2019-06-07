GiftMonMoves:

	ld a, [wScriptVar]
	cp $2
	ret nc
	ld bc, wPartyCount
	ld a, [bc]
	ld hl, MON_SPECIES
	call .GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PARTYMON_STRUCT_LENGTH
.CheckForMon:
; start at the end of the party and search backwards for a Dratini
	ld a, [hl]
	cp KANGASKHAN
	jr z, .GiveMoveset1
	ld a, [hl]
	cp TOTODILE
	jr z, .GiveMoveset2
	ld a, [hl]
	cp CYNDAQUIL
	jr z, .GiveMoveset3
	ld a, [hl]
	cp CHIKORITA
	jr z, .GiveMoveset4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset1:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset1
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de
	jr .GiveMoves
	
.GiveMoveset2:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset2
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoveset3:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset3
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoveset4:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset4
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	push hl
	push de
	ld [de], a ; give the Pokémon the new move

	; get the PP of the new move
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte

	; get the address of the move's PP and update the PP
	ld hl, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a

	pop de
	pop hl
	inc de
	inc hl
	jr .GiveMoves

.Moveset1:
	db HEADBUTT
	db COUNTER
	db FORESIGHT
	db MILK_DRINK
	db 0
	
.Moveset2:
	db AQUA_JET
	db ICE_PUNCH
	db BITE
	db ANCIENTPOWER
	db 0
	
.Moveset3:
	db FLAME_WHEEL
	db WILD_CHARGE
	db SUBMISSION
	db ROLLOUT
	db 0
	
.Moveset4:
	db GIGA_DRAIN
	db HEAL_BELL
	db LEECH_SEED
	db ANCIENTPOWER
	db 0

.GetNthPartyMon:
; inputs:
; hl must be set to 0 before calling this function.
; a must be set to the number of Pokémon in the party.

; outputs:
; returns the address of the last Pokémon in the party in hl.
; sets carry if a is 0.

	ld de, wPartyMon1
	add hl, de
	and a
	jr z, .EmptyParty
	dec a
	ret z
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	add hl, de
	dec a
	jr nz, .loop
	ret

.EmptyParty:
	scf
	ret
