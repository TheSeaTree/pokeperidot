Route28_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route28Sign:
	jumptext Route28SignText


Route28SignText:
	text "ROUTE 28"
	done

Route28_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  3, ROUTE_28_STEEL_WING_HOUSE, 1
	warp_event 33,  5, VICTORY_ROAD_GATE, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event 31,  5, BGEVENT_READ, Route28Sign

	db 0 ; object events
