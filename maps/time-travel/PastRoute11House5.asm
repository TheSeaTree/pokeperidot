	const_def 2 ; object constants

PastRoute11House5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute11House5Granny:
	jumptextfaceplayer PastRoute11House5GrannyText

PastRoute11House5GrannyText:
	text "My grandson told"
	line "me that I'm"
	cont "delusional, but I"
	cont "swear I have been"
	cont "visited by some"
	cont "GHOST #MON."

	para "He says there's no"
	line "such thing!"

	para "They have taken an"
	line "interest in the"
	cont "DOLLs I've made."

	para "…………"

	para "………………………"

	para "Ah, you don't"
	line "believe me either!"
	done

PastRoute11House5_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_10, 4
	warp_event 3,  7, PAST_ROUTE_10, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastRoute11House5Granny, -1