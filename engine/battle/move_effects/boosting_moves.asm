BattleCommand_CalmMind:
;calmmind
; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage
	
BattleCommand_BulkUp:
;bulkup
; Attack
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage

; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	jp   BattleCommand_StatUpMessage
	
BattleCommand_DragonDance:
;dragondance
; Attack
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage

; Speed
	call ResetMiss
	call BattleCommand_SpeedUp
	jp   BattleCommand_StatUpMessage
	
BattleCommand_QuiverDance:
;quiverdance
; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	call BattleCommand_StatUpMessage

; Speed
	call ResetMiss
	call BattleCommand_SpeedUp
	jp   BattleCommand_StatUpMessage
	
BattleCommand_CosmicPower:
;cosmicpower
; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage
