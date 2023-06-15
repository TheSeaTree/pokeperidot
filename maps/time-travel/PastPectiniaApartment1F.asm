	const_def 2 ; object constants

PastPectiniaApartment1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaApartmentGuardMScript:
	jumptextfaceplayer PastPectiniaApartmentGuardMText

PastPectiniaApartmentGuardMText:
	text "PECTINIA CITY is a"
	line "real vision of the"
	cont "future!"

	para "This city is grow-"
	line "ing larger by the"
	cont "day! There are"
	cont "still some vacant"
	cont "rooms in this"
	cont "building, but they"
	cont "are quickly being"
	cont "filled up."
	done

PastPectiniaApartment1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PAST_PECTINIA_CITY, 10
	warp_event  3,  7, PAST_PECTINIA_CITY, 10
	warp_event  6,  0, PAST_PECTINIA_APARTMENT_2F,  1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaApartmentGuardMScript, -1