map_attributes: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapAttributes::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: offset of the target map relative to the current map
;    (x offset for east/west, y offset for north/south)
; LEGACY: Support for old connection macro
if _NARG == 6
	connection \1, \2, \3, (\4) - (\5)
else
; Calculate tile offsets for source (current) and target maps
_src = 0
_tgt = (\4) + 3
if _tgt < 0
_src = -_tgt
_tgt = 0
endc
if "\1" == "north"
_blk = \3_WIDTH * (\3_HEIGHT + -3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "south"
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "west"
_blk = (\3_WIDTH * _src) + \3_WIDTH + -3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 + -6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif "\1" == "east"
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc
else
fail "Invalid direction for 'connection'."
endc
	map_id \3
	dw \2_Blocks + _blk
	dw wOverworldMapBlocks + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMapBlocks + _win
endc
ENDM

	map_attributes NewBarkTown, NEW_BARK_TOWN, $05, SOUTH
	connection south, Route1, ROUTE_1, -1

	map_attributes CherrygroveCity, CHERRYGROVE_CITY, $05, SOUTH | EAST
	connection south, Route30, ROUTE_30, 0
	connection east, Route2, ROUTE_2, 7

	map_attributes VioletCity, VIOLET_CITY, $05, NORTH | SOUTH
	connection north, Route6, ROUTE_6,  -7
	connection south, Route5, ROUTE_5, -11

	map_attributes AzaleaTown, AZALEA_TOWN, $05, 0

	map_attributes CianwoodCity, CIANWOOD_CITY, $71, 0

	map_attributes GoldenrodCity, GOLDENROD_CITY, $05, 0

	map_attributes OlivineCity, OLIVINE_CITY, $35, 0

	map_attributes EcruteakCity, ECRUTEAK_CITY, $05, NORTH
	connection north, PaintersForest, PAINTERS_FOREST, 5
	
	map_attributes PaintersForest, PAINTERS_FOREST, $05, SOUTH
	connection south, EcruteakCity, ECRUTEAK_CITY, -5

	map_attributes MahoganyTown, MAHOGANY_TOWN, $71, 0

	map_attributes BlackthornCity, BLACKTHORN_CITY, $71, 0

	map_attributes SilverCaveOutside, SILVER_CAVE_OUTSIDE, $2c, 0

	map_attributes Route30, ROUTE_30, $05, NORTH
	connection north, CherrygroveCity, CHERRYGROVE_CITY, 0

	map_attributes Route2, ROUTE_2, $05, WEST
	connection west, CherrygroveCity, CHERRYGROVE_CITY, -7

	map_attributes Route1, ROUTE_1, $05, NORTH
	connection north, NewBarkTown, NEW_BARK_TOWN, 1

	map_attributes Route17, ROUTE_17, $43, 0

	map_attributes Route16, ROUTE_16, $35, 0

	map_attributes Route7, ROUTE_7, $35, WEST | EAST
	connection west, Route8, ROUTE_8, 2
	connection east, Route6, ROUTE_6, 1

	map_attributes Route15, ROUTE_15, $0f, 0

	map_attributes Route18, ROUTE_18, $43, 0
	
	map_attributes Route14, ROUTE_14, $43, 0

	map_attributes Route13, ROUTE_13, $43, 0

	map_attributes Route12, ROUTE_12, $43, 0

	map_attributes Route11, ROUTE_11, $05, 0

	map_attributes Route6, ROUTE_6, $35, SOUTH | WEST
	connection south, VioletCity, VIOLET_CITY, 7
	connection west, Route7, ROUTE_7, -1

	map_attributes Route5, ROUTE_5, $05, NORTH | SOUTH
	connection north, VioletCity, VIOLET_CITY, 11
	connection south, Route4, ROUTE_4, -6

	map_attributes Route3, ROUTE_3, $05, 0

	map_attributes Route4, ROUTE_4, $05, NORTH
	connection north, Route5, ROUTE_5, 6

	map_attributes Route8, ROUTE_8, $05, NORTH | EAST
	connection north, Route16, ROUTE_16, 6
	connection east, Route7, ROUTE_7, -2

	map_attributes Route10North, ROUTE_10_NORTH, $05, 0

	map_attributes Route10South, ROUTE_10_SOUTH, $2c, 0

	map_attributes NationalPark, NATIONAL_PARK, $00, 0
	map_attributes NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $00, 0
	map_attributes RadioTower1F, RADIO_TOWER_1F, $00, 0
	map_attributes RadioTower2F, RADIO_TOWER_2F, $00, 0
	map_attributes RadioTower3F, RADIO_TOWER_3F, $00, 0
	map_attributes RadioTower4F, RADIO_TOWER_4F, $00, 0
	map_attributes RadioTower5F, RADIO_TOWER_5F, $00, 0
	map_attributes UnionCave1F, UNION_CAVE_1F, $09, 0
	map_attributes UnionCaveB1F, UNION_CAVE_B1F, $09, 0
	map_attributes UnionCaveB2F, UNION_CAVE_B2F, $09, 0
	map_attributes MahoganyMart1F, MAHOGANY_MART_1F, $00, 0
	map_attributes IlexForest, ILEX_FOREST, $05, 0
	map_attributes Route6Underground, ROUTE_6_UNDERGROUND, $00, 0
	map_attributes MountMortar1FOutside, MOUNT_MORTAR_1F_OUTSIDE, $09, 0
	map_attributes MountMortar1FInside, MOUNT_MORTAR_1F_INSIDE, $09, 0
	map_attributes MountMortar2FInside, MOUNT_MORTAR_2F_INSIDE, $09, 0
	map_attributes MountMortarB1F, MOUNT_MORTAR_B1F, $09, 0
	map_attributes OlivinePokecenter1F, OLIVINE_POKECENTER_1F, $00, 0
	map_attributes OlivineGym, OLIVINE_GYM, $00, 0
	map_attributes OlivineMart, OLIVINE_MART, $00, 0
	map_attributes MahoganyGym, MAHOGANY_GYM, $00, 0
	map_attributes MahoganyPokecenter1F, MAHOGANY_POKECENTER_1F, $00, 0
	map_attributes DiglettsCave, DIGLETTS_CAVE, $09, 0
	map_attributes MountMoon, MOUNT_MOON, $09, 0
	map_attributes UndergroundPath, UNDERGROUND_PATH, $00, 0
	map_attributes PalerockCave1F, PALEROCK_CAVE_1F, $09, 0
	map_attributes PalerockCaveB1F, PALEROCK_CAVE_B1F, $09, 0
	map_attributes VictoryRoad, VICTORY_ROAD, $1d, 0
	map_attributes EcruteakPokecenter1F, ECRUTEAK_POKECENTER_1F, $00, 0
	map_attributes EcruteakMart, ECRUTEAK_MART, $00, 0
	map_attributes EcruteakGym, ECRUTEAK_GYM, $00, 0
	map_attributes BlackthornGym1F, BLACKTHORN_GYM_1F, $00, 0
	map_attributes BlackthornGym2F, BLACKTHORN_GYM_2F, $00, 0
	map_attributes BlackthornMart, BLACKTHORN_MART, $00, 0
	map_attributes BlackthornPokecenter1F, BLACKTHORN_POKECENTER_1F, $00, 0
	map_attributes MoveDeletersHouse, MOVE_DELETERS_HOUSE, $00, 0
	map_attributes AzaleaPokecenter1F, AZALEA_POKECENTER_1F, $00, 0
	map_attributes CharcoalKiln, CHARCOAL_KILN, $00, 0
	map_attributes AzaleaMart, AZALEA_MART, $00, 0
	map_attributes KurtsHouse, KURTS_HOUSE, $00, 0
	map_attributes AzaleaGym, AZALEA_GYM, $00, 0
	map_attributes VioletMart, VIOLET_MART, $00, 0
	map_attributes VioletGym, VIOLET_GYM, $00, 0
	map_attributes VioletPokecenter1F, VIOLET_POKECENTER_1F, $00, 0
	map_attributes GoldenrodGym, GOLDENROD_GYM, $00, 0
	map_attributes GoldenrodBikeShop, GOLDENROD_BIKE_SHOP, $00, 0
	map_attributes GoldenrodHappinessRater, GOLDENROD_HAPPINESS_RATER, $00, 0
	map_attributes BillsFamilysHouse, BILLS_FAMILYS_HOUSE, $00, 0
	map_attributes GoldenrodMagnetTrainStation, GOLDENROD_MAGNET_TRAIN_STATION, $00, 0
	map_attributes GoldenrodFlowerShop, GOLDENROD_FLOWER_SHOP, $00, 0
	map_attributes GoldenrodPPSpeechHouse, GOLDENROD_PP_SPEECH_HOUSE, $00, 0
	map_attributes GoldenrodNameRater, GOLDENROD_NAME_RATER, $00, 0
	map_attributes GoldenrodDeptStore1F, GOLDENROD_DEPT_STORE_1F, $00, 0
	map_attributes GoldenrodDeptStore2F, GOLDENROD_DEPT_STORE_2F, $00, 0
	map_attributes GoldenrodDeptStore3F, GOLDENROD_DEPT_STORE_3F, $00, 0
	map_attributes GoldenrodDeptStore4F, GOLDENROD_DEPT_STORE_4F, $00, 0
	map_attributes GoldenrodDeptStore5F, GOLDENROD_DEPT_STORE_5F, $00, 0
	map_attributes GoldenrodDeptStore6F, GOLDENROD_DEPT_STORE_6F, $00, 0
	map_attributes GoldenrodDeptStoreElevator, GOLDENROD_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes GoldenrodDeptStoreRoof, GOLDENROD_DEPT_STORE_ROOF, $24, 0
	map_attributes GoldenrodGameCorner, GOLDENROD_GAME_CORNER, $00, 0
	map_attributes GoldenrodPokecenter1F, GOLDENROD_POKECENTER_1F, $00, 0
	map_attributes IlexForestAzaleaGate, ILEX_FOREST_AZALEA_GATE, $00, 0
	map_attributes DayCare, DAY_CARE, $00, 0
	map_attributes Route3AzaleaGate, ROUTE_3_AZALEA_GATE, $00, 0
	map_attributes Route6SurfersHouse, ROUTE_6_SURFERS_HOUSE, $00, 0
	map_attributes IndigoPlateauPokecenter1F, INDIGO_PLATEAU_POKECENTER_1F, $00, 0
	map_attributes WillsRoom, WILLS_ROOM, $00, 0
	map_attributes KogasRoom, KOGAS_ROOM, $00, 0
	map_attributes BrunosRoom, BRUNOS_ROOM, $00, 0
	map_attributes KarensRoom, KARENS_ROOM, $00, 0
	map_attributes LancesRoom, LANCES_ROOM, $00, 0
	map_attributes HallOfFame, HALL_OF_FAME, $00, 0
	map_attributes Route3Route4Gate, ROUTE_3_ROUTE_4_GATE, $00, 0
	map_attributes Route5SuperRodHouse, ROUTE_5_SUPER_ROD_HOUSE, $00, 0
	map_attributes SilverCavePokecenter1F, SILVER_CAVE_POKECENTER_1F, $00, 0
	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes Route16FuchsiaSpeechHouse, ROUTE_16_FUCHSIA_SPEECH_HOUSE, $00, 0
	map_attributes Route16Gate, ROUTE_16_GATE, $00, 0
	map_attributes NewBarkForestGate, NEW_BARK_FOREST_GATE, $00, 0
	map_attributes Route8Route10Gate, ROUTE_8_ROUTE_10_GATE, $00, 0
	map_attributes ManiasHouse, MANIAS_HOUSE, $00, 0
	map_attributes CianwoodGym, CIANWOOD_GYM, $00, 0
	map_attributes CianwoodPokecenter1F, CIANWOOD_POKECENTER_1F, $00, 0
	map_attributes CianwoodMart, CIANWOOD_MART, $00, 0
	map_attributes CianwoodPhotoStudio, CIANWOOD_PHOTO_STUDIO, $00, 0
	map_attributes CianwoodLugiaSpeechHouse, CIANWOOD_LUGIA_SPEECH_HOUSE, $00, 0
	map_attributes PokeSeersHouse, POKE_SEERS_HOUSE, $00, 0
	map_attributes GoldenrodMart, GOLDENROD_MART, $00, 0
	map_attributes ViridianPokecenter1F, VIRIDIAN_POKECENTER_1F, $00, 0
	map_attributes Route2Gate, ROUTE_2_GATE, $00, 0
	map_attributes ElmsLab, ELMS_LAB, $00, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes PlayersNeighborsHouse, PLAYERS_NEIGHBORS_HOUSE, $00, 0
	map_attributes ElmsHouse, ELMS_HOUSE, $00, 0
	map_attributes Route1NewBarkGate, ROUTE_1_NEW_BARK_GATE, $00, 0
	map_attributes Route1GoldenrodGate, ROUTE_1_GOLDENROD_GATE, $00, 0
	map_attributes Route5UndergroundPathEntrance, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, $00, 0
	map_attributes Route1CherrygroveGate, ROUTE_1_CHERRYGROVE_GATE, $00, 0
	map_attributes Route5CleanseTagHouse, ROUTE_5_CLEANSE_TAG_HOUSE, $00, 0
	map_attributes CherrygroveMart, CHERRYGROVE_MART, $00, 0
	map_attributes CherrygrovePokecenter1F, CHERRYGROVE_POKECENTER_1F, $00, 0
	map_attributes CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $00, 0
	map_attributes GuideGentsHouse, GUIDE_GENTS_HOUSE, $00, 0
	map_attributes CherrygroveInn, CHERRYGROVE_INN, $00, 0
	map_attributes Route2AzaleaGate, ROUTE_2_AZALEA_GATE, $00, 0
	map_attributes VioletGymB1, VIOLET_GYM_B1, $0A, 0
	map_attributes PalerockMountain1F, PALEROCK_MOUNTAIN_1F, $09, 0
	map_attributes PalerockMountain2F, PALEROCK_MOUNTAIN_2F, $09, 0
	map_attributes PalerockMountain3F, PALEROCK_MOUNTAIN_3F, $09, 0
	map_attributes PalerockMountainOutside, PALEROCK_MOUNTAIN_OUTSIDE, $09, 0
	map_attributes PalerockMountainB1, PALEROCK_MOUNTAIN_B1, $09, 0
	map_attributes PalerockMountainStrengthRoom, PALEROCK_MOUNTAIN_STRENGTH_ROOM, $09, 0
	map_attributes Route9, ROUTE_9, $2c, 0
	map_attributes Route9ForestGate, ROUTE_9_FOREST_GATE, $00, 0
	map_attributes EcruteakForestGate, ECRUTEAK_FOREST_GATE, $00, 0
	map_attributes Route8GoldenrodGate, ROUTE_8_GOLDENROD_GATE, $00, 0
	map_attributes EastForest, EAST_FOREST, $05, 0
	map_attributes Route4ForestGate, ROUTE_4_FOREST_GATE, $00, 0
	map_attributes Route4AzaleaGate, ROUTE_4_AZALEA_GATE, $00, 0
	map_attributes HiddenPowerCave, HIDDEN_POWER_CAVE, $09, 0
	map_attributes Factory1F, FACTORY_1F, $00, 0
	map_attributes FactoryB1, FACTORY_B1, $00, 0
	map_attributes FactoryBack, FACTORY_BACK, $00, 0
	map_attributes CianwoodChurch, CIANWOOD_CHURCH, $00, 0
	map_attributes AzaleaApartmentLeft, AZALEA_APARTMENT_LEFT, $00, 0
	map_attributes AzaleaApartmentRight, AZALEA_APARTMENT_RIGHT, $00, 0
	map_attributes AzaleaGymSpeechHouse, AZALEA_GYM_SPEECH_HOUSE, $00, 0
	map_attributes AzaleaEvolutionHouse, AZALEA_EVOLUTION_HOUSE, $00, 0
	map_attributes AzaleaBikeHouse, AZALEA_BIKE_HOUSE, $00, 0
	map_attributes AzaleaBerryHouse, AZALEA_BERRY_HOUSE, $00, 0
	map_attributes VioletMoveTutor, VIOLET_MOVE_TUTOR, $00, 0
	map_attributes VioletWeatherHouse, VIOLET_WEATHER_HOUSE, $00, 0
	map_attributes VioletTradeHouse, VIOLET_TRADE_HOUSE, $00, 0
	map_attributes Route8SilkScarfHouse, ROUTE_8_SILK_SCARF_HOUSE, $00, 0
	map_attributes PaintersHouse, PAINTERS_HOUSE, $00, 0
	map_attributes Route11GoldenrodGate, ROUTE_11_GOLDENROD_GATE, $00, 0	
	map_attributes CianwoodCave1F, CIANWOOD_CAVE_1F, $09, 0
	map_attributes CianwoodCaveB1F, CIANWOOD_CAVE_B1F, $09, 0
	map_attributes CianwoodCaveB2F, CIANWOOD_CAVE_B2F, $09, 0
	map_attributes OverlookMaze, OVERLOOK_MAZE, $05, 0
