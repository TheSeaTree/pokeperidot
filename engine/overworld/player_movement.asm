DoPlayerMovement::

	call .GetDPad
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ld [wd041], a
	call .TranslateIntoMovement
	ld c, a
	ld a, [wMovementAnimation]
	ld [wPlayerNextMovement], a
	ret

.GetDPad:

	ldh a, [hJoyDown]
	ld [wCurInput], a
	ret

.TranslateIntoMovement:
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_SURF
	jr z, .Surf
	cp PLAYER_SURF_LAPRAS
	jr z, .Surf
	cp PLAYER_SURF_PIKA
	jr z, .Surf
	cp PLAYER_BIKE
	jr z, .Normal
	cp PLAYER_RUN
	jr z, .Normal

.Normal:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	jr .NotMoving

.Surf:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TrySurf
	ret c
	jr .NotMoving

.Ice:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .HitWall
	call .BumpSound
.HitWall:
	call .StandInPlace
	xor a
	ret

.NotMoving:
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .NotMovingCont
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	
.NotMovingCont:
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
	ld a, [wEngineBuffer4]
	and a
	jr nz, .CantMove
	call .BumpSound
.CantMove:
	call ._WalkInPlace
	xor a
	ret

.Standing:
	call .StandInPlace
	xor a
	ret

.CheckTile:
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [wPlayerStandingTile]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .not_whirlpool
	ld a, 3
	scf
	ret

.not_whirlpool
	and $f0
	cp HI_NYBBLE_CURRENT
	jr z, .water
	cp HI_NYBBLE_WALK
	jr z, .land1
	cp HI_NYBBLE_WALK_ALT
	jr z, .land2
	cp HI_NYBBLE_WARPS
	jr z, .warps
	cp HI_NYBBLE_BOUNCE
	jr z, .bounce
	jr .no_walk

.water
	ld a, c
	maskbits NUM_DIRECTIONS
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [wWalkingDirection], a
	jr .continue_walk

.water_table
	db RIGHT ; COLL_WATERFALL_RIGHT
	db LEFT  ; COLL_WATERFALL_LEFT
	db UP    ; COLL_WATERFALL_UP
	db DOWN  ; COLL_WATERFALL

.land1
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land1_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [wWalkingDirection], a
	jr .continue_walk

.land1_table
	db STANDING ; COLL_BRAKE
	db RIGHT    ; COLL_WALK_RIGHT
	db LEFT     ; COLL_WALK_LEFT
	db UP       ; COLL_WALK_UP
	db DOWN     ; COLL_WALK_DOWN
	db STANDING ; COLL_BRAKE_45
	db STANDING ; COLL_BRAKE_46
	db STANDING ; COLL_BRAKE_47

.land2
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land2_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [wWalkingDirection], a
	jr .continue_walk

.land2_table
	db RIGHT    ; COLL_WALK_RIGHT_ALT
	db LEFT     ; COLL_WALK_LEFT_ALT
	db UP       ; COLL_WALK_UP_ALT
	db DOWN     ; COLL_WALK_DOWN_ALT
	db STANDING ; COLL_BRAKE_ALT
	db STANDING ; COLL_BRAKE_55
	db STANDING ; COLL_BRAKE_56
	db STANDING ; COLL_BRAKE_57

.warps
	ld a, c
	cp COLL_DOOR
	jr z, .down
	cp COLL_GYM_DOOR
	jr z, .down
	cp COLL_STAIRCASE
	jr z, .down
	cp COLL_CAVE
	jr nz, .no_walk

.down
	ld a, DOWN
	ld [wWalkingDirection], a
	jr .continue_walk

.no_walk
	xor a
	ret

.continue_walk
	ld a, STEP_WALK
	call .DoStep
	ld a, 5
	scf
	ret

.bounce
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .bounce_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [wWalkingDirection], a

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, 7
	scf
	ret

.bounce_table
	db UP    ; COLL_BOUNCE_UP
	db DOWN  ; COLL_BOUNCE_DOWN
	db LEFT  ; COLL_BOUNCE_LEFT
	db RIGHT ; COLL_BOUNCE_RIGHT

.CheckTurning:
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wPlayerTurningDirection]
	cp 0
	jr nz, .not_turning
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_turning

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr z, .not_turning

	ld a, STEP_TURN
	call .DoStep
	ld a, 2
	scf
	ret

.not_turning
	xor a
	ret

