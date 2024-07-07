	const_def 2 ; object constants

PastFaviaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PECTINIA
	closetext
	end

PastFaviaMartRockerScript:
	jumptextfaceplayer PastFaviaMartRockerText

PastFaviaMartLassScript:
	jumptextfaceplayer PastFaviaMartLassText

PastFaviaMartRockerText:
	text "If you're looking"
	line "to catch some"
	cont "#MON, try the"
	cont "mart in PECTINIA"
	cont "CITY."

	para "The one here only"
	line "sells medicine for"
	cont "your #MON."
	done

PastFaviaMartLassText:
	text "I'm not very good"
	line "at battles, so"
	cont "this place is"
	cont "great for when I"
	cont "want to explore"
	cont "with my #MON."

	para "I can make sure"
	line "they are always"
	cont "perfectly healthy!"
	done

PastFaviaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, PAST_FAVIA_TOWN, 6
	warp_event  4,  5, PAST_FAVIA_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaMartClerkScript, -1
	object_event  1,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastFaviaMartRockerScript, -1
	object_event  8,  2, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaMartLassScript, -1
