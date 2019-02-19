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
	map_const OLIVINE_GYM,                                  5,  8 ;  2
	map_const OLIVINE_MART,                                 6,  4 ;  8
	map_const OLIVINE_CITY,                                20, 18 ; 14

	newgroup                                                      ;  2

	map_const MAHOGANY_GYM,                                 5,  9 ;  2
	map_const MAHOGANY_POKECENTER_1F,                       5,  4 ;  3
	map_const MAHOGANY_TOWN,                               10,  9 ;  7

	newgroup                                                      ;  3

	map_const NATIONAL_PARK,                               20, 27 ; 15
	map_const NATIONAL_PARK_BUG_CONTEST,                   20, 27 ; 16
	map_const RADIO_TOWER_1F,                               9,  4 ; 17
	map_const RADIO_TOWER_2F,                               9,  4 ; 18
	map_const RADIO_TOWER_3F,                               9,  4 ; 19
	map_const RADIO_TOWER_4F,                               9,  4 ; 20
	map_const RADIO_TOWER_5F,                               9,  4 ; 21
	map_const UNION_CAVE_1F,                               23, 10 ; 37
	map_const UNION_CAVE_B1F,                              11,  7 ; 38
	map_const UNION_CAVE_B2F,                              10, 18 ; 39
	map_const MAHOGANY_MART_1F,                             4,  4 ; 48
	map_const ILEX_FOREST,                                 37, 24 ; 52
	map_const MOUNT_MORTAR_1F_OUTSIDE,                     20, 18 ; 57
	map_const MOUNT_MORTAR_1F_INSIDE,                      20, 27 ; 58
	map_const MOUNT_MORTAR_2F_INSIDE,                      20, 18 ; 59
	map_const MOUNT_MORTAR_B1F,                            20, 18 ; 60
	map_const DIGLETTS_CAVE,                               13,  9 ; 84
	map_const MOUNT_MOON,                                  15,  9 ; 85
	map_const UNDERGROUND_PATH,                             3, 14 ; 86
	map_const PALEROCK_CAVE_1F,                            13, 16 ; 87
	map_const PALEROCK_CAVE_B1F,                           22, 15 ; 88
	map_const VICTORY_ROAD,                                10, 36 ; 91

	newgroup                                                      ;  4

	map_const ECRUTEAK_POKECENTER_1F,                       5,  4 ;  3
	map_const ECRUTEAK_MART,                                6,  4 ;  6
	map_const ECRUTEAK_GYM,                                 5,  9 ;  7
	map_const ECRUTEAK_CITY,                               20, 15 ;  9
	map_const ECRUTEAK_FOREST_GATE,                         6,  4 ; 10
	map_const PAINTERS_FOREST,                              7,  7
	map_const PAINTERS_HOUSE,                               4,  4

	newgroup                                                      ;  5

	map_const BLACKTHORN_GYM_1F,                            5,  9 ;  1
	map_const BLACKTHORN_GYM_2F,                            5,  9 ;  2
	map_const BLACKTHORN_MART,                              6,  4 ;  5
	map_const BLACKTHORN_POKECENTER_1F,                     5,  4 ;  6
	map_const MOVE_DELETERS_HOUSE,                          4,  4 ;  7
	map_const BLACKTHORN_CITY,                             20, 18 ; 10

	newgroup                                                      ;  6


	newgroup                                                      ;  7

	map_const ROUTE_9,                                     19, 13 ; 13
	map_const ROUTE_10_NORTH,                              16, 14 ; 14
	map_const ROUTE_9_FOREST_GATE,                          6,  4 ; 18

	newgroup                                                      ;  8

	map_const ROUTE_3,                                     32, 22 ;  1
	map_const ROUTE_3_AZALEA_GATE,                          5,  4 ; 12
	map_const AZALEA_POKECENTER_1F,                         5,  4 ;  1
	map_const CHARCOAL_KILN,                                4,  4 ;  2
	map_const AZALEA_MART,                                  6,  4 ;  3
	map_const KURTS_HOUSE,                                  8,  4 ;  4
	map_const AZALEA_GYM,                                   9, 10 ;  5
	map_const AZALEA_TOWN,                                 30, 20 ;  7
	map_const AZALEA_APARTMENT_LEFT,                        6,  4
	map_const AZALEA_APARTMENT_RIGHT,                       6,  4
	map_const AZALEA_GYM_SPEECH_HOUSE,                      4,  4
	map_const AZALEA_EVOLUTION_HOUSE,                       4,  4
	map_const AZALEA_BIKE_HOUSE,                            4,  4
	map_const AZALEA_BERRY_HOUSE,                           4,  4
	map_const ROUTE_4_FOREST_GATE,                          5,  4
	map_const ROUTE_4_AZALEA_GATE,                          5,  4
	map_const EAST_FOREST,                                 30, 15
	map_const FACTORY_1F,                                  11, 11
	map_const FACTORY_B1,                                   6,  8
	map_const FACTORY_BACK,                                 5,  8

	newgroup                                                      ;  9

	newgroup                                                      ; 10

	map_const ROUTE_4,                                     25, 24 ; 12
	map_const ROUTE_5,                                     28, 13 ;  1
	map_const ROUTE_6,                                     24, 11 ;  1
	map_const ROUTE_7,                                     28, 14 ;  1
	map_const ROUTE_8,                                     20, 37 ;  1
	map_const VIOLET_CITY,                                 28, 13 ;  5
	map_const VIOLET_MART,                                  6,  4 ;  6
	map_const VIOLET_GYM,                                   5,  4 ;  7
	map_const VIOLET_POKECENTER_1F,                         5,  4 ; 10
	map_const VIOLET_GYM_B1,							   17, 17 ; 18
	map_const VIOLET_MOVE_TUTOR,                            4,  4
	map_const VIOLET_WEATHER_HOUSE,                         4,  4
	map_const VIOLET_TRADE_HOUSE,                         4,  4
	map_const ROUTE_8_SILK_SCARF_HOUSE,                     4,  4

	newgroup                                                      ; 11

	map_const GOLDENROD_CITY,                              18, 17 ;  2
	map_const GOLDENROD_GYM,                               15, 20 ;  3
	map_const GOLDENROD_BIKE_SHOP,                          4,  4 ;  4
	map_const GOLDENROD_HAPPINESS_RATER,                    4,  4 ;  5
	map_const BILLS_FAMILYS_HOUSE,                          4,  4 ;  6
	map_const GOLDENROD_MAGNET_TRAIN_STATION,              10,  9 ;  7
	map_const GOLDENROD_FLOWER_SHOP,                        4,  4 ;  8
	map_const GOLDENROD_PP_SPEECH_HOUSE,                    4,  4 ;  9
	map_const GOLDENROD_NAME_RATER,                         4,  4 ; 10
	map_const GOLDENROD_DEPT_STORE_1F,                      8,  4 ; 11
	map_const GOLDENROD_DEPT_STORE_2F,                      8,  4 ; 12
	map_const GOLDENROD_DEPT_STORE_3F,                      8,  4 ; 13
	map_const GOLDENROD_DEPT_STORE_4F,                      8,  4 ; 14
	map_const GOLDENROD_DEPT_STORE_5F,                      8,  4 ; 15
	map_const GOLDENROD_DEPT_STORE_6F,                      8,  4 ; 16
	map_const GOLDENROD_DEPT_STORE_ELEVATOR,                2,  2 ; 17
	map_const GOLDENROD_DEPT_STORE_ROOF,                    8,  4 ; 18
	map_const GOLDENROD_GAME_CORNER,                       10,  7 ; 19
	map_const GOLDENROD_POKECENTER_1F,                      5,  4 ; 20
	map_const ROUTE_8_GOLDENROD_GATE,                       5,  4 ; 21
	map_const ILEX_FOREST_AZALEA_GATE,                      5,  4 ; 22
	map_const DAY_CARE,                                     4,  4 ; 24
	map_const ROUTE_1_GOLDENROD_GATE,                       5,  4 ; 13
	map_const GOLDENROD_MART,                               6,  4

	newgroup                                                      ; 12

	map_const ROUTE_11,                                    20,  9 ;  2
	map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13

	newgroup                                                      ; 13

	newgroup                                                      ; 14

	newgroup                                                      ; 15

	newgroup                                                      ; 16

	map_const INDIGO_PLATEAU_POKECENTER_1F,                 9,  7 ;  2
	map_const WILLS_ROOM,                                   5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const BRUNOS_ROOM,                                  5,  9 ;  5
	map_const KARENS_ROOM,                                  5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	map_const ROUTE_13,                                    30,  9 ;  1
	map_const ROUTE_14,                                    10, 18 ;  2
	map_const ROUTE_15,                                    20,  9 ;  3
	map_const ROUTE_18,                                    10,  9 ;  4

	newgroup                                                      ; 18

	map_const ROUTE_12,                                    10, 27 ;  2
	map_const ROUTE_10_SOUTH,                              10,  9 ;  3
	map_const ROUTE_3_ROUTE_4_GATE,                         5,  4 ; 13
	map_const ROUTE_5_SUPER_ROD_HOUSE,                      4,  4 ; 14

	newgroup                                                      ; 19

	map_const SILVER_CAVE_OUTSIDE,                         20, 18 ;  2
	map_const SILVER_CAVE_POKECENTER_1F,                    5,  4 ;  3

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3

	newgroup                                                      ; 21

	map_const ROUTE_7_UNDERGROUND,                         18, 10 ; 53
	map_const ROUTE_16,                                    24, 14 ;  2
	map_const ROUTE_17,                                    10, 45 ;  3
	map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE,                4,  4 ; 23
	map_const ROUTE_16_GATE,                                5,  4 ; 24
	map_const NEW_BARK_FOREST_GATE,                         5,  4 ; 25
	map_const ROUTE_8_ROUTE_10_GATE,                       5,  4 ; 26

	newgroup                                                      ; 22

	map_const CIANWOOD_CITY,                               17, 25 ;  3
	map_const MANIAS_HOUSE,                                 4,  4 ;  4
	map_const CIANWOOD_GYM,                                16, 20 ;  5
	map_const CIANWOOD_POKECENTER_1F,                       5,  4 ;  6
	map_const CIANWOOD_MART,                                6,  4 ;  7
	map_const CIANWOOD_PHOTO_STUDIO,                        4,  4 ;  8
	map_const CIANWOOD_LUGIA_SPEECH_HOUSE,                  4,  4 ;  9
	map_const POKE_SEERS_HOUSE,                             4,  4 ; 10
	map_const CIANWOOD_CHURCH,                              7,  9

	newgroup                                                      ; 23

	map_const VIRIDIAN_POKECENTER_1F,                       5,  4 ;  9
	map_const ROUTE_2_GATE,                                 5,  4 ; 12

	newgroup                                                      ; 24

	map_const ROUTE_1,                                     33, 17 ;  1
	map_const NEW_BARK_TOWN,                               14, 11 ;  4
	map_const ELMS_LAB,                                     5,  6 ;  5
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  7
	map_const PLAYERS_NEIGHBORS_HOUSE,                      4,  4 ;  8
	map_const ELMS_HOUSE,                                   4,  4 ;  9
	map_const ROUTE_1_NEW_BARK_GATE,                        5,  4 ; 13

	newgroup                                                      ; 25

	map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13
	map_const ROUTE_5_CLEANSE_TAG_HOUSE,                    4,  4 ; 15

	newgroup                                                      ; 26

	map_const ROUTE_30,                                    21, 11 ;  1
	map_const ROUTE_1_CHERRYGROVE_GATE,                     5,  4 ; 14
	map_const ROUTE_2,                                     23, 20 ;  1
	map_const CHERRYGROVE_CITY,                            17, 14 ;  3
	map_const CHERRYGROVE_MART,                             6,  4 ;  4
	map_const CHERRYGROVE_POKECENTER_1F,                    5,  4 ;  5
	map_const CHERRYGROVE_GYM_SPEECH_HOUSE,                 4,  4 ;  6
	map_const GUIDE_GENTS_HOUSE,                            4,  4 ;  7
	map_const CHERRYGROVE_INN,                              5,  4 ;  8
	map_const ROUTE_2_AZALEA_GATE,                          5,  4 ; 11

	newgroup													  ; 27
	
	map_const PALEROCK_MOUNTAIN_1F,  					   18, 14 ;  1
	map_const PALEROCK_MOUNTAIN_2F,  					   16, 11 ;  2
	map_const PALEROCK_MOUNTAIN_3F,  					    9,  9 ;  3
	map_const PALEROCK_MOUNTAIN_OUTSIDE,				   18, 13 ;  4
	map_const PALEROCK_MOUNTAIN_B1,						   17, 12 ;  5
	map_const PALEROCK_MOUNTAIN_STRENGTH_ROOM,		        5,  4 ;  6
	map_const HIDDEN_POWER_CAVE,                            6,  5
	