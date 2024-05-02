	const_def 2 ; object constants

PastRoute2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute2HiddenMiracleBerry:
	hiddenitem MIRACLEBERRY, EVENT_ROUTE_2_PAST_HIDDEN_MIRACLEBERRY

PastRoute2HiddenEnergyRoot:
	hiddenitem ENERGY_ROOT, EVENT_ROUTE_2_PAST_HIDDEN_ENERGY_ROOT

PastRoute2HiddenMysteryBerry:
	hiddenitem MYSTERYBERRY, EVENT_ROUTE_2_PAST_HIDDEN_MYSTERYBERRY

PastRoute2HiddenRevivalHerb:
	hiddenitem REVIVAL_HERB, EVENT_ROUTE_2_PAST_HIDDEN_REVIVAL_HERB

PastRoute2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 30, PAST_ROUTE_2_GATE, 1 ; Pectinia Gate
	warp_event 39, 31, PAST_ROUTE_2_GATE, 2 ; Pectinia Gate

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 13, BGEVENT_ITEM, PastRoute2HiddenMiracleBerry
	bg_event 22, 21, BGEVENT_ITEM, PastRoute2HiddenEnergyRoot
	bg_event 12, 32, BGEVENT_ITEM, PastRoute2HiddenMysteryBerry
	bg_event 28, 12, BGEVENT_ITEM, PastRoute2HiddenRevivalHerb

	db 0 ; object events
