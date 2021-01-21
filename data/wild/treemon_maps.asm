treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ELKHORN_TOWN,              TREEMON_SET_TOWN
	treemon_map ROUTE_1,                   TREEMON_SET_ROUTE
	treemon_map PAVONA_VILLAGE,            TREEMON_SET_TOWN
	treemon_map ROUTE_2,                   TREEMON_SET_FOREST
	treemon_map PECTINIA_CITY,             TREEMON_SET_CITY
	treemon_map ROUTE_3,                   TREEMON_SET_ROUTE
	treemon_map ROUTE_4,                   TREEMON_SET_LAKE
	treemon_map EAST_FOREST,               TREEMON_SET_FOREST
	treemon_map ROUTE_5,                   TREEMON_SET_ROUTE
	treemon_map RIDGE_VILLAGE,             TREEMON_SET_TOWN
	treemon_map ROUTE_8,                   TREEMON_SET_FOREST
	treemon_map ROUTE_10_NORTH,            TREEMON_SET_FOREST
	treemon_map ROUTE_9,                   TREEMON_SET_ROUTE
	treemon_map ROUTE_11,                  TREEMON_SET_ROUTE
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	treemon_map STAGHORN_TOWN,             TREEMON_SET_TOWN
	treemon_map FAVIA_TOWN,                TREEMON_SET_CITY
	treemon_map HEPATICA_TOWN,             TREEMON_SET_CITY
	treemon_map ROUTE_12,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_13,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_14,                  TREEMON_SET_ROUTE
	treemon_map RUGOSA_CITY,               TREEMON_SET_CITY
	treemon_map ROUTE_18,                  TREEMON_SET_ROUTE
	treemon_map CARNATION_TOWN,            TREEMON_SET_TOWN
	treemon_map ROUTE_19,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_20,                  TREEMON_SET_ROUTE
	treemon_map ACROPORA_CITY,             TREEMON_SET_TOWN
	treemon_map ROUTE_21,                  TREEMON_SET_ROUTE
	db -1

RockMonMaps:
	treemon_map PAVONA_VILLAGE,            TREEMON_SET_ROCK
	treemon_map ROUTE_3,                   TREEMON_SET_ROCK
	treemon_map ROUTE_6,           		   TREEMON_SET_KANTO
	treemon_map SEA_ROUTE_4,       		   TREEMON_SET_KANTO
	treemon_map ROUTE_8,           		   TREEMON_SET_KANTO
	treemon_map RUGOSA_COAST,      		   TREEMON_SET_KANTO
	db -1
