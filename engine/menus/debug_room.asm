paged_value: MACRO
	dw \1 ; value address
	db \2 ; min value
	db \3 ; max value
	db \4 ; initial value
	dw \5 ; label string
	dw \6 ; value name function
	db \7 ; is hex value?
ENDM

PAGED_VALUE_SIZE EQU 10

Arena_EditPagedValues:
	xor a
	ld [wArenaTempCurPage], a
	ld [wArenaTempCurValue], a
	ld a, [hli]
	ld [wArenaTempAFunction], a
	ld a, [hli]
	ld [wArenaTempAFunction+1], a
	ld a, [hli]
	ld [wArenaTempSelectFunction], a
	ld a, [hli]
	ld [wArenaTempSelectFunction+1], a
	ld a, [hli]
	ld [wArenaTempStartFunction], a
	ld a, [hli]
	ld [wArenaTempStartFunction+1], a
	ld a, [hli]
	ld [wArenaTempAutoFunction], a
	ld a, [hli]
	ld [wArenaTempAutoFunction+1], a
	ld a, [hli]
	ld [wArenaTempPageCount], a
	ld a, l
	ld [wArenaTempPagesPointer], a
	ld a, h
	ld [wArenaTempPagesPointer+1], a
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call TextBox
	hlcoord 6, 16
	ld de, Arena_PageString
	call PlaceString
	call Arena_InitializePagedValues
	xor a
	call Arena_PrintPage
	ld a, "▶"
	call Arena_ShowHideCursor
	xor a
	ldh [hJoyLast], a
	xor a
	ld [wArenaTempCurPage], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
.resume
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	bit 1, a
	jr nz, .done
	ld hl, .continue
	push hl
	rra ; A_BUTTON_F?
	jr c, Arena_PagedValuePressedA
	rra ; skip B_BUTTON_F
	rra ; SELECT_F?
	jr c, Arena_PagedValuePressedSelect
	rra ; START_F?
	jr c, Arena_PagedValuePressedStart
	rra ; D_RIGHT_F?
	jp c, Arena_IncrementPagedValue
	rra ; D_LEFT_F?
	jp c, Arena_DecrementPagedValue
	rra ; D_UP_F?
	jp c, Arena_PrevPagedValue
	rra ; D_DOWN_F?
	jp c, Arena_NextPagedValue
	pop hl
.continue
; call wArenaTempAutoFunction if it's not null, then jump to .resume
	ld hl, .resume
	push hl
	ld a, [wArenaTempAutoFunction]
	ld l, a
	ld a, [wArenaTempAutoFunction+1]
	ld h, a
	or l
	ret z
	jp hl

.done
	pop af
	ldh [hInMenu], a
	scf
	ret

Arena_PagedValuePressedA:
	ld hl, wArenaTempAFunction
	jr _CallNonNullPointer

Arena_PagedValuePressedSelect:
	ld hl, wArenaTempSelectFunction
	jr _CallNonNullPointer

Arena_PagedValuePressedStart:
	ld hl, wArenaTempStartFunction
	; fallthrough

_CallNonNullPointer:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	jp hl

Arena_PageString:
	db   "┌──────┐<LF>┘PAGE  └@"

Arena_IncrementPagedValue:
	call Arena_GetCurPagedValuePointer
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [de] ; a = max value
	cp [hl]
	ret z
	inc a
	ld [de], a
	jp Arena_PrintPageBValueC

Arena_DecrementPagedValue:
	call Arena_GetCurPagedValuePointer
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	ld a, [de] ; a = min value
	cp [hl]
	ret z
	dec a
	ld [de], a
	jp Arena_PrintPageBValueC

Arena_NextPage:
	ld a, [wArenaTempPageCount]
	ld c, a
	ld a, [wArenaTempCurPage]
	inc a
	cp c
	jr c, .ok
	xor a
