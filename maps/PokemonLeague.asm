	const_def 2 ; object constants

PokemonLeague_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonLeagueSuperNerdScript:
	jumptextfaceplayer PokemonLeagueSuperNerdText

PokemonLeagueCooltrainerFScript:
	jumptextfaceplayer PokemonLeagueCooltrainerFText

PokemonLeagueYoungsterScript:
	jumptextfaceplayer PokemonLeagueYoungsterText

PokemonLeagueBeautyScript:
	jumptextfaceplayer PokemonLeagueBeautyText

PokemonLeagueRockerScript:
	jumptextfaceplayer PokemonLeagueRockerText

PokemonLeagueTeacherScript:
	jumptextfaceplayer PokemonLeagueTeacherText

VitaminShopSign:
	jumptext VitaminShopSignText

PokemonLeagueCafeSign:
	jumptext PokemonLeagueCafeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

PokemonLeagueHotelSign:
	jumptext PokemonLeagueHotelSignText

PokemonLeagueSuperNerdText:
	text "Do you ever think"
	line "about what the"
	cont "TRAINER HOUSE does"
	cont "with all of the"
	cont "data it collects?"

	para "They've never made"
	line "it clear."

	para "I'm hesitant to"
	line "challenge it for"
	cont "that reason."

	para "I don't like giving"
	line "out a lot of info-"
	cont "rmation about my"
	cont "strategy or my"
	cont "#MON."
	done

PokemonLeagueCooltrainerFText:
	text "There's rumors of"
	line "an abandoned lab-"
	cont "oratory on ROUTE"
	cont "23 that was used"
	cont "to create a super"
	cont "powerful #MON."

	para "Do you think it"
	line "might be real?"

	para "I wonder what kind"
	line "of #MON it is."
	done

PokemonLeagueYoungsterText:
	text "Wow! This place is"
	line "intimidating!"

	para "I thought I was a"
	line "good trainer, but"
	cont "the people here"
	cont "are a step above"
	cont "what I'm used to."
	done

PokemonLeagueBeautyText:
	text "Hey kid, do you"
	line "wanna buy my"
	cont "autograph?"

	para "I'm gonna be a"
	line "star soon, so you"
	cont "won't want to miss"
	cont "out on a real"
	cont "collector's item!"

	para "Tch! Don't give me"
	line "that look!"

	para "You'll see, I'm"
	line "gonna be famous"
	cont "after I defeat the"
	cont "ELITE FOUR!"

	para "Then you'll be"
	line "sorry you missed"
	cont "out, because my"
	cont "signature won't"
	cont "be cheap!"
	done

PokemonLeagueRockerText:
	text "Ah! The #MON"
	line "LEAGUE at last!"

	para "It feels like the"
	line "sun shines even"
	cont "brighter here!"

	para "It's really so"
	line "refreshing."

	para "I never want to go"
	line "home!"
	done

PokemonLeagueTeacherText:
	text "Every time I lose"
	line "a battle here, I"
	cont "planted a flower."

	para "As you can see, I"
	line "really need to"
	cont "work on battling."

	para "Even if I do"
	line "improve, I think"
	cont "I'll keep planting"
	cont "more flowers."

	para "It never hurts to"
	line "make the world a"
	cont "prettier place,"
	cont "don't you think?"
	done

VitaminShopSignText:
	text "VITAMIN SHOP"
	
	para "Make sure your"
	line "#MON are fight-"
	cont "ing fit!"
	done

PokemonLeagueCafeSignText:
	text "#MON LEAGUE"
	line "CAFé"
	done

TrainerHouseSignText:
	text "TRAINER HOUSE"
	
	para "Ready your team"
	line "for the #MON"
	cont "LEAGUE!"
	done

PokemonLeagueHotelSignText:
	text "#MON LEAGUE"
	line "HOTEL -"
	
	para "No current"
	line "vacancies."
	done

PokemonLeague_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 20,  5, POKEMON_LEAGUE_POKECENTER_1F, 1
	warp_event 21,  5, POKEMON_LEAGUE_POKECENTER_1F, 2
	warp_event 35, 21, FAST_EDDIES_HOUSE, 1
	warp_event 27, 23, VITAMIN_SHOP, 1
	warp_event 11,  7, POKEMON_LEAGUE_CAFE, 1
	warp_event 30, 11, TRAINER_HOUSE, 1
	warp_event 10, 19, POKEMON_LEAGUE_HOTEL_1F, 1
	warp_event 10, 29, POKEMON_LEAGUE_GATE_1F, 1
	warp_event 11, 29, POKEMON_LEAGUE_GATE_1F, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 28, 23, BGEVENT_READ, VitaminShopSign
	bg_event 12,  7, BGEVENT_READ, PokemonLeagueCafeSign
	bg_event 27, 11, BGEVENT_READ, TrainerHouseSign
	bg_event  9, 20, BGEVENT_READ, PokemonLeagueHotelSign

	db 6 ; object events
	object_event 31, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueSuperNerdScript, -1
	object_event 32, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonLeagueCooltrainerFScript, -1
	object_event 16, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonLeagueYoungsterScript, -1
	object_event 15,  8, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokemonLeagueBeautyScript, -1
	object_event  4, 23, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonLeagueRockerScript, -1
	object_event 29,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonLeagueTeacherScript, -1
