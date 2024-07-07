; Move Reminder code by TPP Anniversary Crystal 251
; https://github.com/TwitchPlaysPokemon/tppcrystal251pub/blob/public/event/move_relearner.asm
; Edited by TheFakeMateo for RedPlusPlus
; https://github.com/TheFakeMateo/RedPlusPlus/blob/250763c40439c80fae400dca66c11194cbb9f6ea/engine/events/move_reminder.asm


MoveRelearner:
	ld hl, Text_MoveReminderIntro
	call PrintText
	call YesNoBox
	jp c, .cancel

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

	ld b, 6
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
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, wStringBuffer2 - wStringBuffer1
	call CopyBytes
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	jr z, .skip_learn

	ld c, HAPPINESS_LEARNMOVE
	callfar ChangeHappiness

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
	call ReturnToMapWithSpeechTextbox
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

MoveReminder_Simulation:
; Used in the Battle Simulation as well, where it has no cost.
	ld hl, Text_SimulationMoveReminderIntro
	call PrintText
	call YesNoBox
	jp c, .cancel

	ld b, 6
	farcall SelectMonFromParty
	jr c, .cancel

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
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, wStringBuffer2 - wStringBuffer1
	call CopyBytes
	ld b, 0
	predef LearnMove
	ld a, b
	and a
.skip_learn
	call ReturnToMapWithSpeechTextbox
.cancel
	ld hl, Text_SimulationMoveReminderCancel
	jp PrintText

.no_moves
	ld hl, Text_MoveReminderNoMoves
	jp PrintText

EggMoveTutor:
	ld hl, Text_EggMoveTutorIntro
	call PrintText
	call YesNoBox
	jp c, .cancel

	ld a, BRICK_PIECE
	ld [wCurItem], a
	ld a, 5
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call CheckItem
	jp nc, .no_item

	ld hl, Text_MoveReminderPrompt
	call PrintText
	call YesNoBox
	jp c, .cancel

	ld hl, Text_EggMoveTutorWhichMon
	call PrintText
	call JoyWaitAorB

	ld b, 6
	farcall SelectMonFromParty
	jp c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .egg
	; The list is just too long with Smeargle.
	cp SMEARGLE
	jr z, .no_moves

	call IsAPokemon
	jp c, .no_mon

	call GetValidEggMoves
	jr z, .no_moves

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp 170
	jr c, .not_happy_enough

	ld hl, Text_EggMoveTutorWhichMove
	call PrintText
	call JoyWaitAorB

	call ChooseMoveToLearn
	jr c, .skip_learn

	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, wStringBuffer2 - wStringBuffer1
	call CopyBytes
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	jr z, .skip_learn

	ld c, HAPPINESS_LEARNMOVE
	callfar ChangeHappiness

	ld a, BRICK_PIECE
	ld [wCurItem], a
	ld a, 5
	ld [wItemQuantityChangeBuffer], a
	ld a, -5
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX

.skip_learn
	call ReturnToMapWithSpeechTextbox
.cancel
	ld hl, Text_MoveReminderCancel
	jp PrintText

.not_happy_enough
	ld hl, Text_EggMoveTutorNotHappy
	jp PrintText

.no_moves
	ld hl, Text_EggMoveTutorNoMoves
	jp PrintText

.egg
	ld hl, Text_MoveReminderEgg
	jp PrintText

.no_item
	ld hl, Text_EggMoveTutorNoItem
	jp PrintText

.no_mon
	ld hl, Text_MoveReminderNoMon
	jp PrintText

GetRemindableMoves:
; Get moves remindable by CurPartyMon
; Returns z if no moves can be reminded.

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

; Based on GetEggMove in engine/breeding/egg.asm
	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
REPT 2
	add hl, bc
ENDR
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.skip_evos
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

.loop_moves
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	ld a, BANK("Evolutions and Attacks")
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
	pop bc
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

GetValidEggMoves:
; Get moves remindable by CurPartyMon
; Returns z if no moves can be reminded.

	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	push af
	call GetPartyParamLocation
	ld a, [hl]

	ld b, 0
	ld de, wd002 + 1

; Based on GetEggMove in engine/breeding/egg.asm
	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld b, 0
	ld c, a
	ld hl, EggMovePointers
	add hl, bc
	add hl, bc
	ld a, BANK(EggMovePointers)
	call GetFarHalfword

.loop_moves
	ld a, BANK("Egg Moves")
	call GetFarByte
	inc hl
	cp -1 ; last entry in egg move table is -1
	jr z, .done
	cp DIVE_BOMB ; Dive Bomb is a secret move, skip it.
	jr z, .loop_moves
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
	pop bc
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
	inc a
	jr z, .nope
	dec a
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
	ld b, 4
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
	
	hlcoord 0, 0
	ld b, 12
	ld c, 18
	call TextBox
	
	ld hl, .MenuHeader
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

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 18, 10
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3 ; item format
	db 4, SCREEN_WIDTH + 2 ; rows, columns
	db 1 ; horizontal spacing
	dba  wd002
	dba .PrintMoveName
	dba .PrintDetails
	dba .PrintMoveDesc

.PrintMoveName
	push de
	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	pop hl
	call PlaceString
	ret

.PrintDetails
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de
	dec a

	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wd265], a

	ld a, [wMenuSelection]
	dec a
	
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_POWER
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld hl, wStringBuffer1 + 11
	and a
	cp 2
	jr c, .no_power
;	jr z, .no_power
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	call PrintNum
	jr .got_power
.no_power
	ld de, .ThreeDashes
	ld bc, 3
	call PlaceString
.got_power
	ld hl, wStringBuffer1 + 8
	ld de, .BP
	ld bc, 3
	call PlaceString

	ld a, [wMenuSelection]
	dec a

; Print PP (works)
	ld hl, wStringBuffer1 + 14
	ld [hl], "@"

	pop hl
	ld de, wStringBuffer1
	jp PlaceString
	
.ThreeDashes
	db "---@"

.PrintMoveDesc
	push de
	call SpeechTextBox

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
	inc a
	pop de
	jr z, .CancelButton
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDesc

	; Print Accuracy
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

	; Display "---" for moves that can't miss.
	cp 2
	jr c, .Perfect_Accuracy

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

.Perfect_Accuracy
	hlcoord 16, 12
	ld de, .String_PerfectAccuracy
	jp PlaceString

.CancelDescription
	db   "Do not relearn a"
	next "previous move.@"

.BP
	db "<BOLD_B><BOLD_P>/@"

.ACC
	db "<BOLD_A><BOLD_C><BOLD_C>/@"

.String_PerfectAccuracy
	db "---@"

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

Text_SimulationMoveReminderIntro:
	text_jump SimulationMoveReminderIntrroText
	db "@"

Text_SimulationMoveReminderCancel:
	text_jump SimulationMoveReminderCancelText
	db "@"

Text_EggMoveTutorIntro:
	text_jump EggMoveTutorIntroText
	db "@"

Text_EggMoveTutorWhichMon:
	text_jump EggMoveTutorWhichMonText
	db "@"

Text_EggMoveTutorWhichMove:
	text_jump EggMoveTutorWhichMoveText
	db "@"

Text_EggMoveTutorNoItem:
	text_jump EggMoveTutorNoItemText
	db "@"

Text_EggMoveTutorNoMoves:
	text_jump EggMoveTutorNoMovesText
	db "@"

Text_EggMoveTutorNotHappy:
	text_jump EggMoveTutorNotHappyText
	db "@"
