	const_def
	const MARTTEXT_HOW_MANY
	const MARTTEXT_COSTS_THIS_MUCH
	const MARTTEXT_NOT_ENOUGH_MONEY
	const MARTTEXT_BAG_FULL
	const MARTTEXT_HERE_YOU_GO
	const MARTTEXT_SOLD_OUT

OpenMartDialog::
	call GetMart
	ld a, c
	ld [wEngineBuffer1], a
	call LoadMartPointer
	ld a, [wEngineBuffer1]
	ld hl, .dialogs
	rst JumpTable
	ret

.dialogs
	dw MartDialog
	dw HerbShop
	dw BargainShop
	dw Pharmacist
	dw RooftopSale
	dw Robbed
	dw Drinks

MartDialog:
	ld a, 0
	ld [wEngineBuffer1], a
	xor a ; STANDARDMART_HOWMAYIHELPYOU
	ld [wEngineBuffer5], a
	call StandardMart
	ret

HerbShop:
	call FarReadMart
	call LoadStandardMenuHeader
	ld hl, Text_HerbShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_HerbShop_ComeAgain
	call MartTextBox
	ret

BargainShop:
	ld b, BANK(BargainShopData)
	ld de, BargainShopData
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuHeader
	ld hl, Text_BargainShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, wBargainShopFlags
	ld a, [hli]
	or [hl]
	jr z, .skip_set
	ld hl, wDailyFlags1
	set DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F, [hl]

.skip_set
	ld hl, Text_BargainShop_ComeAgain
	call MartTextBox
	ret

Pharmacist:
	call FarReadMart
	call LoadStandardMenuHeader
	ld hl, Text_Pharmacist_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Pharmacist_ComeAgain
	call MartTextBox
	ret

Robbed:
	call FarReadMart
	call LoadStandardMenuHeader
	ld hl, Text_Pharmacist_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Pharmacist_ComeAgain
	call MartTextBox
	ret

Drinks:
	call FarReadMart
	call LoadStandardMenuHeader
	ld hl, Text_Mart_DrinksIntro
	call MartTextBox
	call BuyMenu
	ld hl, Text_BargainShop_ComeAgain
	call MartTextBox
	ret

RooftopSale:
	ld b, BANK(RooftopSaleMart1)
	ld de, RooftopSaleMart1
	ld a, [wTimeOfDay]
	cp DAY_F
	jr c, .ok

	ld b, BANK(RooftopSaleMart2)
	ld de, RooftopSaleMart2
	ld a, [wTimeOfDay]
	cp NITE_F
	jr c, .ok

	ld b, BANK(RooftopSaleMart3)
	ld de, RooftopSaleMart3

.ok
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuHeader
	ld hl, Text_Mart_RooftopIntro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Mart_ComeAgain
	call MartTextBox
	ret

INCLUDE "data/items/rooftop_sale.asm"

LoadMartPointer:
	ld a, b
	ld [wMartPointerBank], a
	ld a, e
	ld [wMartPointer], a
	ld a, d
	ld [wMartPointer + 1], a
	ld hl, wCurMart
	xor a
	ld bc, wCurMartEnd - wCurMart
	call ByteFill
	xor a
	ld [wEngineBuffer5], a
	ld [wBargainShopFlags], a
	ld [wFacingDirection], a
	ret

GetMart:
	ld a, e
	cp (Marts.End - Marts) / 2
	jr c, .IsAMart
	ld b, BANK(DefaultMart)
	ld de, DefaultMart
	ret

.IsAMart:
	ld hl, Marts
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, BANK(Marts)
	ret

; StandardMart.MartFunctions indexes
	const_def
	const STANDARDMART_HOWMAYIHELPYOU ; 0
	const STANDARDMART_TOPMENU        ; 1
	const STANDARDMART_BUY            ; 2
	const STANDARDMART_SELL           ; 3
	const STANDARDMART_QUIT           ; 4
	const STANDARDMART_ANYTHINGELSE   ; 5

StandardMart:
.loop
	ld a, [wEngineBuffer5]
	ld hl, .MartFunctions
	rst JumpTable
	ld [wEngineBuffer5], a
	cp -1
	jr nz, .loop
	ret

