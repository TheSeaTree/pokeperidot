HiddenPowerGirl:
	ld hl, Text_HiddenPowerGirlIntro
	call PrintText
	call JoyWaitAorB

	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .cancel

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1DVs
	call GetPartyLocation
	ld b, h
	ld c, l
	call GetHiddenPowerType
	ld a, e
	ld [wNamedObjectIndexBuffer], a
	predef GetTypeName

	ld hl, Text_HiddenPowerGirlAnswer
	jp PrintText

.cancel 
	ld hl, Text_HiddenPowerGirlDecline
	jp PrintText

.egg
	ld hl, Text_HiddenPowerGirlEgg
	jp PrintText

GetHiddenPowerType:
	; Def & 3
	ld a, [hl]
	and %0011
	ld b, a

	; + (Atk & 3) << 2
	ld a, [hl]
	and %0011 << 4
	swap a
	add a
	add a
	or b

; Skip Normal
	inc a
; Skip Bird
	cp BIRD
	jr c, .done
	inc a

; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add SPECIAL - UNUSED_TYPES

.done
	ld e, a
	ret

Text_HiddenPowerGirlIntro:
	text_far _HiddenPowerGirlIntroText
	text_end

Text_HiddenPowerGirlDecline:
	text_far _HiddenPowerGirlDeclineText
	text_end

Text_HiddenPowerGirlEgg:
	text_far _HiddenPowerGirlEggText
	text_end

Text_HiddenPowerGirlAnswer:
	text_far _HiddenPowerGirlAnswerText
	text_end
