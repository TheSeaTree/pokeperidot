	const_def 2 ; object constants

PastPectiniaApartment2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaApartment2FPokefan:
	jumptextfaceplayer PastPectiniaApartment2FPokefanText

PastPectiniaApartment2FPokefanText:
	text "Do you know what"
	line "the problem is"
	cont "with people these"
	cont "days is?"

	para "Nobody ever talks"
	line "anymore. They'd"
	cont "rather just sit"
	cont "around the TV and"
	cont "watch quietly."

	para "That's why I'm"
	line "never getting rid"
	cont "of my turntable!"
	done

PastPectiniaApartment2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  0, PAST_PECTINIA_APARTMENT_1F, 3
	warp_event  7,  0, PAST_PECTINIA_APARTMENT_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastPectiniaApartment2FPokefan, -1
