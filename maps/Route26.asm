	const_def 2 ; object constants

Route26_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route26Sign:
	jumptext Route26SignText

Route26XAccuracy:
	itemball X_ACCURACY

Route26Slowpoketail:
	itemball SLOWPOKETAIL

Route26HiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_ROUTE_23_HIDDEN_BRICK_PIECE

Route26HiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_ROUTE_23_HIDDEN_GOLD_LEAF

Route26HiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_ROUTE_23_HIDDEN_SILVER_LEAF

Route26HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_23_HIDDEN_POWER_HERB

Route26SignText:
	text "ROUTE 23"

	para "The sign has more"
	line "on it, but it's"
	cont "completely illeg-"
	cont "ible…"
	done

Route26_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 18, 17, ROUTE_23_CAVE_1F, 1
	warp_event 32,  9, ROUTE_23_CAVE_1F, 2
	warp_event  4, 26, ROUTE_23_GATE, 3
	warp_event  4, 27, ROUTE_23_GATE, 4
	warp_event  8,  7, TREASURE_HUNTERS_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 27, 23, BGEVENT_ITEM, Route26HiddenBrickPiece
	bg_event 36, 28, BGEVENT_ITEM, Route26HiddenGoldLeaf
	bg_event 24, 27, BGEVENT_ITEM, Route26HiddenSilverLeaf
	bg_event  3, 14, BGEVENT_ITEM, Route26HiddenPowerHerb
	bg_event 15, 25, BGEVENT_READ, Route26Sign

	db 2 ; object events
	object_event 39, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26XAccuracy, EVENT_ROUTE_23_X_ACCURACY
	object_event 40, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26Slowpoketail, EVENT_ROUTE_23_SLOWPOKETAIL
