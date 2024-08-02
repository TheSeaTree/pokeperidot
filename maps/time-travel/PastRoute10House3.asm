	const_def 2 ; object constants

PastRoute10House3_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Cards

.Cards
	changeblock		4, 2, $28
	return

PastRoute10House3Beauty:
	jumptextfaceplayer PastRoute10House3BeautyText

PastRoute10House3Cards:
	jumptext PastRoute10House3CardsText

PastRoute10House3BeautyText:
	text "I bet an adorable"
	line "new #MON the"
	cont "other night."

	para "I've never seen one"
	line "like it before,"
	cont "but I think it"
	cont "will make a great"
	cont "addition to the"
	cont "magic act I'm"
	cont "working on!"
	done

PastRoute10House3CardsText:
	text "A bunch of cards"
	line "that may be used"
	cont "for magic tricks."
	done

PastRoute10House3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_10, 8
	warp_event 3,  7, PAST_ROUTE_10, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 3, BGEVENT_READ, PastRoute10House3Cards

	db 1 ; object events
	object_event  3,  5, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastRoute10House3Beauty, -1