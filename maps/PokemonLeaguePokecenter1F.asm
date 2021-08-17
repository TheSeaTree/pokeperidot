	const_def 2 ; object constants
	const POKEMONLEAGUEPOKECENTER1F_NURSE
	const POKEMONLEAGUEPOKECENTER1F_CLERK1
	const POKEMONLEAGUEPOKECENTER1F_CLERK2
	const POKEMONLEAGUEPOKECENTER1F_COOLTRAINER_M
	const POKEMONLEAGUEPOKECENTER1F_SILVER
	const POKEMONLEAGUEPOKECENTER1F_GRAMPS
	const POKEMONLEAGUEPOKECENTER1F_ABRA

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
	setmapscene LANCES_ROOM, SCENE_DEFAULT
	setmapscene HALL_OF_FAME, SCENE_DEFAULT
	clearevent EVENT_ORVILLES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_ORVILLES_ROOM_EXIT_OPEN
	clearevent EVENT_REGANS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_REGANS_ROOM_EXIT_OPEN
	clearevent EVENT_BREDES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BREDES_ROOM_EXIT_OPEN
	clearevent EVENT_AMBERS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_AMBERS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_ORVILLE
	clearevent EVENT_BEAT_ELITE_4_REGAN
	clearevent EVENT_BEAT_ELITE_4_BREDE
	clearevent EVENT_BEAT_ELITE_4_AMBER
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	return

PlateauRivalBattle1:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, PlateauRivalScriptDone
	ifequal TUESDAY, PlateauRivalScriptDone
	ifequal THURSDAY, PlateauRivalScriptDone
	ifequal FRIDAY, PlateauRivalScriptDone
	ifequal SATURDAY, PlateauRivalScriptDone
	moveobject POKEMONLEAGUEPOKECENTER1F_SILVER, 17, 9
	appear POKEMONLEAGUEPOKECENTER1F_SILVER
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement POKEMONLEAGUEPOKECENTER1F_SILVER, PlateauRivalMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, RIGHT
	jump PlateauRivalBattleCommon

PlateauRivalBattle2:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, PlateauRivalScriptDone
	ifequal TUESDAY, PlateauRivalScriptDone
	ifequal THURSDAY, PlateauRivalScriptDone
	ifequal FRIDAY, PlateauRivalScriptDone
	ifequal SATURDAY, PlateauRivalScriptDone
	appear POKEMONLEAGUEPOKECENTER1F_SILVER
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement POKEMONLEAGUEPOKECENTER1F_SILVER, PlateauRivalMovement2
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, LEFT
PlateauRivalBattleCommon:
	opentext
	writetext PlateauRivalText1
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Totodile
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Chikorita
	; Cyndaquil
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked POKEMONLEAGUEPOKECENTER1F_SILVER
	loadtrainer RIVAL2, RIVAL2_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump PlateauRivalPostBattle

.Totodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked POKEMONLEAGUEPOKECENTER1F_SILVER
	loadtrainer RIVAL2, RIVAL2_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump PlateauRivalPostBattle

.Chikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked POKEMONLEAGUEPOKECENTER1F_SILVER
	loadtrainer RIVAL2, RIVAL2_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump PlateauRivalPostBattle

PlateauRivalPostBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PlateauRivalText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POKEMONLEAGUEPOKECENTER1F_SILVER, PlateauRivalLeavesMovement
	disappear POKEMONLEAGUEPOKECENTER1F_SILVER
	setscene SCENE_DEFAULT
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
PlateauRivalScriptDone:
	end

PokemonLeaguePokecenter1FNurseScript:
	jumpstd pokecenternurse

PokemonLeaguePokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

PokemonLeaguePokecenter1FTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU_TM
	closetext
	end

PokemonLeaguePokecenter1FCooltrainerMScript:
	jumptextfaceplayer PokemonLeaguePokecenter1FCooltrainerMText

PlateauRivalMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

PlateauRivalMovement2:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

PlateauRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

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

PlateauRivalText1:
	text "Hold it."

	para "You're going to"
	line "take the #MON"

	para "LEAGUE challenge"
	line "now?"

	para "That's not going"
	line "to happen."

	para "My super-well-"
	line "trained #MON"

	para "are going to pound"
	line "you."

	para "<PLAYER>!"
	line "I challenge you!"
	done

PlateauRivalWinText:
	text "…"

	para "OK--I lost…"
	done

PlateauRivalText2:
	text "…Darn… I still"
	line "can't win…"

	para "I… I have to think"
	line "more about my"
	cont "#MON…"

	para "Humph! Try not to"
	line "lose!"
	done

PlateauRivalLoseText:
	text "…"

	para "Whew…"
	line "With my partners,"

	para "I'm going to be"
	line "the CHAMPION!"
	done

PokemonLeaguePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7,  7, POKEMON_LEAGUE, 3
	warp_event  8,  7, POKEMON_LEAGUE, 4
	warp_event  0,  7, POKECENTER_2F, 1
	warp_event  7,  0, ORVILLES_ROOM, 1
	warp_event  8,  0, ORVILLES_ROOM, 2

	db 2 ; coord events
	coord_event 14,  0, SCENE_DEFAULT, PlateauRivalBattle1
	coord_event 13,  0, SCENE_DEFAULT, PlateauRivalBattle2

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FNurseScript, -1
	object_event 11,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FClerkScript, -1
	object_event 13,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FTMClerkScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeaguePokecenter1FCooltrainerMScript, -1
	object_event 15,  0, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
