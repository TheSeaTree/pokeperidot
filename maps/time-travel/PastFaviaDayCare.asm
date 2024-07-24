	const_def 2 ; object constants

PastFaviaDayCare_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastDayCareMan:
	jumptextfaceplayer PastDayCareManText

PastDayCareLady:
	jumptextfaceplayer PastDayCareLadyText

PastDayCareManText:
	text "My wife & I never"
	line "became trainers."

	para "However, we love"
	line "to look after the"
	cont "#MON of those"
	cont "who are."

	para "We take good care"
	line "of anything en-"
	cont "trusted with us."
	done

PastDayCareLadyText:
	text "A girl in town"
	line "wanted to use our"
	cont "yard to let her"
	cont "#MON play."

	para "I didn't see any"
	line "harm in that."
	cont "Sometimes her"
	cont "#MON even get"
	cont "stronger after"
	cont "some time!"
	done

PastFaviaDayCare_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 4
	warp_event 3,  7, PAST_FAVIA_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastDayCareMan, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastDayCareLady, -1
