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
FossilTreasureMenu:
	jr c, .nope
	ld hl, .MenuHeader
	call LoadMenuHeader
	call DoNthMenu
	call CloseWindow
	jr c, .nope
	ld a, [wMenuSelection]
	jr .done

.nope
	xor a ; FALSE

.done
	ld c, a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 14, 17
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_ENABLE_SELECT | SCROLLINGMENU_ENABLE_FUNCTION3
	dbw 0, wBuffer1
	dw .Name
	dw NULL

.Name:
	ld a, [wMenuSelection]
	and a
	ret z
	farcall PlaceMenuItemName
	ret

SelectTreasureMenu:
	call LoadStandardMenuHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wKurtApricornQuantity], a
.loop
	ld a, c
	ld [wMenuSelection], a
	call SelectTreasure
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

SelectTreasure:
	farcall FindTreasureInBag
	jp FossilTreasureMenu

