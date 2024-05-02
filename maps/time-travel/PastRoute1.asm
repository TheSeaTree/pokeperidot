	const_def 2 ; object constants

PastRoute1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute1HiddenCoarseCharm
	hiddenitem COARSE_CHARM, EVENT_ROUTE_1_PAST_HIDDEN_COARSE_CHARM

PastRoute1HiddenGoldBerry:
	hiddenitem GOLD_BERRY, EVENT_ROUTE_1_PAST_HIDDEN_GOLD_BERRY

PastRoute1HiddenMysteryBerry:
	hiddenitem MYSTERYBERRY, EVENT_ROUTE_1_PAST_HIDDEN_MYSTERYBERRY

PastRoute1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 45,  7, PAST_ROUTE_1, 1 ; Cut Guy's House
	warp_event  4, 25, PAST_HIDDEN_POWER_CAVE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  9, 29, BGEVENT_ITEM, PastRoute1HiddenCoarseCharm
	bg_event 17, 41, BGEVENT_ITEM, PastRoute1HiddenGoldBerry
	bg_event 24,  4, BGEVENT_ITEM, PastRoute1HiddenMysteryBerry

	db 0 ; object events
