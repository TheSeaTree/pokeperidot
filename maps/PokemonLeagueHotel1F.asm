	const_def 2 ; object constants

PokemonLeagueHotel1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LeagueHotelReceptionistScript:
	jumptextfaceplayer LeagueHotelReceptionistText

LeagueHotelTwin1Script:
	jumptextfaceplayer LeagueHotelTwin1Text

LeagueHotelTwin2Script:
	jumptextfaceplayer LeagueHotelTwin2Text

LeagueHotelGentlemanScript:
	jumptextfaceplayer LeagueHotelGentlemanText

LeagueHotelReceptionistText:
	text "Hello, welcome!"

	para "I regret to inform"
	line "you that we have"
	cont "no vacancies at"
	cont "the moment."

	para "But you are free"
	line "to visit anyone on"
	cont "the next floor."
	done

LeagueHotelTwin1Text:
	text "JAN: We'll have to"
	line "take the S.S.MAKO"
	cont "back home, because"
	cont "we can't stay here."
	done

LeagueHotelTwin2Text:
	text "ANNE: They wouldn't"
	line "let my sister JAN"
	cont "and me share a"
	cont "room here."
	done

LeagueHotelGentlemanText:
	text "Are your #MON"
	line "prepared for the"
	cont "battles ahead of"
	cont "them here?"

	para "It's important they"
	line "are as ready as"
	cont "you are, these are"
	cont "the most important"
	cont "battles in a"
	cont "trainer's life."
	done

PokemonLeagueHotel1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  9, POKEMON_LEAGUE, 7
	warp_event  5,  9, POKEMON_LEAGUE, 7
	warp_event  6,  0, POKEMON_LEAGUE_HOTEL_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LeagueHotelReceptionistScript, -1
	object_event 10,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LeagueHotelTwin1Script, -1
	object_event 11,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LeagueHotelTwin2Script, -1
	object_event  7,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LeagueHotelGentlemanScript, -1