.TryStep:
	call .CheckLandPerms
	jp c, .bump

	call .CheckNPC
	and a
	jp z, .bump
	cp 2
	jp z, .bump

	ld a, [wPlayerStandingTile]
	cp COLL_ESCALATOR_DOWN
	jp z, .escalatordown

	ld a, [wPlayerStandingTile]
	cp COLL_ESCALATOR_UP
	jp z, .escalatorup

	ld a, [wPlayerStandingTile]
	call CheckIceTile
	jp nc, .ice

; Downhill riding is slower when not moving down.
	call .BikeCheck
	jp z, .fast

	ld hl, wPokegearFlags
	bit RUNNING_SHOES_F, [hl]
	jr z, .walk
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr nz, .running
	call GetMapEnvironment
	cp INDOOR
	jr z, .walk
	cp DUNGEON
	jr z, .walk
	cp GYM_CAVE
	jr z, .walk
	ld a, [hJoypadDown]
	and B_BUTTON
	cp B_BUTTON
	jr nz, .walk
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .walk
	ld a, PLAYER_RUN
	ld [wPlayerState], a
	call ReplaceKrisSprite
	jr .walk
.running
	call GetMapEnvironment
	cp INDOOR
	jr z, .runningstand
	cp DUNGEON
	jr z, .runningstand
	cp GYM_CAVE
	jr z, .runningstand
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .walk
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .runningstand
	ld a, [hJoypadDown]
	and B_BUTTON
	cp B_BUTTON
	jr z, .walk
.runningstand
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite

.walk
	ld hl, wPokegearFlags
	bit RUNNING_SHOES_F, [hl]
	jr z, .holdwalk
	call GetMapEnvironment
	cp INDOOR
	jr z, .holdwalk
	cp DUNGEON
	jr z, .holdwalk
	cp GYM_CAVE
	jr z, .holdwalk
	ld a, [wCurInput]
	and B_BUTTON
	jr nz, .holdrun
.holdwalk
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.fast
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.run
	ld a, [wCurInput]
	and B_BUTTON
	jr nz, .holdwalk
.holdrun
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	ld a, STEP_RUN
	call .DoStep
	push af
	ld a, [wWalkingDirection]
	cp STANDING
	call nz, CheckTrainerRun
	pop af
	scf
	ret

.ice
	ld a, STEP_ICE
	call .DoStep
	scf
	ret
	
.escalatordown
	ld a, [wWalkingDirection]
	cp UP
	jr z, .slow

	ld a, DOWN
	ld [wWalkingDirection], a
	jr .escalatorslide

.escalatorup
	ld a, [wWalkingDirection]
	cp DOWN
	jr z, .slow

	ld a, UP
	ld [wWalkingDirection], a
	
.escalatorslide
	ld a, STEP_SLIDE
	call .DoStep
	ld a, 5
	scf
	ret

.slow
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret

.bump
	xor a
	ret

.TrySurf:
	call .CheckSurfPerms
	ld [wd040], a
	jr c, .surf_bump

	call .CheckNPC
	ld [wd03f], a
	and a
	jr z, .surf_bump
	cp 2
	jr z, .surf_bump

	ld a, [wd040]
	and a
	jr nz, .ExitWater

	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.ExitWater:
	call .GetOutOfWater
	call PlayMapMusic
	ld a, STEP_WALK
	call .DoStep
	ld a, 6
	scf
	ret

.surf_bump
	xor a
	ret

.TryJump:
	ld a, [wPlayerStandingTile]
	ld e, a
	and $f0
	cp HI_NYBBLE_LEDGES
	jr nz, .DontJump

	ld a, e
	and 7
	ld e, a
	ld d, 0
	ld hl, .data_8021e
	add hl, de
	ld a, [wFacingDirection]
	and [hl]
	jr z, .DontJump

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, 7
	scf
	ret

.DontJump:
	xor a
	ret

.data_8021e
	db FACE_RIGHT             ; COLL_HOP_RIGHT
	db FACE_LEFT              ; COLL_HOP_LEFT
	db FACE_UP                ; COLL_HOP_UP
	db FACE_DOWN              ; COLL_HOP_DOWN
	db FACE_RIGHT | FACE_DOWN ; COLL_HOP_DOWN_RIGHT
	db FACE_DOWN | FACE_LEFT  ; COLL_HOP_DOWN_LEFT
	db FACE_UP | FACE_RIGHT   ; COLL_HOP_UP_RIGHT
	db FACE_UP | FACE_LEFT    ; COLL_HOP_UP_LEFT

