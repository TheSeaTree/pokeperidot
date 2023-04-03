Pokepic::
	hlcoord 6, 4
	ld b, 7
	ld c, 7
	call TextBox
	call UpdateSprites
	call ApplyTilemap
	ld b, SCGB_POKEPIC
	call GetSGBLayout
	xor a
	ldh [hBGMapMode], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld de, vTiles1
	predef GetMonFrontpic
_Displaypic:
	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	hlcoord 7, 5
	ld a, $80
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

Trainerpic::
	hlcoord 6, 4
	ld b, 7
	ld c, 7
	call TextBox
	call UpdateSprites
	call ApplyTilemap
	ld b, SCGB_POKEPIC
	call GetSGBLayout
	xor a
	ldh [hBGMapMode], a
	ld a, [wTrainerClass]
	ld de, vTiles1
	farcall GetTrainerPic
	jr _Displaypic

ClosePokepic::
	ld hl, PokepicMenuHeader
	call CopyMenuHeader
	call ClearMenuBoxInterior
	call WaitBGMap
	call GetMemSGBLayout
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call LoadStandardFont
	ret

PokepicMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 14, 13
	dw NULL
	db 1 ; default option
