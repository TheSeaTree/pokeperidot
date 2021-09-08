	const_def 2 ; object constants

PokemonLeagueGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeagueGate2FBeauty:
	jumptextfaceplayer PokemonLeagueGate2FBeautyText
	
PokemonLeagueGate2FBeautyText:
	text "Gosh, the city"
	line "they built around"
	cont "the #MON LEAGUE"
	cont "sure is big."
	
	para "They must make a"
	line "line lot of money"
	cont "from trainers"
	cont "losing to the"
	cont "ELITE FOUR."
	done

PokemonLeagueGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, POKEMON_LEAGUE_GATE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate2FBeauty, -1
