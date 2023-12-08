MAP_NAME_SIGN_START EQU $c0

ReturnFromMapSetupScript::
	xor a
	ldh [hBGMapMode], a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld [wCurLandmark], a
	call .CheckCarnationZooGate
	jr z, .not_gate

	call GetMapEnvironment
	cp GYM_CAVE
	jr z, .gym_cave
	cp GATE
	jr nz, .not_gate
.gym_cave
	ld a, -1
	ld [wCurLandmark], a

.not_gate
	ld hl, wEnteredMapFromContinue
	bit 1, [hl]
	res 1, [hl]
	jr nz, .dont_do_map_sign

	call .CheckMovingWithinLandmark
	jr z, .dont_do_map_sign
	ld a, [wCurLandmark]
	ld [wPrevLandmark], a

	call .CheckSpecialMap
	jr z, .dont_do_map_sign

; Display for 60 frames
	ld a, 60
	ld [wLandmarkSignTimer], a
	call LoadMapNameSignGFX
	call InitMapNameFrame
	farcall LoadSignPals
	farcall ApplyPals
	farcall HDMATransfer_OnlyTopFourRows
	ret

.dont_do_map_sign
	ld a, [wCurLandmark]
	ld [wPrevLandmark], a
	ld a, $90
	ldh [rWY], a
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ret

.CheckMovingWithinLandmark:
	ld a, [wCurLandmark]
	ld c, a
	ld a, [wPrevLandmark]
	cp c
	ret z
	cp SPECIAL_MAP
	ret

.CheckSpecialMap:
; These landmarks do not get pop-up signs.
	cp -1
	ret z
	cp SPECIAL_MAP
	ret z
	cp PALEROCK_MOUNTAIN
	ret z
	cp DIGLETTS_CAVE
	ret z
	cp BONEYARD
	ret z
	cp THE_PAST
	ret z
	cp BATTLE_SIM
	ret z
	cp LOST_LAND
	jr nz, .DisplayMapName
	; Lost Land will only display the map name if the player has visited previously.
	ld hl, wPokegearFlags
	bit LOST_LAND_VISITED_F, [hl]
	ret z
.DisplayMapName
	ld a, 1
	and a
	ret

.CheckCarnationZooGate:
	ld a, [wMapGroup]
	cp GROUP_CARNATION_TOWN
	ret nz
	ld a, [wMapNumber]
	cp MAP_CARNATION_ZOO_GATE
	ret

PlaceMapNameSign::
	ld hl, wLandmarkSignTimer
	ld a, [hl]
	and a
	jr z, .disappear
	dec [hl]
	cp 60
	ret z
	cp 59
	jr nz, .skip2
	call InitMapNameFrame
	call PlaceMapNameCenterAlign
	farcall HDMATransfer_OnlyTopFourRows
.skip2
	ld a, $80
	ld a, $70
	ldh [rWY], a
	ldh [hWY], a
	ret

.disappear
	ld a, $90
	ldh [rWY], a
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ret

LoadMapNameSignGFX:
	ld de, MapEntryFrameGFX
	ld hl, vTiles0 tile MAP_NAME_SIGN_START
	lb bc, BANK(MapEntryFrameGFX), 14
	call Get2bpp
	ret

InitMapNameFrame:
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call InitMapSignAttrMap
	call PlaceMapNameFrame
	hlcoord 1, 1
	ld de, .Entering
	call PlaceString
	ret
	
.Entering:
	db "Entering:@"

PlaceMapNameCenterAlign:
	ld a, [wCurLandmark]
	ld e, a
	farcall GetLandmarkName
	call .GetNameLength
	ld a, SCREEN_WIDTH
	sub c
	srl a
	ld b, $0
	ld c, a
	hlcoord 0, 2
	add hl, bc
	ld de, wStringBuffer1
	call PlaceString
	ret

.GetNameLength:
	ld c, 0
	push hl
	ld hl, wStringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr z, .stop
	cp "%"
	jr z, .loop
	inc c
	jr .loop
.stop
	pop hl
	ret

InitMapSignAttrMap:
	ld de, wAttrMap - wTileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT | PRIORITY
.loop
	push bc
	push hl
.inner_loop
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	ret

PlaceMapNameFrame:
	hlcoord 0, 0
	; top left
	ld a, MAP_NAME_SIGN_START + 1
	ld [hli], a
	; top left, second column
	ld a, MAP_NAME_SIGN_START + 2
	ld [hli], a
	; top row
	ld a, MAP_NAME_SIGN_START + 2
	call .FillTop
	; top right
	ld a, MAP_NAME_SIGN_START + 4
	ld [hli], a
	; left, first line
	ld a, MAP_NAME_SIGN_START + 5
	ld [hli], a
	; first line
	call .FillMiddle
	; right, first line
	ld a, MAP_NAME_SIGN_START + 11
	ld [hli], a
	; left, second line
	ld a, MAP_NAME_SIGN_START + 6
	ld [hli], a
	; left, second line, second column
	ld a, MAP_NAME_SIGN_START + 3
	ld [hli], a
	; second line
	call .FillMiddle2
	; right, second line
	ld a, MAP_NAME_SIGN_START + 11
	ld [hli], a
	; bottom left
	ld a, MAP_NAME_SIGN_START + 7
	ld [hli], a
	; bottom left, second line, second column
	ld a, MAP_NAME_SIGN_START + 9
	ld [hli], a
	; bottom
	ld a, MAP_NAME_SIGN_START + 8
	call .FillBottom
	; bottom right
	ld a, MAP_NAME_SIGN_START + 10
	ld [hl], a
	ret

.FillMiddle:
	ld c, SCREEN_WIDTH - 2
	ld a, MAP_NAME_SIGN_START + 13
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

.FillBottom:
	ld c, SCREEN_WIDTH - 3
	ld a, MAP_NAME_SIGN_START + 8
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret
	
.FillTop:
	ld c, SCREEN_WIDTH - 3
	ld a, MAP_NAME_SIGN_START + 2
.loop3
	ld [hli], a
	dec c
	jr nz, .loop3
	ret
	
.FillMiddle2:
	ld c, SCREEN_WIDTH - 3
	ld a, MAP_NAME_SIGN_START + 13
.loop4
	ld [hli], a
	dec c
	jr nz, .loop4
	ret