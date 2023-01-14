; StartMenu.Items indexes
	const_def
	const STARTMENUITEM_POKEDEX  ; 0
	const STARTMENUITEM_POKEMON  ; 1
	const STARTMENUITEM_PACK     ; 2
	const STARTMENUITEM_STATUS   ; 3
	const STARTMENUITEM_SAVE     ; 4
	const STARTMENUITEM_OPTION   ; 5
	const STARTMENUITEM_EXIT     ; 6

StartMenu::
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate
	
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	jr nz, .SimulationMenuPlacement
	ld hl, wSafariFlag
	bit SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	ld hl, .MenuHeader
	jr z, .GotMenuData
.SimulationMenuPlacement
	ld hl, .ContestMenuHeader

.GotMenuData:
	call LoadMenuHeader
	call .SetUpMenuItems
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call .DrawMenuAccount
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatusBox
	call SafeUpdateSprites
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	farcall LoadFonts_NoOAMUpdate
	call .DrawBugContestStatus
	call UpdateTimePals
	jr .Select

.Reopen:
	call UpdateSprites
	call UpdateTimePals
	call .SetUpMenuItems
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a

.Select:
	call .GetInput
	jr c, .Exit
	call ._DrawMenuAccount
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call PlayClickSFX
	call PlaceHollowCursor
	call .OpenMenu

; Menu items have different return functions.
; For example, saving exits the menu.
	ld hl, .MenuReturns
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuReturns:
	dw .Reopen
	dw .Exit
	dw .ExitMenuCallFuncCloseText
	dw .ExitMenuRunScriptCloseText
	dw .ExitMenuRunScript
	dw .ReturnEnd
	dw .ReturnRedraw

.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
.ReturnEnd:
	call ExitMenu
.ReturnEnd2:
	call CloseText
	call UpdateTimePals
	ret

.GetInput:
; Return carry on exit, and no-carry on selection.
	xor a
	ldh [hBGMapMode], a
	call ._DrawMenuAccount
	call SetUpMenu
	ld a, $ff
	ld [wMenuSelection], a
.loop
	call .PrintMenuAccount
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b
	cp A_BUTTON
	jr z, .a
	jr .loop
.a
	call PlayClickSFX
	and a
	ret
.b
	scf
	ret

.ExitMenuRunScript:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.ExitMenuRunScriptCloseText:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	jr .ReturnEnd2

.ExitMenuCallFuncCloseText:
	call ExitMenu
	ld hl, wQueuedScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wQueuedScriptBank]
	rst FarCall
	jr .ReturnEnd2

.ReturnRedraw:
	call .Clear
	jp .Reopen

.Clear:
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call .DrawMenuAccount
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatus
	call UpdateSprites
	call ret_d90
	call FinishExitMenu
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.ContestMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 4, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_ENABLE_START ; flags
	dn 0, 0 ; rows, columns
	dw wMenuItemsList
	dw .MenuString
	dw .Items

.Items:
; entries correspond to STARTMENUITEM_* constants
	dw StartMenu_Pokedex,  .PokedexString,  .ExitDesc
	dw StartMenu_Pokemon,  .PartyString,    .ExitDesc
	dw StartMenu_Pack,     .PackString,     .ExitDesc
	dw StartMenu_Status,   .StatusString,   .ExitDesc
	dw StartMenu_Save,     .SaveString,     .ExitDesc
	dw StartMenu_Option,   .OptionString,   .ExitDesc
	dw StartMenu_Exit,     .ExitString,     .ExitDesc

.PokedexString:  db "#DEX@"
.PartyString:    db "#MON@"
.PackString:     db "PACK@"
.StatusString:   db "<PLAYER>@"
.SaveString:     db "SAVE@"
.OptionString:   db "OPTION@"
.ExitString:     db "EXIT@"

.ExitDesc:
	db   "Close this"
	next "menu@"

.OpenMenu:
	ld a, [wMenuSelection]
	call .GetMenuAccountTextPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuString:
	push de
	ld a, [wMenuSelection]
	call .GetMenuAccountTextPointer
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

.MenuDesc:
	push de
	ld a, [wMenuSelection]
	cp $ff
	jr z, .none
	call .GetMenuAccountTextPointer
rept 4
	inc hl
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret
.none
	pop de
	ret

.GetMenuAccountTextPointer:
	ld e, a
	ld d, 0
	ld hl, wMenuDataPointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 6
	add hl, de
endr
	ret

.SetUpMenuItems:
	xor a
	ld [wWhichIndexSet], a
	call .FillMenuList

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	jr nz, .no_pokedex

	ld hl, wStatusFlags
	bit STATUSFLAGS_POKEDEX_F, [hl]
	jr z, .no_pokedex
	ld a, STARTMENUITEM_POKEDEX
	call .AppendMenuList
