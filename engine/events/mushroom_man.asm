MushroomMan_PrintTextWhichMushroom:
	ld hl, .Text
	call PrintText
	ret

.Text:
	; Which MUSHROOM do you want to sell?
	text_far MushroomManText_WhichMushroom
	text_end

MushroomMan_PrintTextHowMany:
	ld hl, .Text
	call PrintText
	ret

.Text:
	; How many would you like to sell?
	text_far MushroomManText_HowMany
	text_end

SelectMushroomForMushroomMan:
	call LoadStandardMenuHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wMushroomQuantity], a
.loop
	push bc
	call MushroomMan_PrintTextWhichMushroom
	pop bc
	ld a, c
	ld [wMenuSelection], a
	call MushroomMan_SelectMushroom
	ld a, c
	ld [wScriptVar], a
	and a
	jr z, .done
	ld [wCurItem], a
	ld a, [wMenuCursorY]
	ld c, a
	push bc
	call MushroomMan_PrintTextHowMany
	call MushroomMan_SelectQuantity
	pop bc
	jr nc, .loop
	ld a, [wItemQuantityChangeBuffer]
	ld [wMushroomQuantity], a
	call MushroomMan_GiveUpSelectedQuantityOfSelectedMushroom

.done
	call Call_ExitMenu
	ret

MushroomMan_SelectMushroom:
	farcall FindMushroomsInBag
	jr c, .nope
	ld hl, .MenuHeader
	call CopyMenuHeader
	ld a, [wMenuSelection]
	ld [wMenuCursorBuffer], a
	xor a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .nope
	ld a, [wMenuSelection]
	cp -1
	jr nz, .done

.nope
	xor a ; FALSE

.done
	ld c, a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 4, 13, 10
	dw .MenuData
	db 1 ; default option

	db 0 ; XXX

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 7
	db 1
	dbw 0, wBuffer1
	dba .Name
	dba .Quantity
	dba NULL

.Name:
	ld a, [wMenuSelection]
	and a
	ret z
	farcall PlaceMenuItemName
	ret

.Quantity:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	call MushroomMan_GetQuantityOfMushroom
	ret z
	ld a, [wItemQuantityChangeBuffer]
	ld [wMenuSelectionQuantity], a
	farcall PlaceMenuItemQuantity
	ret

MushroomMan_SelectQuantity:
	ld a, [wCurItem]
	ld [wMenuSelection], a
	call MushroomMan_GetQuantityOfMushroom
	jr z, .done
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, .MenuHeader
	call LoadMenuHeader
.loop
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call .PlaceMushroomName
	call PlaceMushroomQuantity
	call ApplyTilemap
	farcall Kurt_SelectQuantity_InterpretJoypad
	jr nc, .loop

	push bc
	call PlayClickSFX
	pop bc
	ld a, b
	cp -1
	jr z, .done
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityChangeBuffer], a ; What is the point of this operation?
	scf

.done
	call CloseWindow
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 9, SCREEN_WIDTH - 1, 12
	dw NULL
	db -1 ; default option
	db 0

.PlaceMushroomName:
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld d, h
	ld e, l
	farcall PlaceMenuItemName
	ret

PlaceMushroomQuantity:
	call MenuBoxCoord2Tile
	ld de, 2 * SCREEN_WIDTH + 10
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

MushroomMan_GetQuantityOfMushroom:
	push bc
	ld hl, wNumItems
	ld a, [wCurItem]
	ld c, a
	ld b, $0
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	ld a, [hl]
	add b
	ld b, a
	jr nc, .loop
	ld b, -1

.done
	ld a, b
	sub 99
	jr c, .done2
	ld b, 99

.done2
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	and a
	pop bc
	ret

MushroomMan_GiveUpSelectedQuantityOfSelectedMushroom:
; Get the quantity of Apricorns of type [wCurItem]
; in the bag. Compatible with multiple stacks.

; Initialize the search.
	push de
	push bc
	ld hl, wNumItems
	ld a, [wCurItem]
	ld c, a
	ld e, $0
	xor a
	ld [wCurItemQuantity], a
	ld a, -1
	ld [wApricorns], a

; Search for [wCurItem] in the bag.
.loop1
; Increase the total count.
	ld a, [wCurItemQuantity]
	inc a
	ld [wCurItemQuantity], a
; Get the index of the next item.
	inc hl
	ld a, [hli]
; If we've reached the end of the pocket, break.
	cp -1
	jr z, .okay1
; If we haven't found what we're looking for, continue.
	cp c
	jr nz, .loop1
; Increment the result counter and store the bag index of the match.
	ld d, $0
	push hl
	ld hl, wApricorns
	add hl, de
	inc e
	ld a, [wCurItemQuantity]
	dec a
	ld [hli], a
	ld a, -1
	ld [hl], a
	pop hl
	jr .loop1

.okay1
; How many stacks have we found?
	ld a, e
	and a
	jr z, .done
	dec a
	jr z, .OnlyOne
	ld hl, wApricorns

.loop2
	ld a, [hl]
	ld c, a
	push hl
.loop3
	inc hl
	ld a, [hl]
	cp -1
	jr z, .okay2
	ld b, a
	ld a, c
	call MushroomMan_GetAddressOfMushroomQuantity
	ld e, a
	ld a, b
	call MushroomMan_GetAddressOfMushroomQuantity
	sub e
	jr z, .equal
	jr c, .less
	jr .loop3

.equal
	ld a, c
	sub b
	jr nc, .loop3

.less
	ld a, c
	ld c, b
	ld [hl], a
	ld a, c
	pop hl
	ld [hl], a
	push hl
	jr .loop3

.okay2
	pop hl
	inc hl
	ld a, [hl]
	cp -1
	jr nz, .loop2

.OnlyOne:
	ld hl, wApricorns
.loop4
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [wCurItemQuantity], a
	call MushroomMan_GetRidOfItem
	pop hl
	ld a, [wItemQuantityChangeBuffer]
	and a
	jr z, .done
	push hl
	ld a, [hli]
	ld c, a
.loop5
	ld a, [hli]
	cp -1
	jr z, .okay3
	cp c
	jr c, .loop5
	dec a
	dec hl
	ld [hli], a
	jr .loop5

.okay3
	pop hl
	inc hl
	jr .loop4

.done
	ld a, [wItemQuantityChangeBuffer]
	and a
	pop bc
	pop de
	ret

MushroomMan_GetAddressOfMushroomQuantity:
	push hl
	push bc
	ld hl, wNumItems
	inc hl
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	pop bc
	pop hl
	ret

MushroomMan_GetRidOfItem:
	push bc
	ld hl, wNumItems
	ld a, [wCurItemQuantity]
	ld c, a
	ld b, $0
	inc hl
	add hl, bc
	add hl, bc
	ld a, [wCurItem]
	ld c, a
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .done
	ld a, [wItemQuantityChangeBuffer]
	ld c, a
	ld a, [hl]
	sub c
	ld b, c
	jr nc, .okay
	add c
	ld b, a

.okay
	push bc
	ld hl, wNumItems
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	call TossItem
	pop bc
	ld a, c
	sub b

.done
	ld [wItemQuantityChangeBuffer], a
	pop bc
	ret
