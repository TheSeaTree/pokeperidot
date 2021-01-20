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
	flypoint VIOLET,       VIOLET_CITY
	flypoint FAVIA,	       FAVIA_TOWN
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint ROUTE_9,      ROUTE_9
	flypoint ECRUTEAK,     ECRUTEAK_CITY
	flypoint MAHOGANY,     MAHOGANY_TOWN
	flypoint CARNATION,	   CARNATION_TOWN
	flypoint BLACKTHORN,   BLACKTHORN_CITY
	flypoint ORCHID,       ORCHID_CITY

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint INDIGO,       INDIGO_PLATEAU
	db -1