.ok
	ld [wArenaTempCurPage], a
	call Arena_PrintPage
	ld a, [wArenaTempCurPage]
	call Arena_GetNthPagePointer
	ld a, [wArenaTempCurValue]
	cp [hl]
	jr c, .skip
	ld a, [hl]
	dec a
	ld [wArenaTempCurValue], a
.skip
	ld a, "▶"
	jp Arena_ShowHideCursor

Arena_PrevPage:
	ld a, [wArenaTempCurPage]
	or a
	jr nz, .ok
	ld a, [wArenaTempPageCount]
.ok
	dec a
	ld [wArenaTempCurPage], a
	call Arena_PrintPage
	ld a, [wArenaTempCurPage]
	call Arena_GetNthPagePointer
	ld a, [wArenaTempCurValue]
	cp [hl]
	jr c, .skip
	ld a, [hl]
	dec a
	ld [wArenaTempCurValue], a
.skip
	ld a, "▶"
	jp Arena_ShowHideCursor

Arena_NextPagedValue:
	ld a, " "
	call Arena_ShowHideCursor
	ld a, [wArenaTempCurPage]
	call Arena_GetNthPagePointer
	ld a, [wArenaTempCurValue]
	inc a
	cp [hl] ; incremented value < paged_value count?
	jr c, Arena_UpdateValueCursor
	xor a
	ld [wArenaTempCurValue], a
	jr Arena_NextPage

Arena_UpdateValueCursor:
	ld [wArenaTempCurValue], a
	ld a, "▶"
	jp Arena_ShowHideCursor

Arena_PrevPagedValue:
	ld a, " "
	call Arena_ShowHideCursor
	ld a, [wArenaTempCurValue]
	or a ; pre-decremented value > 0?
	jr nz, .decrement
	ld a, -1
	ld [wArenaTempCurValue], a
	jr Arena_PrevPage

.decrement:
	dec a
	jr Arena_UpdateValueCursor

