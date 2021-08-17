	const_def 2 ; object constants

VictoryPort_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryPort_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 19, VICTORY_PORT_INSIDE, 1
;	warp_event 16,  7, POKEMON_LEAGUE_GATE, 1
;	warp_event 39, 14, ROUTE_23_GATE, 1
;	warp_event 39, 15, ROUTE_23_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
