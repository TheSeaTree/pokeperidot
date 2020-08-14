BattleCommand_Teleport:
; teleport

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jr z, .failed
	cp BATTLETYPE_TRAP
	jr z, .failed
	cp BATTLETYPE_CELEBI
	jr z, .failed
	cp BATTLETYPE_LEGENDARY
	jr z, .failed
	cp BATTLETYPE_BOSS
	jr z, .failed

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .switchout
; Only need to check these next things if it's your turn
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn
; Can't teleport from a trainer battle
	ld a, [wBattleMode]
	dec a
	jr nz, .switchout
; If your level is greater than the opponent's, you run without fail.
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .run_away
; Generate a number between 0 and (YourLevel + TheirLevel).
	add b
	ld c, a
	inc c
.loop_player
	call BattleRandom
	cp c
	jr nc, .loop_player
; If that number is greater than 4 times your level, run away.
	srl b
	srl b
	cp b
	jr nc, .run_away

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.enemy_turn
	ld a, [wBattleMode]
	dec a
	jp nz, .enemyswitch
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .run_away
	add b
	ld c, a
	inc c
.loop_enemy
	call BattleRandom
	cp c
	jr nc, .loop_enemy
	srl b
	srl b
	cp b
	; This does the wrong thing. What was
	; probably intended was jr c, .failed
	; The way this is made makes enemy use
	; of Teleport always succeed if able
	jr nc, .run_away
.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wKickCounter], a
	call SetBattleDraw
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld c, 20
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextBox
	
.switchout
	call CheckPlayerHasMonToSwitchTo
	jr c, .failed

	call UpdateBattleMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld hl, TeleportOutText
	call StdBattleTextBox
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurBattleMon]
	ld c, a

.PlayerUTurn:
; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu_NoLoop

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, TeleportInText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.enemyswitch
	call FindAliveEnemyMons
	jr c, .switch_fail
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld hl, TeleportOutText
	call StdBattleTextBox
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wOTPartyCount]
	ld b, a
	ld a, [wCurOTMon]
	ld c, a

; select a random enemy mon to switch to
.random_loop_trainer
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer
	cp c
	jr z, .random_loop_trainer
	push af
	push bc
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer
	ld a, d
	inc a
	ld [wEnemySwitchMonIndex], a
	callfar ForceEnemySwitch

	ld hl, TeleportInText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.switch_fail
	jp .failed
