; See data/maps/scenes.asm for which maps have scene variables.
; Each scene_script and coord_event is associated with a current scene ID.

; Scene variables default to 0.
SCENE_DEFAULT  EQU 0
; Often a map will have a one-time default event for scene 0, and switch to a
; do-nothing scene 1 when the event finishes.
SCENE_FINISHED EQU 1

; wPokecenter2FSceneID
	const_def 1
	const SCENE_POKECENTER2F_LEAVE_TRADE_CENTER       ; 1
	const SCENE_POKECENTER2F_LEAVE_COLOSSEUM          ; 2
	const SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE       ; 3
	const SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM  ; 4
	const SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM ; 5

; wRoute1SceneID
	const_def 1
	const SCENE_ROUTE_1_NOTHING             ; 1

; wCeruleanGymSceneID
	const_def
	const SCENE_CERULEANGYM_NOTHING        ; 0
	const SCENE_CERULEANGYM_GRUNT_RUNS_OUT ; 1

; wRoute25SceneID
	const_def
	const SCENE_ROUTE25_NOTHING     ; 0
	const SCENE_ROUTE25_MISTYS_DATE ; 1

; wLancesRoomSceneID
	const_def 1
	const SCENE_LANCESROOM_APPROACH_LANCE ; 1

; wMaplesLabSceneID
	const_def 1
	const SCENE_MAPLESLAB_CANT_LEAVE            ; 1
	const SCENE_MAPLESLAB_NOTHING               ; 2
	const SCENE_MAPLESLAB_MEET_OFFICER          ; 3
	const SCENE_MAPLESLAB_UNUSED                ; 4
	const SCENE_MAPLESLAB_AIDE_GIVES_POTION     ; 5
	const SCENE_MAPLESLAB_AIDE_GIVES_POKE_BALLS ; 6

; wRoute29SceneID
	const_def
	const SCENE_ROUTE29_NOTHING        ; 0
	const SCENE_ROUTE29_CATCH_TUTORIAL ; 1

; wCherrygroveCitySceneID
	const_def
	const SCENE_PAVONAVILLAGE_NOTHING    ; 0
	const SCENE_PAVONAVILLAGE_MEET_RIVAL ; 1
	const SCENE_PAVONAVILLAGE_FINISHED   ; 2

; wRoute32SceneID
	const_def 1
	const SCENE_ROUTE32_OFFER_SLOWPOKETAIL ; 1
	const SCENE_ROUTE32_NOTHING            ; 2

; wRoute35NationalParkGateSceneID
	const_def
	const SCENE_ROUTE35NATIONALPARKGATE_NOTHING             ; 0
	const SCENE_ROUTE35NATIONALPARKGATE_UNUSED              ; 1
	const SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY ; 2

; wRoute36SceneID
	const_def
	const SCENE_ROUTE36_NOTHING ; 0
	const SCENE_ROUTE36_SUICUNE ; 1

; wRoute36NationalParkGateSceneID
	const_def
	const SCENE_ROUTE36NATIONALPARKGATE_NOTHING             ; 0
	const SCENE_ROUTE36NATIONALPARKGATE_UNUSED              ; 1
	const SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY ; 2

; wVioletCitySceneID
	const_def
	const SCENE_RIDGEVILLAGE_NOTHING              ; 0
	const SCENE_RIDGEVILLAGE_DEFEATED_RIVAL       ; 1	
	const SCENE_RIDGEVILLAGE_RUNNING_SHOES
	
; wAzaleaTownSceneID
	const_def
	const SCENE_PECTINIACITY_NOTHING              ; 0
	const SCENE_PECTINIACITY_DEFEATED_RIVAL       ; 1
	const SCENE_PECTINIACITY_KURT_RETURNS_GS_BALL ; 2

; wGoldenrodCitySceneID
	const_def
	const SCENE_GOLDENRODCITY_NOTHING              ; 0
	const SCENE_GOLDENRODCITY_DEFEATED_RIVAL ; 1

; wRoute42SceneID
	const_def
	const SCENE_ROUTE42_NOTHING ; 0
	const SCENE_ROUTE42_SUICUNE ; 1

; wCianwoodCitySceneID
	const_def
	const SCENE_HEPATICATOWN_NOTHING            ; 0
	const SCENE_HEPATICATOWN_SUICUNE_AND_EUSINE ; 1

;wBattleTowerOutsideSceneID
	const_def
	const SCENE_PALEROCK3F_NOTHING              ; 0
	const SCENE_PALEROCK3F_OPEN       ; 1	
	
