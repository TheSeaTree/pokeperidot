PlaceWaitingText::
	hlcoord 3, 12
	ld b, 1
	ld c, 12

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call TextBox
	jr .proceed

.notinbattle
	predef LinkTextboxAtHL

.proceed
	hlcoord 3, 12
	ld [hl], "♥"
	hlcoord 16, 12
	ld [hl], "♥"
	hlcoord 5, 13
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
	db "Waiting...@"
	
PlaceWaitingText2::
	hlcoord 3, 7
	ld b, 1
	ld c, 12

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call TextBox
	jr .proceed

.notinbattle
	predef LinkTextboxAtHL

.proceed
	hlcoord 5, 8
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
	db "Waiting...@"
