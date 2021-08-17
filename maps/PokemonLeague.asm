	const_def 2 ; object constants

PokemonLeague_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeague_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
;	warp_event 10, 31, POKEMON_LEAGUE_GATE, 3
;	warp_event 11, 31, POKEMON_LEAGUE_GATE, 4
	warp_event 24,  5, POKEMON_LEAGUE_POKECENTER_1F, 1
	warp_event 25,  5, POKEMON_LEAGUE_POKECENTER_1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