; wBurnedTower1FSceneID
	const_def 1
	const SCENE_BURNEDTOWER1F_RIVAL_BATTLE ; 1
	const SCENE_BURNEDTOWER1F_NOTHING      ; 2

; wRadioTower5FSceneID
	const_def 1
	const SCENE_RADIOTOWER5F_ROCKET_BOSS ; 1
	const SCENE_RADIOTOWER5F_NOTHING     ; 2

; wRuinsOfAlphOutsideSceneID
	const_def
	const SCENE_RUINSOFALPHOUTSIDE_NOTHING       ; 0
	const SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX ; 1

; wRuinsOfAlphResearchCenterSceneID
	const_def
	const SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING       ; 0
	const SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX ; 1

; wRuinsOfAlphInnerChamberSceneID
	const_def
	const SCENE_RUINSOFALPHINNERCHAMBER_NOTHING          ; 0
	const SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE ; 1

; wMahoganyMart1FSceneID
	const_def
	const SCENE_MAHOGANYMART1F_NOTHING               ; 0
	const SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS ; 1

; wTeamRocketBaseB2FSceneID
	const_def 1
	const SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS ; 1
	const SCENE_TEAMROCKETBASEB2F_ELECTRODES  ; 2
	const SCENE_TEAMROCKETBASEB2F_NOTHING     ; 3

; wTeamRocketBaseB3FSceneID
	const_def 1
	const SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER ; 1
	const SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS     ; 2
	const SCENE_TEAMROCKETBASEB3F_NOTHING         ; 3

; wDragonsDenB1FSceneID
	const_def
	const SCENE_DRAGONSDENB1F_NOTHING        ; 0
	const SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM ; 1

; wOlivinePortSceneID
	const_def 1
	const SCENE_OLIVINEPORT_LEAVE_SHIP ; 1

; wVermilionPortSceneID
	const_def 1
	const SCENE_VERMILIONPORT_LEAVE_SHIP ; 1

; wFastShip1FSceneID
	const_def 1
	const SCENE_FASTSHIP1F_ENTER_SHIP   ; 1
	const SCENE_FASTSHIP1F_MEET_GRANDPA ; 2
	
; wPalerockMountain3FSceneID
	const_def 1
	const SCENE_PALEROCK_DEFAULT ; 1
	const SCENE_PALEROCK_BUTTON_PRESSED ; 2
	
; wEcruteakGymSceneID
	const_def
	const SCENE_STAGHORNGYM_INTRO
	const SCENE_STAGHORNGYM_MON_1
	const SCENE_STAGHORNGYM_MON_2
	const SCENE_STAGHORNGYM_MON_3
	const SCENE_STAGHORNGYM_MON_4
	const SCENE_STAGHORNGYM_DONE

; wEcruteakCitySceneID
	const_def
	const SCENE_STAGHORNTOWN_GYMRESET
	const SCENE_STAGHORNTOWN_DONE
	
; wBurglarHideoutB1FSceneID
	const_def
	const SCENE_BURGLARHIDEOUTB1F_DEFAULT
	const SCENE_BURGLARHIDEOUTB1F_RIVAL
	const SCENE_BURGLARHIDEOUTB1F_FINISHED
	
; wUnownChamberHNSceneID
	const_def
	const SCENE_UNOWNCHAMBERHN_DEFAULT
	const SCENE_UNOWNCHAMBERHN_FINISHED
	
; wUnownChamberOUSceneID
	const_def
	const SCENE_UNOWNCHAMBEROU_DEFAULT
	const SCENE_UNOWNCHAMBEROU_FINISHED

; wUnownChamberVZSceneID
	const_def
	const SCENE_UNOWNCHAMBERVZ_DEFAULT
	const SCENE_UNOWNCHAMBERVZ_FINISHED

; wRoute18FarmhouseSceneID
	const_def
	const SCENE_ROUTE18FARMHOUSE_DEFAULT
	const SCENE_ROUTE18FARMHOUSE_FINISHED

; wCarnationZooSceneID
	const_def
	const SCENE_CARNATIONZOO_DEFAULT
	const SCENE_CARNATIONZOO_FINISHED

; wOrchidGym1FSceneID
	const_def
	const SCENE_ORCHIDGYM1F_DEFAULT
	const SCENE_ORCHIDGYM1F_FINISHED

; wBattleSubwayPlatformSceneID
	const_def
	const SCENE_BATTLESUBWAYPLATFORM_DEFAULT
	const SCENE_BATTLESUBWAYPLATFORM_FINISHED
	const SCENE_BATTLESUBWAYPLATFORM_SUSPEND
