	const_def 2 ; object constants

Route26_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route26HiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_ROUTE_26_HIDDEN_BRICK_PIECE

Route26_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 30, 11, ROUTE_23, 1
	warp_event 16, 17, ROUTE_23, 2
	warp_event 11,  5, ROUTE_23, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 23, 25, BGEVENT_ITEM, Route26HiddenBrickPiece

	db 0 ; object events
