BattleCommand_BellyDrum:
; bellydrum
	callfar GetHalfMaxHP
	callfar CheckUserHasEnoughHP
	jp nc, BattleEffect_ButItFailed
	
	push bc
	call BattleCommand_AttackUp2
	pop bc
	ld a, [wAttackMissed]
	and a
	jp nz, BattleEffect_ButItFailed

	push bc
	call AnimateCurrentMove
	pop bc
	callfar SubtractHPFromUser
	call UpdateUserInParty
	ld a, 5

.max_attack_loop
	push af
	call BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .max_attack_loop

	ld hl, BellyDrumText
	jp StdBattleTextBox
