_PokeFlute:
	ld hl, .PokeFluteScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.PokeFluteScript:
	reloadmappart
	special UpdateTimePals
	opentext
	writetext .PlayedFluteText
	playsound SFX_POKEFLUTE
	waitsfx
	callasm .CheckCanUsePokeFlute
	iffalse .NothingHappenedScript
	farjump AwokenSnorlaxScript

.NothingHappenedScript:
	buttonsound
	writetext .CatchyTuneText
	waitbutton
	closetext
	end

.PlayedFluteText:
	; Played the # FLUTE.
	text_far UnknownText_0x1c5c44
	text_end

.CatchyTuneText:
	; Now, that's a catchy tune!
	text_far UnknownText_0x1c5bf9
	text_end

.CheckCanUsePokeFlute:
	ld a, [wEnvironment]
	cp ROUTE
	jr nz, .nope

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

_TimeBell:
	ld hl, .TimeBellScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.TimeBellScript:
	reloadmappart
	special UpdateTimePals
	opentext
	writetext .PlayedBellText
	playsound SFX_MORNING_SUN
	waitsfx
	callasm .CheckTimeBellDoesAnything
	iffalse .NothingHappenedScript
	checkevent EVENT_FOUGHT_BOSS_CELEBI
	iftrue .NothingHappenedScript
	closetext
	farjump CelebiBoss4

.NothingHappenedScript:
	buttonsound
	writetext .NothingHappenedText
	waitbutton
	closetext
	end

.PlayedBellText:
	; Rang the TIME BELL.
	text_far PlayerPlayedTimeBell_Text
	text_end

.NothingHappenedText:
	; …But nothing happened.
	text_far AncientTomeNothingHappened_Text
	text_end

.CheckTimeBellDoesAnything:
; Are we even in the right map to use this?
	ld a, [wMapGroup]
	cp GROUP_PAST_OCCIDENT_FOREST
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_PAST_OCCIDENT_FOREST
	jr nz, .nope

; Are we facing the shrine?
	ld a, [wPlayerDirection]
	and %1100
	cp OW_UP
	jr nz, .nope

; Are we on the tile in front of the shrine?
	call GetFacingTileCoord
	ld a, d
	cp 52
	jr nz, .nope
	ld a, e
	cp 6
	jr nz, .nope

	ld a, 1
	ld [wScriptVar], a
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret
