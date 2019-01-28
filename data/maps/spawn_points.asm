spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn PLAYERS_HOUSE_2F,            3,  3
	spawn VIRIDIAN_POKECENTER_1F,      5,  3

	spawn NEW_BARK_TOWN,              21, 12
	spawn CHERRYGROVE_CITY,           24, 16
	spawn VIOLET_CITY,                 9, 10
	spawn AZALEA_TOWN,                49,  8
	spawn CIANWOOD_CITY,              19, 22
	spawn GOLDENROD_CITY,             19, 16
	spawn OLIVINE_CITY,               13, 22
	spawn ECRUTEAK_CITY,               9, 20
	spawn MAHOGANY_TOWN,              15, 14
	spawn BLACKTHORN_CITY,            21, 30
	spawn SILVER_CAVE_OUTSIDE,        23, 20
	spawn N_A,                        -1, -1
