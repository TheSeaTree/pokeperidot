	const_def 2 ; object constants

Route23Cave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route23Cave1FHiddenStardust:
	hiddenitem STARDUST, EVENT_ROUTE_23_CAVE_HIDDEN_STARDUST

Route23Cave1FHiddenHPUp:
	hiddenitem HP_UP, EVENT_ROUTE_23_CAVE_HIDDEN_HP_UP

Route23Cave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, ROUTE_23, 1
	warp_event 19,  7, ROUTE_23, 2
	warp_event  5,  3, ROUTE_23_CAVE_B1F, 1
	warp_event 21,  3, ROUTE_23_CAVE_B1F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9,  7, BGEVENT_ITEM, Route23Cave1FHiddenStardust
	bg_event 18,  4, BGEVENT_ITEM, Route23Cave1FHiddenHPUp

	db 0 ; object events
