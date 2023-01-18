_AnimateTileset::
; Iterate over a given pointer array of
; animation functions (one per frame).

; Typically in wra1, vra0

	ld a, [wTilesetAnim]
	ld e, a
	ld a, [wTilesetAnim + 1]
	ld d, a

	ldh a, [hTileAnimFrame]
	ld l, a
	inc a
	ldh [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de.
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl

Tileset0Anim:
TilesetKantoAnim:
TilesetJohtoCityAnim:
TilesetForestAnim:
TilesetMountainAnim:
	dw vTiles2 tile $49, AnimateWaterTile
	dw NULL,  LavaBubbleAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim1
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetGameCornerAnim:
;	dw NULL,  AnimateRoofPalette
	dw vTiles2 tile $11, AnimateLeftArcadeScreenTile
	dw vTiles2 tile $12, AnimateRightArcadeScreenTile
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
	
TilesetLostLandAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetPokemonLeagueOutsideAnim:
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetOceanAnim:
	dw vTiles2 tile $49, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $49, WriteTileFromBuffer
	dw NULL,  AnimateWaterPalette
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetVolcanoAnim:
	dw vTiles2 tile $49, AnimateWaterTile
	dw NULL,  LavaBubbleAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetParkAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $5f, AnimateFountain
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetJohtoAnim:
	dw vTiles2 tile $49, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc0d7:
	dw vTiles2 tile $03, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc103:
	dw vTiles2 tile $14, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetPortAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw vTiles2 tile $2c, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileLeft
	dw vTiles2 tile $2c, WriteTileFromBuffer
	dw NULL, AnimateLeftGeyserTile
	dw NULL, AnimateRightGeyserTile
	dw NULL, AnimateLeftGeyserTile2
	dw NULL, AnimateRightGeyserTile2
	dw NULL, AnimateLeftGeyserTile3
	dw NULL, AnimateRightGeyserTile3
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette	
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetEliteFourRoomAnim:
TilesetCastleAnim:
	dw NULL,  LavaBubbleAnim2
	dw NULL,  WallCandleTileAnim
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc17f:
	dw vTiles2 tile $53, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $53, WriteTileFromBuffer
	dw vTiles2 tile $03, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromBuffer
	dw vTiles2 tile $53, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $53, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc1af:
	dw vTiles2 tile $54, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $54, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $03, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $54, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $54, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation

TilesetCaveAnim:
TilesetDarkCaveAnim:
	dw vTiles2 tile $14, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  AnimateWaterPalette
	dw vTiles2 tile $40, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $40, WriteTileFromBuffer
	dw NULL,  LavaBubbleAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetChampionsRoomAnim:
TilesetTowerAnim:
	dw NULL, AnimateRightFireTile
	dw NULL, AnimateLeftFireTile
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc2bf:
	dw vTiles2 tile $4f, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $4f, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetHouseAnim:
TilesetPlayersHouseAnim:
TilesetPokecenterAnim:
TilesetLabAnim:
TilesetMartAnim:
TilesetMansionAnim:
TilesetTraditionalHouseAnim:
TilesetTrainStationAnim:
TilesetLighthouseAnim:
TilesetPlayersRoomAnim:
TilesetBattleTowerAnim:
TilesetRuinsOfAlphAnim:
TilesetRadioTowerAnim:
TilesetUndergroundAnim:
TilesetBetaWordRoomAnim:
TilesetHoOhWordRoomAnim:
TilesetKabutoWordRoomAnim:
TilesetOmanyteWordRoomAnim:
TilesetAerodactylWordRoomAnim:
TilesetRoofAnim:
TilesetPokecomCenterAnim:
TilesetCyberspaceAnim:
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetIcePathAnim:
	dw vTiles2 tile $09, AnimateWaterTile
	dw NULL,  StandingTileFrame8
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetPokemonLeagueAnim:
	dw vTiles2 tile $57, AnimateTopLeftIceWaterTile
	dw vTiles2 tile $58, AnimateTopRightIceWaterTile
	dw vTiles2 tile $67, AnimateBottomLeftIceWaterTile
	dw vTiles2 tile $68, AnimateBottomRightIceWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetGateAnim:
	dw vTiles2 tile $22, ScrollTileUp
	dw vTiles2 tile $23, ScrollTileDown
	dw vTiles2 tile $22, ScrollTileUp
	dw vTiles2 tile $23, ScrollTileDown
	dw vTiles2 tile $32, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $1e, AnimateFountain
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateYellowPalette
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
;	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetFacilityAnim:
	dw vTiles2 tile $26, AnimateWaterTile
	dw vTiles2 tile $6b, AnimateTopLeftTubeTile
	dw vTiles2 tile $6c, AnimateTopRightTubeTile
	dw vTiles2 tile $7b, AnimateBottomLeftTubeTile
	dw vTiles2 tile $7c, AnimateBottomRightTubeTile
	dw vTiles2 tile $69, AnimateTopLeftEmptyTubeTile
	dw vTiles2 tile $6a, AnimateTopRightEmptyTubeTile
	dw vTiles2 tile $79, AnimateBottomLeftEmptyTubeTile
	dw vTiles2 tile $7a, AnimateBottomRightEmptyTubeTile
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
	
DoneTileAnimation:
; Reset the animation command loop.
	xor a
	ldh [hTileAnimFrame], a

WaitTileAnimation:
; Do nothing this frame.
	ret

StandingTileFrame8:
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	ret

ScrollTileRightLeft:
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileLeft
	jr ScrollTileRight

ScrollTileUpDown:
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileDown
	jr ScrollTileUp

ScrollTileLeft:
	ld h, d
	ld l, e
	ld c, 4
.loop
rept 4
	ld a, [hl]
	rlca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileRight:
	ld h, d
	ld l, e
	ld c, 4
.loop
rept 4
	ld a, [hl]
	rrca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileUp:
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, TILE_WIDTH * 2 - 2
	add hl, bc
	ld a, TILE_WIDTH / 2
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret

ScrollTileDown:
	ld h, d
	ld l, e
	ld de, TILE_WIDTH * 2 - 2
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, TILE_WIDTH / 2
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret

AnimateFountain:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld hl, .frames
	ld a, [wTileAnimationTimer]
	and %111
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame1

.frame1 INCBIN "gfx/tilesets/fountain/1.2bpp"
.frame2 INCBIN "gfx/tilesets/fountain/2.2bpp"
.frame3 INCBIN "gfx/tilesets/fountain/3.2bpp"
.frame4 INCBIN "gfx/tilesets/fountain/4.2bpp"
.frame5 INCBIN "gfx/tilesets/fountain/5.2bpp"

AnimateLeftFireTile:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and %110
	srl a
	inc a
	inc a
	and %011
	swap a
	ld e, a
	ld d, 0
	ld hl, LeftFireTileFrames
	add hl, de
	ld sp, hl
	ld hl, vTiles2 tile $24
	jp WriteTile
	
LeftFireTileFrames:
	INCBIN "gfx/tilesets/fire/left_1.2bpp"
	INCBIN "gfx/tilesets/fire/left_2.2bpp"
	INCBIN "gfx/tilesets/fire/right_3.2bpp"
	INCBIN "gfx/tilesets/fire/right_4.2bpp"
	
AnimateRightFireTile:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and %110
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, RightFireTileFrames
	add hl, de
	ld sp, hl
	ld hl, vTiles2 tile $25
	jp WriteTile

RightFireTileFrames:
	INCBIN "gfx/tilesets/fire/right_1.2bpp"
	INCBIN "gfx/tilesets/fire/right_2.2bpp"
	INCBIN "gfx/tilesets/fire/left_4.2bpp"
	INCBIN "gfx/tilesets/fire/left_3.2bpp"
	
AnimateLeftGeyserTile:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(LeftGeyserTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(LeftGeyserTileFrames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $23
	jp WriteTile
	
LeftGeyserTileFrames:
	INCBIN "gfx/tilesets/geyser/left_1.2bpp"
	INCBIN "gfx/tilesets/geyser/left_2.2bpp"

WallCandleTileAnim:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(WallCandleTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(WallCandleTileFrames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile
	
WallCandleTileFrames:
	INCBIN "gfx/tilesets/candle/2.2bpp"
	INCBIN "gfx/tilesets/candle/1.2bpp"

AnimateLeftGeyserTile2:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(LeftGeyserTile2Frames)
	ld l, a
	ld a, 0
	adc HIGH(LeftGeyserTile2Frames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $33
	jp WriteTile
	
LeftGeyserTile2Frames:
	INCBIN "gfx/tilesets/geyser/left_3.2bpp"
	INCBIN "gfx/tilesets/geyser/left_4.2bpp"

AnimateLeftGeyserTile3:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(LeftGeyserTile3Frames)
	ld l, a
	ld a, 0
	adc HIGH(LeftGeyserTile3Frames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $43
	jp WriteTile
	
LeftGeyserTile3Frames:
	INCBIN "gfx/tilesets/geyser/left_5.2bpp"
	INCBIN "gfx/tilesets/geyser/left_6.2bpp"

AnimateRightGeyserTile:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(RightGeyserTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(RightGeyserTileFrames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $24
	jp WriteTile
	
RightGeyserTileFrames:
	INCBIN "gfx/tilesets/geyser/right_1.2bpp"
	INCBIN "gfx/tilesets/geyser/right_2.2bpp"

AnimateRightGeyserTile2:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(RightGeyserTile2Frames)
	ld l, a
	ld a, 0
	adc HIGH(RightGeyserTile2Frames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $34
	jp WriteTile
	
RightGeyserTile2Frames:
	INCBIN "gfx/tilesets/geyser/right_3.2bpp"
	INCBIN "gfx/tilesets/geyser/right_4.2bpp"

AnimateRightGeyserTile3:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(RightGeyserTile3Frames)
	ld l, a
	ld a, 0
	adc HIGH(RightGeyserTile3Frames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $44
	jp WriteTile
	
RightGeyserTile3Frames:
	INCBIN "gfx/tilesets/geyser/right_5.2bpp"
	INCBIN "gfx/tilesets/geyser/right_6.2bpp"

AnimateWaterTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(WaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(WaterTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

WaterTileFrames:
	INCBIN "gfx/tilesets/water/water.2bpp"

AnimateTopLeftIceWaterTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(TopLeftIceWaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(TopLeftIceWaterTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

TopLeftIceWaterTileFrames:
	INCBIN "gfx/tilesets/ice-water/top_left.2bpp"

AnimateTopRightIceWaterTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(TopRightIceWaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(TopRightIceWaterTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

TopRightIceWaterTileFrames:
	INCBIN "gfx/tilesets/ice-water/top_right.2bpp"

AnimateBottomLeftIceWaterTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(BottomLeftIceWaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(BottomLeftIceWaterTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

BottomLeftIceWaterTileFrames:
	INCBIN "gfx/tilesets/ice-water/bottom_left.2bpp"

AnimateBottomRightIceWaterTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(BottomRightIceWaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(BottomRightIceWaterTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

BottomRightIceWaterTileFrames:
	INCBIN "gfx/tilesets/ice-water/bottom_right.2bpp"

AnimateLeftArcadeScreenTile:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(LeftArcadeScreenTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(LeftArcadeScreenTileFrames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $11
	jp WriteTile

LeftArcadeScreenTileFrames:
	INCBIN "gfx/tilesets/arcade-screen/left_1.2bpp"
	INCBIN "gfx/tilesets/arcade-screen/left_2.2bpp"

AnimateRightArcadeScreenTile:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(RightArcadeScreenTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(RightArcadeScreenTileFrames)
	ld h, a

	ld sp, hl
	ld hl, vTiles2 tile $12
	jp WriteTile
	
RightArcadeScreenTileFrames:
	INCBIN "gfx/tilesets/arcade-screen/right_1.2bpp"
	INCBIN "gfx/tilesets/arcade-screen/right_2.2bpp"

AnimateTopLeftTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(TopLeftTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(TopLeftTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

TopLeftTubeTileFrames:
	INCBIN "gfx/tilesets/tube/top_left.2bpp"

AnimateTopRightTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(TopRightTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(TopRightTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

TopRightTubeTileFrames:
	INCBIN "gfx/tilesets/tube/top_right.2bpp"

AnimateBottomLeftTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(BottomLeftTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(BottomLeftTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

BottomLeftTubeTileFrames:
	INCBIN "gfx/tilesets/tube/bottom_left.2bpp"

AnimateBottomRightTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(BottomRightTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(BottomRightTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

BottomRightTubeTileFrames:
	INCBIN "gfx/tilesets/tube/bottom_right.2bpp"


AnimateTopLeftEmptyTubeTile:

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(TopLeftEmptyTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(TopLeftEmptyTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

TopLeftEmptyTubeTileFrames:
	INCBIN "gfx/tilesets/tube_empty/top_left.2bpp"

AnimateTopRightEmptyTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(TopRightEmptyTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(TopRightEmptyTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

TopRightEmptyTubeTileFrames:
	INCBIN "gfx/tilesets/tube_empty/top_right.2bpp"

AnimateBottomLeftEmptyTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(BottomLeftEmptyTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(BottomLeftEmptyTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

BottomLeftEmptyTubeTileFrames:
	INCBIN "gfx/tilesets/tube_empty/bottom_left.2bpp"

AnimateBottomRightEmptyTubeTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(BottomRightEmptyTubeTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(BottomRightEmptyTubeTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

BottomRightEmptyTubeTileFrames:
	INCBIN "gfx/tilesets/tube_empty/bottom_right.2bpp"

ForestTreeLeftAnimation:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc46c
	ld hl, ForestTreeLeftFrames
	jr .asm_fc47d

.asm_fc46c
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.asm_fc47d
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeLeftFrames:
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"

ForestTreeRightFrames:
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"

ForestTreeRightAnimation:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc4d4
	ld hl, ForestTreeRightFrames
	jr .asm_fc4eb

.asm_fc4d4
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc4eb
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

ForestTreeLeftAnimation2:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc502
	ld hl, ForestTreeLeftFrames
	jr .asm_fc515

.asm_fc502
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.asm_fc515
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeRightAnimation2:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc52c
	ld hl, ForestTreeRightFrames
	jr .asm_fc545

.asm_fc52c
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc545
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

GetForestTreeFrame:
; Return 0 if a is even, or 2 if odd.
	and 1
	add a
	ret

AnimateFlowerTile:
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [wTileAnimationTimer]
	and %10

; CGB has different color mappings for flowers.
	ld e, a
	ldh a, [hCGB]
	and 1
	add e

	swap a
	ld e, a
	ld d, 0
	ld hl, FlowerTileFrames
	add hl, de
	ld sp, hl

	ld hl, vTiles2 tile $39

	jp WriteTile

FlowerTileFrames:
	INCBIN "gfx/tilesets/flower/dmg_1.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_1.2bpp"
	INCBIN "gfx/tilesets/flower/dmg_2.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_2.2bpp"

LavaBubbleAnim1:
; Splash in the bottom-right corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and %110
	srl a
	inc a
	inc a
	and %011
	swap a
	ld e, a
	ld d, 0
	ld hl, LavaBubbleFrames
	add hl, de
	ld sp, hl
	ld hl, vTiles2 tile $07
	jp WriteTile

LavaBubbleAnim2:
; Splash in the top-left corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and %110
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, LavaBubbleFrames
	add hl, de
	ld sp, hl
	ld hl, vTiles2 tile $08
	jp WriteTile

LavaBubbleFrames:
	INCBIN "gfx/tilesets/lava/1.2bpp"
	INCBIN "gfx/tilesets/lava/2.2bpp"
	INCBIN "gfx/tilesets/lava/3.2bpp"
	INCBIN "gfx/tilesets/lava/4.2bpp"

AnimateTowerPillarTile:
; Read from struct at de:
; 	Destination (VRAM)
;	Address of the first tile in the frame array

	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]
	and %111

; Get frame index a
	ld hl, .frames
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

; Destination
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Add the frame index to the starting address
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jr WriteTile

.frames
	db $00, $10, $20, $30, $40, $30, $20, $10

StandingTileFrame:
	ld hl, wTileAnimationTimer
	inc [hl]
	ret

AnimateWhirlpoolTile:
; Update whirlpool tile using struct at de.

; Struct:
; 	VRAM address
;	Address of the first tile

; Only does one of 4 tiles at a time.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; de = VRAM address
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; Tile address is now at hl.

; Get the tile for this frame.
	ld a, [wTileAnimationTimer]
	and %11 ; 4 frames x2
	swap a  ; * 16 bytes per tile

	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; The stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jr WriteTile

WriteTileFromBuffer:
; Write tiledata at wTileAnimBuffer to de.
; wTileAnimBuffer is loaded to sp for WriteTile.

	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, wTileAnimBuffer
	ld sp, hl

	ld h, d
	ld l, e
	jr WriteTile

WriteTileToBuffer:
; Write tiledata de to wTileAnimBuffer.
; de is loaded to sp for WriteTile.

	ld hl, sp+0
	ld b, h
	ld c, l

	ld h, d
	ld l, e
	ld sp, hl

	ld hl, wTileAnimBuffer

	; fallthrough

WriteTile:
; Write one 8x8 tile ($10 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 7
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; restore sp
	ld h, b
	ld l, c
	ld sp, hl
	ret

AnimateWaterPalette:
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ldh a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...

	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_WATER
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Update color 0 in order 0 1 2 1
	ld a, l
	and %110 ; frames 0 2 4 6
	jr z, .color0
	cp %100 ; frame 4
	jr z, .color2

.color1
	ld hl, wBGPals1 palette PAL_BG_WATER color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wBGPals1 palette PAL_BG_WATER color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color2
	ld hl, wBGPals1 palette PAL_BG_WATER color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret
	
AnimateYellowPalette:
; Transition between color values 0-2 for color 0 in palette 4.

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...

	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_YELLOW
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Update color 0 in order 0 1 2 1
	ld a, l
	and %110 ; frames 0 2 4 6
	jr z, .color0
	cp %100 ; frame 4
	jr z, .color2

.color1
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color2
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret

AnimateRoofPalette:
; Transition between color values 0-2 for color 0 in palette 3.

; We don't want to mess with non-standard palettes.
	ldh a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...

	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_ROOF color 1
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Update color 0 in order 0 1 2 1
	ld a, l
	and %110 ; frames 0 2 4 6
	jr z, .color0
	cp %100 ; frame 4
	jr z, .color2

.color1
	ld hl, wBGPals1 palette PAL_BG_ROOF color 1
	jr .end

.color0
	ld hl, wBGPals1 palette PAL_BG_ROOF color 0
	jr .end

.color2
	ld hl, wBGPals1 palette PAL_BG_ROOF color 0

.end
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	pop af
	ldh [rSVBK], a
	ret

TowerPillarTilePointer1:  dw vTiles2 tile $2d, TowerPillarTile1
TowerPillarTilePointer2:  dw vTiles2 tile $2f, TowerPillarTile2
TowerPillarTilePointer3:  dw vTiles2 tile $3d, TowerPillarTile3
TowerPillarTilePointer4:  dw vTiles2 tile $3f, TowerPillarTile4
TowerPillarTilePointer5:  dw vTiles2 tile $3c, TowerPillarTile5
TowerPillarTilePointer6:  dw vTiles2 tile $2c, TowerPillarTile6
TowerPillarTilePointer7:  dw vTiles2 tile $4d, TowerPillarTile7
TowerPillarTilePointer8:  dw vTiles2 tile $4f, TowerPillarTile8
TowerPillarTilePointer9:  dw vTiles2 tile $5d, TowerPillarTile9
TowerPillarTilePointer10: dw vTiles2 tile $5f, TowerPillarTile10

TowerPillarTile1:  INCBIN "gfx/tilesets/tower-pillar/1.2bpp"
TowerPillarTile2:  INCBIN "gfx/tilesets/tower-pillar/2.2bpp"
TowerPillarTile3:  INCBIN "gfx/tilesets/tower-pillar/3.2bpp"
TowerPillarTile4:  INCBIN "gfx/tilesets/tower-pillar/4.2bpp"
TowerPillarTile5:  INCBIN "gfx/tilesets/tower-pillar/5.2bpp"
TowerPillarTile6:  INCBIN "gfx/tilesets/tower-pillar/6.2bpp"
TowerPillarTile7:  INCBIN "gfx/tilesets/tower-pillar/7.2bpp"
TowerPillarTile8:  INCBIN "gfx/tilesets/tower-pillar/8.2bpp"
TowerPillarTile9:  INCBIN "gfx/tilesets/tower-pillar/9.2bpp"
TowerPillarTile10: INCBIN "gfx/tilesets/tower-pillar/10.2bpp"

WhirlpoolFrames1: dw vTiles2 tile $32, WhirlpoolTiles1
WhirlpoolFrames2: dw vTiles2 tile $33, WhirlpoolTiles2
WhirlpoolFrames3: dw vTiles2 tile $42, WhirlpoolTiles3
WhirlpoolFrames4: dw vTiles2 tile $43, WhirlpoolTiles4

WhirlpoolTiles1: INCBIN "gfx/tilesets/whirlpool/1.2bpp"
WhirlpoolTiles2: INCBIN "gfx/tilesets/whirlpool/2.2bpp"
WhirlpoolTiles3: INCBIN "gfx/tilesets/whirlpool/3.2bpp"
WhirlpoolTiles4: INCBIN "gfx/tilesets/whirlpool/4.2bpp"
