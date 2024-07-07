_PokeFlute:
	ld hl, .PokeFluteScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.PokeFluteScript:
	reloadmappart
	special UpdateTimePals
	callasm .CheckCanUsePokeFlute
	iffalse .NothingHappenedScript
	farjump AwokenSnorlaxScript

.NothingHappenedScript:
	opentext
	writetext .PlayedFluteText
	playsound SFX_POKEFLUTE
	waitsfx
	buttonsound
	writetext .CatchyTuneText
	closetext
	end

.PlayedFluteText:
	; Played the # FLUTE. Now, that's a catchy tune!
	text_far UnknownText_0x1c0b3b
	text_end

.CatchyTuneText:
	; Played the # FLUTE. Now, that's a catchy tune!
	text_far UnknownText_0x1c0b3b
	text_end

.CheckCanUsePokeFlute:
	ld a, [wEnvironment]
	cp ROUTE
	jr z, .nope

	farcall GetFacingObject
	jr c, .nope

	ld a, d
	cp SPRITEMOVEDATA_BIGDOLLSYM
	jr nz, .nope

	ld a, 1
	ld [wScriptVar], a
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret
