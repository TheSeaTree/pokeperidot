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

BeautyVioletText:
BeautyVioletWinText:
BeautyVioletAfterText:

SailorDaleText:
SailorDaleWinText:
SailorDaleAfterText:

PsychicRossText:
PsychicRossWinText:
PsychicRossAfterText:

BikerZacharyText:
BikerZacharyWinText:
BikerZacharyAfterText:
	text ""
	done

PastRoute8_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5, 15, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyViolet, -1
	object_event 18,  0, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorDale, -1
	object_event 24,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicRoss, -1
	object_event  8, 19, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerZachary, -1
	object_event 13, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute8GlowScales, EVENT_ROUTE_8_PAST_GLOW_SCALES
	object_event 12, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute8SodaPop, EVENT_ROUTE_8_PAST_SODA_POP