.MartFunctions:
; entries correspond to STANDARDMART_* constants
	dw .HowMayIHelpYou
	dw .TopMenu
	dw .Buy
	dw .Sell
	dw .Quit
	dw .AnythingElse

.HowMayIHelpYou:
	call LoadStandardMenuHeader
	ld hl, Text_Mart_HowMayIHelpYou
	call PrintText
	ld a, STANDARDMART_TOPMENU
	ret

.TopMenu:
	ld hl, MenuHeader_BuySell
	call CopyMenuHeader
	call VerticalMenu
	jr c, .quit
	ld a, [wMenuCursorY]
	cp $1
	jr z, .buy
	cp $2
	jr z, .sell
.quit
	ld a, STANDARDMART_QUIT
	ret
.buy
	ld a, STANDARDMART_BUY
	ret
.sell
	ld a, STANDARDMART_SELL
	ret

.Buy:
	call ExitMenu
	call FarReadMart
	call BuyMenu
	and a
	ld a, STANDARDMART_ANYTHINGELSE
	ret

.Sell:
	call ExitMenu
	call SellMenu
	ld a, STANDARDMART_ANYTHINGELSE
	ret

.Quit:
	call ExitMenu
	ld hl, Text_Mart_ComeAgain
	call MartTextBox
	ld a, -1
	ret

.AnythingElse:
	call LoadStandardMenuHeader
	ld hl, Text_Mart_AnythingElse
	call PrintText
	ld a, STANDARDMART_TOPMENU
	ret

