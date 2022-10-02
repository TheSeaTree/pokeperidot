BattleAnimCmd_RaiseSub:
	ldh a, [rSVBK]
	push af
	ld a, 1 ; unnecessary bankswitch?
	ldh [rSVBK], a
	xor a ; sScratch
	call GetSRAMBank

GetSubstitutePic: ; used only for BANK(GetSubstitutePic)

	ld hl, sScratch
	ld bc, (7 * 7) tiles
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ldh a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, MonsterSpriteGFX + 0 tiles
	ld de, sScratch + (2 * 7 + 5) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 1 tiles
	ld de, sScratch + (3 * 7 + 5) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 2 tiles
	ld de, sScratch + (2 * 7 + 6) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 3 tiles
	ld de, sScratch + (3 * 7 + 6) tiles
	call .CopyTile

	ld hl, vTiles2 tile $00
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 7 * 7
	call Request2bpp
	jr .done

.player
	ld hl, MonsterSpriteGFX + 4 tiles
	ld de, sScratch + (2 * 6 + 4) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 5 tiles
	ld de, sScratch + (3 * 6 + 4) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 6 tiles
	ld de, sScratch + (2 * 6 + 5) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 7 tiles
	ld de, sScratch + (3 * 6 + 5) tiles
	call .CopyTile

	ld hl, vTiles2 tile $31
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 6 * 6
	call Request2bpp

.done
	call CloseSRAM
	pop af
	ldh [rSVBK], a
	ret

.CopyTile:
	ld bc, 1 tiles
	ld a, BANK(MonsterSpriteGFX)
	call FarCopyBytes
	ret