TownMap_ConvertLineBreakCharacters:
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_feed
	cp "¯"
	jr z, .line_feed
	inc hl
	jr .loop

.line_feed
	ld [hl], "<LF>"

.end
	ld de, wStringBuffer1
	hlcoord 1, 0
	call PlaceString
	ret
	
TownMap_ConvertFlyMapLineBreakCharacters:
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_feed
	cp "¯"
	jr z, .line_feed
	inc hl
	jr .loop

.line_feed
	ld [hl], "<LF>"

.end
	ld de, wStringBuffer1
	hlcoord 2, 1
	call PlaceString
	ret
