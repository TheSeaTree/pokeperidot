	const_def 2 ; object constants

PastFaviaTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaTownTwin:
	jumptextfaceplayer PastFaviaTownTwinText

PastFaviaTownBeauty:
	jumptextfaceplayer PastFaviaTownBeautyText

PastFaviaTownSign:
	jumptext PastFaviaTownSignText

PastFaviaInnSign:
	jumptext PastFaviaInnSignText

PastFaviaTownMartSign:
	jumpstd martsign

PastFaviaHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_PAST_FAVIA_HIDDEN_SILVER_LEAF	

PastFaviaHiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_PAST_FAVIA_HIDDEN_GOLD_LEAF	

PastFaviaTownTwinText:
	text "My #MON love to"
	line "spend time with"
	cont "my neighbors."

	para "Especially the"
	line "man and lady with"
	cont "the big yard."
	done

PastFaviaTownBeautyText:
	text "This is such a"
	line "lovely little"
	cont "town, is it not?"

	para "Wait. I sense"
	line "something…………"

	para "……………………………………"
	line "……………………………………"

	para "You will claim"
	line "victory over my"
	cont "daughter in battle"
	cont "some day."

	para "Go easy on her"
	line "next time!"
	done

PastFaviaTownSignText:
	text "FAVIA TOWN"

	para "Friendly neighbors"
	line "who are never too"
	cont "far away."
	done

PastFaviaInnSignText:
	text "FAVIA INN"

	para "Trainers stay"
	line "free!"
	done

PastFaviaTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 11,  7, PAST_FAVIA_EGG_TUTOR_HOUSE, 1
	warp_event 19, 15, PAST_FAVIA_INN, 1 ; Inn
	warp_event 13, 21, PAST_FAVIA_FRIENDSHIP_HOUSE, 1 ; Friendship House
	warp_event  9, 17, PAST_FAVIA_DAY_CARE, 1 ; Day Care
	warp_event  5,  5, PAST_ROUTE_10_GATE, 3 ; Route 11 Gate
	warp_event 21, 25, PAST_FAVIA_MART, 1 ; Mart

	db 0 ; coord events

	db 5 ; bg events
	bg_event 15, 25, BGEVENT_READ, PastFaviaTownSign
	bg_event 17, 15, BGEVENT_READ, PastFaviaInnSign
	bg_event 22, 25, BGEVENT_READ, PastFaviaTownMartSign
	bg_event 24, 23, BGEVENT_ITEM, PastFaviaHiddenSilverLeaf
	bg_event 10, 14, BGEVENT_ITEM, PastFaviaHiddenGoldLeaf

	db 3 ; object events
	object_event 18, 18, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaTownTwin, -1
	object_event 15,  9, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastFaviaTownBeauty, -1
	object_event 35, 19, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