FarReadMart:
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wCurMart
.CopyMart:
	ld a, [wMartPointerBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp -1
	jr nz, .CopyMart
	ld hl, wMartItem1BCD
	ld de, wCurMart + 1
.ReadMartItem:
	ld a, [de]
	inc de
	cp -1
	jr z, .done
	push de
	call GetMartItemPrice
	pop de
	jr .ReadMartItem

.done
	ret

GetMartItemPrice:
; Return the price of item a in BCD at hl and in tiles at wStringBuffer1.
	push hl
	ld [wCurItem], a
	farcall GetItemPrice
	pop hl

GetMartPrice:
; Return price de in BCD at hl and in tiles at wStringBuffer1.
	push hl
	ld a, d
	ld [wStringBuffer2], a
	ld a, e
	ld [wStringBuffer2 + 1], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 6 ; 6 digits
	call PrintNum
	pop hl

	ld de, wStringBuffer1
	ld c, 6 / 2 ; 6 digits
.loop
	call .CharToNybble
	swap a
	ld b, a
	call .CharToNybble
	or b
	ld [hli], a
	dec c
	jr nz, .loop
	ret

.CharToNybble:
	ld a, [de]
	inc de
	cp " "
	jr nz, .not_space
	ld a, "0"

.not_space
	sub "0"
	ret

ReadMart:
; Load the mart pointer.  Mart data is local (no need for bank).
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
; set hl to the first item
	inc hl
	ld bc, wMartItem1BCD
	ld de, wCurMart + 1
.loop
; copy the item to wCurMart + (ItemIndex)
	ld a, [hli]
	ld [de], a
	inc de
; -1 is the terminator
	cp -1
	jr z, .done

	push de
; copy the price to de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
; convert the price to 3-byte BCD at [bc]
	push hl
	ld h, b
	ld l, c
	call GetMartPrice
	ld b, h
	ld c, l
	pop hl

	pop de
	jr .loop

.done
	pop hl
	ld a, [hl]
	ld [wCurMart], a
	ret

INCLUDE "data/items/bargain_shop.asm"

BuyMenu:
	call FadeToMenu
	farcall BlankScreen
	xor a
	ld [wMenuScrollPositionBackup], a
	ld a, 1
	ld [wMenuCursorBufferBackup], a
.loop
	call BuyMenuLoop ; menu loop
	jr nc, .loop
	call CloseSubmenu
	ret

LoadBuyMenuText:
; load text from a nested table
; which table is in wEngineBuffer1
; which entry is in register a
	push af
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret

MartAskPurchaseQuantity:
	ld a, [wCurItem]
	cp TM01
	jr nc, .PurchaseQuantityOfTM
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	inc hl
	inc hl
	ld a, [hl]
	and a
	jp z, StandardMartAskPurchaseQuantity
	cp 1
	jp z, BargainShopAskPurchaseQuantity
	jp RooftopSaleAskPurchaseQuantity

.PurchaseQuantityOfTM:
	push de
	ld hl, wNumItems
	call CheckItem
	pop de
	jp c, .AlreadyHaveTM
	farcall GetItemPrice
	ld a, d
	ld [wBuffer1], a
	ld a, e
	ld [wBuffer2], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, 99
	ld [wItemQuantityBuffer], a
	farcall BuySell_MultiplyPrice
	push hl
	ld hl, hMoneyTemp
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	pop hl
	ret

.AlreadyHaveTM:
	ld hl, .AlreadyHaveTMText
	call PrintText
	call JoyWaitAorB
	scf
	ret

.AlreadyHaveTMText:
	text_jump AlreadyHaveTMText
	db "@"

GetMartDialogGroup:
	ld a, [wEngineBuffer1]
	ld e, a
	ld d, 0
	ld hl, .MartTextFunctionPointers
	add hl, de
	add hl, de
	add hl, de
	ret

.MartTextFunctionPointers:
	dwb .StandardMartPointers, 0
	dwb .HerbShopPointers, 0
	dwb .BargainShopPointers, 1
	dwb .PharmacyPointers, 0
	dwb .StandardMartPointers, 2
	dwb .PharmacyPointers, 0
	dwb .StandardMartPointers, 0

.StandardMartPointers:
	dw Text_Mart_HowMany
	dw Text_Mart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyMenuLoop

.HerbShopPointers:
	dw Text_HerbShop_HowMany
	dw Text_HerbShop_CostsThisMuch
	dw Text_HerbShop_InsufficientFunds
	dw Text_HerbShop_BagFull
	dw Text_HerbShop_HereYouGo
	dw BuyMenuLoop

.BargainShopPointers:
	dw BuyMenuLoop
	dw Text_BargainShop_CostsThisMuch
	dw Text_BargainShop_InsufficientFunds
	dw Text_BargainShop_BagFull
	dw Text_BargainShop_HereYouGo
	dw Text_BargainShop_SoldOut

.PharmacyPointers:
	dw Text_Pharmacy_HowMany
	dw Text_Pharmacy_CostsThisMuch
	dw Text_Pharmacy_InsufficientFunds
	dw Text_Pharmacy_BagFull
	dw Text_Pharmacy_HereYouGo
	dw BuyMenuLoop

BuyMenuLoop:
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, MenuHeader_Buy
	call CopyMenuHeader
	ld a, [wMenuCursorBufferBackup]
	ld [wMenuCursorBuffer], a
	ld a, [wMenuScrollPositionBackup]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wMenuScrollPositionBackup], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorBufferBackup], a
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .set_carry
	cp A_BUTTON
	jr z, .useless_pointer

.useless_pointer
	call MartAskPurchaseQuantity
	jr c, .cancel
	call MartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	ld a, 3 ; useless load
	call CompareMoney
	jr c, .insufficient_funds
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .insufficient_bag_space
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld b, SET_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	call PlayTransactionSound
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call JoyWaitAorB

.cancel
	call SpeechTextBox
	and a
	ret

.set_carry
	scf
	ret

.insufficient_bag_space
	ld a, MARTTEXT_BAG_FULL
	call LoadBuyMenuText
	call JoyWaitAorB
	and a
	ret

.insufficient_funds
	ld a, MARTTEXT_NOT_ENOUGH_MONEY
	call LoadBuyMenuText
	call JoyWaitAorB
	and a
	ret

StandardMartAskPurchaseQuantity:
	ld a, 99
	ld [wItemQuantityBuffer], a
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	farcall SelectQuantityToBuy
	call ExitMenu
	ret

MartConfirmPurchase:
	predef PartyMonItemName
	ld a, MARTTEXT_COSTS_THIS_MUCH
	call LoadBuyMenuText
	call YesNoBox
	ret

