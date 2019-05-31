; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const NEW_BARK_TOWN     ; 01
	const ROUTE_1           ; 30
	const CHERRYGROVE_CITY  ; 03
	const ROUTE_2           ; 32
	const AZALEA_TOWN       ; 0c
	const ROUTE_3           ; 34
	const ROUTE_4           ; 36
	const ROUTE_5           ; 3a
	const VIOLET_CITY       ; 06
	const ROUTE_6           ; 3c
	const ROUTE_7           ; 3f
	const ROUTE_8           ; 40
	const GOLDENROD_CITY    ; 10
	const ROUTE_10          ; 43
	const DIGLETTS_CAVE     ; 3e
	const CIANWOOD_CITY     ; 21
	const UNION_CAVE        ; 0a
	const ROUTE_9           ; 41
	const ILEX_FOREST       ; 0e
	const ECRUTEAK_CITY     ; 16
	const PAINTERS_FOREST
	const ROUTE_11          ; 49
	const ROUTE_12          ; 4a
	const ROUTE_13          ; 4b
	const ROUTE_14          ; 4c
	const NATIONAL_PARK     ; 13
	const OLIVINE_CITY      ; 1b
	const MAHOGANY_TOWN     ; 24
	const BLACKTHORN_CITY   ; 29
	const ROUTE_15          ; 4d
	const ROUTE_16          ; 4e
	const ROUTE_17          ; 4f
	const ROUTE_18          ; 50
	const ROUTE_19          ; 52
	const ROUTE_20          ; 53
	const ROUTE_30          ; 04
	const LOST_LAND
	const VICTORY_ROAD      ; 58
	const INDIGO_PLATEAU    ; 5a
	const UNDERGROUND_PATH  ; 3b
	const BATTLE_TOWER      ; 1d
	
KANTO_LANDMARK EQU const_value

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
