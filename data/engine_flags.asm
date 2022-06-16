engine_flag: MACRO
; location, bit
; (all locations are in WRAM bank 1)
	dwb \1 + (\2 / 8), 1 << (\2 % 8)
ENDM

EngineFlags:
; entries correspond to ENGINE_* constants

	; pokegear
	engine_flag wPokegearFlags, POKEGEAR_RADIO_CARD_F ; $0
	engine_flag wPokegearFlags, POKEGEAR_MAP_CARD_F
	engine_flag wPokegearFlags, LOST_LAND_VISITED_F
	engine_flag wPokegearFlags, RUNNING_SHOES_F
	engine_flag wPokegearFlags, POKEGEAR_OBTAINED_F

	; day-care
	engine_flag wDayCareMan, DAYCAREMAN_HAS_EGG_F
	engine_flag wDayCareMan, DAYCAREMAN_HAS_MON_F
	engine_flag wDayCareLady, DAYCARELADY_HAS_MON_F

	engine_flag wMomSavingMoney, MOM_SAVING_SOME_MONEY_F ; $8
	engine_flag wMomSavingMoney, MOM_ACTIVE_F

	engine_flag wUnusedTwoDayTimerOn, 0 ; unused, possibly related to a 2-day timer

	engine_flag wStatusFlags, STATUSFLAGS_POKEDEX_F
	engine_flag wStatusFlags, STATUSFLAGS_UNOWN_DEX_F
	engine_flag wStatusFlags, STATUSFLAGS_FLASH_F
	engine_flag wStatusFlags, STATUSFLAGS_CAUGHT_POKERUS_F
	engine_flag wStatusFlags, STATUSFLAGS_EXP_ALL_ACTIVE_F
	engine_flag wStatusFlags, STATUSFLAGS_HALL_OF_FAME_F
	engine_flag wStatusFlags, STATUSFLAGS_BATTLE_SUBWAY_LEVELS_F

	engine_flag wStatusFlags2, STATUSFLAGS2_SAFARI_REST_HOUSE_F ; Unused
	engine_flag wStatusFlags2, STATUSFLAGS2_SAFARI_GAME_F
	engine_flag wStatusFlags2, STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F
	engine_flag wStatusFlags2, STATUSFLAGS2_BATTLE_SUBWAY_ACTIVE_F
	engine_flag wStatusFlags2, STATUSFLAGS2_HAVE_BATTLE_PASS_F
	engine_flag wStatusFlags2, STATUSFLAGS2_EXTENDED_SAFARI_GAME_F
	engine_flag wStatusFlags2, STATUSFLAGS2_FORCE_SHINY_ENCOUNTERS_F

	engine_flag wBikeFlags, BIKEFLAGS_STRENGTH_ACTIVE_F ; $18
	engine_flag wBikeFlags, BIKEFLAGS_ALWAYS_ON_BIKE_F
	engine_flag wBikeFlags, BIKEFLAGS_ROCK_SMASH_ACTIVE_F

	engine_flag wJohtoBadges, ZEPHYRBADGE
	engine_flag wJohtoBadges, HIVEBADGE
	engine_flag wJohtoBadges, PLAINBADGE
	engine_flag wJohtoBadges, FOGBADGE
	engine_flag wJohtoBadges, MINERALBADGE
	engine_flag wJohtoBadges, STORMBADGE ; $20
	engine_flag wJohtoBadges, GLACIERBADGE
	engine_flag wJohtoBadges, RISINGBADGE

	engine_flag wKantoBadges, BOULDERBADGE
	engine_flag wKantoBadges, CASCADEBADGE
	engine_flag wKantoBadges, THUNDERBADGE
	engine_flag wKantoBadges, RAINBOWBADGE
	engine_flag wKantoBadges, SOULBADGE
	engine_flag wKantoBadges, MARSHBADGE ; $28
	engine_flag wKantoBadges, VOLCANOBADGE
	engine_flag wKantoBadges, EARTHBADGE

	; unown sets (see data/wild/unlocked_unowns.asm)
	engine_flag wUnlockedUnowns, 0 ; A-K
	engine_flag wUnlockedUnowns, 1 ; L-R
	engine_flag wUnlockedUnowns, 2 ; S-W
	engine_flag wUnlockedUnowns, 3 ; X-Z
	engine_flag wUnlockedUnowns, 4 ; unused
	engine_flag wUnlockedUnowns, 5 ; unused ; $30
	engine_flag wUnlockedUnowns, 6 ; unused
	engine_flag wUnlockedUnowns, 7 ; unused

	; fly
	engine_flag wVisitedSpawns, SPAWN_HOME
	engine_flag wVisitedSpawns, SPAWN_SS_MAKO
	engine_flag wVisitedSpawns, SPAWN_LEAGUE ; $40
	engine_flag wVisitedSpawns, SPAWN_ELKHORN
	engine_flag wVisitedSpawns, SPAWN_PAVONA
	engine_flag wVisitedSpawns, SPAWN_PECTINIA
	engine_flag wVisitedSpawns, SPAWN_RIDGE
	engine_flag wVisitedSpawns, SPAWN_FAVIA
	engine_flag wVisitedSpawns, SPAWN_HEPATICA
	engine_flag wVisitedSpawns, SPAWN_ROUTE_9
	engine_flag wVisitedSpawns, SPAWN_STAGHORN ; $48
	engine_flag wVisitedSpawns, SPAWN_RUGOSA_COAST
	engine_flag wVisitedSpawns, SPAWN_RUGOSA
	engine_flag wVisitedSpawns, SPAWN_CARNATION
	engine_flag wVisitedSpawns, SPAWN_ACROPORA
	engine_flag wVisitedSpawns, SPAWN_ORCHID
	engine_flag wVisitedSpawns, NUM_SPAWNS ; unused

	engine_flag wLuckyNumberShowFlag, LUCKYNUMBERSHOW_GAME_OVER_F

	engine_flag wStatusFlags2, STATUSFLAGS2_BATTLE_SIMULATION_F

	engine_flag wDailyFlags1, DAILYFLAGS1_KURT_MAKING_BALLS_F ; $50
	engine_flag wDailyFlags1, DAILYFLAGS1_OFFICER_DANIEL_BATTLE_F
	engine_flag wDailyFlags1, DAILYFLAGS1_SODA_POP_GUY_F
	engine_flag wDailyFlags1, DAILYFLAGS1_VITAMIN_TIMER_F
	engine_flag wDailyFlags1, DAILYFLAGS1_ALL_FRUIT_TREES_F
	engine_flag wDailyFlags1, DAILYFLAGS1_GOT_SHUCKIE_TODAY_F
	engine_flag wDailyFlags1, DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F
	engine_flag wDailyFlags1, DAILYFLAGS1_TRAINER_HOUSE_F

	engine_flag wDailyFlags2, DAILYFLAGS2_MT_MOON_SQUARE_CLEFAIRY_F ; $58
	engine_flag wDailyFlags2, DAILYFLAGS2_UNION_CAVE_LAPRAS_F
	engine_flag wDailyFlags2, DAILYFLAGS2_GOLDENROD_UNDERGROUND_GOT_HAIRCUT_F
	engine_flag wDailyFlags2, DAILYFLAGS2_GOLDENROD_DEPT_STORE_TM27_RETURN_F
	engine_flag wDailyFlags2, DAILYFLAGS2_DAISYS_GROOMING_F
	engine_flag wDailyFlags2, DAILYFLAGS2_INDIGO_PLATEAU_RIVAL_FIGHT_F
	engine_flag wDailyFlags2, DAILYFLAGS2_MOVE_TUTOR_F
	engine_flag wDailyFlags2, DAILYFLAGS2_BUENAS_PASSWORD_F

	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_MURPHY
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_CECIL
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_CELESTE
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_DUANE
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_POSEY
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_JOEL
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_ALAN
	engine_flag wDailyFlags3, DAILYFLAGS3_REMATCH_ENYA

	engine_flag wSwarmFlags, SWARMFLAGS_BUENAS_PASSWORD_F ; $60
	engine_flag wSafariFlag, SAFARIFLAGS_SAFARI_GAME_ACTIVE_F

	engine_flag wGameTimerPause, GAMETIMERPAUSE_MOBILE_7_F

	engine_flag wPlayerGender, PLAYERGENDER_FEMALE_F

	engine_flag wCelebiEvent, CELEBIEVENT_FOREST_IS_RESTLESS_F

	; rematches

	engine_flag wPlayerSpriteSetupFlags, PLAYERSPRITESETUP_FEMALE_TO_MALE_F

	engine_flag wSwarmFlags, SWARMFLAGS_DUNSPARCE_SWARM_F ; $a0
	engine_flag wSwarmFlags, SWARMFLAGS_YANMA_SWARM_F