BargainShopAskPurchaseQuantity:
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	ld a, c
	and a
	jr nz, .SoldOut
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld a, [hli]
	ldh [hMoneyTemp + 2], a
	ld a, [hl]
	ldh [hMoneyTemp + 1], a
	xor a
	ldh [hMoneyTemp], a
	and a
	ret

.SoldOut:
	ld a, MARTTEXT_SOLD_OUT
	call LoadBuyMenuText
	call JoyWaitAorB
	scf
	ret

RooftopSaleAskPurchaseQuantity:
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	call .GetSalePrice
	ld a, 99
	ld [wItemQuantityBuffer], a
	farcall RooftopSale_SelectQuantityToBuy
	call ExitMenu
	ret

.GetSalePrice:
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

Text_Mart_HowMany:
	; How many?
	text_jump UnknownText_0x1c4bfd
	db "@"

Text_Mart_CostsThisMuch:
	; @ (S) will be ¥@ .
	text_jump UnknownText_0x1c4c08
	db "@"

MenuHeader_Buy:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3 ; flags
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMenuItemName
	dba .PrintBCDPrices
	dba UpdateItemDescription

.PrintBCDPrices:
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld b, 0
	ld hl, wMartItem1BCD
	add hl, bc
	add hl, bc
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld c, PRINTNUM_LEADINGZEROS | PRINTNUM_MONEY | 3
	call PrintBCDNumber
	ret

Text_HerbShop_Intro:
	; Hello, dear. I sell inexpensive herbal medicine. They're good, but a trifle bitter. Your #MON may not like them. Hehehehe…
	text_jump UnknownText_0x1c4c28
	db "@"

Text_HerbShop_HowMany:
	; How many?
	text_jump UnknownText_0x1c4ca3
	db "@"

Text_HerbShop_CostsThisMuch:
	; @ (S) will be ¥@ .
	text_jump UnknownText_0x1c4cae
	db "@"

Text_HerbShop_HereYouGo:
	; Thank you, dear. Hehehehe…
	text_jump UnknownText_0x1c4cce
	db "@"

Text_HerbShop_BagFull:
	; Oh? Your PACK is full, dear.
	text_jump UnknownText_0x1c4cea
	db "@"

Text_HerbShop_InsufficientFunds:
	; Hehehe… You don't have the money.
	text_jump UnknownText_0x1c4d08
	db "@"

Text_HerbShop_ComeAgain:
	; Come again, dear. Hehehehe…
	text_jump UnknownText_0x1c4d2a
	db "@"

Text_BargainShop_Intro:
	; I sell rare items that nobody else carries--but only one of each item.
	text_jump UnknownText_0x1c4d47
	db "@"

Text_BargainShop_CostsThisMuch:
	; costs ¥@ . Want it?
	text_jump UnknownText_0x1c4db0
	db "@"

Text_BargainShop_HereYouGo:
	; Thanks.
	text_jump UnknownText_0x1c4dcd
	db "@"

Text_BargainShop_BagFull:
	; Uh-oh, your PACK is chock-full.
	text_jump UnknownText_0x1c4dd6
	db "@"

Text_BargainShop_SoldOut:
	; You bought that already. I'm all sold out of it.
	text_jump UnknownText_0x1c4df7
	db "@"

Text_BargainShop_InsufficientFunds:
	; Uh-oh, you're short on funds.
	text_jump UnknownText_0x1c4e28
	db "@"

Text_BargainShop_ComeAgain:
	; Come by again sometime.
	text_jump UnknownText_0x1c4e46
	db "@"

Text_Pharmacist_Intro:
	; I don't have much to offer.
	text_jump UnknownText_0x1c4e5f
	db "@"

Text_Pharmacy_HowMany:
	; How many?
	text_jump UnknownText_0x1c4e7e
	db "@"

Text_Pharmacy_CostsThisMuch:
	; @ (S) will cost ¥@ .
	text_jump UnknownText_0x1c4e89
	db "@"

Text_Pharmacy_HereYouGo:
	; Thanks much!
	text_jump UnknownText_0x1c4eab
	db "@"

