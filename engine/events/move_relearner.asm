; Move Reminder code by TPP Anniversary Crystal 251
; https://github.com/TwitchPlaysPokemon/tppcrystal251pub/blob/public/event/move_relearner.asm
; Edited by TheFakeMateo for RedPlusPlus
; https://github.com/TheFakeMateo/RedPlusPlus/blob/250763c40439c80fae400dca66c11194cbb9f6ea/engine/events/move_reminder.asm


MoveRelearner:
	ld hl, Text_MoveReminderIntro
	call PrintText
	call JoyWaitAorB

	ld a, BRICK_PIECE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jp nc, .no_gold_leaf

	ld hl, Text_MoveReminderPrompt
	call PrintText
	call YesNoBox
	jp c, .cancel

	ld hl, Text_MoveReminderWhichMon
	call PrintText
	call JoyWaitAorB

	ld b, $6
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	call GetRemindableMoves
	jr z, .no_moves

	ld hl, Text_MoveReminderWhichMove
	call PrintText
	call JoyWaitAorB

	call ChooseMoveToLearn
	jr c, .skip_learn

	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	xor a
	jr z, .skip_learn

	ld a, BRICK_PIECE
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX

.skip_learn
	call CloseSubmenu
	call SpeechTextBox
.cancel
	ld hl, Text_MoveReminderCancel
	jp PrintText

.egg
	ld hl, Text_MoveReminderEgg
	jp PrintText

.no_gold_leaf
	ld hl, Text_MoveReminderNoGoldLeaf
	jp PrintText

.no_mon
	ld hl, Text_MoveReminderNoMon
	jp PrintText

.no_moves
	ld hl, Text_MoveReminderNoMoves
	jp PrintText

GetRemindableMoves:
; Get moves remindable by CurPartyMon
; Returns z if no moves can be reminded.
	GLOBAL EvosAttacksPointers, EvosAttacks
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	push af
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a

	ld b, 0
	ld de, wd002 + 1
; based on GetEggMove in engine/breeding.asm
.loop
	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.skip_evos
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

.loop_moves
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	jr c, .loop_moves

	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves

.done
	ld a, [wCurPartySpecies]
	dec a

	farcall GetPreEvolution
	pop bc
	jr c, .loop
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret


CheckAlreadyInList:
	push hl
	ld hl, wd002 + 1
.loop
	ld a, [hli]
	cp $ff
	jr z, .nope
	cp c
	jr nz, .loop
	pop hl
	scf
	ret
.nope
	pop hl
	and a
	ret


CheckPokemonAlreadyKnowsMove:
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	pop bc
	pop hl
	and a
	ret
.yes
	pop bc
	pop hl
	scf
	ret


ChooseMoveToLearn:
	; Number of items stored in wd002
	; List of items stored in wd002 + 1
	call FadeToMenu
	farcall BlankScreen
	call UpdateSprites
	call SetUpMoveRelearnerScreenBG
	ld hl, .MenuDataHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorBuffer], a
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

.carry
	scf
	ret

.MenuDataHeader:
	db $40 ; flags
	db 01, 01 ; start coords
	db 10, 18 ; end coords
	dw .menudata2
	db 1 ; default option

.menudata2:
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wd002
	dba .PrintMoveName
	dba .PrintDetails
	dba .PrintMoveDesc

.PrintMoveName
	push de
	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	pop hl
	jp PlaceString

.PrintDetails
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	cp $ff
	ret z
	push de
	dec a

	ld hl, wStringBuffer1 + 9
	ld de, .BP
	ld bc, 3
	call PlaceString

	ld a, [wMenuSelection]
	dec a

	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_POWER
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld hl, wStringBuffer1 + 12
	and a
	jr z, .no_power
	ld [wEngineBuffer1], a
	ld de, wEngineBuffer1
	lb bc, 1, 3
	call PrintNum
	jr .got_power
.no_power
	ld de, .ThreeDashes
	ld bc, 3
	call PlaceString
.got_power
	ld hl, wStringBuffer1 + 13 + 2
	ld [hl], "@"

	ld hl, SCREEN_WIDTH - 6
	pop de
	add hl, de
	push de
	ld de, wStringBuffer1
	call PlaceString
	pop de
	ret

.ThreeDashes
	db "---@"
	
.BP
	db "<BOLD_B><BOLD_P>/@"

.PrintMoveDesc
	push de
	push hl
	hlcoord 0, 10
	ld de, String_MoveRelearnerType_Top
	call PlaceString
	hlcoord 0, 11
	ld de, String_MoveRelearnerType_Bottom
	call PlaceString
	hlcoord 0, 12
	ld [hl], "♣"
	hlcoord 19, 12
	ld [hl], "♦"
	call PlaceString
	pop hl
	hlcoord 1, 13
	ld b, 4
	ld c, 18
	call ClearBox
	hlcoord 1, 12
	ld b, 1
	ld c, 18
	call ClearBox
	hlcoord 0, 12
	ld [hl], "│"
	hlcoord 19, 12
	ld [hl], "│"
	call PlaceString
	ld a, [wMenuSelection]
	cp $ff
	pop de
	jr z, .CancelButton
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDesc
	
	hlcoord 12, 12
	ld de, .ACC
	call PlaceString

	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_ACC
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	; display accuracy out of 100
	ld [hMultiplicand], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct]
	; don't increase a for 0% moves
	and a
	jr z, .no_inc
	inc a
.no_inc
	hlcoord 16, 12
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	lb bc, 1, 3
	call PrintNum

	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld a, [wCurSpecies]
	ld b, a
	hlcoord 2, 12
	predef PrintMoveType
	ret

.CancelButton
	hlcoord 2, 12
	ld de, .ThreeDashes
	call PlaceString

	hlcoord 1, 14
	ld de, .CancelDescription
	jp PlaceString
	
.CancelDescription
	db   "Do not relearn a"
	next "previous move.@"
	
.ACC
	db "<BOLD_A><BOLD_C><BOLD_C>/@"
	
SetUpMoveRelearnerScreenBG:
	call PlaceString
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	farcall ClearSpriteAnims2
	hlcoord 0, 0
	ld b, 12
	ld c, 18
	call TextBox
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call TextBox
	hlcoord 0, 0
	ld de, .Corner
	call PlaceString
	xor a
	ret
	
.Corner
	db "┌@"
	
String_MoveRelearnerType_Top:
	db "♣─────┐@"
String_MoveRelearnerType_Bottom:
	db "│TYPE/└────────────♦@"

Text_MoveReminderIntro:
	text_jump MoveReminderIntroText
	db "@"

Text_MoveReminderPrompt:
	text_jump MoveReminderPromptText
	db "@"

Text_MoveReminderWhichMon:
	text_jump MoveReminderWhichMonText
	db "@"

Text_MoveReminderWhichMove:
	text_jump MoveReminderWhichMoveText
	db "@"

Text_MoveReminderCancel:
	text_jump MoveReminderCancelText
	db "@"

Text_MoveReminderEgg:
	text_jump MoveReminderEggText
	db "@"

Text_MoveReminderNoGoldLeaf:
	text_jump MoveReminderNoGoldLeafText
	db "@"

Text_MoveReminderNoMon:
	text_jump MoveReminderNoMonText
	db "@"

Text_MoveReminderNoMoves:
	text_jump MoveReminderNoMovesText
	db "@"
