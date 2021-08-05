UnusedTitleScreen:
	call ClearBGPalettes
	call ClearTileMap
	call DisableLCD

	ld de, MUSIC_NONE
	call PlayMusic

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

	ld hl, UnusedTitleBG_GFX
	ld de, vTiles2
	ld bc, vBGMap0 - vTiles2
	call CopyBytes

	ld hl, UnusedTitleBG_GFX + $80 tiles
	ld de, vTiles1
	ld bc, vTiles2 - vTiles1
	call CopyBytes

	ld hl, UnusedTitleFG_GFX
	ld de, vTiles0
	ld bc, vTiles1 - vTiles0
	call CopyBytes

	ld hl, UnusedTitleBG_Tilemap
	debgcoord 0, 1
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
.copy
	ld a, 0
	ldh [rVBK], a
	ld a, [hli]
	ld [de], a
	ld a, 1
	ldh [rVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy

	ld hl, UnusedTitleFG_OAM
	ld de, wVirtualOAMSprite00
	ld bc, SPRITEOAMSTRUCT_LENGTH * NUM_SPRITE_OAM_STRUCTS
	call CopyBytes

	call EnableLCD
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	set rLCDC_SPRITE_SIZE, a
	ldh [rLCDC], a

;	call DelayFrame

	ld de, SFX_INTRO_WHOOSH
	call PlaySFX

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenBlack_Palettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes
	
	ld hl, UnusedTitleFG_Palettes
	ld de, wOBPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, TitleScreenBlack_Palettes
	ld de, wBGPals2
	ld bc, 8 palettes
	call CopyBytes
	
	ld hl, UnusedTitleFG_Palettes
	ld de, wOBPals2
	ld bc, 8 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	ld a, $1
	ldh [hCGBPalUpdate], a
	
	ld c, 10
	call DelayFrames

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenStep2_Palettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, TitleScreenStep2_Palettes
	ld de, wBGPals2
	ld bc, 8 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	ld a, $1
	ldh [hCGBPalUpdate], a
	
	ld c, 5
	call DelayFrames

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenStep3_Palettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, TitleScreenStep3_Palettes
	ld de, wBGPals2
	ld bc, 8 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	ld a, $1
	ldh [hCGBPalUpdate], a
	
	ld c, 5
	call DelayFrames

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 8 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	ld a, $1
	ldh [hCGBPalUpdate], a
	
	call WaitSFX
	ret

UnusedTitleBG_GFX:
INCBIN "gfx/title/title_bg.2bpp"

UnusedTitleBG_Tilemap:
; 32x32 (alternating tiles and attributes)
INCBIN "gfx/title/title_bg.tilemap"

UnusedTitleBG_Palettes:
INCLUDE "gfx/title/title.pal"

UnusedTitleFG_GFX:
INCBIN "gfx/title/old_fg.2bpp"

UnusedTitleFG_Palettes:
INCLUDE "gfx/title/title_fg.pal"

TitleScreenBlack_Palettes:
INCLUDE "gfx/title/title_black.pal"

TitleScreenStep2_Palettes:
INCLUDE "gfx/title/title_step_2.pal"

TitleScreenStep3_Palettes:
INCLUDE "gfx/title/title_step_3.pal"

GS_FG_Palettes:
INCLUDE "gfx/title/unused_gs_fg.pal"

UnusedTitleFG_OAM:
; Row 1
	dsprite 10,  0,  7,  0, $00, 2
	dsprite 10,  0,  8,  0, $02, 2
	dsprite 10,  0,  9,  0, $04, 2
	dsprite 10,  0, 10,  0, $06, 0
	dsprite 10,  0, 11,  0, $08, 0
	dsprite 10,  0, 12,  0, $0a, 2
	dsprite 10,  0, 13,  0, $0c, 2
	dsprite 10,  0, 14,  0, $0e, 2
; Row 2
	dsprite 12,  0,  7,  0, $10, 2
	dsprite 12,  0,  8,  0, $12, 2
	dsprite 12,  0,  9,  0, $14, 2
	dsprite 12,  0, 10,  0, $16, 1
	dsprite 12,  0, 11,  0, $18, 1
	dsprite 12,  0, 12,  0, $1a, 5
	dsprite 12,  0, 13,  0, $1c, 5
	dsprite 12,  0, 14,  0, $1e, 6
; Row 3
	dsprite 14,  0,  7,  0, $20, 2
	dsprite 14,  0,  8,  0, $22, 2
	dsprite 14,  0,  9,  0, $24, 2
	dsprite 14,  0, 10,  0, $26, 3
	dsprite 14,  0, 11,  0, $28, 3
	dsprite 14,  0, 12,  0, $2a, 4
	dsprite 14,  0, 13,  0, $2c, 6
	dsprite 14,  0, 14,  0, $2e, 6
; Row 4
	dsprite 16,  0,  7,  0, $30, 0
	dsprite 16,  0,  8,  0, $32, 0
	dsprite 16,  0,  9,  0, $34, 0
	dsprite 16,  0, 10,  0, $36, 0
	dsprite 16,  0, 11,  0, $38, 0
	dsprite 16,  0, 12,  0, $3a, 0
	dsprite 16,  0, 13,  0, $3c, 0
	dsprite 16,  0, 14,  0, $3e, 0
; Row 5
	dsprite 18,  0, 13,  0, $40, 7
	dsprite 18,  0, 14,  0, $42, 7
	dsprite 18,  0, 15,  0, $44, 7
	dsprite 18,  0, 16,  0, $46, 7
	dsprite 18,  0, 17,  0, $48, 7
	dsprite 18,  0, 18,  0, $4a, 7
	dsprite 18,  0, 19,  0, $4c, 7
	dsprite 18,  0, 20,  0, $4e, 7
