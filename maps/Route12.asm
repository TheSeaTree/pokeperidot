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
	
Route12FruitTree:
	fruittree FRUITTREE_ROUTE_12_1

Route12ItemBush:
	itembush FRUITTREE_ROUTE_12_2

Route12FireStone:
	itemball FIRE_STONE
	
Route12HiddenFreshWater:
	hiddenitem FRESH_WATER, EVENT_ROUTE_12_HIDDEN_FRESH_WATER
	
Route12HiddenSuperRepel:
	hiddenitem SUPER_REPEL, EVENT_ROUTE_12_HIDDEN_SUPER_REPEL

Route12ShelterSign:
	jumptext ShelterSignText

ShelterSignText:
	text "#MON SHELTER-"
	
	para "Pledging to take"
	line "care of any"
	cont "#MON in need."
	done
	
CamperRustyText:
	text "There is so much"
	line "to explore!"
	
	para "Let's explore each"
	line "other's #MON!"
	done

PicnickerLeslieText:
	text "Hi…"
	line "um…"
	
	para "Battle me!"
	
	para "…Please?"
	done
	
BeautyRebeccaText:
	text "Hey there, cutie!"
	
	para "If you let me win,"
	line "I might give you"
	cont "something nice."
	done
	
PsychicSolomonText:
	text "Want to see a"
	line "magic trick?"
	
	para "I can make your"
	line "POTIONs disappear!"
	done
	
TeacherSharonText:
	text "I am giving my"
	line "students first-"
	cont "hand battling exp-"
	cont "erience."
	done
	
SchoolboyMartinText:
	text "My assignment for"
	line "today is to win a"
	cont "battle against the"
	cont "first trainer I"
	cont "see!"
	done
	
CamperRustyWinText:
	text "I took a wrong"
	line "turn somewhere!"
	done

PicnickerLeslieWinText:
	text "I was too nervous"
	line "to win…"
	done

BeautyRebeccaWinText:
	text "Hmph! You had your"
	line "chance, and you"
	cont "blew it!"
	done

PsychicSolomonWinText:
	text "You tried your"
	line "best, partners."
	done

TeacherSharonWinText:
	text "I may need you to"
	line "become my teaching"
	cont "aide."
	done

SchoolboyMartinWinText:
	text "This will affect"
	line "my marks for sure!"
	done

CamperRustyAfterText:
	text "I really need to"
	line "take a rest after"
	cont "that battle."
	
	para "I won't be able to"
	line "move from this"
	cont "spot until then!"
	done

PicnickerLeslieAfterText:
	text "I thought the way"
	line "you battled was"
	cont "kind of cute…"
	
	para "……………"

	para "…I'm sorry!"
	done

BeautyRebeccaAfterText:
	text "Wipe that smirk"
	line "off your face!"
	done

PsychicSolomonAfterText:
	text "My #MON have"
	line "taught me some"
	cont "real neat tricks."
	
	para "I feel bad for"
	line "losing a battle"
	cont "with them."
	done

TeacherSharonAfterText:
	text "Not everything can"
	line "be taught in a"
	cont "classroom."
	done

SchoolboyMartinAfterText:
	text "Ms. SHARON is the"
	line "best! None of my"
	cont "other TEACHERs"
	cont "let us take field"
	cont "trips to battle"
	cont "real trainers."
	done


Route12_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 12, ROUTE_12_STAGHORN_GATE, 3
	warp_event  4, 13, ROUTE_12_STAGHORN_GATE, 4
	warp_event 49,  5, ROUTE_12_SHELTER, 1
	warp_event 57, 21, ROUTE_11_ROUTE_12_GATE, 3
	warp_event 58, 21, ROUTE_11_ROUTE_12_GATE, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event 48,  6, BGEVENT_READ, Route12ShelterSign
	bg_event 54, 21, BGEVENT_ITEM, Route12HiddenFreshWater
	bg_event 25,  5, BGEVENT_ITEM, Route12HiddenSuperRepel

	db 10 ; object events
	object_event 16, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperRusty, -1
	object_event 17,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerLeslie, -1
	object_event 34, 14, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyRebecca, -1
	object_event 39, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicSolomon, -1
	object_event 37,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherSharon, -1
	object_event 34,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyMartin, -1
	object_event 56,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route12FruitTree, -1
	object_event 65,  8, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route12ItemBush, -1
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12FireStone, EVENT_ROUTE_12_FIRE_STONE
	object_event 12, -3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
