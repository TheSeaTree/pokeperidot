	const_def 2 ; object constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler

Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayersRadioText1
	pause 45
	writetext PlayersRadioText2
	pause 45
	writetext PlayersRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd radio1

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
;	giveitem MASTER_BALL
;	giveitem TM_CALM_MIND
;	giveitem TM_BULK_UP
;	giveitem TM_HIDDEN_POWER
;	giveitem TM_ROAR
;	giveitem TM_TOXIC
;	giveitem TM_SUBMISSION
;	giveitem TM_HEADBUTT
;	giveitem TM_CURSE
;	giveitem TM_FIRE_PUNCH
;	giveitem TM_FLAMETHROWER
;	giveitem TM_FIRE_BLAST
;	giveitem TM_ICE_PUNCH
;	giveitem TM_ICE_BEAM
;	giveitem TM_BLIZZARD
;	giveitem TM_THUNDERPUNCH
;	giveitem TM_THUNDERBOLT
;	giveitem TM_THUNDER
;	giveitem TM_HURRICANE
;	giveitem TM_WATERFALL
;	giveitem TM_HYPER_BEAM
;	giveitem TM_THUNDER_WAVE
;	giveitem TM_LEECH_LIFE
;	giveitem TM_ICY_WIND
;	giveitem TM_STRENGTH
;	giveitem TM_RETURN
;	giveitem TM_REFLECT
;	giveitem TM_LIGHT_SCREEN
;	giveitem TM_SAFEGUARD
;	giveitem TM_PROTECT
;	giveitem TM_ENDURE
;	giveitem TM_PSYCHIC_M
;	giveitem TM_CRUNCH
;	giveitem TM_SHADOW_BALL
;	giveitem TM_DRAGONBREATH
;	giveitem TM_TELEPORT
;	giveitem TM_PSYCH_UP
;	giveitem TM_SLUDGE_BOMB
;	giveitem TM_ROCK_SMASH
;	giveitem TM_FLY
;	giveitem TM_ROCK_SLIDE
;	giveitem TM_EARTHQUAKE
;	giveitem TM_IRON_HEAD
;	giveitem TM_CUT
;	giveitem TM_THIEF
;	giveitem TM_WHIRLPOOL
;	giveitem TM_SWAGGER
;	giveitem TM_NASTY_PLOT
;	giveitem TM_SUBSTITUTE
;	giveitem TM_REST
;	giveitem TM_SLEEP_TALK
;	giveitem TM_ATTRACT
;	giveitem TM_DOUBLE_TEAM
;	giveitem TM_SUNNY_DAY
;	giveitem TM_RAIN_DANCE
;	giveitem TM_SANDSTORM
;	giveitem TM_SOLARBEAM
;	giveitem TM_GIGA_DRAIN
;	giveitem TM_DRAGON_DANCE
;	giveitem TM_SWORDS_DANCE
;	giveitem TM_BULLDOZE
;	giveitem TM_PLAY_ROUGH
;	giveitem HM_SURF
;	loadwildmon SEARION, 10
;	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
;	startbattle
;	reloadmapafterbattle
;	turnobject PLAYER, DOWN
	end

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

PlayersRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayersRadioText2:
	text "#MON CHANNEL!"
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
;	warp_event  7,  0, PLAYERS_HOUSE_1F, 3
	warp_event  7,  0, DAY_CARE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 4 ; object events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
