KangaskhanGiftMon:
	call CheckMon

.CheckForMon:
; start at the end of the party and search backwards for a valid Pokemon
	ld a, [hl]
	cp KANGASKHAN
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves

.Moveset:
	db HEADBUTT
	db COUNTER
	db FORESIGHT
	db MILK_DRINK
	db 0

GetNthPartyMon:
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
	
TotodileGiftMon:
	call CheckMon
	
.CheckForMon:
; start at the end of the party and search backwards for a valid Pokemon
	ld a, [hl]
	cp TOTODILE
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves

.Moveset:
	db AQUA_JET
	db ICE_PUNCH
	db BITE
	db ANCIENTPOWER
	db 0

.EmptyParty:
	scf
	ret
	
CyndaquilGiftMon:
	call CheckMon
	
.CheckForMon:
; start at the end of the party and search backwards for a valid Pokemon
	ld a, [hl]
	cp CYNDAQUIL
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves

.Moveset:
	db FLAME_WHEEL
	db WILD_CHARGE
	db SUBMISSION
	db ROLLOUT
	db 0

.EmptyParty:
	scf
	ret
	
ChikoritaGiftMon:
	call CheckMon

.CheckForMon:
; start at the end of the party and search backwards for a valid Pokemon
	ld a, [hl]
	cp CHIKORITA
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves

.Moveset:
	db GIGA_DRAIN
	db GROWTH
	db LEECH_SEED
	db ANCIENTPOWER
	db 0

.EmptyParty:
	scf
	ret
	
MagikarpGiftMon:
	call CheckMon
	
.CheckForMon:
; start at the end of the party and search backwards for a valid Pokemon
	ld a, [hl]
	cp MAGIKARP
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves

.Moveset:
	db SPLASH
	db TACKLE
	db FLAIL
	db DIVE_BOMB
	db 0

.EmptyParty:
	scf
	ret

BattleSimGiftMon:
	call CheckMon

.CheckForMon:
; start at the end of the party and search backwards for a valid Pokemon
	ld a, [hl]
	cp PORYGON2
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForMon
	ret

.GiveMoveset:
; Porgyon2 holding a Trick Mirror gets a single moveset
	push hl
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp TRICK_MIRROR
	pop hl
	jr z, .GiveMoveset5

; All others have a 25% chance of getting a different moveset
	call Random
	cp 75 percent
	jr nc, .GiveMoveset2
	cp 50 percent
	jr nc, .GiveMoveset3
	cp 25 percent
	jr nc, .GiveMoveset4

	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset1
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves1:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves1

.GiveMoveset2:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset2
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves2:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves2

.GiveMoveset3:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset3
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves3:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves3

.GiveMoveset4:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset4
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves4:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves4

.GiveMoveset5:
	push hl
	ld a, [wScriptVar]
	ld hl, .Moveset5
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves5:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	call GiveMovesCommon
	jr .GiveMoves5

.Moveset1:
	db HYPER_BEAM
	db ICE_BEAM
	db THUNDERBOLT
	db RECOVER
	db 0

.Moveset2:
	db SHARPEN
	db HEADBUTT
	db THIEF
	db RECOVER
	db 0

.Moveset3:
	db NASTY_PLOT
	db PSYCHIC_M
	db SHADOW_BALL
	db RECOVER
	db 0

.Moveset4:
	db LOCK_ON
	db BLIZZARD
	db THUNDER
	db RECOVER
	db 0

.Moveset5
	db NASTY_PLOT
	db HEADBUTT
	db THIEF
	db RECOVER
	db 0

GiveMovesCommon:
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
	ret

CheckMon:
	ld a, [wScriptVar]
	cp $2
	ret nc
	ld bc, wPartyCount
	ld a, [bc]
	ld hl, MON_SPECIES
	call GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PARTYMON_STRUCT_LENGTH
	ret
