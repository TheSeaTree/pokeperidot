_Diploma:
	call PlaceDiplomaOnScreen
	call WaitPressAorB_BlinkCursor
	ret

PlaceDiplomaOnScreen:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, DiplomaGFX
	ld de, vTiles2
	call Decompress
	ld hl, DiplomaMaleTilemap
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .draw
	ld hl, DiplomaFemaleTilemap
.draw
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .Player
	hlcoord 2, 5
	call PlaceString
	ld de, .EmptyString
	hlcoord 15, 5
	call PlaceString
	ld de, wPlayerName
	hlcoord 9, 5
	call PlaceString
	ld de, .Certification
	hlcoord 2, 8
	call PlaceString
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_BETA_POKER
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	ret

.Player:
	db "PLAYER:@"

.EmptyString:
	db "@"

.Certification:
	db   "This certifies"
	next "that you have"
	next "completed the"
	next "#DEX."
	db   "@"

PrintDiplomaPage2:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7f
	call ByteFill
	ld hl, DiplomaPage2Tilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .GameFreak
	hlcoord 8, 0
	call PlaceString
	ld de, .PlayTime
	hlcoord 3, 15
	call PlaceString
	hlcoord 12, 15
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], $67 ; colon
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.PlayTime: db "PLAY TIME@"
.GameFreak: db "GAME FREAK@"

DiplomaGFX:
INCBIN "gfx/diploma/diploma.2bpp.lz"

DiplomaMaleTilemap:
INCBIN "gfx/diploma/male.tilemap"

DiplomaFemaleTilemap:
INCBIN "gfx/diploma/female.tilemap"

DiplomaPage2Tilemap:
INCBIN "gfx/diploma/page2.tilemap"
