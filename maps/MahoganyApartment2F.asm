	const_def 2 ; object constants

MahoganyApartment2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyApartmentLassScript:
	jumptextfaceplayer MahoganyApartmentLassText
	
MahoganyApartmentSuperNerdScript:
	jumptextfaceplayer MahoganyApartmentSuperNerdText
	
MahoganyApartmentSchoolAssignment:
	jumptext MahoganyApartmentSchoolAssignmentText
	
MahoganyApartmentLassText:
	text "My brother is such"
	line "a weirdo."
	
	para "He sits in the"
	line "lobby all day be-"
	cont "cause he likes the"
	cont "couch down there"
	cont "so much more."
	
	para "Oh well, more time"
	line "alone for me."
	done
	
MahoganyApartmentSuperNerdText:
	text "Argh!"
	
	para "I've been stuck on"
	line "this project for"
	cont "so long!"
	
	para "I thought checking"
	line "into a hotel would"
	cont "help me concentr-"
	cont "ate, but it has"
	cont "been no help!"
	done
	
MahoganyApartmentSchoolAssignmentText:
	text "It looks like a"
	line "writing assignment"
	cont "on the screen."
	
	para "Let's see…"
	
	para "A 5-page essay on"
	line "#MON battle"
	cont "strategies."
	
	para "…There is barely a"
	line "single page filled"
	cont "out."
	done

MahoganyApartment2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  0, MAHOGANY_APARTMENT_1F, 3
	warp_event  7,  0, MAHOGANY_APARTMENT_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  5, BGEVENT_UP, MahoganyApartmentSchoolAssignment

	db 2 ; object events
	object_event  0,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyApartmentLassScript, -1
	object_event  8,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyApartmentSuperNerdScript, -1
