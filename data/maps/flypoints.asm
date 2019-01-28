flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint NEW_BARK,     NEW_BARK_TOWN
	flypoint CHERRYGROVE,  CHERRYGROVE_CITY
	flypoint VIOLET,       VIOLET_CITY
	flypoint AZALEA,       AZALEA_TOWN
	flypoint GOLDENROD,    GOLDENROD_CITY
	flypoint ECRUTEAK,     ECRUTEAK_CITY
	flypoint OLIVINE,      OLIVINE_CITY
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint MAHOGANY,     MAHOGANY_TOWN
	flypoint BLACKTHORN,   BLACKTHORN_CITY

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint INDIGO,       INDIGO_PLATEAU
	db -1
