PlaceMenuItemName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	pop hl
	call PlaceString
	ret

PlaceMenuItemQuantity:
	push de
	ld a, [wMenuSelection]
	ld [wCurItem], a
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	pop hl
	and a
	jr nz, .done
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wMenuSelectionQuantity
	lb bc, 1, 2
	call PrintNum

.done
	ret

PlaceMoneyTopRight:
	ld hl, MenuHeader_0x24b15
	call CopyMenuHeader
	jr PlaceMoneyTextBox

PlaceMoneyBottomLeft:
	ld hl, MenuHeader_0x24b1d
	call CopyMenuHeader
	jr PlaceMoneyTextBox

PlaceMoneyAtTopLeftOfTextbox:
	ld hl, MenuHeader_0x24b15
	lb de, 0, 11
	call OffsetMenuHeader

PlaceMoneyTextBox:
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	ret

MenuHeader_0x24b15:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, 2
	dw NULL
	db 1 ; default option

MenuHeader_0x24b1d:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 11, 8, 13
	dw NULL
	db 1 ; default option

DisplayCoinCaseBalance:
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 12, 0
	ld b, 1
	ld c, 6
	call TextBox
	hlcoord 17, 1
	ld de, CoinString
	call PlaceString
	hlcoord 17, 1
	ld de, ShowMoney_TerminatorString
	call PlaceString
	ld de, wCoins
	lb bc, 2, 4
	hlcoord 13, 1
	call PrintNum
	ret

DisplayMoneyAndCoinBalance:
	hlcoord 5, 0
	ld b, 3
	ld c, 13
	call TextBox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 12, 1
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 15, 3
	ld de, wCoins
	lb bc, 2, 4
	call PrintNum
	ret

MoneyString:
	db "MONEY@"
CoinString:
	db $c8, $c9
ShowMoney_TerminatorString:
	db "@"

StartMenu_DrawBugContestStatusBox:
	hlcoord 10, 0
	ld b, 2
	ld c, 8
	call TextBox
	ret

StartMenu_PrintBugContestStatus:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 11, 2
	ld de, .Balls_EN
	call PlaceString

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_EXTENDED_SAFARI_GAME_F, [hl]
	jr z, .normal_safari
	hlcoord 15, 1
	ld de, .ExtendedSteps
	call PlaceString
	call PlaceString
	jr .ball_count
.normal_safari
	hlcoord 15, 1
	ld de, .Steps
	call PlaceString
.ball_count
	hlcoord 17, 2
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	hlcoord 12, 1
	ld de, wSafariStepsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 2, 3
	call PrintNum
	pop af
	ld [wOptions], a
	ret

.Balls_EN:
	db "BALLS:@"
.Steps:
	db "/300@"
.ExtendedSteps:
	db "/500@"

StartMenu_PrintSimulationStatus:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 11, 1
	ld de, .SimulationPoints
	call PlaceString
	hlcoord 16, 2
	ld de, wBlueCardBalance
	lb bc, 1, 3
	call PrintNum
	pop af
	ld [wOptions], a
	ret

.SimulationPoints:
	db "POINTS:@"

FindApricornsInBag:
; Checks the bag for Apricorns.
	ld hl, wBuffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, ApricornBalls
	jp FindSpecificItems

FindFossilsInBag:
; Checks the bag for Fossils.
	ld hl, wBuffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, Fossils
	jp FindSpecificItems

FindMushroomsInBag:
; Checks the bag for Mushrooms.
	ld hl, wBuffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, Mushrooms
	jp FindSpecificItems

FindTreasureInBag:
; Checks the bag for Mushrooms.
	ld hl, wBuffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, Treasure
	jp FindSpecificItems

FindSpecificItems:
.loop
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	pop hl
	jr nc, .nope
	ld a, [hl]
	call .addtobuffer
.nope
	inc hl
	inc hl
	jr .loop

.done
	ld a, [wBuffer1]
	and a
	ret nz
	scf
	ret

.addtobuffer
	push hl
	ld hl, wBuffer1
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	ret

INCLUDE "data/items/exchange_items.asm"
