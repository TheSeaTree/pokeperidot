	const_def 2 ; object constants

PastFaviaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PECTINIA
	closetext
	end

PastFaviaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, PAST_FAVIA_TOWN, 6
	warp_event  4,  5, PAST_FAVIA_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaMartClerkScript, -1
