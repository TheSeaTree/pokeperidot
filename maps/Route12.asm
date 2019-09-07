	const_def 2 ; object constants

Route12_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperRusty:
	trainer CAMPER, RUSTY, EVENT_BEAT_CAMPER_RUSTY, CamperRustyText, CamperRustyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CamperRustyAfterText
	waitbutton
	closetext
	end
	
TrainerPicnickerLeslie:
	trainer PICNICKER, LESLIE, EVENT_BEAT_PICNICKER_LESLIE, PicnickerLeslieText, PicnickerLeslieWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PicnickerLeslieAfterText
	waitbutton
	closetext
	end
	
TrainerBeautyRebecca:
	trainer BEAUTY, REBECCA, EVENT_BEAT_BEAUTY_REBECCA, BeautyRebeccaText, BeautyRebeccaWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyRebeccaAfterText
	waitbutton
	closetext
	end

TrainerPsychicSolomon:
	trainer PSYCHIC_T, SOLOMON, EVENT_BEAT_PSYCHIC_SOLOMON, PsychicSolomonText, PsychicSolomonWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PsychicSolomonAfterText
	waitbutton
	closetext
	end

TrainerTeacherSharon:
	trainer TEACHER, SHARON, EVENT_BEAT_TEACHER_SHARON, TeacherSharonText, TeacherSharonWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TeacherSharonAfterText
	waitbutton
	closetext
	end

TrainerSchoolboyMartin:
	trainer SCHOOLBOY, MARTIN, EVENT_BEAT_SCHOOLBOY_MARTIN, SchoolboyMartinText, SchoolboyMartinWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SchoolboyMartinAfterText
	waitbutton
	closetext
	end

Route12FireStone:
	itemball FIRE_STONE

Route12ShelterSign:
;	writebyte VENUSAUR
;	special CheckOwnedMon
;	iffalse .novenusaur
	jumptext ShelterSignText
	
ShelterSignText:
	text "#MON SHELTER-"
	
	para "Pledging to take"
	line "care of any"
	cont "#MON in need."
	done
	
CamperRustyText:
	text "I am a"
	line "#MON trainer!"
	done
	
PicnickerLeslieText:
	text "I am a"
	line "#MON trainer!"
	done
	
BeautyRebeccaText:
	text "I am a"
	line "#MON trainer!"
	done
	
PsychicSolomonText:
	text "I am a"
	line "#MON trainer!"
	done
	
TeacherSharonText:
	text "I am a"
	line "#MON trainer!"
	done
	
SchoolboyMartinText:
	text "I am a"
	line "#MON trainer!"
	done
	
CamperRustyWinText:
	text "I lost."
	done

PicnickerLeslieWinText:
	text "I lost."
	done

BeautyRebeccaWinText:
	text "I lost."
	done

PsychicSolomonWinText:
	text "I lost."
	done

TeacherSharonWinText:
	text "Don't you dare"
	line "harm any of my"
	cont "students!"
	done

SchoolboyMartinWinText:
	text "I lost."
	done

CamperRustyAfterText:
	text "I lost."
	done

PicnickerLeslieAfterText:
	text "I lost."
	done

BeautyRebeccaAfterText:
	text "I lost."
	done

PsychicSolomonAfterText:
	text "I lost."
	done

TeacherSharonAfterText:
	text "I lost."
	done

SchoolboyMartinAfterText:
	text "I lost."
	done


Route12_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 12, ROUTE_12_ECRUTEAK_GATE, 3
	warp_event  4, 13, ROUTE_12_ECRUTEAK_GATE, 4
	warp_event 49,  5, ROUTE_12_SHELTER, 1
	warp_event 57, 21, ROUTE_11_ROUTE_12_GATE, 3
	warp_event 58, 21, ROUTE_11_ROUTE_12_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 48,  6, BGEVENT_READ, Route12ShelterSign

	db 9 ; object events
	object_event 16, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperRusty, -1
	object_event 17,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerLeslie, -1
	object_event 34, 14, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyRebecca, -1
	object_event 39, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicSolomon, -1
	object_event 37,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherSharon, -1
	object_event 34,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyMartin, -1
	object_event 56,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12FireStone, EVENT_ROUTE_12_FIRE_STONE
	object_event 12, -3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
