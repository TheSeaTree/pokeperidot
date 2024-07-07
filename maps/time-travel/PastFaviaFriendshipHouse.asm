	const_def 2 ; object constants

PastFaviaFriendshipHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaFriendshipHouseTeacher:
	jumptextfaceplayer PastFaviaFriendshipHouseTeacherText

PastFaviaFriendshipHouseTeacherText:
	text "My husband is an"
	line "excellnt #MON"
	cont "trainer."

	para "His schoolhouse"
	line "teaches all about"
	cont "the different"
	cont "#MON types and"
	cont "how to best use"
	cont "them in battle."
	done

PastFaviaFriendshipHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 3
	warp_event 3,  7, PAST_FAVIA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaFriendshipHouseTeacher, -1
