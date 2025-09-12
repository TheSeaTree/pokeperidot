	const_def 2 ; object constants

PokemonLeagueHotel2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LeagueHotelBeautyScript:
	jumptextfaceplayer LeagueHotelBeautyText

LeagueHotelCooltrainerMScript:
	jumptextfaceplayer LeagueHotelCooltrainerMText

LeagueHotelSuperNerdScript:
	jumptextfaceplayer LeagueHotelSuperNerdText

LeagueHotelPokefanMScript:
	jumptextfaceplayer LeagueHotelPokefanMText

LeagueHotelLassScript:
	jumptextfaceplayer LeagueHotelLassText

LeagueHotelBeautyText:
	text "<……> <……>Yawn!"

	para "I slept so well on"
	line "the ship! I even"
	cont "had a vivid dream"
	cont "that I was in a"
	cont "#MON battle!"
	done

LeagueHotelCooltrainerMText:
	text "Man, these rooms"
	line "are so cramped."

	para "How are my BIRD"
	line "#MON supposed"
	cont "to stretch their"
	cont "wings in such a"
	cont "tiny space?"

	para "Oh well, at least"
	line "I'm staying here"
	cont "for free."
	done

LeagueHotelSuperNerdText:
	text "Aw, man. I wasn't"
	line "done reviewing my"
	cont "footage before"
	cont "coming here."

	para "How was I supposed"
	line "to know they'd have"
	cont "no TV?"
	done

LeagueHotelPokefanMText:
	text "I've spent a great"
	line "deal of time"
	cont "trying to defeat"
	cont "the ELITE FOUR."

	para "It's no use! No"
	line "matter how long I"
	cont "train my #MON,"
	cont "I never make it"
	cont "more than a"
	cont "couple battles."

	para "Thankfully, I can"
	line "use that as an"
	cont "excuse to continue"
	cont "staying here."

	para "I love this city!"
	done

LeagueHotelLassText:
	text "I wanted to take"
	line "my little brother"
	cont "along, but they"
	cont "wouldn't allow him"
	cont "on the S.S.MAKO."

	para "I miss him a lot."
	line "He helped me train"
	cont "my #MON."
	done

PokemonLeagueHotel2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  0, POKEMON_LEAGUE_HOTEL_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  7, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LeagueHotelBeautyScript, -1
	object_event 12,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LeagueHotelCooltrainerMScript, -1
	object_event 12,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LeagueHotelSuperNerdScript, -1
	object_event  1,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LeagueHotelPokefanMScript, -1
	object_event  1,  1, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LeagueHotelLassScript, -1
