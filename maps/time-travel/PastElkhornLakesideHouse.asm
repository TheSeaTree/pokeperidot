	const_def 2 ; object constants

PastElkhornLakesideHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastElkhornGymGuy:
	jumptextfaceplayer PastElkhornGymGuyText

PastElkhornTeacher:
	jumptextfaceplayer PastElkhornTeacherText

PastElkhornGymGuyText:
	text "I heard there is a"
	line "road under constr-"
	cont "uction that will"
	cont "allow people to"
	cont "walk from here to"
	cont "RIDGE COAST."

	para "My wife wants to"
	line "move our family"
	cont "there as soon as"
	cont "possible."
	done

PastElkhornTeacherText:
	text "My husband and I"
	line "are thinking about"
	cont "moving closer to"
	cont "the ocean as soon"
	cont "as our child is"
	cont "born."

	para "The lake here is"
	line "nice, but it can't"
	cont "beat the view of a"
	cont "vast ocean!"
	done

PastElkhornLakesideHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ELKHORN_TOWN, 1
	warp_event 3,  7, PAST_ELKHORN_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornGymGuy, -1
	object_event  1,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornTeacher, -1
