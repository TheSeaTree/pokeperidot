treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ELKHORN_TOWN,              TREEMON_SET_TOWN
	treemon_map ROUTE_1,                   TREEMON_SET_ROUTE
	treemon_map PAVONA_VILLAGE,            TREEMON_SET_TOWN
	treemon_map PAVONA_OASIS,              TREEMON_SET_LAKE
	treemon_map ROUTE_2,                   TREEMON_SET_FOREST
	treemon_map PECTINIA_CITY,             TREEMON_SET_CITY
	treemon_map ROUTE_3,                   TREEMON_SET_ROUTE
	treemon_map ROUTE_4,                   TREEMON_SET_LAKE
	treemon_map EAST_FOREST,               TREEMON_SET_FOREST
	treemon_map ROUTE_5,                   TREEMON_SET_ROUTE
	treemon_map RIDGE_VILLAGE,             TREEMON_SET_TOWN
	treemon_map ROUTE_7,                   TREEMON_SET_FOREST
	treemon_map ROUTE_8_NORTH,             TREEMON_SET_FOREST
	treemon_map ROUTE_9,                   TREEMON_SET_ROUTE
	treemon_map ROUTE_10,                  TREEMON_SET_ROUTE
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	treemon_map STAGHORN_TOWN,             TREEMON_SET_TOWN
	treemon_map FAVIA_TOWN,                TREEMON_SET_CITY
	treemon_map HEPATICA_TOWN,             TREEMON_SET_CITY
	treemon_map ROUTE_11,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_12,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_13,                  TREEMON_SET_ROUTE
	treemon_map RUGOSA_CITY,               TREEMON_SET_CITY
	treemon_map ROUTE_14,                  TREEMON_SET_ROUTE
	treemon_map CARNATION_TOWN,            TREEMON_SET_TOWN
	treemon_map ROUTE_15,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_16,                  TREEMON_SET_ROUTE
	treemon_map ACROPORA_CITY,             TREEMON_SET_TOWN
	treemon_map ROUTE_17,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_21,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_18_NORTH,            TREEMON_SET_FOREST
	treemon_map ROUTE_18_SOUTH,            TREEMON_SET_FOREST
	treemon_map ROUTE_19,	               TREEMON_SET_FOREST
	treemon_map ROUTE_23,	               TREEMON_SET_LAKE
	treemon_map ROUTE_22,	               TREEMON_SET_ROUTE
	treemon_map ROUTE_24,	               TREEMON_SET_FOREST
	treemon_map NORTH_FOREST,              TREEMON_SET_FOREST
	treemon_map PAST_ROUTE_1,			   TREEMON_SET_PAST
	treemon_map PAST_ROUTE_2,			   TREEMON_SET_PAST
	treemon_map PAST_ROUTE_3,			   TREEMON_SET_PAST
	treemon_map PAST_ROUTE_7,			   TREEMON_SET_PAST
	treemon_map PAST_ROUTE_10,			   TREEMON_SET_PAST
	treemon_map PAST_ELKHORN_TOWN,		   TREEMON_SET_TOWN
	treemon_map PAST_PAVONA_VILLAGE,	   TREEMON_SET_LAKE
	treemon_map PAST_FAVIA_TOWN,		   TREEMON_SET_TOWN
	treemon_map PAST_PECTINIA_CITY,		   TREEMON_SET_TOWN
	treemon_map PAST_ILEX_FOREST,		   TREEMON_SET_FOREST
	treemon_map GENESIS_ISLAND,	   		   TREEMON_SET_FOREST
	db -1

RockMonMaps:
	treemon_map PAVONA_VILLAGE,            TREEMON_SET_ROCK
	treemon_map ROUTE_3,                   TREEMON_SET_ROCK
	treemon_map ROUTE_4,                   TREEMON_SET_ROCK
	treemon_map ROUTE_5,           		   TREEMON_SET_KANTO
	treemon_map ROUTE_6,           		   TREEMON_SET_KANTO
	treemon_map SEA_ROUTE_4,       		   TREEMON_SET_KANTO
	treemon_map ROUTE_7,           		   TREEMON_SET_KANTO
	treemon_map RUGOSA_COAST,      		   TREEMON_SET_KANTO
	treemon_map FACTORY_1F,      		   TREEMON_SET_ROCK
	treemon_map FACTORY_2F,      		   TREEMON_SET_ROCK
	treemon_map HEPATICA_TOWN,     		   TREEMON_SET_ROCK
	treemon_map PALEROCK_MOUNTAIN_1F,	   TREEMON_SET_ROCK
	treemon_map REMNANT_CAVE_3F,    	   TREEMON_SET_ROCK
	treemon_map ROUTE_12,		    	   TREEMON_SET_ROCK
	treemon_map ROUTE_23_CAVE_B1F,    	   TREEMON_SET_ROCK
	treemon_map UNION_CAVE_1F,      	   TREEMON_SET_ROCK
	treemon_map PAST_PAVONA_VILLAGE,	   TREEMON_SET_ROCK
	db -1