.CheckWarp:

	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_warp
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [wPlayerStandingTile]
	cp [hl]
	jr nz, .not_warp

	ld a, 1
	ld [wd041], a
	ld a, [wWalkingDirection]
	; This is in the wrong place.
	cp STANDING
	jr z, .not_warp

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr nz, .not_warp
	call WarpCheck
	jr nc, .not_warp

	call .StandInPlace
	scf
	ld a, 1
	ret

.not_warp
	xor a
	ret

.EdgeWarps:
	db COLL_WARP_CARPET_DOWN
	db COLL_WARP_CARPET_UP
	db COLL_WARP_CARPET_LEFT
	db COLL_WARP_CARPET_RIGHT

.DoStep:
	ld e, a
	ld d, 0
	ld hl, .Steps
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wWalkingDirection]
	ld e, a
	cp STANDING
	jp z, .StandInPlace

	add hl, de
	ld a, [hl]
	ld [wMovementAnimation], a

	ld hl, .FinishFacing
	add hl, de
	ld a, [hl]
	ld [wPlayerTurningDirection], a

	ld a, 4
	ret

.Steps:
; entries correspond to STEP_* constants
	dw .SlowStep
	dw .NormalStep
	dw .FastStep
	dw .JumpStep
	dw .IceStep
	dw .TurningStep
	dw .BackJumpStep
	dw .FinishFacing
	dw .RunStep
	dw .SlideStep
	dw .BounceStep

.SlowStep:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
.NormalStep:
	step DOWN
	step UP
	step LEFT
	step RIGHT
.FastStep:
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT
.JumpStep:
	jump_step DOWN
	jump_step UP
	jump_step LEFT
	jump_step RIGHT
.IceStep:
	fast_slide_step DOWN
	fast_slide_step UP
	fast_slide_step LEFT
	fast_slide_step RIGHT
.BackJumpStep:
	jump_step UP
	jump_step DOWN
	jump_step RIGHT
	jump_step LEFT
.TurningStep:
	turn_step DOWN
	turn_step UP
	turn_step LEFT
	turn_step RIGHT
.FinishFacing:
	db $80 | DOWN
	db $80 | UP
	db $80 | LEFT
	db $80 | RIGHT
.RunStep
	run_step DOWN
	run_step UP
	run_step LEFT
	run_step RIGHT
.SlideStep
	slide_step DOWN
	slide_step UP
	turn_head LEFT
	turn_head RIGHT
.BounceStep:
	jump_step DOWN
	jump_step UP
	jump_step LEFT
	jump_step RIGHT

.StandInPlace:
	ld a, 0
	ld [wPlayerTurningDirection], a
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ret

._WalkInPlace:
	ld a, 0
	ld [wPlayerTurningDirection], a
	ld a, movement_step_bump
	ld [wMovementAnimation], a
	xor a
	ret

.CheckForced:
; When sliding on ice, input is forced to remain in the same direction.

	call CheckStandingOnIce
	ret nc

	ld a, [wPlayerTurningDirection]
	cp 0
	ret z

	maskbits NUM_DIRECTIONS
	ld e, a
	ld d, 0
	ld hl, .forced_dpad
	add hl, de
	ld a, [wCurInput]
	and BUTTONS
	or [hl]
	ld [wCurInput], a
	ret

.forced_dpad
	db D_DOWN, D_UP, D_LEFT, D_RIGHT

.GetAction:
; Poll player input and update movement info.

	ld hl, .action_table
	ld de, .action_table_1_end - .action_table_1
	ld a, [wCurInput]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
; Standing
	jr .update

.d_down 	add hl, de
.d_up   	add hl, de
.d_left 	add hl, de
.d_right	add hl, de

