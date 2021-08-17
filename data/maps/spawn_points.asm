spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn PLAYERS_HOUSE_2F,            3,  3
	spawn SS_MAKO_1F_ROOMS,            2,  1

	spawn ELKHORN_TOWN,               17, 12
	spawn PAVONA_VILLAGE,             15, 22
	spawn PECTINIA_CITY,              49,  8
	spawn RIDGE_VILLAGE,               9,  8
	spawn FAVIA_TOWN,                 19, 16
	spawn HEPATICA_TOWN,              11, 20
	spawn ROUTE_9,                    26,  6
	spawn STAGHORN_TOWN,              13, 20
	spawn RUGOSA_COAST,               13, 22
	spawn RUGOSA_CITY,                31, 30
	spawn CARNATION_TOWN,             19,  6
	spawn ACROPORA_CITY,              27, 18
	spawn ORCHID_CITY,                23, 26
	spawn POKEMON_LEAGUE,	          24,  6
	spawn N_A,                        -1, -1
