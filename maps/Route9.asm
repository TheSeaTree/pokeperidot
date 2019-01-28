	const_def 2 ; object constants

Route9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

Route9SignText:
	text "ILEX FOREST"
	line "Rest house ahead."
	done

Route9_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 30, 17, UNION_CAVE_B1F, 4
	warp_event 26,  5, ROUTE_9_FOREST_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 28,  6, BGEVENT_READ, Route9Sign
	bg_event 21,  5, BGEVENT_ITEM, Route9HiddenEther

	db 0 ; object events
