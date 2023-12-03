	const_def 2 ; object constants

PastElkhornRichardsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastElkhornRichardScript:
	jumptextfaceplayer PastElkhornRichardText

PastElkhornPeggyScript:
	jumptextfaceplayer PastElkhornPeggyText

PastElkhornFarfetchdScript:
	opentext
	writetext PastElkhornFarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

PastElkhornRichardText:
	text "Oh, hello there!"

	para "Do you train"
	line "#MON?"

	para "I've been practic-"
	line "ing battles with"
	cont "my son and the"
	cont "the students from"
	cont "FURCATA SCHOOL."

	para "Other parts of the"
	line "world have started"
	cont "to open up leagues"
	cont "for battling."

	para "I want to be the"
	line "first one to join"
	cont "such a league!"
	done

PastElkhornPeggyText:
	text "I'm training to be"
	line "a #MON NURSE."

	para "I help out my boy-"
	line "friend's #MON as"
	cont "he is training!"
	done

PastElkhornFarfetchdText:
	text "FARFETCH'D: Kwaa!"
	done

PastElkhornRichardsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ELKHORN_TOWN, 3
	warp_event 3,  7, PAST_ELKHORN_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornRichardScript, -1 ; Gym Guy sprite if he doesn't get a battle.
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornPeggyScript, -1
	object_event  4,  1, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornFarfetchdScript, -1
