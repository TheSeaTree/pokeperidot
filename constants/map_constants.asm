newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup                                                      ;  1

	map_const OLIVINE_POKECENTER_1F,                        5,  4 ;  1
	map_const OLIVINE_MART,                                 6,  4 ;  8
	map_const OLIVINE_CITY,                                23, 17 ; 14
	map_const ROUTE_14_OLIVINE_GATE,						5,  4
	map_const OLIVINE_SURF_HOUSE,							4,  4
	map_const COASTAL_LAB,									5,  4
	map_const OLIVINE_PORT,                                10,  9 ; 14
	map_const ROUTE_15,                                    20, 19 ;  3
	map_const ROUTE_16,                                    24, 14 ;  2
	map_const ROUTE_17,                                    20, 21 ;  3
	map_const LUGIA_LAIR,                                  13, 12 ;  3

	newgroup                                                      ;  2

	map_const MAHOGANY_GYM,                                13, 16 ;  2
	map_const MAHOGANY_POKECENTER_1F,                       5,  4 ;  3
	map_const MAHOGANY_TOWN,                               21, 19 ;  7
	map_const POWER_PLANT_1F,							   16, 11
	map_const POWER_PLANT_2F,							   16,  8
	map_const POWER_PLANT_1F_B,							   16, 11
	map_const POWER_PLANT_2F_B,							   16,  8
	map_const MAHOGANY_GATE,							    5,  4
	map_const MAHOGANY_MAGNET_TRAIN_STATION,               10,  9 ;  7
	map_const EMYS_HOUSE,									4,  4
	map_const MOVE_DELETERS_HOUSE,                          4,  4 ;  7
	map_const SUBSTITUTE_HOUSE,                             4,  4 ;  7
	map_const MAHOGANY_APARTMENT_1F,                        6,  4
	map_const MAHOGANY_APARTMENT_2F,                        6,  4
	map_const MAHOGANY_APARTMENT_3F,                        6,  4
	map_const MAHOGANY_CAFE,                                7,  4 ;  6
	map_const ROUTE_30_CAVE_1F,								8,  7
	map_const ROUTE_30_CAVE_B1F,						   13, 18
	map_const ROUTE_9_CAVE_1F,								6,  5

	newgroup                                                      ;  3

	map_const NATIONAL_PARK,                               20, 27 ; 15
	map_const NATIONAL_PARK_BUG_CONTEST,                   20, 27 ; 16
	map_const RADIO_TOWER_1F,                               9,  4 ; 17
	map_const RADIO_TOWER_2F,                               9,  4 ; 18
	map_const RADIO_TOWER_3F,                               9,  4 ; 19
	map_const RADIO_TOWER_4F,                               9,  4 ; 20
	map_const RADIO_TOWER_5F,                               9,  4 ; 21
	map_const UNION_CAVE_1F,                               23, 10 ; 37
	map_const UNION_CAVE_B1F,                              20, 16 ; 38
	map_const UNION_CAVE_B2F,                              10, 18 ; 39
	map_const MAHOGANY_MART_1F,                             4,  4 ; 48
	map_const MOUNT_MORTAR_1F_OUTSIDE,                     20, 18 ; 57
	map_const MOUNT_MORTAR_1F_INSIDE,                      20, 27 ; 58
	map_const MOUNT_MORTAR_2F_INSIDE,                      20, 18 ; 59
	map_const MOUNT_MORTAR_B1F,                            20, 18 ; 60
	map_const DIGLETTS_CAVE,                               13,  9 ; 84
	map_const DRAIN_PUNCH_CHAMBER,							5,  4
	map_const MOUNT_MOON,                                  15,  9 ; 85
	map_const PALEROCK_CAVE_1F,                            13, 16 ; 87
	map_const PALEROCK_CAVE_B1F,                           21, 15 ; 88
	map_const VICTORY_ROAD,                                10, 36 ; 91
	map_const CIANWOOD_CAVE_1F,                             7,  6
	map_const CIANWOOD_CAVE_B1F,                           20, 15
	map_const NEVERMELTICE_CHAMBER,                         5,  7
	map_const CIANWOOD_CAVE_B2F,                           21, 17
	map_const OVERLOOK_MAZE,                               29, 19
	map_const LOST_LAND,		                           29,  20
	map_const BURGLAR_HIDEOUT_1F,							6,  5
	map_const BURGLAR_HIDEOUT_B1F,						   15, 15
	map_const BURGLAR_HIDEOUT_B2F,						   18, 11

	newgroup                                                      ;  4

	map_const ECRUTEAK_POKECENTER_1F,                       5,  4 ;  3
	map_const ECRUTEAK_MART,                                6,  4 ;  6
	map_const ECRUTEAK_GYM,                                11, 13 ;  7
	map_const ECRUTEAK_CITY,                               22, 15 ;  9
	map_const ECRUTEAK_FOREST_GATE,                         6,  4 ; 10
	map_const PAINTERS_FOREST,                              7,  7
	map_const PAINTERS_HOUSE,                               4,  4
	map_const ROUTE_12_ECRUTEAK_GATE,						5,  4
	map_const ECRUTEAK_THIEF_HOUSE,							4,  4
	map_const FRIEND_BALL_HOUSE,							4,  4
	map_const RICHARDS_HOUSE,		    					4,  4
	map_const EMILYS_HOUSE_1F,                              5,  4 ;  6
	map_const EMILYS_HOUSE_2F,                              4,  3 ;  7

	newgroup                                                      ;  5

	map_const OLIVINE_GYM,                                  5,  6 ;  2
	map_const BLACKTHORN_MART,                              6,  4 ;  5
	map_const BLACKTHORN_POKECENTER_1F,                     5,  4 ;  6
	map_const BLACKTHORN_CITY,                             32, 16 ; 10
	map_const ROUTE_21,									   27, 10
	map_const ROUTE_21_ECRUTEAK_GATE,						5,  4
	map_const BLACKTHORN_REST_TALK_HOUSE,                   4,  4
	map_const BLACKTHORN_LASS_HOUSE,                        4,  4
	map_const FLUTE_MASTER_HOUSE,                           4,  4
	map_const BLACKTHORN_CAVE_1F,                          19, 11
	map_const BLACKTHORN_CAVE_2F,                          10,  7
	map_const BLACKTHORN_CAVE_B1F,                         18, 14

	newgroup                                                      ;  6
	
	map_const SAFARI_ZONE_GATE_1F,							5,   4
	map_const SAFARI_ZONE_GATE_2F,  						4,   4
	map_const SAFARI_ZONE_AREA_1,						   19,  17
	map_const SAFARI_ZONE_AREA_2,						   17,  14
	map_const SAFARI_ZONE_AREA_3,						   13,  15
	map_const SAFARI_ZONE_AREA_4,						   17,  15
	map_const CARNATION_ZOO,							   18, 13

	newgroup                                                      ;  7
	
	map_const ROUTE_18,                                    18, 20 ;  4
	map_const CARNATION_TOWN,        					   17, 10
	map_const CARNATION_POKECENTER_1F,                      5,  4 ;  1
	map_const WOBBUFFET_HOUSE,   							4,  4
	map_const ROUTE_19,									   27, 12
	map_const ROUTE_20,                                    31, 22
	map_const HEAVY_BALL_HOUSE,                             4,  4 ; 13

	newgroup                                                      ;  8

	map_const ROUTE_3,                                     32, 22 ;  1
	map_const ROUTE_3_AZALEA_GATE,                          5,  4 ; 12
	map_const AZALEA_POKECENTER_1F,                         5,  4 ;  1
	map_const CHARCOAL_KILN,                                4,  4 ;  2
	map_const AZALEA_MART,                                  6,  4 ;  3
	map_const KURTS_HOUSE,                                  8,  4 ;  4
	map_const AZALEA_GYM,                                   9,  9 ;  5
	map_const AZALEA_TOWN,                                 30, 20 ;  7
	map_const AZALEA_APARTMENT_LEFT,                        6,  4
	map_const AZALEA_APARTMENT_LEFT_2F,                     6,  4
	map_const AZALEA_APARTMENT_LEFT_3F,                     6,  4
	map_const AZALEA_APARTMENT_RIGHT,                       6,  4
	map_const AZALEA_APARTMENT_RIGHT_2F,                    6,  4
	map_const AZALEA_APARTMENT_RIGHT_3F,                    6,  4
	map_const AZALEA_GYM_SPEECH_HOUSE,                      4,  4
	map_const AZALEA_EVOLUTION_HOUSE,                       4,  4
	map_const AZALEA_BIKE_HOUSE,                            4,  4
	map_const AZALEA_BERRY_HOUSE,                           4,  4
	map_const ROUTE_4_FOREST_GATE,                          5,  4
	map_const ROUTE_4_AZALEA_GATE,                          5,  4

	newgroup                                                      ;  9

	map_const EAST_FOREST,                                 30, 15
	map_const FACTORY_1F,                                  11, 11
	map_const FACTORY_B1,                                   6,  8
	map_const FACTORY_BACK,                                 5,  8
	map_const RAIKOU_LAIR,									5,  3

	newgroup                                                      ; 10

	map_const ROUTE_4,                                     25, 24 ; 12
	map_const ROUTE_5,                                     27, 13 ;  1
	map_const ROUTE_6,                                     28, 13 ;  1
	map_const ROUTE_7,                                     21, 14 ;  1
	map_const ROUTE_8,                                     20, 37 ;  1
	map_const ROUTE_10_NORTH,                              16, 14 ; 14
	map_const VIOLET_CITY,                                 27, 12 ;  5
	map_const VIOLET_CAFE,                                  7,  4 ;  6
	map_const VIOLET_GYM,                                   5,  4 ;  7
	map_const VIOLET_POKECENTER_1F,                         5,  4 ; 10
	map_const VIOLET_GYM_B1,							   18, 16 ; 18
	map_const VIOLET_MOVE_TUTOR,                            4,  4
	map_const VIOLET_WEATHER_HOUSE,                         4,  4
	map_const VIOLET_TRADE_HOUSE,                           4,  4
	map_const ROUTE_8_SILK_SCARF_HOUSE,                     4,  4

	newgroup                                                      ; 11

	map_const GOLDENROD_CITY,                              18, 17 ;  2
	map_const CIANWOOD_GYM,                                16, 22 ;  5
	map_const GOLDENROD_BIKE_SHOP,                          4,  4 ;  4
	map_const GOLDENROD_HAPPINESS_RATER,                    4,  4 ;  5
	map_const BILLS_FAMILYS_HOUSE,                          4,  4 ;  6
	map_const GOLDENROD_MAGNET_TRAIN_STATION,              10,  9 ;  7
	map_const CARNATION_FLOWER_SHOP,                        4,  4 ;  8
	map_const GOLDENROD_PP_SPEECH_HOUSE,                    4,  4 ;  9
	map_const GOLDENROD_NAME_RATER,                         4,  4 ; 10
	map_const GOLDENROD_GAME_CORNER,                       10,  7 ; 19
	map_const GOLDENROD_POKECENTER_1F,                      5,  4 ; 20
	map_const ROUTE_8_GOLDENROD_GATE,                       5,  4 ; 21
	map_const ILEX_FOREST_AZALEA_GATE,                      5,  4 ; 22
	map_const DAY_CARE,                                     4,  4 ; 24
	map_const ROUTE_1_GOLDENROD_GATE,                       5,  4 ; 13
	map_const GOLDENROD_MART,                               6,  4
	map_const ROUTE_11_GOLDENROD_GATE,                      5,  4
	map_const ROUTE_11_ROUTE_12_GATE,                       5,  4

	newgroup                                                      ; 12

	map_const MAHOGANY_DEPT_STORE_1F,                      8,  4 ; 11
	map_const MAHOGANY_DEPT_STORE_2F,                      8,  4 ; 12
	map_const MAHOGANY_DEPT_STORE_3F,                      8,  4 ; 13
	map_const MAHOGANY_DEPT_STORE_4F,                      8,  4 ; 14
	map_const MAHOGANY_DEPT_STORE_5F,                      8,  4 ; 15
	map_const MAHOGANY_DEPT_STORE_6F,                      8,  4 ; 16
	map_const MAHOGANY_DEPT_STORE_ELEVATOR,                2,  2 ; 17
	map_const ROUTE_6_SURFERS_HOUSE,                       4,  4 ; 13

	newgroup                                                      ; 13
	map_const ROUTE_11,                                    32, 16	
	map_const ROUTE_11_CURSE_HOUSE,                         4,  4	
	map_const ROUTE_11_CLEANSE_TAG_HOUSE,                   4,  4	

	newgroup                                                      ; 14
	map_const MAHOGANY_DEPT_STORE_ROOF,                   12,  8 ; 18

	newgroup                                                      ; 15

	newgroup                                                      ; 16

	map_const INDIGO_PLATEAU_POKECENTER_1F,                 8,  4 ;  2
	map_const WILLS_ROOM,                                   5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const BRUNOS_ROOM,                                  5,  9 ;  5
	map_const KARENS_ROOM,                                  5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	map_const ILEX_FOREST,                                 32, 24 ; 52
	map_const SWORDS_DANCE_HOUSE,							4,  4
	map_const ROUTE_9_FOREST_GATE,                          6,  4 ; 18

	newgroup                                                      ; 18

	map_const ROUTE_12,                                    35, 11 ;  2
	map_const ROUTE_12_SHELTER,								4,  4
	map_const ROUTE_13,                                    29, 16 ;  1
	map_const ROUTE_14,                                    31, 14 ;  2
	map_const ROUTE_14_CAVE_1F, 							9, 11
	map_const ROUTE_14_CAVE_2F,							   10, 10
	map_const ROUTE_10_SOUTH,                              10,  9 ;  3
	map_const ROUTE_3_ROUTE_4_GATE,                         5,  4 ; 13
	map_const ROUTE_5_SUPER_ROD_HOUSE,                      4,  4 ; 14

	newgroup                                                      ; 19

	map_const SILVER_CAVE_OUTSIDE,                         20, 18 ;  2
	map_const SILVER_CAVE_POKECENTER_1F,                    5,  4 ;  3

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                6,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3

	newgroup                                                      ; 21

	map_const ROUTE_6_UNDERGROUND,                         18, 10 ; 53
	map_const ROUTE_16_GATE,                                5,  4 ; 24
	map_const NEW_BARK_FOREST_GATE,                         5,  4 ; 25
	map_const ROUTE_8_ROUTE_10_GATE,                       5,  4 ; 26

	newgroup                                                      ; 22

	map_const CIANWOOD_CITY,                               18, 23 ;  3
	map_const MANIAS_HOUSE,                                 4,  4 ;  4
	map_const CIANWOOD_POKECENTER_1F,                       5,  4 ;  6
	map_const CIANWOOD_MART,                                6,  4 ;  7
	map_const CIANWOOD_PHOTO_STUDIO,                        4,  4 ;  8
	map_const CIANWOOD_LUGIA_SPEECH_HOUSE,                  4,  4 ;  9
	map_const POKE_SEERS_HOUSE,                             4,  4 ; 10
	map_const CIANWOOD_CHURCH,                              7, 11
	map_const GOLDENROD_GYM,                                9,  9 ;  3
	map_const GOLDENROD_GYM_NORTH_CHAMBER,                  9, 10 ;  3
	map_const GOLDENROD_GYM_EAST_CHAMBER,                   8, 10 ;  3
	map_const GOLDENROD_GYM_WEST_CHAMBER,                   8, 10 ;  3

	newgroup                                                      ; 23

	map_const ROUTE_2_GATE,                                 5,  4 ; 12
	map_const ORCHID_CITY,                                 19, 17
	map_const BLACKTHORN_GYM_1F,                           10, 13 ;  1
	map_const BLACKTHORN_GYM_2F,                           11,  9 ;  2
	map_const ORCHID_POKECENTER_1F,                         5,  4 ;  9
	map_const ORCHID_MART,                                  6,  4 ;  4
	map_const DRAGONBREATH_HOUSE,                           4,  4
	map_const ENTEI_LAIR,									7,  5
	map_const ROUTE_22_CAVE_1F,							   14, 14
	map_const ROUTE_22_CAVE_B1F,						   23, 17
	map_const ROUTE_22_CAVE_B2F,						   21, 24
	map_const ROUTE_22_NORTH,							   19,  8
	map_const ROUTE_22_SOUTH,							   20, 19
	map_const ROUTE_22_HIDDEN_CAVE,						    5,  7

	newgroup                                                      ; 24

	map_const ROUTE_1,                                     33, 17 ;  1
	map_const NEW_BARK_TOWN,                               12, 11 ;  4
	map_const VIRIDIAN_POKECENTER_1F,                       5,  4 ;  9
	map_const MAPLES_LAB,                                   5,  6 ;  5
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  7
	map_const PLAYERS_NEIGHBORS_HOUSE,                      4,  4 ;  8
	map_const ELMS_HOUSE,                                   4,  4 ;  9
	map_const ROUTE_1_NEW_BARK_GATE,                        5,  4 ; 13

	newgroup                                                      ; 25

	map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13
	map_const ROUTE_5_CLEANSE_TAG_HOUSE,                    4,  4 ; 15

	newgroup                                                      ; 26

	map_const ROUTE_30,                                    18, 18 ;  1
	map_const ROUTE_1_CHERRYGROVE_GATE,                     5,  4 ; 14
	map_const ROUTE_2,                                     23, 20 ;  1
	map_const CHERRYGROVE_CITY,                            17, 16 ;  3
	map_const CHERRYGROVE_POKECENTER_1F,                    5,  4 ;  5
	map_const CHERRYGROVE_GYM_SPEECH_HOUSE,                 4,  4 ;  6
	map_const GUIDE_GENTS_HOUSE,                            4,  4 ;  7
	map_const CHERRYGROVE_INN,                              5,  4 ;  8
	map_const ROUTE_2_AZALEA_GATE,                          5,  4 ; 11
	map_const ROUTE_9,                                     20, 13 ; 13
	map_const SUICUNE_LAIR,	    							7,  3

	newgroup													  ; 27
	
	map_const PALEROCK_MOUNTAIN_1F,  					   18, 14 ;  1
	map_const PALEROCK_MOUNTAIN_2F,  					   15, 11 ;  2
	map_const PALEROCK_MOUNTAIN_3F,  					    9,  9 ;  3
	map_const PALEROCK_MOUNTAIN_OUTSIDE,				   18, 13 ;  4
	map_const PALEROCK_MOUNTAIN_B1,						   17, 12 ;  5
	map_const PALEROCK_MOUNTAIN_STRENGTH_ROOM,		        5,  4 ;  6
	map_const HIDDEN_POWER_CAVE,                            6,  5
	map_const UNOWN_CHAMBER_AG,                             6,  7 ; 52
	map_const UNOWN_CHAMBER_HN,                             6,  7 ; 52
	map_const UNOWN_CHAMBER_OU,                             6,  7 ; 52
	map_const UNOWN_CHAMBER_VZ,                             6,  7 ; 52
	