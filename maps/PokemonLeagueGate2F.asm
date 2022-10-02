	const_def 2 ; object constants

PokemonLeagueGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeagueGate2FCooltrainerM:
	jumptextfaceplayer PokemonLeagueGate2FCooltrainerMText

PokemonLeagueGate2FCooltrainerF:
	jumptextfaceplayer PokemonLeagueGate2FCooltrainerFText

PokemonLeagueGate2FGentleman:
	jumptextfaceplayer PokemonLeagueGate2FGentlemanText

PokemonLeagueGate2FBeauty:
	jumptextfaceplayer PokemonLeagueGate2FBeautyText

PokemonLeagueGate2FCooltrainerMText:
	text "I don't know what I"
	line "would do if I have"
	cont "to battle my own"
	cont "girlfriend at the"
	cont "#MON LEAGUE."
	
	para "I want us both to"
	line "make it to the"
	cont "top, but at the"
	cont "end of the day,"
	cont "there can only be"
	cont "one CHAMPION."
	done

PokemonLeagueGate2FCooltrainerFText:
	text "My boyfriend is"
	line "sweet, but I don't"
	cont "want him to hold"
	cont "back in a battle"
	cont "with me."
	
	para "I know he wishes"
	line "the same from me."
	done

PokemonLeagueGate2FGentlemanText:
	text "I have tried to"
	line "take on the ELITE"
	cont "FOUR more times"
	cont "than I can count."
	
	para "I must have first"
	line "made it here"
	cont "before you were"
	cont "born!"
	
	para "I wonder if the"
	line "GYM LEADERS have"
	cont "gotten stronger"
	cont "since I battled"
	cont "them last…"
	done

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
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate2FCooltrainerM, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate2FCooltrainerF, -1
	object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate2FGentleman, -1
	object_event  7,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate2FBeauty, -1
