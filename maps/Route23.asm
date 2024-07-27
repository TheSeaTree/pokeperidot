	const_def 2 ; object constants

Route23_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route23Sign:
	jumptext Route23SignText

Route23XAccuracy:
	itemball X_ACCURACY

Route23Slowpoketail:
	itemball SLOWPOKETAIL

Route23HiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_ROUTE_23_HIDDEN_BRICK_PIECE

Route23HiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_ROUTE_23_HIDDEN_GOLD_LEAF

Route23HiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_ROUTE_23_HIDDEN_SILVER_LEAF

Route23HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_23_HIDDEN_POWER_HERB

Route23SignText:
	text "ROUTE 23"

	para "The sign has more"
	line "on it, but it's"
	cont "completely illeg-"
	cont "ible…"
	done

Route23_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 18, 17, ROUTE_23_CAVE_1F, 1
	warp_event 32,  9, ROUTE_23_CAVE_1F, 2
	warp_event  4, 26, ROUTE_23_GATE, 3
	warp_event  4, 27, ROUTE_23_GATE, 4
	warp_event  8,  7, TREASURE_HUNTERS_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 27, 23, BGEVENT_ITEM, Route23HiddenBrickPiece
	bg_event 36, 28, BGEVENT_ITEM, Route23HiddenGoldLeaf
	bg_event 24, 27, BGEVENT_ITEM, Route23HiddenSilverLeaf
	bg_event  3, 14, BGEVENT_ITEM, Route23HiddenPowerHerb
	bg_event 15, 25, BGEVENT_READ, Route23Sign

	db 2 ; object events
	object_event 39, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route23XAccuracy, EVENT_ROUTE_23_X_ACCURACY
	object_event 40, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route23Slowpoketail, EVENT_ROUTE_23_SLOWPOKETAIL
