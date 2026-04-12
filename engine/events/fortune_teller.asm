FortuneTeller:
	ld hl, FortuneTeller_IntroText
	call PrintText
	call YesNoBox
	jp c, .Cancel

	ld hl, FortuneTeller_SelectText
	call PrintText
	call WaitButton

	farcall SelectMonFromParty
	jp c, .Cancel

	; Eggs are disqualified before doing the reading.
	; Nicknames are stored at this time, too.
	push hl
	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .Egg
	call GetCurNick
	pop hl

	ld hl, FortuneTeller_ReadCardsText
	call PrintText

	ldh a, [hLastTalked]
	call CheckObjectVisibility
	ld a, OW_RIGHT
	call SetSpriteDirection

	ld hl, FortuneTeller_EllipsisText
	call PrintText

	push bc
	ld a, [wCurPartySpecies]
	; These are edge cases with multiple unique evolution methods.
	; This is hard-coded, but it's also the simplest way to handle branch evolutions.
	cp POLIWHIRL
	jr z, .PoliwhirlShellder
	cp SHELLDER
	jr z, .PoliwhirlShellder
	cp SLOWPOKE
	jr z, .Slowpoke
	cp EEVEE
	jr z, .Eevee

	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
	pop bc

	push bc
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	pop bc
	cp EVOLVE_LEVEL
	jr z, .Level
	cp EVOLVE_ITEM
	jr z, .Item
	cp EVOLVE_HOLD
	jr z, .Hold
	cp EVOLVE_HAPPINESS
	jr z, .Happiness
	ld a, BANK(.FullyEvolvedScript)
	ld hl, .FullyEvolvedScript
	call CallScript
	scf
	ret

.Cancel
	ld a, BANK(.CancelScript)
	ld hl, .CancelScript
	call CallScript
	scf
	ret

.Egg
	pop bc
	ld a, BANK(.EggScript)
	ld hl, .EggScript
	call CallScript
	scf
	ret

.Level
	ld hl, FortuneTeller_LevelText
	call PrintText
	jr .Done

.Item
	ld hl, FortuneTeller_ItemText
	call PrintText
	jr .Done

.Slowpoke
	pop bc
	ld hl, FortuneTeller_LevelText
	call PrintText
	call TextCommand_WAIT_BUTTON
	ld hl, FortuneTeller_AdditionallyText
	call PrintText
	jr .Hold

.PoliwhirlShellder
	pop bc
	ld hl, FortuneTeller_ItemText
	call PrintText
	call TextCommand_WAIT_BUTTON
	ld hl, FortuneTeller_AdditionallyText
	call PrintText
.Hold
	ld hl, FortuneTeller_HoldText
	call PrintText
	jr .Done

.Eevee
	pop bc
	ld hl, FortuneTeller_ItemText
	call PrintText
	call TextCommand_WAIT_BUTTON
	ld hl, FortuneTeller_AdditionallyText
	call PrintText
.Happiness
	push hl
	ld hl, FortuneTeller_HappinessText
	call PrintText
	pop hl

	inc hl

	push bc
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	pop bc

	cp TR_NITE
	jr z, .Night
	cp TR_MORNDAY
	jr nz, .Done

.Day
	call TextCommand_WAIT_BUTTON
	ld hl, FortuneTeller_MornDayText
	call PrintText
	jr .Done

.Night
	call TextCommand_WAIT_BUTTON
	ld hl, FortuneTeller_NightText
	call PrintText
.Done
	ld a, BANK(.EndingScript)
	ld hl, .EndingScript
	call CallScript
	scf
	ret

.EndingScript:
	waitbutton
	faceplayer
	writetext FortuneTeller_EndText
	jump .ScriptsDone

.FullyEvolvedScript:
	writetext FortuneTeller_NoEvolutionText
	faceplayer
	writetext FortuneTeller_CongratulationsText
	jump .ScriptsDone

.EggScript:
	writetext FortuneTeller_EggText
	jump .ScriptsDone

.CancelScript:
	writetext FortuneTeller_CancelText
.ScriptsDone
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

FortuneTeller_IntroText:
	text "I am a FORTUNE"
	line "TELLER."

	para "I can give you"
	line "insight on any of"
	cont "your #MON."

	para "Will you hear what"
	line "the cards say?"
	done

FortuneTeller_SelectText:
	text "Let me see one of"
	line "your #MON."
	done

FortuneTeller_ReadCardsText:
	text "Okay, now let's"
	line "see…"
	prompt

FortuneTeller_EllipsisText:
	text "………………………………"
	line "………………………………"
	prompt

FortuneTeller_CancelText:
	text "Do you not wish to"
	line "hear of the future"
	cont "you may have with"
	cont "your #MON?"

	para "Please do return"
	line "if you wish to see"
	cont "what the cards"
	cont "have to say."
	done

FortuneTeller_EggText:
	text "This #MON has"
	line "not yet hatched"
	cont "from its EGG."

	para "Its future is a"
	line "mystery for now."
	done

FortuneTeller_NoEvolutionText:
	text "I believe that"
	line "@"
	text_from_ram wStringBuffer1
	text " has"
	cont "achieved its most"
	cont "powerful form."
	prompt

FortuneTeller_CongratulationsText:
	text "Congratulations on"
	line "raising it!"
	done

FortuneTeller_LevelText:
	text "@"
	text_from_ram wStringBuffer1
	text "'s"
	line "natural growth"
	cont "will bring change."

	para "Keep at it!"
	done

FortuneTeller_ItemText:
	text "A certain ITEM may"
	line "cause a reaction"
	cont "when @"
	text_from_ram wStringBuffer1
	text_start
	cont "is exposed to it."
	done

FortuneTeller_HappinessText:
	text "Your @"
	text_from_ram wStringBuffer1
	text_start
	line "will find strength"
	cont "as it forms a bond"
	cont "with you."
	done

FortuneTeller_MornDayText:
	text "It loves to be"
	line "out in the sun."
	done

FortuneTeller_NightText:
	text "It seems to be"
	line "most active during"
	cont "the night."
	done

FortuneTeller_HoldText:
	text "@"
	text_from_ram wStringBuffer1
	text "'s growth"
	line "may be affected by"
	cont "the ITEM it holds."
	done

FortuneTeller_AdditionallyText:
	text "Additionally…"
	prompt

FortuneTeller_EndText:
	text "I hope the cards"
	line "have revealed"
	cont "valuable knowledge"
	cont "to you."

	para "Come back any time"
	line "you wish to have"
	cont "your fortune read."
	done
