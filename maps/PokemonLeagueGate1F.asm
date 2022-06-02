	const_def 2 ; object constants

PokemonLeagueGate1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeagueGate1FOfficer:
	jumptext PokemonLeagueGate1FOfficerText

PokemonLeagueGate1FReceptionist:
	jumptext PokemonLeagueGate1FReceptionistText
	
PokemonLeagueGate1FPokefan:
	jumptextfaceplayer PokemonLeagueGate1FPokefanText
	
PokemonLeagueGate1FOfficerText:
	text "Through this gate"
	line "is the #MON"
	cont "LEAGUE."
	
	para "You will meet some"
	line "of the strongest"
	cont "trainers around."
	
	para "This is where your"
	line "skills will be put"
	cont "to the test, to"
	cont "see if you are as"
	cont "good as you think"
	cont "you are."
	done

PokemonLeagueGate1FReceptionistText:
	text "The #MON LEAGUE"
	line "lies ahead of this"
	cont "gate."
	
	para "You are welcome to"
	line "rest upstairs be-"
	cont "fore entering the"
	cont "city."
	done
	
PokemonLeagueGate1FPokefanText:
	text "Standing on solid"
	line "ground after so"
	cont "long on that ship"
	cont "is a strange feel-"
	cont "ing. I have no"
	cont "idea how SAILORs"
	cont "can tolerate it."
	done

PokemonLeagueGate1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  0, POKEMON_LEAGUE, 8
	warp_event  4,  0, POKEMON_LEAGUE, 9
	warp_event  3,  7, VICTORY_COAST, 2
	warp_event  4,  7, VICTORY_COAST, 2
	warp_event  0,  7, POKEMON_LEAGUE_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate1FOfficer, -1
	object_event  8,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate1FReceptionist, -1
	object_event  8,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGate1FPokefan, -1
