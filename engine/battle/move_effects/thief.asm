BattleCommand_Thief:
; thief

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call .playeritem
	ld a, [hl]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call .enemyitem
	ld a, [hl]
	and a
	ret z

; Can't steal valuables.

	call CheckValuableItem
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

	ld a, [wBattleMode]
	dec a
	ret z

.stealenemyitem
	call .enemyitem
	xor a
	ld [hl], a
	ld [de], a

	call .playeritem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a
	jr .stole

.enemy

; The enemy can't already have an item.

	call .enemyitem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call .playeritem
	ld a, [hl]
	and a
	ret z

; Can't steal valuables!

	call CheckValuableItem
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

; If the enemy steals your item,
; it's gone for good if you don't get it back.

	call .playeritem
	xor a
	ld [hl], a
	ld [de], a

	call .enemyitem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jp StdBattleTextBox

.playeritem
	ld a, 1
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, 1
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret

ItemIsValuable:
	ld a, d
	ld hl, ValuableItems
	ld de, 1
	jp IsInArray

INCLUDE "data/items/valuable_items.asm"

BattleCommand_ThiefDamage:
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call BattleCommand_Thief.playeritem
	ld a, [hl]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call BattleCommand_Thief.enemyitem
	ld a, [hl]
	and a
	ret z

	call CheckValuableItem
	ret c
	
	ld a, [wLinkMode]
	and a
	jr z, .doubledamage

	ld a, [wBattleMode]
	dec a
	ret z
.doubledamage
	jp DoubleDamage

.enemy

; The enemy can't already have an item.

	call BattleCommand_Thief.enemyitem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call BattleCommand_Thief.playeritem
	ld a, [hl]
	and a
	ret z

; Can't steal valuables!

	call CheckValuableItem
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz
	
	jp DoubleDamage

CheckValuableItem:
	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsValuable
	ret
