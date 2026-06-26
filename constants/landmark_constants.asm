; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const ELKHORN_TOWN      ; 01
	const ROUTE_1           ; 02
	const PAVONA_VILLAGE    ; 03
	const ROUTE_2           ; 04
	const PECTINIA_CITY     ; 05
	const ROUTE_3           ; 06
	const ROUTE_4           ; 07
	const ORIENTEM_FOREST   ; 08
	const ABANDONED_LAB     ; 09
	const ROUTE_5           ; 0a
	const RIDGE_VILLAGE     ; 0b
	const ROUTE_6           ; 0c
	const ROUTE_7           ; 0d
	const FAVIA_TOWN        ; 0e
	const ROUTE_8           ; 0f
	const DIGLETTS_CAVE     ; 10
	const PALEROCK_MOUNTAIN ; 11
	const HEPATICA_TOWN     ; 12
	const PAVONA_PASS       ; 13
	const PAVONA_OASIS      ; 14
	const ROUTE_9           ; 15
	const OCCIDENT_FOREST   ; 16
	const STAGHORN_TOWN     ; 17
	const PAINTERS_FOREST   ; 18
	const ROUTE_10          ; 19
	const ROUTE_11          ; 1a
	const ROUTE_12          ; 1b
	const ROUTE_13          ; 1c
	const BONEYARD          ; 1d
	const RUGOSA_COAST      ; 1e
	const RUGOSA_CITY       ; 1f
	const ROUTE_14          ; 20
	const CARNATION_TOWN	; 21
	const SAFARI_ZONE       ; 22
	const ROUTE_15          ; 23
	const ROUTE_16          ; 24
	const ACROPORA_CITY     ; 25
	const ROUTE_17          ; 26
	const ROUTE_18          ; 27
	const ROUTE_19          ; 28
	const GILDED_HALL       ; 29
	const MOLTEN_PEAK		; 2a
	const ROUTE_20          ; 2b
	const ORCHID_CITY		; 2c
	const SEA_ROUTE_1       ; 2d
	const SEA_ROUTE_2       ; 2e
	const REMNANT_CAVE      ; 2f
	const SEA_ROUTE_3       ; 30
	const SEA_ROUTE_4       ; 31
	const TIDAL_PASS		; 32
	const SEA_ROUTE_5       ; 33
	const ARGENT_DEPTHS     ; 34
	const SEA_ROUTE_6       ; 35
	const ROUTE_21       	; 36
	const ROUTE_22			; 37
	const ROUTE_23			; 38
	const VICTORY_ROAD      ; 39
	const SEA_ROUTE_7       ; 3a
	const ROUTE_24			; 3b
	const BOREAS_FOREST		; 3c
	const BOREAS_COMPOUND	; 3d
	const POKEMON_LEAGUE    ; 3e
	
KANTO_LANDMARK EQU const_value

	const FAST_SHIP			; 3f
	const LOST_LAND			; 40
	const THE_PAST			; 41
	const BATTLE_SIM		; 42
	const GENESIS_ISLAND	; 43

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
