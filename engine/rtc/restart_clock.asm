RestartClock_GetWraparoundTime:
	push hl
	dec a
	ld e, a
	ld d, 0
	ld hl, .WrapAroundTimes
rept 4
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl
	ret

.WrapAroundTimes:
	dw wBuffer5
	db 24, 2

	dw wBuffer6
	db 60, 5

RestartClock:
; If we're here, we had an RTC overflow.
	ld hl, .Text_ClockTimeMayBeWrong
	call PrintText
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadStandardMenuHeader
	call .SetClock
	call ExitMenu
	pop bc
	ld hl, wOptions
	ld [hl], b
	ld c, a
	ret

.Text_ClockTimeMayBeWrong:
	; The clock's time may be wrong. Please reset the time.
	text_far UnknownText_0x1c40e6
	text_end

.Text_SetWithControlPad:
	; Set with the Control Pad. Confirm: A Button Cancel:  B Button
	text_far UnknownText_0x1c411c
	text_end

.SetClock:
	ld a, 1
	ld [wBuffer1], a ; which digit
	ld [wBuffer2], a
	ld a, 10
	ld [wBuffer3], a
	call UpdateTime
	ldh a, [hHours]
	ld [wBuffer5], a
	ldh a, [hMinutes]
	ld [wBuffer6], a

.loop
	call .joy_loop
	jr nc, .loop
	and a
	ret nz
	call .PrintTime
	ld [wStringBuffer2], a
	ld a, [wBuffer5]
	ld [wStringBuffer2 + 1], a
	ld a, [wBuffer6]
	ld [wStringBuffer2 + 2], a
	xor a
	ld [wStringBuffer2 + 3], a
	call InitTime
	ld hl, .Text_ClockReset
	call PrintText
	farcall _SaveGameData
	call WaitPressAorB_BlinkCursor
	xor a
	ret

.cancel
	ld a, $1
	ret

.Text_ClockReset:
	; The clock has been reset.
	text_far UnknownText_0x1c4168
	text_end

.joy_loop
	call JoyTextDelay_ForcehJoyDown
	ld c, a
	push af
	call .PrintTime
	pop af
	bit 0, a
	jr nz, .press_A
	bit 1, a
	jr nz, .press_B
	bit 6, a
	jr nz, .pressed_up
	bit 7, a
	jr nz, .pressed_down
	bit 5, a
	jr nz, .pressed_left
	bit 4, a
	jr nz, .pressed_right
	jr .joy_loop

.press_A
	ld a, $0
	scf
	ret

.press_B
	ld a, $1
	scf
	ret

.pressed_up
	ld a, [wBuffer1]
	call RestartClock_GetWraparoundTime
	ld a, [de]
	inc a
	ld [de], a
	cp b
	jr c, .done_scroll
	ld a, $0
	ld [de], a
	jr .done_scroll

.pressed_down
	ld a, [wBuffer1]
	call RestartClock_GetWraparoundTime
	ld a, [de]
	dec a
	ld [de], a
	cp -1
	jr nz, .done_scroll
	ld a, b
	dec a
	ld [de], a
	jr .done_scroll

.pressed_left
	ld hl, wBuffer1
	dec [hl]
	jr nz, .done_scroll
	ld [hl], $2
	jr .done_scroll

.pressed_right
	ld hl, wBuffer1
	inc [hl]
	ld a, [hl]
	cp $3
	jr c, .done_scroll
	ld [hl], $1

.done_scroll
	xor a
	ret

.PrintTime:
	hlcoord 0, 8
	ld b, 3
	ld c, 8
	call TextBox
	decoord 11, 10
	hlcoord 0, 12
	ld [hl], "♣"
	hlcoord 9, 12
	ld [hl], "♠"
	hlcoord 4, 8
	ld [hl], "♠"
	hlcoord 9, 9
	ld [hl], "♣"
	ld a, [wBuffer5]
	ld b, a
	ld a, [wBuffer6]
	ld c, a
	decoord 1, 10
	farcall PrintHoursMins
	ld a, [wBuffer2]
	lb de, " ", " "
	call .PlaceChars
	ld a, [wBuffer1]
	lb de, "▲", "▼"
	call .PlaceChars
	ld a, [wBuffer1]
	ld [wBuffer2], a
	ret

.PlaceChars:
	push de
	call RestartClock_GetWraparoundTime
	ld a, [wBuffer3]
	dec a
	ld b, a
	call Coord2Tile
	pop de
	ld [hl], d
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	ld [hl], e
	ret