.update
	ld a, [hli]
	ld [wWalkingDirection], a
	ld a, [hli]
	ld [wFacingDirection], a
	ld a, [hli]
	ld [wWalkingX], a
	ld a, [hli]
	ld [wWalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [wWalkingTile], a
	ret

player_action: MACRO
; walk direction, facing, x movement, y movement, tile collision pointer
	db \1, \2, \3, \4
	dw \5
ENDM

.action_table:
.action_table_1
	player_action STANDING, FACE_CURRENT, 0,  0, wPlayerStandingTile
.action_table_1_end
	player_action RIGHT,    FACE_RIGHT,   1,  0, wTileRight
	player_action LEFT,     FACE_LEFT,   -1,  0, wTileLeft
	player_action UP,       FACE_UP,      0, -1, wTileUp
	player_action DOWN,     FACE_DOWN,    0,  1, wTileDown

.CheckNPC:
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front
	ld a, 0
	ldh [hMapObjectIndexBuffer], a
; Load the next X coordinate into d
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	ld bc, wObjectStructs ; redundant
	farcall IsNPCAtCoord
	jr nc, .is_npc
	call .CheckStrengthBoulder
	jr c, .no_bump

	xor a
	ret

.is_npc
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret

.CheckStrengthBoulder:
	ld hl, wBikeFlags
	bit BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .not_boulder

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit STRENGTH_BOULDER_F, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 2, [hl]

	ld a, [wWalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and %11111100
	or d
	ld [hl], a

	scf
	ret

.not_boulder
	xor a
	ret

.CheckLandPerms:
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [wWalkingTile]
	call .CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable:
	scf
	ret

.CheckSurfPerms:
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [wWalkingTile]
	call .CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable:
	scf
	ret

.BikeCheck:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	ret

.CheckWalkable:
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTileCollision
	and a ; LANDTILE?
	ret z
	scf
	ret

.CheckSurfable:
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTileCollision
	cp WATERTILE
	jr z, .Water

; Can walk back onto land from water.
	and a ; LANDTILE?
	jr z, .Land

	jr .Neither

.Water:
	xor a
	ret

.Land:
	ld a, 1
	and a
	ret

.Neither:
	scf
	ret

.BumpSound:
	call CheckSFX
	ret c
	ld de, SFX_BUMP
	call PlaySFX
	ret

.GetOutOfWater:
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	farcall SpawnPlayer
	ret

CheckStandingOnIce::
	ld a, [wPlayerTurningDirection]
	cp 0
	jr z, .not_ice
	cp $f0
	jr z, .not_ice
	ld a, [wPlayerStandingTile]
	call CheckIceTile
	jr c, .not_ice

.yep
	scf
	ret

.not_ice
	and a
	ret
	
CheckTrainerRun:
; Check if any trainer on the map sees the player.
; Skip the player object.
	ld a, 1
	ld de, wMapObjects + OBJECT_LENGTH
.loop
; Have them face the player if the object:
	push af
	push de
; Has a sprite
	ld hl, MAPOBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
; Is a trainer
	ld hl, MAPOBJECT_COLOR
	add hl, de
	ld a, [hl]
	and $f
	cp $2
	jr nz, .next
; Is visible on the map
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next
; Spins around
	ld hl, MAPOBJECT_MOVEMENT
	add hl, de
	ld a, [hl]
	cp $3
	jr z, .spinner
	cp $a
	jr z, .spinner
	cp $1e
	jr z, .spinner
	cp $1f
	jr nz, .next
.spinner
; You're within their sight range
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	call GetObjectStruct
	call AnyFacingPlayerDistance_bc
	ld hl, MAPOBJECT_RANGE
	add hl, de
	ld a, [hl]
	cp c
	jr c, .next
; Get them to face you
	ld a, b
	push af
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	call GetObjectStruct
	pop af
	call SetSpriteDirection
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .next
	ld a, $40
	ld [hl], a
.next
	pop de
	ld hl, OBJECT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	xor a
	ret
AnyFacingPlayerDistance_bc::
; Returns distance in c and direction in b.
	push de
	call .AnyFacingPlayerDistance
	ld b, d
	ld c, e
	pop de
	ret
.AnyFacingPlayerDistance
	ld hl, OBJECT_NEXT_MAP_X ; x
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y ; y
	add hl, bc
	ld e, [hl]
	ld a, [$ffa4]
	bit 7, a
	jr nz, .down
	bit 6, a
	jr nz, .up
	bit 5, a
	jr nz, .left
	bit 4, a
	jr nz, .right
.down
	lb bc, 1, 0
	jr .got_vector
.up
	lb bc, -1, 0
	jr .got_vector
.left
	lb bc, 0, -1
	jr .got_vector
.right
	lb bc, 0, 1
.got_vector
	ld a, [wPlayerStandingMapX]
	add c
	sub d
	ld l, OW_RIGHT
	jr nc, .check_y
	cpl
	inc a
	ld l, OW_LEFT
.check_y
	ld d, a
	ld a, [wPlayerStandingMapY]
	add b
	sub e
	ld h, OW_DOWN
	jr nc, .compare
	cpl
	inc a
	ld h, OW_UP
.compare
	cp d
	ld e, a
	ld a, d
	ld d, h
	ret nc
	ld e, a
	ld d, l
	ret

StopPlayerForEvent::
	ld hl, wPlayerNextMovement
	ld a, movement_step_sleep
	cp [hl]
	ret z

	ld [hl], a
	ld a, 0
	ld [wPlayerTurningDirection], a
	ret
