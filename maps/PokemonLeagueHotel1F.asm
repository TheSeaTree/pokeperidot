	const_def 2 ; object constants

PokemonLeagueHotel1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeagueHotel1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  9, POKEMON_LEAGUE, 7
	warp_event  5,  9, POKEMON_LEAGUE, 7
	warp_event  6,  0, POKEMON_LEAGUE_HOTEL_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
