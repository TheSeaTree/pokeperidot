	const_def 2 ; object constants

PokemonLeague_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHouseSign:
	jumptext TrainerHouseSignText

TrainerHouseSignText:
	text "TRAINER HOUSE"
	
	para "Ready your team"
	line "for the #MON"
	cont "LEAGUE!"
	done

PokemonLeague_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 20,  5, POKEMON_LEAGUE_POKECENTER_1F, 1
	warp_event 21,  5, POKEMON_LEAGUE_POKECENTER_1F, 2
	warp_event 35, 21, FAST_EDDIES_HOUSE, 1
	warp_event 27, 23, VITAMIN_SHOP, 1
	warp_event 11,  7, POKEMON_LEAGUE_CAFE, 1
	warp_event 30, 11, TRAINER_HOUSE, 1
	warp_event 10, 29, POKEMON_LEAGUE_GATE_1F, 1
	warp_event 11, 29, POKEMON_LEAGUE_GATE_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 27, 11, BGEVENT_READ, TrainerHouseSign

	db 0 ; object events
