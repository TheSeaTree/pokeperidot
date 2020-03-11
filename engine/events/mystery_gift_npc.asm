MysteryGiftNPC:
	ld hl, MysteryGiftItems
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
	ld a, POKE_BALL
	jr z, .done
	ld a, [hli]
.done
	ld [wScriptVar], a
	ret

INCLUDE "data/items/mystery_gift_items.asm"