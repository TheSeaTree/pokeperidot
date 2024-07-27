	const_def 2 ; object constants

PastRoute8_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBeautyViolet:
	trainer BEAUTY, VIOLET, EVENT_BEAT_BEAUTY_VIOLET, BeautyVioletText, BeautyVioletWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVioletAfterText
	waitbutton
	closetext
	end

TrainerSailorDale:
	trainer SAILOR, DALE, EVENT_BEAT_SAILOR_DALE, SailorDaleText, SailorDaleWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorDaleAfterText
	waitbutton
	closetext
	end

TrainerPsychicRoss:
	trainer PSYCHIC_T, ROSS, EVENT_BEAT_PSYCHIC_ROSS, PsychicRossText, PsychicRossWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRossAfterText
	waitbutton
	closetext
	end

TrainerBikerZachary:
	trainer BIKER, ZACHARY, EVENT_BEAT_BIKER_ZACHARY, BikerZacharyText, BikerZacharyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZacharyAfterText
	waitbutton
	closetext
	end

PastRoute8GlowScales:
	itemball GLOW_SCALES

PastRoute8SodaPop:
	itemball SODA_POP

PastRoute8HiddenLeafStone:
	hiddenitem LEAF_STONE, EVENT_ROUTE_7_PAST_HIDDEN_LEAF_STONE

PastRoute8HiddenBigMushroom:
	hiddenitem BIG_MUSHROOM, EVENT_ROUTE_7_PAST_HIDDEN_BIG_MUSHROOM

PastRoute8HiddenKingsRock:
	hiddenitem KINGS_ROCK, EVENT_ROUTE_7_PAST_HIDDEN_KINGS_ROCK

BeautyVioletText:
	text "My team matches my"
	line "favorite color!"
	done

BeautyVioletWinText:
	text "You may have won,"
	line "but your #MON"
	cont "lack style."
	done

BeautyVioletAfterText:
	text "I don't normally"
	line "like BUG-types,"
	cont "but I just had to"
	cont "have my HERACROSS!"

	para "I fell in love"
	line "with its glittery"
	cont "shell right away!"
	done

SailorDaleText:
	text "The trees here are"
	line "too thick!"
	done

SailorDaleWinText:
	text "…Like a fish out"
	line "of water."
	done

SailorDaleAfterText:
	text "I need to be near"
	line "the ocean!"

	para "It's right on the"
	line "other side of"
	cont "these woods!"

PsychicRossText:
	text "Some strange new"
	line "#MON have been"
	cont "appearing around"
	cont "these parts."
	done

PsychicRossWinText:
	text "Take care of your-"
	line "self out here."
	done

PsychicRossAfterText:
	text "I fear that"
	line "spirits may be"
	cont "wandering among"
	cont "the living."

	para "They are rare, but"
	line "I suspect they"
	cont "won't be forever."
	done

BikerZacharyText:
	text "FAVIA TOWN is too"
	line "quiet."

	para "I want someone to"
	line "make some noise!"
	done

BikerZacharyWinText:
	text "That got my ears"
	line "ringing!"
	done

BikerZacharyAfterText:
	text "That was intense!"

	para "Now I just want to"
	line "sit back and crack"
	cont "open a SODA POP."
	done

PastRoute8_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  5, BGEVENT_ITEM, PastRoute8HiddenLeafStone
	bg_event 27, 14, BGEVENT_ITEM, PastRoute8HiddenBigMushroom
	bg_event 30,  0, BGEVENT_ITEM, PastRoute8HiddenKingsRock

	db 6 ; object events
	object_event  5, 15, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyViolet, -1
	object_event 18,  0, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorDale, -1
	object_event 24,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicRoss, -1
	object_event  8, 19, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerZachary, -1
	object_event 13, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute8GlowScales, EVENT_ROUTE_7_PAST_GLOW_SCALES
	object_event 12, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute8SodaPop, EVENT_ROUTE_7_PAST_SODA_POP
