; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const ELKHORN_TOWN      ; 01
	const ROUTE_1           ; 30
	const PAVONA_VILLAGE    ; 03
	const PAVONA_OASIS      ; 04
	const ROUTE_2           ; 32
	const PECTINIA_CITY     ; 0c
	const ROUTE_3           ; 34
	const ROUTE_4           ; 36
	const ORIENTEM_FOREST   ; 0e
	const ROUTE_5           ; 3a
	const RIDGE_VILLAGE     ; 06
	const ROUTE_6           ; 3c
	const ROUTE_7           ; 40
	const FAVIA_TOWN        ; 10
	const ROUTE_8           ; 43
	const DIGLETTS_CAVE     ; 3e
	const PALEROCK_MOUNTAIN
	const HEPATICA_TOWN     ; 21
	const PAVONA_PASS       ; 0a
	const ROUTE_9           ; 41
	const OCCIDENT_FOREST   ; 0e
	const STAGHORN_TOWN     ; 16
	const PAINTERS_FOREST
	const ROUTE_10          ; 49
	const ROUTE_11          ; 4a
	const ROUTE_12          ; 4b
	const ROUTE_13          ; 4c
	const BONEYARD          ; 4c
	const RUGOSA_COAST      ; 1b
	const RUGOSA_CITY       ; 24
	const ROUTE_14          ; 50
	const CARNATION_TOWN
	const SAFARI_ZONE       ; 13
	const ROUTE_15          ; 52
	const ROUTE_16          ; 53
	const ACROPORA_CITY     ; 29
	const ROUTE_17          ; 53
	const ROUTE_20          ; 53
	const ROUTE_21          ; 53
	const MOLTEN_PEAK
	const ROUTE_18          ; 53
	const ORCHID_CITY
	const SEA_ROUTE_1       ; 4d
	const SEA_ROUTE_2       ; 4e
	const REMNANT_CAVE      ; 4e
	const SEA_ROUTE_3       ; 4f
	const SEA_ROUTE_4       ; 3f
	const SEA_ROUTE_5       ; 3f
	const SEA_ROUTE_6       ; 3f
	const ROUTE_19       	; 3f
	const ROUTE_22
	const ROUTE_23
	const VICTORY_ROAD      ; 58
	const SEA_ROUTE_7       ; 3f
	const ROUTE_24
	const BOREAS_FOREST
	const POKEMON_LEAGUE    ; 5a
	
KANTO_LANDMARK EQU const_value

	const FAST_SHIP
	const LOST_LAND
	const THE_PAST
	const BATTLE_SIM
	const GENESIS_ISLAND

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
