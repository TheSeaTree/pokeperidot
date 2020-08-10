SelectFossilsMenu:
	call LoadStandardMenuHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wKurtApricornQuantity], a
.loop
	ld a, c
	ld [wMenuSelection], a
	call Kurt_SelectFossil
	ld a, c
	ld [wScriptVar], a
	and a
	jr z, .done
	ld [wCurItem], a
	ld a, [wMenuCursorY]
	ld c, a

.done
	call Call_ExitMenu
	ret

Kurt_SelectFossil:
	farcall FindFossilsInBag
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
	menu_coords 1, 1, 13, 10
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
	call Kurt_GetQuantityOfFossil
	ret z
	ld a, [wItemQuantityChangeBuffer]
	ld [wMenuSelectionQuantity], a
	farcall PlaceMenuItemQuantity
	ret

Fossil_SelectQuantity:
	ld a, [wCurItem]
	ld [wMenuSelection], a
	call Kurt_GetQuantityOfFossil
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
	call .PlaceFossilName
	call PlaceFossilQuantity
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

.PlaceFossilName:
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld d, h
	ld e, l
	farcall PlaceMenuItemName
	ret

PlaceFossilQuantity:
	call MenuBoxCoord2Tile
	ld de, 2 * SCREEN_WIDTH + 10
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

Kurt_GetQuantityOfFossil:
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

Kurt_GetAddressOfFossilQuantity:
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
