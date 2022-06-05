	const_def 2 ; object constants

Route26Cave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route26Cave1FHiddenStardust:
	hiddenitem HP_UP, EVENT_ROUTE_26_CAVE_HIDDEN_STARDUST

Route26Cave1FHiddenHPUp:
	hiddenitem HP_UP, EVENT_ROUTE_26_CAVE_HIDDEN_HP_UP

Route26Cave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, ROUTE_26, 1
	warp_event 19,  7, ROUTE_26, 2
	warp_event  5,  3, ROUTE_26_CAVE_B1F, 1
	warp_event 21,  3, ROUTE_26_CAVE_B1F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9,  7, BGEVENT_ITEM, Route26Cave1FHiddenStardust
	bg_event 18,  4, BGEVENT_ITEM, Route26Cave1FHiddenHPUp

	db 0 ; object events
