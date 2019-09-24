scene_var: MACRO
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,                               wPokecenter2FSceneID
	scene_var TRADE_CENTER,                                wTradeCenterSceneID
	scene_var COLOSSEUM,                                   wColosseumSceneID
	scene_var ROUTE_16_GATE,                               wRoute16GateSceneID
	scene_var ROUTE_8_ROUTE_10_GATE,                       wRoute17Route18GateSceneID
	scene_var INDIGO_PLATEAU_POKECENTER_1F,                wIndigoPlateauPokecenter1FSceneID
	scene_var WILLS_ROOM,                                  wWillsRoomSceneID
	scene_var KOGAS_ROOM,                                  wKogasRoomSceneID
	scene_var BRUNOS_ROOM,                                 wBrunosRoomSceneID
	scene_var KARENS_ROOM,                                 wKarensRoomSceneID
	scene_var LANCES_ROOM,                                 wLancesRoomSceneID
	scene_var HALL_OF_FAME,                                wHallOfFameSceneID
	scene_var NEW_BARK_TOWN,                               wNewBarkTownSceneID
	scene_var ELMS_LAB,                                    wElmsLabSceneID
	scene_var PLAYERS_HOUSE_1F,                            wPlayersHouse1FSceneID
	scene_var CHERRYGROVE_CITY,                            wCherrygroveCitySceneID
	scene_var AZALEA_TOWN,                                 wAzaleaTownSceneID
	scene_var GOLDENROD_CITY,                              wGoldenrodGymSceneID
	scene_var GOLDENROD_MAGNET_TRAIN_STATION,              wGoldenrodMagnetTrainStationSceneID
	scene_var GOLDENROD_POKECENTER_1F,                     wGoldenrodPokecenter1FSceneID
	scene_var OLIVINE_CITY,                                wOlivineCitySceneID
	scene_var AZALEA_GYM,                                  wRoute34SceneID ; unused
	scene_var VIOLET_GYM,                                  wVioletGymSceneID
	scene_var ECRUTEAK_POKECENTER_1F,                      wEcruteakPokecenter1FSceneID
	scene_var POWER_PLANT_1F_B,                            wMahoganyTownSceneID
	scene_var CIANWOOD_CITY,                               wCianwoodCitySceneID
	scene_var PALEROCK_MOUNTAIN_3F,                        wBattleTowerOutsideSceneID ; unused
	scene_var MOUNT_MOON,                                  wMountMoonSceneID
	scene_var RADIO_TOWER_5F,                              wRadioTower5FSceneID
	scene_var MAHOGANY_MART_1F,                            wMahoganyMart1FSceneID
	scene_var VICTORY_ROAD,                                wVictoryRoadSceneID
	scene_var ROUTE_1,                                     wRoute1SceneID
	scene_var VIOLET_CITY,								   wVioletCitySceneID
	scene_var ECRUTEAK_GYM,                                wEcruteakGymSceneID
	scene_var ECRUTEAK_CITY,                               wEcruteakCitySceneID
	scene_var ROUTE_12_SHELTER,							   wRoute12ShelterSceneID
	scene_var LOST_LAND,								   wLostLandSceneID
	scene_var FLUTE_MASTER_HOUSE,						   wFluteMasterHouseSceneID
	db -1
