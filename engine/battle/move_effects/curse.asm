BattleCommand_Curse:
; curse

	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels

.go

; Curse is different for Ghost-types.

	ld a, [de]
	cp GHOST
	jr z, .ghost
	inc de
	ld a, [de]
	cp GHOST
	jr z, .ghost

; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Raise Attack and Defense, and lower Speed.

	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld a, SPEED
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SwitchTurn
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	jp BattleCommand_StatUpMessage

.ghost

; Cut HP in half and put a curse on the opponent.

	call CheckHiddenOpponent
	jp nz, BattleEffect_ButItFailed

	call CheckSubstituteOpp
	jp nz, BattleEffect_ButItFailed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jp nz, BattleEffect_ButItFailed

	set SUBSTATUS_CURSE, [hl]
	call AnimateCurrentMove
	ld hl, GetHalfMaxHP
	call CallBattleCore
	ld hl, SubtractHPFromUser
	call CallBattleCore
	call UpdateUserInParty
	ld hl, PutACurseText
	jp StdBattleTextBox

.cantraise
	call CantRaiseStats
	ret
	
