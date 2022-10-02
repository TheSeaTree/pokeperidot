	const_def 2 ; object constants

VictoryCoast_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryCoast_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 19, VICTORY_PORT, 1
	warp_event 16,  7, POKEMON_LEAGUE_GATE_1F, 3
	warp_event 39, 14, ROUTE_27_GATE, 1
	warp_event 39, 15, ROUTE_27_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
