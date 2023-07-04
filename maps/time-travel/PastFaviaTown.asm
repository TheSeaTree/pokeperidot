	const_def 2 ; object constants

PastFaviaTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaTownTwin:
	jumptextfaceplayer PastFaviaTownTwinText

PastFaviaTownTwinText:
	text "My #MON love to"
	line "spend time with"
	cont "my neighbors."

	para "Especially the"
	line "man and lady with"
	cont "the big yard."
	done

PastFaviaTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 11,  7, PAST_FAVIA_CELESTES_HOUSE, 1 ; Celeste's House
	warp_event 19, 15, PAST_FAVIA_INN, 1 ; Inn
	warp_event 13, 21, PAST_FAVIA_FRIENDSHIP_HOUSE, 1 ; Friendship House
	warp_event  9, 17, PAST_FAVIA_DAY_CARE, 1 ; Day Care
	warp_event  5,  5, PAST_ROUTE_11_GATE, 3 ; Route 11 Gate
	warp_event 21, 25, PAST_FAVIA_MART, 1 ; Mart

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 11, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaTownTwin, -1
