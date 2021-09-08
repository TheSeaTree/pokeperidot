flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint ELKHORN,      ELKHORN_TOWN
	flypoint PAVONA,  	   PAVONA_VILLAGE
	flypoint PECTINIA,     PECTINIA_CITY
	flypoint RIDGE,        RIDGE_VILLAGE
	flypoint FAVIA,	       FAVIA_TOWN
	flypoint HEPATICA,     HEPATICA_TOWN
	flypoint ROUTE_9,      ROUTE_9
	flypoint STAGHORN,     STAGHORN_TOWN
	flypoint RUGOSA,       RUGOSA_CITY
	flypoint CARNATION,	   CARNATION_TOWN
	flypoint ACROPORA,     ACROPORA_CITY
	flypoint ORCHID,       ORCHID_CITY

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint LEAGUE,       POKEMON_LEAGUE
	db -1
