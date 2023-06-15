	const_def 2 ; object constants

PastFaviaCelestesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaCelestesHouseTeacher:
	jumptextfaceplayer PastFaviaCelestesHouseTeacherText

PastFaviaCelestesHouseEspeon:
	opentext
	writetext PastFaviaCelestesHouseEspeonText
	cry ESPEON
	waitbutton
	closetext
	end

PastFaviaCelestesHouseTeacherText:
	text "I can sense some-"
	line "thing about you……"

	para "……………………………………"
	line "……………………………………"

	para "Yes, of course."

	para "I've seen you in a"
	line "vision."

	para "Go easy on my"
	line "daughter in your"
	cont "next battle!"
	done

PastFaviaCelestesHouseEspeonText:
	text "ESPEON: Eeees!"
	done

PastFaviaCelestesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 1
	warp_event 3,  7, PAST_FAVIA_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastFaviaCelestesHouseTeacher, -1
	object_event  0,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastFaviaCelestesHouseEspeon, -1
