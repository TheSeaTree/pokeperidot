	const_def 2 ; object constants

VictoryCoast_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryPortSign:
	jumptext VictoryPortSignText

VictoryPortSignText:
	text "VICTORY PORT"

	para "#MON LEAGUE"
	line "ahead."
	done

VictoryCoast_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 19, VICTORY_PORT, 1
	warp_event 16,  7, POKEMON_LEAGUE_GATE_1F, 3
	warp_event 39, 14, ROUTE_22_GATE, 1
	warp_event 39, 15, ROUTE_22_GATE, 2
	warp_event 29, 13, VICTORY_COAST_OFFICERS_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 19, BGEVENT_READ, VictoryPortSign

	db 0 ; object events
