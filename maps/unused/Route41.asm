	const_def 2 ; object constants

Route41_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

Route41_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	db 0 ; object events
