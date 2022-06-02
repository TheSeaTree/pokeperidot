	const_def 2 ; object constants

Route26_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route26HiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_ROUTE_26_HIDDEN_BRICK_PIECE

Route26_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 18, 17, ROUTE_26_CAVE_1F, 1
	warp_event 32,  9, ROUTE_26_CAVE_1F, 2
	warp_event  4, 26, ROUTE_26_GATE, 3
	warp_event  4, 27, ROUTE_26_GATE, 4
	warp_event  8,  7, TREASURE_HUNTERS_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 27, 23, BGEVENT_ITEM, Route26HiddenBrickPiece

	db 0 ; object events
