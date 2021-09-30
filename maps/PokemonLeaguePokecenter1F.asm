	const_def 2 ; object constants
	const POKEMONLEAGUEPOKECENTER1F_NURSE
	const POKEMONLEAGUEPOKECENTER1F_CLERK1
	const POKEMONLEAGUEPOKECENTER1F_CLERK2
	const POKEMONLEAGUEPOKECENTER1F_COOLTRAINER_M
	const POKEMONLEAGUEPOKECENTER1F_IVY
	const POKEMONLEAGUEPOKECENTER1F_FANGIRL

PokemonLeaguePokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareElite4

.DummyScene:
	end

.PrepareElite4:
	setmapscene ORVILLES_ROOM, SCENE_DEFAULT
	setmapscene REGANS_ROOM, SCENE_DEFAULT
	setmapscene BREDES_ROOM, SCENE_DEFAULT
	setmapscene AMBERS_ROOM, SCENE_DEFAULT
	setmapscene VICTORS_ROOM, SCENE_DEFAULT
	setmapscene HALL_OF_FAME, SCENE_DEFAULT
	clearevent EVENT_ORVILLES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_ORVILLES_ROOM_EXIT_OPEN
	clearevent EVENT_REGANS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_REGANS_ROOM_EXIT_OPEN
	clearevent EVENT_BREDES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BREDES_ROOM_EXIT_OPEN
	clearevent EVENT_AMBERS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_AMBERS_ROOM_EXIT_OPEN
	clearevent EVENT_VICTORS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_VICTORS_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_ORVILLE
	clearevent EVENT_BEAT_ELITE_4_REGAN
	clearevent EVENT_BEAT_ELITE_4_BREDE
	clearevent EVENT_BEAT_ELITE_4_AMBER
	clearevent EVENT_BEAT_CHAMPION_VICTOR
	setevent EVENT_VICTORS_ROOM_OAK_AND_MARY
	return

PokemonLeaguePokecenter1FNurseScript:
	jumpstd pokecenternurse

PokemonLeaguePokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_POKEMON_LEAGUE
	closetext
	end

PokemonLeaguePokecenter1FTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_POKEMON_LEAGUE_TM
	closetext
	end

PokemonLeaguePokecenter1FFangirlScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_ALL
	iftrue .After
	writetext PokemonLeaguePokecenter1FFangirlText
	waitbutton
	verbosegiveitem EXP_ALL
	setevent EVENT_GOT_EXP_ALL
	writetext PokemonLeaguePokecenter1FFangirlExplainExpAllText
	waitbutton
	closetext
	end

.After
	writetext PokemonLeaguePokecenter1FFangirlAfterText
	waitbutton
	closetext
	end

Ivy:
	faceplayer
	opentext
	trade NPC_TRADE_IVY
	waitbutton
	closetext
	turnobject LAST_TALKED, DOWN
	end

PokemonLeaguePokecenter1FCooltrainerMScript:
	jumptextfaceplayer PokemonLeaguePokecenter1FCooltrainerMText

PokemonLeaguePokecenter1FFangirlText:
	text "Oh, hey <PLAYER>…"
	
	para "The ELITE FOUR is"
	line "really tough."
	
	para "I couldn't even win"
	line "against the first"
	cont "member."
	
	para "But hey, let's not"
	line "be so negative!"
	
	para "Oh, by the way! I"
	line "got you something,"
	cont "as thanks for"
	cont "saving my #MON"
	cont "from that lousy"
	cont "thief. It will"
	cont "help a lot against"
	cont "the ELITE FOUR."
	done
	
PokemonLeaguePokecenter1FFangirlExplainExpAllText:
	text "The EXP.ALL will"
	line "let all of your"
	cont "#MON grow"
	cont "stronger, even if"
	cont "they don't all go"
	cont "into battle."
	
	para "Pretty neat, huh?"

	para "Now you have no"
	line "excuse to keep"
	cont "training!"
	done
	
PokemonLeaguePokecenter1FFangirlAfterText:
	text "Both of us have"
	line "come so far, so"
	cont "let's not give up"
	cont "now!"
	
	para "I will keep train-"
	line "ing until I can"
	cont "win the title of"
	cont "CHAMPION. I hope"
	cont "you will too!"
	done

PokemonLeaguePokecenter1FCooltrainerMText:
	text "At the #MON"
	line "LEAGUE, you'll get"

	para "tested by the"
	line "ELITE FOUR."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done

PokemonLeaguePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7,  9, POKEMON_LEAGUE, 1
	warp_event  8,  9, POKEMON_LEAGUE, 2
	warp_event  0,  9, POKECENTER_2F, 1
	warp_event  7,  0, ORVILLES_ROOM, 1
	warp_event  8,  0, ORVILLES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  3,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FNurseScript, -1
	object_event 11,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FClerkScript, -1
	object_event 13,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FTMClerkScript, -1
	object_event  4,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FCooltrainerMScript, -1
	object_event 14,  8, SPRITE_GAMEBOY_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ivy, -1
	object_event 10,  6, SPRITE_FANGIRL, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FFangirlScript, EVENT_BEAT_ELITE_FOUR
