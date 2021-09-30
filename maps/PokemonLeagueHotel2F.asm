	const_def 2 ; object constants

PokemonLeagueHotel2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeagueHotel2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  0, POKEMON_LEAGUE_HOTEL_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
