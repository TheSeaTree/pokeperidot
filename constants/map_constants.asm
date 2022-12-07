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

	map_const RUGOSA_COAST,                                23, 17 ; 14
	map_const ROUTE_14_RUGOSA_GATE,							5,  4
	map_const RUGOSA_SURF_HOUSE,							4,  4
	map_const COASTAL_LAB,									5,  4
	map_const RUGOSA_PORT,                                 10,  9 ; 14
	map_const SEA_ROUTE_4,                                 17, 14 ;  1
	map_const ROUTE_8,                                     20, 37 ;  1
	map_const SEA_ROUTE_1,                                 21, 17 ;  3
	map_const SEA_ROUTE_2,                                 24, 14 ;  2
	map_const SEA_ROUTE_3,                                 20, 19 ;  3
	map_const SEA_ROUTE_5,                                 22, 17 ;  3
	map_const SEA_ROUTE_6,                                 19, 19 ;  3
	map_const ROUTE_6_GATE,                                 5,  4 ;  3
	map_const ROUTE_23,					                   19, 20 ; 15
	map_const ROUTE_23_GATE,					           	5,  4
	map_const ROUTE_23_HIDDEN_CAVE,		                    5,  7

	newgroup                                                      ;  2

	map_const RUGOSA_GYM,                                13, 16 ;  2
	map_const RUGOSA_POKECENTER_1F,                       5,  4 ;  3
	map_const RUGOSA_CITY,                               23, 19 ;  7
	map_const POWER_PLANT_1F,							   16, 11
	map_const POWER_PLANT_2F,							   16,  8
	map_const POWER_PLANT_1F_B,							   16, 11
	map_const POWER_PLANT_2F_B,							   16,  8
	map_const RUGOSA_GATE,							    5,  4
	map_const EMYS_HOUSE,									4,  4
	map_const MOVE_DELETERS_HOUSE,                          4,  4 ;  7
	map_const SUBSTITUTE_HOUSE,                             4,  4 ;  7
	map_const RUGOSA_APARTMENT_1F,                        6,  4
	map_const RUGOSA_APARTMENT_2F,                        6,  4
	map_const RUGOSA_APARTMENT_3F,                        6,  4
	map_const RUGOSA_CAFE,                                7,  4 ;  6
	map_const ROUTE_30_CAVE_1F,								8,  7
	map_const ROUTE_30_CAVE_B1F,						   13, 18
	map_const ROUTE_9_CAVE_1F,								6,  5

	newgroup                                                      ;  3

	map_const UNION_CAVE_1F,                               23, 10 ; 37
	map_const UNION_CAVE_B1F,                              20, 16 ; 38
	map_const UNION_CAVE_B2F,                              10, 18 ; 39
	map_const DIGLETTS_CAVE,                               13,  9 ; 84
	map_const DRAIN_PUNCH_CHAMBER,							5,  4
	map_const PALEROCK_CAVE_1F,                            13, 16 ; 87
	map_const PALEROCK_CAVE_B1F,                           21, 15 ; 88
	map_const PALEROCK_CAVE_B2F,                           15, 12 ; 88
	map_const HEPATICA_CAVE_1F,                             7,  6
	map_const HEPATICA_CAVE_B1F,                           20, 15
	map_const NEVERMELTICE_CHAMBER,                         5,  7
	map_const HEPATICA_CAVE_B2F,                           21, 17
	map_const OVERLOOK_MAZE,                               29, 19
	map_const BURGLAR_HIDEOUT_1F,							6,  5
	map_const BURGLAR_HIDEOUT_B1F,						   15, 15
	map_const BURGLAR_HIDEOUT_B2F,						   18, 11
	map_const ROUTE_7_CAVE_1F,							   13, 10
	map_const ROUTE_7_CAVE_B1F,							   21, 19
	map_const TENTACRUELS_DEN,						        8,  8

	newgroup                                                      ;  4

	map_const STAGHORN_POKECENTER_1F,                       5,  4 ;  3
	map_const STAGHORN_MART,                                6,  4 ;  6
	map_const STAGHORN_GYM,                                11, 13 ;  7
	map_const STAGHORN_TOWN,                               22, 15 ;  9
	map_const STAGHORN_FOREST_GATE,                         6,  4 ; 10
	map_const PAINTERS_FOREST,                              7,  9
	map_const PAINTERS_HOUSE,                               4,  4
	map_const ROUTE_12_STAGHORN_GATE,						5,  4
	map_const STAGHORN_THIEF_HOUSE,							4,  4
	map_const FRIEND_BALL_HOUSE,							4,  4
	map_const RICHARDS_HOUSE,		    					4,  4
	map_const EMILYS_HOUSE_1F,                              5,  4 ;  6
	map_const EMILYS_HOUSE_2F,                              4,  3 ;  7

	newgroup                                                      ;  5

	map_const ACROPORA_GYM,                               5,  6 ;  2
	map_const ACROPORA_MART,                              6,  4 ;  5
	map_const ACROPORA_POKECENTER_1F,                     5,  4 ;  6
	map_const ACROPORA_CITY,                             29, 16 ; 10
	map_const ROUTE_20_ACROPORA_GATE,					  5,  4
	map_const ROUTE_21,									 27, 10
	map_const ROUTE_21_STAGHORN_GATE,					  5,  4
	map_const ACROPORA_REST_TALK_HOUSE,                   4,  4
	map_const ACROPORA_LASS_HOUSE,                        4,  4
	map_const ACROPORA_CASTLE_HOUSE,                      4,  4
	map_const FLUTE_MASTER_HOUSE,                         4,  4
	map_const ROUTE_24_NORTH,							 18, 14
	map_const ROUTE_24_SOUTH,							 25, 12
	map_const ROUTE_24_HIDDEN_CAVE_1F,	                 22, 15
	map_const ROUTE_24_HIDDEN_CAVE_B1F,	                 20, 14
	map_const DUGTRIOS_DEN,		                  		  5,  7
	map_const ROUTE_25_GATE,							  5,  4
	map_const ACROPORA_CAVE_1F,                          19, 15
	map_const ACROPORA_CAVE_2F,                          10,  7
	map_const ACROPORA_CAVE_B1F,                         18, 14

	newgroup                                                      ;  6
	
	map_const SAFARI_ZONE_GATE_1F,							5,  4
	map_const SAFARI_ZONE_GATE_2F,  						4,  4
	map_const SAFARI_ZONE_AREA_1,						   19, 19
	map_const SAFARI_ZONE_AREA_2,						   20, 17
	map_const SAFARI_ZONE_AREA_3,						   15, 15
	map_const SAFARI_ZONE_AREA_4,						   17, 15
	map_const SAFARI_ZONE_AREA_5,						   15, 13
	map_const SAFARI_ZONE_AREA_6,						   12, 10
	map_const SAFARI_ZONE_AREA_1_REST_HOUSE,				5,  4
	map_const SAFARI_ZONE_AREA_2_REST_HOUSE,				5,  4
	map_const SAFARI_ZONE_AREA_3_REST_HOUSE,				5,  4
	map_const SAFARI_ZONE_AREA_4_REST_HOUSE,				5,  4
	map_const SAFARI_ZONE_AREA_5_REST_HOUSE,				5,  4
	map_const SAFARI_ZONE_AREA_6_REST_HOUSE,				5,  4
	map_const CARNATION_ZOO,							   18, 13

	newgroup                                                      ;  7
	
	map_const ROUTE_18,                                    18, 20 ;  4
	map_const ROUTE_18_BARN,                                7,  3 ;  4
	map_const ROUTE_18_FARMHOUSE,                           4,  4 ;  4
	map_const ROUTE_18_CARNATION_GATE,						5,  4
	map_const CARNATION_TOWN,        					   17, 10
	map_const CARNATION_ZOO_GATE,        				    5,  4
	map_const CARNATION_POKECENTER_1F,                      5,  4 ;  1
	map_const WOBBUFFET_HOUSE,   							4,  4
	map_const ROUTE_19,									   27, 12
	map_const ROUTE_20,                                    31, 22
	map_const HEAVY_BALL_HOUSE,                             4,  4 ; 13

	newgroup                                                      ;  8

	map_const ROUTE_3,                                       32, 22 ;  1
	map_const ROUTE_3_PECTINIA_GATE,                          5,  4 ; 12
	map_const PECTINIA_POKECENTER_1F,                         5,  4 ;  1
	map_const CHARCOAL_KILN,                                  4,  4 ;  2
	map_const PECTINIA_MART,                                  6,  4 ;  3
	map_const PECTINIA_GYM,                                   9,  9 ;  5
	map_const PECTINIA_CITY,                                 30, 20 ;  7
	map_const PECTINIA_APARTMENT_LEFT,                        6,  4
	map_const PECTINIA_APARTMENT_LEFT_2F,                     6,  4
	map_const PECTINIA_APARTMENT_LEFT_3F,                     6,  4
	map_const PECTINIA_APARTMENT_RIGHT,                       6,  4
	map_const PECTINIA_APARTMENT_RIGHT_2F,                    6,  4
	map_const PECTINIA_APARTMENT_RIGHT_3F,                    6,  4
	map_const PECTINIA_GYM_SPEECH_HOUSE,                      4,  4
	map_const PECTINIA_EVOLUTION_HOUSE,                       4,  4
	map_const PECTINIA_BIKE_HOUSE,                            4,  4
	map_const PECTINIA_BERRY_HOUSE,                           4,  4
	map_const ROUTE_4_FOREST_GATE,                            5,  4
	map_const ROUTE_4_PECTINIA_GATE,                          5,  4
	map_const PAST_PECTINIA_CITY,                            28, 15
	map_const PAST_PECTINIA_GYM,                              9, 11
	map_const PAST_PECTINIA_APARTMENT_1F,                     6,  4
	map_const PAST_PECTINIA_APARTMENT_2F,                     6,  4
	map_const PAST_PECTINIA_APARTMENT_3F,                     6,  4
	map_const PAST_ROUTE_3,                                  20, 24

	newgroup                                                      ;  9

	map_const EAST_FOREST,                                 30, 15
	map_const FACTORY_1F,                                  16, 12
	map_const FACTORY_B1,                                   7,  8
	map_const FACTORY_2F,                                  14,  8
	map_const FACTORY_BACK,                                 5,  8
	map_const RAIKOU_LAIR,									7,  3

	newgroup                                                      ; 10

	map_const ROUTE_4,                                    25, 24 ; 12
	map_const ROUTE_5,                                    27, 13 ;  1
	map_const ROUTE_6,                                    37, 16 ;  1
	map_const ROUTE_10_NORTH,                             16, 14 ; 14
	map_const RIDGE_VILLAGE,                              27, 12 ;  5
	map_const RIDGE_CAFE,                                  7,  4 ;  6
	map_const RIDGE_GYM,                                   5,  4 ;  7
	map_const RIDGE_POKECENTER_1F,                         5,  4 ; 10
	map_const RIDGE_GYM_B1,							      18, 16 ; 18
	map_const RIDGE_MOVE_TUTOR,                            4,  4
	map_const RIDGE_WEATHER_HOUSE,                         4,  4
	map_const RIDGE_TRADE_HOUSE,                           4,  4
	map_const RIDGE_MAGIKARP_HOUSE,                        4,  4 ; 13
	map_const ROUTE_8_SILK_SCARF_HOUSE,                    4,  4
	map_const ROUTE_4_HIDDEN_CAVE,                         5,  7
	map_const ROUTE_8_HIDDEN_CAVE,                         5,  7

	newgroup                                                      ; 11

	map_const FAVIA_TOWN,                                 18, 17 ;  2
	map_const FAVIA_GYM,                                  16, 22 ;  5
	map_const FAVIA_HAPPINESS_RATER,                       4,  4 ;  5
	map_const PECTINIA_MALL,                     		  17, 10 ;  7
	map_const CARNATION_FLOWER_SHOP,                       4,  4 ;  8
	map_const NAME_RATER,                      		       4,  4 ; 10
	map_const FAVIA_POKECENTER_1F,						   5,  4 ; 20
	map_const ROUTE_8_FAVIA_GATE,                          5,  4 ; 21
	map_const DAY_CARE,                                    4,  4 ; 24
	map_const ROUTE_1_FAVIA_GATE,                          5,  4 ; 13
	map_const FAVIA_MART,                                  6,  4
	map_const ROUTE_11_FAVIA_GATE,                         5,  4
	map_const ROUTE_11_ROUTE_12_GATE,                      5,  4
	map_const PECTINIA_BED_STORE,                    	   7,  3
	map_const PECTINIA_DOLL_STORE,                         8,  4
	map_const PECTINIA_CARPET_STORE,                       5,  3
	map_const PECTINIA_COMIC_STORE,                        6,  6
	map_const PECTINIA_BATTLE_ITEM_STORE,                  7,  4
	map_const PECTINIA_ARCADE,                             8,  9
	map_const PAST_FAVIA_TOWN,							  15, 14
	map_const PAST_FAVIA_INN,							   5,  4

	newgroup                                                      ; 12

	map_const RUGOSA_DEPT_STORE_1F,                        8,  4 ; 11
	map_const RUGOSA_DEPT_STORE_2F,                        8,  4 ; 12
	map_const RUGOSA_DEPT_STORE_3F,                        8,  4 ; 13
	map_const RUGOSA_DEPT_STORE_4F,                        8,  4 ; 14
	map_const RUGOSA_DEPT_STORE_5F,                        8,  4 ; 15
	map_const RUGOSA_DEPT_STORE_6F,                        8,  4 ; 16
	map_const RUGOSA_DEPT_STORE_ELEVATOR,                  2,  2 ; 17
	map_const ROUTE_6_SURFERS_HOUSE,                       4,  4 ; 13
	map_const ROUTE_6_WATERFALL_HOUSE,                     4,  4 ; 13

	newgroup                                                      ; 13
	map_const ROUTE_11,                                    32, 16	
	map_const ROUTE_11_CURSE_HOUSE,                         4,  4	
	map_const ROUTE_11_CLEANSE_TAG_HOUSE,                   4,  4	
	map_const ROUTE_11_HIDDEN_CAVE,                         5,  7
	map_const PAST_ROUTE_11,                               31, 16
	map_const PAST_ROUTE_11_GATE,                           5,  4
	map_const PAST_ROUTE_11_INN,                            5,  4

	newgroup                                                      ; 14
	map_const RUGOSA_DEPT_STORE_ROOF,                      12,  8 ; 18
	map_const HO_OH_CASTLE_ROOF,                            7,  9 ; 18

	newgroup                                                      ; 15
	map_const ROUTE_25,									   	31, 14
	map_const SS_MAKO_1F,								   	12, 11
	map_const SS_MAKO_1F_ROOMS,						   		12,  8
	map_const SS_MAKO_B1F,							   		24,  8
	map_const SS_MAKO_ENGINE_ROOM,							 7,  5
	map_const SS_MAKO_2F,								   	11,  7
	map_const SS_MAKO_2F_ROOMS,						   		25,  8
	map_const SS_MAKO_DECK, 						   		10,  7
	map_const SS_MAKO_LOWER_DECK,						   	10,  5

	newgroup                                                      ; 16

	map_const POKEMON_LEAGUE,							   22, 17
	map_const FAST_EDDIES_HOUSE,						  	4,  4
	map_const VITAMIN_SHOP,						  			6,  4
	map_const POKEMON_LEAGUE_CAFE,                          7,  4 ;  6
	map_const TRAINER_HOUSE,							   14,  5
	map_const POKEMON_LEAGUE_HOTEL_1F,						7,  5
	map_const POKEMON_LEAGUE_HOTEL_2F,						7,  5
	map_const POKEMON_LEAGUE_GATE_1F,						6,  4
	map_const POKEMON_LEAGUE_GATE_2F,						6,  4
	map_const VICTORY_COAST,						   	   23, 19
	map_const VICTORY_PORT,						   		   10, 13
	map_const POKEMON_LEAGUE_POKECENTER_1F,                 8,  5 ;  2
	map_const WILBURS_ROOM,                                 7, 10 ;  3
	map_const REGANS_ROOM,                                  7, 10 ;  5
	map_const BREDES_ROOM,                                  7, 10 ;  4
	map_const AMBERS_ROOM,                                  7, 10 ;  6
	map_const JOSEPHS_ROOM,                                 7, 15 ;  7
	map_const EMILYS_ROOM,                                  7, 15 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	map_const ILEX_FOREST,                                 35, 25 ; 52
	map_const SWORDS_DANCE_HOUSE,							4,  4
	map_const ROUTE_9_FOREST_GATE,                          6,  4 ; 18
	map_const MOON_BALL_CAVE,			                   10,  9
	map_const PAST_ILEX_FOREST,                            37, 21

	newgroup                                                      ; 18

	map_const ROUTE_12,                                    35, 11 ;  2
	map_const ROUTE_12_SHELTER,								4,  4
	map_const ROUTE_13,                                    29, 16 ;  1
	map_const ROUTE_14,                                    31, 14 ;  2
	map_const ROUTE_14_GATE,                                5,  4 ;  2
	map_const ROUTE_14_CAVE_1F, 							9, 11
	map_const ROUTE_14_CAVE_2F,							   10, 10
	map_const ROUTE_10_SOUTH,                              10,  9 ;  3
	map_const ROUTE_3_ROUTE_4_GATE,                         5,  4 ; 13
	map_const ROUTE_5_SUPER_ROD_HOUSE,                      4,  4 ; 14

	newgroup                                                      ; 19

	map_const REMNANT_CAVE_1F,                             17, 12
	map_const REMNANT_CAVE_2F,	                           18, 18
	map_const REMNANT_CAVE_OUTSIDE,	                       23, 16
	map_const REMNANT_CAVE_3F,	                           28,  9
	map_const LOST_LAND,		                           30, 20
	map_const LOST_LAND_CAVE_1F,		                   13, 12
	map_const LOST_LAND_CAVE_B1F,		                   22, 14
	map_const LOST_LAND_HIDDEN_CAVE_1F,					   10, 10
	map_const LOST_LAND_HIDDEN_CAVE_2F,					    9, 11

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                6,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3

	newgroup                                                      ; 21

	map_const ROUTE_6_UNDERGROUND,                         18, 10 ; 53
	map_const ROUTE_8_ROUTE_10_GATE,                        5,  4 ; 26
	map_const LUGIA_CAVE_1F,                                5,  4 ;  3
	map_const LUGIA_CAVE_B1F,                              16, 13 ;  3
	map_const LUGIA_CAVE_B2F,                              22, 16 ;  3
	map_const LUGIA_CAVE_GATE_CHAMBER,                      6,  9 ;  3
	map_const LUGIA_LAIR,                                  14, 12 ;  3
	map_const HO_OH_CASTLE_1F_CENTER_ROOM,                 12, 18 ;  4
	map_const HO_OH_CASTLE_1F_SIDE_ROOMS,                  15, 12 ;  5
	map_const HO_OH_CASTLE_2F,                             19, 13 ;  6
	map_const HO_OH_CASTLE_3F,                             18,  9 ;  7

	newgroup                                                      ; 22

	map_const HEPATICA_TOWN,                               18, 23 ;  3
	map_const HEPATICA_POKECENTER_1F,                       5,  4 ;  6
	map_const HEPATICA_MART,                                6,  4 ;  7
	map_const HEPATICA_LUGIA_SPEECH_HOUSE,                  4,  4 ;  9
	map_const POKE_SEERS_HOUSE,                             4,  4 ; 10
	map_const HEPATICA_CHURCH,                              7, 11
	map_const HEPATICA_GYM,                                9,  9 ;  3
	map_const HEPATICA_GYM_NORTH_CHAMBER,                  9, 10 ;  3
	map_const HEPATICA_GYM_EAST_CHAMBER,                   8, 10 ;  3
	map_const HEPATICA_GYM_WEST_CHAMBER,                   8, 10 ;  3

	newgroup                                                      ; 23

	map_const ROUTE_2_GATE,                                 5,  4 ; 12
	map_const ORCHID_CITY,                                 19, 17
	map_const ORCHID_GYM_1F,		      	                9,  5 ;  2
	map_const ORCHID_GYM_B1F,        	                   10, 14 ;  1
	map_const ORCHID_GYM_LEADER_ROOM,                      	7,  8 ;  2
	map_const ORCHID_POKECENTER_1F,                         5,  4 ;  9
	map_const ORCHID_MART,                                  6,  4 ;  4
	map_const DRAGONBREATH_HOUSE,                           4,  4
	map_const ORCHID_TEACHERS_HOUSE,                        5,  4
	map_const ORCHID_GRANNYS_HOUSE,                        	4,  4
	map_const ORCHID_BLACKBELTS_HOUSE,                     	8,  6
	map_const ORCHID_ENTEI_SHRINE,						   12, 14
	map_const ENTEI_LAIR,									7,  5
	map_const MOLTEN_PEAK_1F,							   14, 10
	map_const MOLTEN_PEAK_B1F,							   23, 17
	map_const MOLTEN_PEAK_B2F,							   21, 24
	map_const ROUTE_22,									   19,  8
	map_const MOLTEN_PEAK_OUTSIDE,						   20, 19
	map_const MOLTEN_PEAK_HIDDEN_CAVE,					    7,  8
	map_const ENTEI_CAVE_1F,							   16, 18
	map_const ENTEI_CAVE_B1F,							   15, 18

	newgroup                                                      ; 24

	map_const ROUTE_1,                                    33, 17 ;  1
	map_const ELKHORN_TOWN,                               12, 11 ;  4
	map_const VIRIDIAN_POKECENTER_1F,                      5,  4 ;  9
	map_const MAPLES_LAB,                                  5,  6 ;  5
	map_const PLAYERS_HOUSE_1F,                            5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                            4,  3 ;  7
	map_const PLAYERS_NEIGHBORS_HOUSE,                     4,  4 ;  8
	map_const ELMS_HOUSE,                                  4,  4 ;  9
	map_const ROUTE_1_ELKHORN_GATE,                        5,  4 ; 13
	map_const PAST_ELKHORN_TOWN,						  15, 11 

	newgroup                                                      ; 25

	map_const ROUTE_26,					                   21, 16
	map_const ROUTE_26_GATE,					           	5,  4
	map_const ROUTE_26_CAVE_1F,			                   13,  5
	map_const ROUTE_26_CAVE_B1F,		                   15, 10
	map_const ROUTE_27_GATE,					           	5,  4
	map_const ROUTE_27,					           		   20, 22
	map_const BATTLE_SUBWAY_TRAIN,							4,  3
	map_const BATTLE_SUBWAY_PLATFORM,					   15,  5
	map_const BATTLE_SUBWAY_BOSS_TRAIN,					    4,  3
	map_const MAPLES_LAB_ELEVATOR,					        2,  2
	map_const BATTLE_SIMULATION,					       10,  7
	map_const BATTLE_SIMULATION_TEST_ROOM,				   20, 10
	map_const DEVELOPERS_HOUSE,				           	    5,  4

	newgroup                                                      ; 26

	map_const ROUTE_30,                                    18, 18 ;  1
	map_const ROUTE_1_PAVONA_GATE,                     		5,  4 ; 14
	map_const ROUTE_2,                                     23, 20 ;  1
	map_const PAVONA_VILLAGE,                              17, 16 ;  3
	map_const PAVONA_GYM_SPEECH_HOUSE,                 		4,  4 ;  6
	map_const PAVONA_INN,                              		5,  4 ;  8
	map_const ROUTE_2_PECTINIA_GATE,                        5,  4 ; 11
	map_const ROUTE_9,                                     20, 13 ; 13
	map_const SUICUNE_LAIR,	    							7,  3
	map_const PAST_PAVONA_VILLAGE,                         16, 10 ;  3
	map_const PAST_ROUTE_1,						  		   26, 16
	map_const PAST_ROUTE_2,                                23, 18 ;  1

	newgroup													  ; 27
	
	map_const PALEROCK_MOUNTAIN_1F,  					   18, 14 ;  1
	map_const PALEROCK_MOUNTAIN_2F,  					   15, 11 ;  2
	map_const PALEROCK_MOUNTAIN_3F,  					    9,  9 ;  3
	map_const PALEROCK_MOUNTAIN_OUTSIDE,				   17, 13 ;  4
	map_const PALEROCK_MOUNTAIN_B1,						   17, 12 ;  5
	map_const PALEROCK_MOUNTAIN_B2,						    6, 11 ;  5
	map_const PALEROCK_MOUNTAIN_B3,						   22, 16 ;  5
	map_const PALEROCK_MOUNTAIN_WATERFALL_CHAMBER,	       15, 13 ;  6
	map_const PALEROCK_MOUNTAIN_STRENGTH_ROOM,		        5,  4 ;  6
	map_const PALEROCK_MOUNTAIN_HIDDEN_CAVE,		       10, 18
	map_const SKARMORYS_DEN,							   10,  9
	map_const HIDDEN_POWER_CAVE,                            6,  5
	map_const UNOWN_CHAMBER_AG,                             6,  7 ; 52
	map_const UNOWN_CHAMBER_HN,                             6,  7 ; 52
	map_const UNOWN_CHAMBER_OU,                             6,  7 ; 52
	map_const UNOWN_CHAMBER_VZ,                             6,  7 ; 52
	map_const TREASURE_HUNTERS_HOUSE,                       7,  5
	map_const VICTORY_COAST_OFFICERS_HOUSE,		   		    5,  4
	
	newgroup

	map_const NORTH_FOREST,					           	   20, 15
	map_const MEWTWO_LAB_1F,						       18, 13
	map_const MEWTWO_LAB_B1F,						       18,  8
	map_const MEWTWO_LAB_2F,						       13,  8
	
	newgroup
	
	map_const SEA_ROUTE_7,                                 14, 15
	map_const ROUTE_28,					           		   16, 16
	map_const ROUTE_28_GATE,					            3,  4
