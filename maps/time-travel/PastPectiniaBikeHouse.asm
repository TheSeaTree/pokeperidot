	const_def 2 ; object constants

PastPectiniaBikeHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaBikeReceptionist:
	jumptextfaceplayer PastPectiniaBikeReceptionistText

PastPectiniaBikeReceptionistText:
	text "The construction"
	line "going on across"
	cont "the street can be"
	cont "so noisy!"

	para "But it's going to"
	line "allow for so many"
	cont "more people to"
	cont "move in and call"
	cont "this city home."

	para "It's worth a little"
	line "bit of noise if it"
	cont "means there will"
	cont "be lots of new"
	cont "people to meet!"
	done

PastPectiniaBikeHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PECTINIA_CITY, 6
	warp_event 3,  7, PAST_PECTINIA_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaBikeReceptionist, -1
