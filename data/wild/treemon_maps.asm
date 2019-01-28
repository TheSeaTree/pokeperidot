treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map NEW_BARK_TOWN,             TREEMON_SET_TOWN
	treemon_map ROUTE_1,                   TREEMON_SET_ROUTE
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_TOWN
	treemon_map ROUTE_2,                   TREEMON_SET_FOREST
	treemon_map AZALEA_TOWN,               TREEMON_SET_CANYON
	treemon_map ROUTE_3,                   TREEMON_SET_ROUTE
	treemon_map ROUTE_4,                   TREEMON_SET_LAKE
	treemon_map EAST_FOREST,               TREEMON_SET_FOREST
	treemon_map ROUTE_5,                   TREEMON_SET_ROUTE
	treemon_map VIOLET_CITY,               TREEMON_SET_TOWN
	treemon_map ROUTE_8,                   TREEMON_SET_FOREST
	treemon_map ROUTE_10_NORTH,            TREEMON_SET_FOREST
	treemon_map ROUTE_9,                   TREEMON_SET_ROUTE
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	treemon_map ECRUTEAK_CITY,             TREEMON_SET_TOWN
	db -1

RockMonMaps:
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_ROCK
	treemon_map ROUTE_3,                   TREEMON_SET_ROCK
	treemon_map ROUTE_7,           		   TREEMON_SET_KANTO
	treemon_map ROUTE_8,           		   TREEMON_SET_KANTO
	db -1
