EnteiChamber:
	ld hl, wPartySpecies
	ld a, [hl]
	cp ENTEI ; is Entei the first Pokémon in the party?
	jr nz, .done ; if not, we're done
	ld a, 1
	ld [wScriptVar], a
.done
	ret

SpecialUnownFishing:
	push de
	push bc

	call GetMapAttributesPointer
	ld a, h
	cp HIGH(UnownChamberHN_MapAttributes)
	jr nz, .nope
	ld a, l
	cp LOW(UnownChamberHN_MapAttributes)
	jr nz, .nope
	call GetFacingTileCoord
	call CheckUnownStatueTile
	jr nz, .nope

	ld de, EVENT_FISHED_UNOWN_CHAMBER_HN
	ld b, SET_FLAG
	call EventFlagAction

	scf
	jr .done

.nope
	and a

.done
	pop bc
	pop de
	ret

DisplayUnownWords:
	ld a, [wScriptVar]
	ld hl, MenuHeaders_UnownWalls
	and a
	jr z, .load

	ld d, $0
	ld e, $5
.loop
	add hl, de
	dec a
	jr nz, .loop

.load
	call LoadMenuHeader
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	call MenuBoxCoord2Tile
	inc hl
	ld d, 0
	ld e, SCREEN_WIDTH
	add hl, de
	add hl, de
	ld a, [wScriptVar]
	ld c, a
	ld de, UnownWalls
	and a
	jr z, .copy
.loop2
	ld a, [de]
	inc de
	cp -1
	jr nz, .loop2
	dec c
	jr nz, .loop2
.copy
	call _DisplayUnownWords_CopyWord
	ld bc, wAttrMap - wTileMap
	add hl, bc
	call _DisplayUnownWords_FillAttr
	call WaitBGMap2
	call JoyWaitAorB
	call PlayClickSFX
	call CloseWindow
	ret

INCLUDE "data/events/unown_walls.asm"

_DisplayUnownWords_FillAttr:
	ld a, [de]
	cp $ff
	ret z
	cp $60
	ld a, VRAM_BANK_1 | PAL_BG_BROWN
	jr c, .got_pal
	ld a, PAL_BG_BROWN

.got_pal
	call .PlaceSquare
	inc hl
	inc hl
	inc de
	jr _DisplayUnownWords_FillAttr

.PlaceSquare:
	push hl
	ld [hli], a
	ld [hld], a
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	pop hl
	ret

_DisplayUnownWords_CopyWord:
	push hl
	push de
.word_loop
	ld a, [de]
	cp $ff
	jr z, .word_done
	ld c, a
	call .ConvertChar
	inc hl
	inc hl
	inc de
	jr .word_loop

.word_done
	pop de
	pop hl
	ret

.ConvertChar:
	push hl
	ld a, c
	cp $60
	jr z, .Tile60
	cp $62
	jr z, .Tile62
	cp $64
	jr z, .Tile64
	ld [hli], a
	inc a
	ld [hld], a
	dec a
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld c, $10
	add c
	ld [hli], a
	inc a
	ld [hl], a
	pop hl
	ret

.Tile60:
	ld [hl], $5b
	inc hl
	ld [hl], $5c
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hl], $4d
	inc hl
	ld [hl], $5d
	pop hl
	ret

.Tile62:
	ld [hl], $4e
	inc hl
	ld [hl], $4f
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hl], $5e
	inc hl
	ld [hl], $5f
	pop hl
	ret

.Tile64:
	ld [hl], $2
	inc hl
	ld [hl], $3
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hl], $3
	inc hl
	ld [hl], $2
	pop hl
	ret
