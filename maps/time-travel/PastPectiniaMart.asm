	const_def 2 ; object constants

PastPectiniaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PECTINIA
	closetext
	end

PastPectiniaMartTeacherScript:
	jumptextfaceplayer PastPectiniaMartTeacherText

PastPectiniaMartBugCatcherScript:
	jumptextfaceplayer PastPectiniaMartBugCatcherText

PastPectiniaMartTeacherText:
	text "The MART in FAVIA"
	line "TOWN never has"
	cont "what I need."

	para "Thankfully the"
	line "trip here is"
	cont "easy. I enjoy the"
	cont "short walk through"
	cont "nature before I do"
	cont "my shopping."
	done

PastPectiniaMartBugCatcherText:
	text "Ugh! #BALLs get"
	line "to be so expen-"
	cont "sive!"

	para "I want to catch"
	line "the best BUG"
	cont "#MON I can, but"
	cont "I'm no good at"
	cont "throwing…"
	done

PastPectiniaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, PAST_PECTINIA_CITY, 1
	warp_event  4,  5, PAST_PECTINIA_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaMartClerkScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaMartBugCatcherScript, -1
	object_event  8,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaMartTeacherScript, -1
