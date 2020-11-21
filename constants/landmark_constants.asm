; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const NEW_BARK_TOWN     ; 01
	const ROUTE_1           ; 30
	const CHERRYGROVE_CITY  ; 03
	const ROUTE_30          ; 04
	const ROUTE_2           ; 32
	const AZALEA_TOWN       ; 0c
	const ROUTE_3           ; 34
	const ROUTE_4           ; 36
	const VIRIDIAN_FOREST   ; 0e
	const ROUTE_5           ; 3a
	const VIOLET_CITY       ; 06
	const ROUTE_6           ; 3c
	const ROUTE_7           ; 40
	const GOLDENROD_CITY    ; 10
	const ROUTE_8           ; 43
	const DIGLETTS_CAVE     ; 3e
	const CIANWOOD_CITY     ; 21
	const UNION_CAVE        ; 0a
	const ROUTE_9           ; 41
	const ILEX_FOREST       ; 0e
	const ECRUTEAK_CITY     ; 16
	const PAINTERS_FOREST
	const ROUTE_10          ; 49
	const ROUTE_11          ; 4a
	const ROUTE_12          ; 4b
	const ROUTE_13          ; 4c
	const OLIVINE_CITY      ; 1b
	const MAHOGANY_TOWN     ; 24
	const ROUTE_14          ; 50
	const CARNATION_TOWN
	const SAFARI_ZONE       ; 13
	const ROUTE_15          ; 52
	const ROUTE_16          ; 53
	const BLACKTHORN_CITY   ; 29
	const ROUTE_17          ; 53
	const ROUTE_18          ; 53
	const ORCHID_CITY
	const SEA_ROUTE_1       ; 4d
	const SEA_ROUTE_2       ; 4e
	const SEA_ROUTE_3       ; 4f
	const SEA_ROUTE_4       ; 3f
	const SEA_ROUTE_5       ; 3f
	const SEA_ROUTE_6       ; 3f
	const VICTORY_ROAD      ; 58
	const INDIGO_PLATEAU    ; 5a
;	const BATTLE_TOWER      ; 1d
	
KANTO_LANDMARK EQU const_value

	const LOST_LAND

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