Text_Pharmacy_BagFull:
	; You don't have any more space.
	text_jump UnknownText_0x1c4eb9
	db "@"

Text_Pharmacy_InsufficientFunds:
	; Huh? That's not enough money.
	text_jump UnknownText_0x1c4ed8
	db "@"

Text_Pharmacist_ComeAgain:
	; All right. See you around.
	text_jump UnknownText_0x1c4ef6
	db "@"

SellMenu:
	call DisableSpriteUpdates
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wPackUsedItem]
	and a
	jp z, .quit
	call .TryToSellItem
	jr .loop

.quit
	call ReturnToMapWithSpeechTextbox
	and a
	ret

.Unreferenced_NothingToSell:
	ld hl, .NothingToSellText
	call MenuTextBoxBackup
	and a
	ret

.NothingToSellText:
	; You don't have anything to sell.
	text_jump UnknownText_0x1c4f12
	db "@"

.TryToSellItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .dw
	rst JumpTable
	ret

.dw
	dw .try_sell
	dw .cant_buy
	dw .cant_buy
	dw .cant_buy
	dw .try_sell
	dw .try_sell
	dw .try_sell

.cant_buy
	ret

.try_sell
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .okay_to_sell
	ld hl, TextMart_CantBuyFromYou
	call PrintText
	and a
	ret

.okay_to_sell
	ld hl, Text_Mart_SellHowMany
	call PrintText
	farcall PlaceMoneyAtTopLeftOfTextbox
	farcall SelectQuantityToSell
	call ExitMenu
	jr c, .declined
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, Text_Mart_ICanPayThisMuch
	call PrintTextBoxText
	call YesNoBox
	jr c, .declined
	ld de, wMoney
	ld bc, hMoneyTemp
	call GiveMoney
	ld a, [wMartItemID]
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, Text_Mart_SoldForAmount
	call PrintTextBoxText
	call PlayTransactionSound
	farcall PlaceMoneyBottomLeft
	call JoyWaitAorB

.declined
	call ExitMenu
	and a
	ret

Text_Mart_SellHowMany:
	; How many?
	text_jump UnknownText_0x1c4f33
	db "@"

Text_Mart_ICanPayThisMuch:
	; I can pay you ¥@ . Is that OK?
	text_jump UnknownText_0x1c4f3e
	db "@"

.UnusedString15f7d:
	db "！ダミー！@"

Text_Mart_HowMayIHelpYou:
	; Welcome! How may I help you?
	text_jump UnknownText_0x1c4f62
	db "@"
	
Text_Mart_RooftopIntro:
	text_jump Rooftop_HowMayIHelpYouText
	db "@"
	
Text_Mart_DrinksIntro:
	text_jump Drinks_HowMayIHelpYouText
	db "@"

MenuHeader_BuySell:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 7, 8
	dw .MenuData
	db 1 ; default option

.MenuData
	db STATICMENU_CURSOR ; strings
	db 3 ; items
	db "BUY@"
	db "SELL@"
	db "QUIT@"

Text_Mart_HereYouGo:
	; Here you are. Thank you!
	text_jump UnknownText_0x1c4f80
	db "@"

Text_Mart_InsufficientFunds:
	; You don't have enough money.
	text_jump UnknownText_0x1c4f9a
	db "@"

Text_Mart_BagFull:
	; You can't carry any more items.
	text_jump UnknownText_0x1c4fb7
	db "@"

TextMart_CantBuyFromYou:
	; Sorry, I can't buy that from you.
	text_jump UnknownText_0x1c4fd7
	db "@"

Text_Mart_ComeAgain:
	; Please come again!
	text_jump UnknownText_0x1c4ff9
	db "@"

Text_Mart_AnythingElse:
	text_jump UnknownText_0x1c500d
	db "@"

Text_Mart_SoldForAmount:
	text_jump UnknownText_0x1c502e
	db "@"

PlayTransactionSound:
	call WaitSFX
	ld de, SFX_TRANSACTION
	call PlaySFX
	ret

MartTextBox:
	call MenuTextBox
	call JoyWaitAorB
	call ExitMenu
	ret
