	const_def 2 ; object constants

PastPectiniaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PECTINIA
	closetext
	end

PastPectiniaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, PAST_PECTINIA_CITY, 1
	warp_event  4,  5, PAST_PECTINIA_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaMartClerkScript, -1
