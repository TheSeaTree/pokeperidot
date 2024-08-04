CheckForHiddenItems:
; Checks to see if there are hidden items on the screen that have not yet been found.  If it finds one, returns carry.
	call GetMapScriptsBank
	ld [wBuffer1], a
; Get the coordinate of the bottom right corner of the screen, and load it in wBuffer3/wBuffer4.
	ld a, [wXCoord]
	add SCREEN_WIDTH / 4
	ld [wBuffer4], a
	ld a, [wYCoord]
	add SCREEN_HEIGHT / 4
	ld [wBuffer3], a
; Get the pointer for the first bg_event in the map...
	ld hl, wCurMapBGEventsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; ... before even checking to see if there are any BG events on this map.
	ld a, [wCurMapBGEventCount]
	and a
	jr z, .nobgeventitems
; For i = 1:wCurMapBGEventCount...
.loop
; Store the counter in wBuffer2, and store the bg_event pointer in the stack.
	ld [wBuffer2], a
	push hl
; Get the Y coordinate of the BG event.
	call .GetFarByte
	ld e, a
; Is the Y coordinate of the BG event on the screen?  If not, go to the next BG event.
	ld a, [wBuffer3]
	sub e
	jr c, .next
	cp SCREEN_HEIGHT / 2
	jr nc, .next
; Is the X coordinate of the BG event on the screen?  If not, go to the next BG event.
	call .GetFarByte
	ld d, a
	ld a, [wBuffer4]
	sub d
	jr c, .next
	cp SCREEN_WIDTH / 2
	jr nc, .next
; Is this BG event a hidden item?  If not, go to the next BG event.
	call .GetFarByte
	cp BGEVENT_ITEM
	jr nz, .next
; Has this item already been found?  If not, set off the Itemfinder.
	ld a, [wBuffer1]
	call GetFarHalfword
	ld a, [wBuffer1]
	call GetFarHalfword
	ld d, h
	ld e, l
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .itemnearby

.next
; Restore the bg_event pointer and increment it by the length of a bg_event.
	pop hl
	ld bc, 5
	add hl, bc
; Restore the BG event counter and decrement it.  If it hits zero, there are no hidden items in range.
	ld a, [wBuffer2]
	dec a
	jr nz, .loop

.nobgeventitems
	xor a
	ret

.itemnearby
	pop hl
	scf
	ret

.GetFarByte:
	ld a, [wBuffer1]
	call GetFarByte
	inc hl
	ret

RockItemEncounter:
	ld de, EVENT_LOST_LAND_GOT_OLD_AMBER
	ld b, CHECK_FLAG
	call EventFlagAction
	jr nz, .OldAmber
	ld de, ENGINE_MYSTICBADGE
	farcall CheckEngineFlag
	jr nc, .EvoStones
	ld hl, .RockItems
	call Random
.loop
	sub [hl]
	jr c, .ok
rept 2
	inc hl
endr
	jr .loop
.ok
	ld a, [hli]
	cp $ff
	ld a, NO_ITEM
	jr z, .done
	ld a, [hli]
.done
	ld [wScriptVar], a
	ret

.EvoStones
	ld hl, .RockItems2
	call Random
	jr .loop

.OldAmber
	ld hl, .RockItems3
	call Random
	jr .loop

.RockItems:
	db 1, MAX_REVIVE
	db 1, NUGGET
	db 2, STAR_PIECE
	db 4, THICK_CLUB
	db 6, STARDUST
	db 12, BIG_PEARL
	db 48, BRICK_PIECE
	db 96, NO_ITEM
	db -1

.RockItems2:
	db 1, MAX_REVIVE
	db 1, NUGGET
	db 2, STAR_PIECE
	db 4, THICK_CLUB
	db 6, STARDUST
	db 8, FIRE_STONE
	db 8, WATER_STONE
	db 8, LEAF_STONE
	db 8, THUNDERSTONE
	db 8, MOON_STONE
	db 8, SUN_STONE
	db 12, BIG_PEARL
	db 48, BRICK_PIECE
	db 48, NO_ITEM
	db -1

.RockItems3:
	db 1, MAX_REVIVE
	db 1, NUGGET
	db 2, STAR_PIECE
	db 4, THICK_CLUB
	db 6, STARDUST
	db 8, OLD_AMBER
	db 8, FIRE_STONE
	db 8, WATER_STONE
	db 8, LEAF_STONE
	db 8, THUNDERSTONE
	db 8, MOON_STONE
	db 8, SUN_STONE
	db 12, BIG_PEARL
	db 48, BRICK_PIECE
	db 40, NO_ITEM
	db -1

TreeItemEncounter:
	ld hl, .TreeItems
	call Random
.loop
	sub [hl]
	jr c, .ok
rept 2
	inc hl
endr
	jr .loop
.ok
	ld a, [hli]
	cp $ff
	ld a, NO_ITEM
	jr z, .done
	ld a, [hli]
.done
	ld [wScriptVar], a
	ret
	
.TreeItems:
	db   8, REVIVAL_HERB
	db  16, SILVER_LEAF
	db  16, GOLD_LEAF
	db  16, POWER_HERB
	db 114, NO_ITEM
	db -1