Arena_GetNthPagePointer:
; Input: a = page index
; Output: hl = pointer to paged_data list
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [wArenaTempPagesPointer]
	ld e, a
	ld a, [wArenaTempPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

_Arena_GetPageBValueCPointer:
	push bc
	ld a, b
	call Arena_GetNthPagePointer
	pop bc
	inc hl
	ld a, c
	ld bc, PAGED_VALUE_SIZE
	jp AddNTimes

Arena_GetCurPagedValuePointer:
	ld a, [wArenaTempCurPage]
	ld b, a
	ld a, [wArenaTempCurValue]
	ld c, a
	jr _Arena_GetPageBValueCPointer

Arena_ShowHideCursor:
	push af
	hlcoord 1, 2
	ld bc, SCREEN_WIDTH * 2
	ld a, [wArenaTempCurValue]
	call AddNTimes
	pop af
	ld [hl], a
	ret

Arena_InitializePagedValues:
; Load the initial values for all pages of the current paged value header
	ld a, [wArenaTempPageCount]
.page_loop
	dec a
	push af
	call .InitializePage
	pop af
	jr nz, .page_loop
	ret

.InitializePage:
; Load the initial values for page a
	ld b, a
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [wArenaTempPagesPointer]
	ld e, a
	ld a, [wArenaTempPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, [hl] ; c = paged_value count
.value_loop
	push bc
	dec c
	call .InitializeValue
	pop bc
	dec c
	jr nz, .value_loop
	ret

.InitializeValue:
; Load the initial value for page b, value c
	ld h, 0
	ld l, b
	add hl, hl
	ld a, [wArenaTempPagesPointer]
	ld e, a
	ld a, [wArenaTempPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; skip the paged_value count
	ld a, c
	push bc
	ld bc, PAGED_VALUE_SIZE
	call AddNTimes
	pop bc
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	inc hl
	ld a, [hl] ; a = initial value
	ld [de], a
	ret

Arena_PrintPage:
	push af
	hlcoord 12, 17
	add "1"
	ld [hl], a
	hlcoord 1, 1
	lb bc, SCREEN_HEIGHT - 3, SCREEN_WIDTH - 2
	call ClearBox

	hlcoord 18, 1
	ld de, .UpArrow
	call PlaceString
	hlcoord 18, 16
	ld de, .DownArrow
	call PlaceString

	pop af
	ld b, a
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [wArenaTempPagesPointer]
	ld e, a
	ld a, [wArenaTempPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, [hl] ; c = paged_value count
.loop
	push bc
	dec c
	call Arena_PrintPagedValue
	pop bc
	dec c
	jr nz, .loop
	ret

.UpArrow
	db $d8, $50

.DownArrow
	db $ee, $50

Arena_PrintPageBValueC:
	ld a, [wArenaTempCurPage]
	ld b, a
	ld a, [wArenaTempCurValue]
	ld c, a
	jr Arena_PrintPagedValue

Arena_PrintPagedValue:
; Print the value for page b, value c
	ld h, 0
	ld l, b
	add hl, hl
	ld a, [wArenaTempPagesPointer]
	ld e, a
	ld a, [wArenaTempPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; skip the paged_value count
	ld a, c
	push bc
	ld bc, PAGED_VALUE_SIZE
	call AddNTimes
	pop bc
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	push de
	inc hl
	inc hl
	inc hl
	ld e, [hl] ; de = label string
	inc hl
	ld d, [hl]
	inc hl
	push hl
	hlcoord 2, 2
	ld a, c
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	push hl
	call PlaceString
	pop hl
	ld bc, SCREEN_WIDTH - 7
	add hl, bc
	pop bc ; pushed hl
	pop de
	push de
	push bc
	inc bc
	inc bc
	ld a, [bc] ; a = is hex value?
	or a
	jr nz, .hex
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	jr .printed
.hex
	ld c, 1
	call PrintHexNumber
	ld [hl], ""
	inc hl
.printed
	ld bc, 6
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	pop de
	ld a, [hli] ; hl = value name function
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [de]
	jp hl

Arena_JoyWaitABSelect:
.loop
	call GetJoypad
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON | SELECT
	jr z, .loop
	ret

Arena_PrintItemName:
	ld [wNamedObjectIndexBuffer], a
	push bc
	call GetItemName
	pop hl
	push hl
	lb bc, 1, 12
	call ClearBox
	pop hl
	ld de, wStringBuffer1
	jp PlaceString

ArenaMenu_PokemonBuilder:
	ld hl, .PagedValuesHeader
	call Arena_EditPagedValues

	ld de, SFX_READ_TEXT_2
	call PlaySFX

	call ClearBGPalettes
	call ClearSprites
	call ReloadTilesetAndPalettes

	call UpdateSprites
	call WaitBGMap2
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	jp UpdateTimePals

.PagedValuesHeader:
	dw NULL ; A function
	dw NULL ; Select function
	dw Arena_SavePokemon ; Start function
	dw NULL ; Auto function
	db 2 ; # pages
	dw ArenaMenu_PokemonBuilder_Page1Values
	dw ArenaMenu_PokemonBuilder_Page2Values

Arena_SavePokemon:
	ld hl, wArenaTempMonHPExp
	ld a, $ff
	ld c, 10
.max_stat_exp_loop:
	ld [hli], a
	dec c
	jr nz, .max_stat_exp_loop
	call Arena_UpdateExpForLevel

ld a, [wArenaTempMonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wArenaTempMonLevel]
	ld [wCurPartyLevel], a

	; Clear Move buffer
	ld hl, wArenaTempMonMoves
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	; Call your custom local function
	call Arena_FillMoves

	; Handle PP (Standard predef is usually safe for PP if moves are valid)
	ld hl, wArenaTempMonPP
	predef FillPP

	ld a, [wArenaTempMonBox]
	dec a
	ld b, a
	add a
	add b
	ld h, 0
	ld l, a
	ld de, Arena_BoxAddresses
	add hl, de
	ld a, [hli]
	call OpenSRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp MONS_PER_BOX
	jp nc, .full
	; update count and species list
	push hl
	inc [hl]
	inc hl
	ld d, 0
	ld e, a
	add hl, de
	ld a, [wArenaTempMonSpecies]
	ld [hli], a
	ld [hl], -1
	pop hl
	; skip count and species list
	ld bc, 2 + MONS_PER_BOX
	add hl, bc
	; update Nth box mon
	push de
	push hl
	ld a, e
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wArenaTempMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	pop hl
	pop de
	; skip box mons
	ld bc, BOXMON_STRUCT_LENGTH * MONS_PER_BOX
	add hl, bc
	; update Nth OT name
	push de
	push hl
	ld a, e
	ld bc, NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	pop hl
	pop de
	; skip OT names
	ld bc, NAME_LENGTH * MONS_PER_BOX
	add hl, bc
	; update Nth nickname
	push de
	push hl
	ld a, e
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl
	pop de

	; Use the player's ID instead of a predefined one.
	ld hl, wPlayerID
	ld a, [hli]
	ld [wArenaTempMonID], a
	ld a, [hl]
	ld [wArenaTempMonID + 1], a

	call CloseSRAM

	farcall TryLoadSaveFile

	ld hl, .CompletedText
	call MenuTextBox
	ld de, SFX_SAVE
	call PlaySFX
	call WaitSFX
	jp CloseWindow

.full
	call CloseSRAM
	ld hl, .BoxIsFullText
	call MenuTextBox
	call Arena_JoyWaitABSelect
	jp CloseWindow

.CompletedText:
	text "@"
	text_ram wStringBuffer2
	text " was"
	line "sent to BOX @"
	deciram wArenaTempMonBox, 1, 2
	text "."
	done

.BoxIsFullText:
	text "BOX IS FULL!"
	done

Arena_PrintPokemonName:
	ld [wNamedObjectIndexBuffer], a
	push bc
	call GetPokemonName
	; Copy the species name elsewhere, this will be the nickname.
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	jr _Arena_FinishGetName

Arena_PrintItemName2:
	ld [wNamedObjectIndexBuffer], a
	push bc
	call GetItemName
	jr _Arena_FinishGetName

Arena_PrintMoveName:
	ld [wNamedObjectIndexBuffer], a
	push bc
	call GetMoveName
	jr _Arena_FinishGetName

_Arena_FinishGetName:
	pop hl
	push hl
	lb bc, 1, 12
	call ClearBox
	pop hl
	ld de, wStringBuffer1
	jp PlaceString

Arena_UpdateExpForLevel:
	ld hl, BaseData + BASE_GROWTH_RATE
	ld bc, BASE_DATA_SIZE
	ld a, [wArenaTempMonSpecies]
	dec a
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarByte
	ld [wBaseGrowthRate], a
	ld a, [wArenaTempMonLevel]
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wArenaTempMonExp
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

ArenaMenu_PokemonBuilder_Page1Values:
	db 7
	paged_value wArenaTempMonBox,		   1,   NUM_BOXES,   $01,			Arena_BoxStructStrings.SendBox,   NULL,					   FALSE
	paged_value wArenaTempMonSpecies,	   1,   NUM_POKEMON, BULBASAUR,	  Arena_BoxStructStrings.Pokemon,   Arena_PrintPokemonName, FALSE
	paged_value wArenaTempMonLevel,		 5,   MAX_LEVEL,   MAX_LEVEL,			Arena_BoxStructStrings.Level,	 NULL,					   FALSE
	paged_value wArenaTempMonItem,		  $03,   $be,		 BRIGHTPOWDER,	Arena_BoxStructStrings.Item,	  Arena_PrintItemName2,   FALSE
	paged_value wArenaTempMonDVs+0,		 $00, $ff,		 $fe,			Arena_BoxStructStrings.PowerRnd0, NULL,					   TRUE
	paged_value wArenaTempMonDVs+1,		 $00, $ff,		 $ff,			Arena_BoxStructStrings.PowerRnd1, NULL,					   TRUE
	paged_value wArenaTempMonHappiness,	 $00, $ff,		 $ff, Arena_BoxStructStrings.Friend,	NULL,					   FALSE


ArenaMenu_PokemonBuilder_Page2Values:
	db 4
	paged_value wArenaTempMonPP+0,		  $00, $ff,		 $ff,			Arena_BoxStructStrings.PP1,	   NULL,					   FALSE
	paged_value wArenaTempMonPP+1,		  $00, $ff,		 $ff,			Arena_BoxStructStrings.PP2,	   NULL,					   FALSE
	paged_value wArenaTempMonPP+2,		  $00, $ff,		 $ff,			Arena_BoxStructStrings.PP3,	   NULL,					   FALSE
	paged_value wArenaTempMonPP+3,		  $00, $ff,		 $ff,			Arena_BoxStructStrings.PP4,	   NULL,					   FALSE


Arena_BoxStructStrings:
.Pokemon:   db "#MON@"
.Item:	  db "ITEM@"
.PowerRnd0: db "DV [ATK/DEF]<LF>  SHINY:FF@"
.PowerRnd1: db "DV [SPD/SPC]<LF>  SHINY:FF@"
.PP1:	   db "MOVE 1 PP@"
.PP2:	   db "MOVE 2 PP@"
.PP3:	   db "MOVE 3 PP@"
.PP4:	   db "MOVE 4 PP<LF><LF><LF>  255▶3×PP UP@"
.Friend:	db "HAPPINESS@"
.Level:	 db "LEVEL@"
.SendBox:   db "SEND BOX@"

Arena_BoxAddresses:
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14

PrintHexNumber:
; Print the c-byte value from de to hl as hexadecimal digits.
.loop
	push bc
	call .HandleByte
	pop bc
	dec c
	jr nz, .loop
	ret

.HandleByte:
	ld a, [de]
	swap a
	and $f
	call .PrintDigit
	ld [hli], a
	ld a, [de]
	and $f
	call .PrintDigit
	ld [hli], a
	inc de
	ret

.PrintDigit:
	ld bc, .HexDigits
	add c
	ld c, a
	ld a, 0
	adc b
	ld b, a
	ld a, [bc]
	ret

.HexDigits:
	db "0123456789ABCDEF"

Arena_FillMoves:
	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	ld hl, wArenaTempMonMoves
	cp SMEARGLE
	jr z, .smeargle
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarByte
	ld e, a
	inc hl
	ld a, BANK(EvosAttacksPointers)
	call GetFarByte
	ld d, a
.skip:
	ld a, BANK(EvosAttacksPointers)
	ld h, d
	ld l, e
	inc de
	call GetFarByte
	and a
	jr nz, .skip
.loop:
	ld a, BANK(EvosAttacksPointers)
	ld h, d
	ld l, e
	inc de
	call GetFarByte
	and a
	jr z, .done
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	ld a, BANK(EvosAttacksPointers)
	ld h, d
	ld l, e
	inc de
	call GetFarByte
	jr c, .loop
	ld b, a
	push de
	ld hl, wArenaTempMonMoves
	ld c, 4
.check:
	ld a, [hl]
	cp b
	jr z, .next
	and a
	jr z, .learn
	inc hl
	dec c
	jr nz, .check

	ld hl, wArenaTempMonMoves + 1
	ld de, wArenaTempMonMoves
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, wArenaTempMonMoves + 3
.learn:
	ld [hl], b
.next:
	pop de
	jr .loop

.smeargle:
	ld [hl], SKETCH
	xor a
	ld [wArenaTempMonMoves + 1], a
	ld [wArenaTempMonMoves + 2], a
	ld [wArenaTempMonMoves + 3], a
.done:
	pop bc
	pop de
	pop hl
	ret