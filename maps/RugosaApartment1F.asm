	const_def 2 ; object constants

RugosaApartment1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RugosaApartmentReceptionistScript:
	jumptextfaceplayer RugosaApartmentReceptionistText
	
RugosaApartmentYoungsterScript:
	jumptextfaceplayer RugosaApartmentYoungsterText

RugosaApartmentReceptionistText:
	text "Welcome to the"
	line "RUGOSA HOTEL."
	
	para "Unfortunately, we"
	line "have no vacancies"
	cont "at the moment."
	done

RugosaApartmentYoungsterText:
	text "This couch is more"
	line "comfortable than"
	cont "the one up in my"
	cont "room. I could sit"
	cont "here all day!"
	
	para "You're welcome to"
	line "join me."
	done
	
RugosaApartment1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, RUGOSA_CITY,  9
	warp_event  3,  7, RUGOSA_CITY,  9
	warp_event  6,  0, RUGOSA_APARTMENT_2F,  1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaApartmentReceptionistScript, -1
	object_event 10,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaApartmentYoungsterScript, -1