.no_pokedex

	ld a, [wPartyCount]
	and a
	jr z, .no_pokemon
	ld a, STARTMENUITEM_POKEMON
	call .AppendMenuList
.no_pokemon

	ld a, [wLinkMode]
	and a
	jr nz, .no_pack

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	jr nz, .no_pack

	ld a, STARTMENUITEM_PACK
	call .AppendMenuList
.no_pack
	ld a, STARTMENUITEM_STATUS
	call .AppendMenuList

	ld a, [wLinkMode]
	and a
	jr nz, .no_save

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	jr nz, .no_save

	ld a, STARTMENUITEM_SAVE
.write
	call .AppendMenuList
.no_save

	ld a, STARTMENUITEM_OPTION
	call .AppendMenuList

	ld hl, wSafariFlag
	bit SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	jr nz, .no_exit

	ld a, STARTMENUITEM_EXIT
	call .AppendMenuList
.no_exit
	ld a, c
	ld [wMenuItemsList], a
	ret

.FillMenuList:
	xor a
	ld hl, wMenuItemsList
	ld [hli], a
	ld a, -1
	ld bc, wMenuItemsListEnd - (wMenuItemsList + 1)
	call ByteFill
	ld de, wMenuItemsList + 1
	ld c, 0
	ret

.AppendMenuList:
	ld [de], a
	inc de
	inc c
	ret

.DrawMenuAccount:
	jp ._DrawMenuAccount

.PrintMenuAccount:
	ld a, POCKET_WATCH
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	ret nc
	call .IsMenuAccountOn
	ret z
	call ._DrawMenuAccount
	hlcoord 0, 0
	ld b, 1
	ld c, 8
	call TextBox
	call CheckRTCStatus
	and $80
	call UpdateTime
	ld b, a
	decoord 1, 1
	ldh a, [hHours]
	ld b, a
	ldh a, [hMinutes]
	ld c, a
	decoord 1, 1
	farcall PrintHoursMins
	ret

._DrawMenuAccount:
	ld a, POCKET_WATCH
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	ret nc
	call .IsMenuAccountOn
	ret z
	hlcoord 0, 0
	lb bc, 1, 8
	call TextBox
	ret

.IsMenuAccountOn:
	ld a, [wOptions2]
	and 1 << MENU_ACCOUNT
	ret

.DrawBugContestStatusBox:
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	jr nz, .SimulationActive
	ld hl, wSafariFlag
	bit SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	ret z
.SimulationActive
	farcall StartMenu_DrawBugContestStatusBox
	ret

.DrawBugContestStatus:
	ld hl, wSafariFlag
	bit SAFARIFLAGS_SAFARI_GAME_ACTIVE_F, [hl]
	jr nz, .contest
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BATTLE_SIMULATION_F, [hl]
	ret z
	farcall StartMenu_PrintSimulationStatus
	ret
.contest
	farcall StartMenu_PrintBugContestStatus
	ret

StartMenu_Exit:
; Exit the menu.
	ld a, 1
	ret

StartMenu_Save:
; Save the game.

	call BufferScreen
	farcall SaveMenu
	jr nc, .asm_12919
	ld a, 0
	ret
.asm_12919
	ld a, 1
	ret

StartMenu_Option:
; Game options.

	call FadeToMenu
	farcall OptionsMenu
	ld a, 6
	ret

StartMenu_Status:
; Player status.

	call FadeToMenu
	farcall TrainerCard
	call CloseSubmenu
	ld a, 0
	ret

StartMenu_Pokedex:
	ld a, [wPartyCount]
	and a
	jr z, .asm_12949

	call FadeToMenu
	farcall Pokedex
	call CloseSubmenu

.asm_12949
	ld a, 0
	ret

StartMenu_Pokegear:
	call FadeToMenu
	farcall PokeGear
	call CloseSubmenu
	ld a, 0
	ret

StartMenu_Pack:
	call FadeToMenu
	farcall Pack
	ld a, [wPackUsedItem]
	and a
	jr nz, .used_item
	call CloseSubmenu
	ld a, 0
	ret

.used_item
	call ExitAllMenus
	ld a, 4
	ret

StartMenu_Pokemon:
	ld a, [wPartyCount]
	and a
	jr z, .return

	call FadeToMenu

.choosemenu
	xor a
	ld [wPartyMenuActionText], a ; Choose a POKéMON.
	call ClearBGPalettes

.menu
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

.menunoreload
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes ; load regular palettes?
	call DelayFrame
	farcall PartyMenuSelect
	jr c, .return ; if cancelled or pressed B

	call PokemonActionSubmenu
	cp 3
	jr z, .menu
	cp 0
	jr z, .choosemenu
	cp 1
	jr z, .menunoreload
	cp 2
	jr z, .quit

.return
	call CloseSubmenu
	ld a, 0
	ret

.quit
	ld a, b
	push af
	call ExitAllMenus
	pop af
	ret
