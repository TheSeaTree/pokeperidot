landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  68,  84, ElkhornTownName
	landmark  68,  96, Route1Name
	landmark  68, 108, PavonaVillageName
	landmark  60, 108, PavonaOasisName
	landmark  84, 116, Route2Name
	landmark 100, 124, PectiniaCityName
	landmark 108, 116, Route3Name
	landmark 124, 100, Route4Name
	landmark 132, 108, OrientemForestName
	landmark 128,  92, Route5Name
	landmark 132,  84, RidgeVillageName
	landmark 128,  76, Route6Name
	landmark 100,  80, Route7Name
	landmark  84,  84, FaviaTownName
	landmark 108,  84, Route8Name
	landmark 100, 110, MachopsDenName
	landmark 100, 108, PalerockMountainName
	landmark 100, 100, HepaticaTownName
	landmark  60, 108, PavonaPassName
	landmark  52,  92, Route9Name
	landmark  52,  84, OccidentForestName
	landmark  52,  68, StaghornTownName
	landmark  52,  60, PaintersForestName
	landmark  76,  76, Route10Name
	landmark  64,  68, Route11Name
	landmark  68,  58, Route12Name
	landmark  72,  44, Route13Name
	landmark  72,  42, BoneyardName
	landmark  84,  44, RugosaCoastName
	landmark  84,  36, RugosaCityName
	landmark  64,  36, Route14Name
	landmark  52,  36, CarnationTownName
	landmark  44,  36, SafariZoneName
	landmark  44,  44, Route15Name
	landmark  36,  52, Route16Name
	landmark  36,  60, AcroporaCityName
	landmark  42,  68, Route17Name
	landmark  28,  68, Route18Name
	landmark  28,  76, Route19Name
	landmark  26,  60, MoltenPeakName
	landmark  20,  60, Route20Name
	landmark  20,  52, OrchidCityName
	landmark  96,  44, SeaRoute1Name
	landmark 100,  58, SeaRoute2Name
	landmark 106,  58, RemnantCaveName
	landmark 116,  44, SeaRoute3Name
	landmark 116,  68, SeaRoute4Name
	landmark 132,  60, SeaRoute5Name
	landmark 132,  44, SeaRoute6Name
	landmark 140,  44, Route21Name
	landmark 140,  36, Route22Name
	landmark 148,  36, Route23Name
	landmark 132,  36, VictoryRoadName
	landmark 121,  36, SeaRoute7Name
	landmark 116,  24, Route24Name
	landmark 116,  22, BoreasForestName
	landmark 132,  28, PokemonLeagueName
	landmark 116,  34, FastShipName
	landmark  -8,  -8, LostLandName
	landmark  -8,  -8, PastMapName
	landmark  -8,  -8, PastMapName ; BATTLE_SIM
	landmark  -8,  -8, GenesisIslandName

ElkhornTownName:      db "ELKHORN¯TOWN@"
PavonaVillageName:    db "PAVONA¯VILLAGE@"
RidgeVillageName:     db "RIDGE¯VILLAGE@"
PectiniaCityName:     db "PECTINIA¯CITY@"
FaviaTownName:        db "FAVIA¯TOWN@"
StaghornTownName:     db "STAGHORN¯TOWN@"
PaintersForestName:   db "PAINTER'S¯FOREST@"
RugosaCoastName:      db "RUGOSA¯COAST@"
PalerockMountainName: db "PALEROCK¯MOUNTAIN@"
HepaticaTownName:     db "HEPATICA¯TOWN@"
RugosaCityName:       db "RUGOSA¯CITY@"
CarnationTownName:    db "CARNATION¯TOWN@"
AcroporaCityName:     db "ACROPORA¯CITY@"
OrchidCityName:       db "ORCHID¯CITY@"
PavonaPassName:       db "PAVONA¯PASS@"
PokemonLeagueName:    db "#MON¯LEAGUE@"
VictoryRoadName:      db "VICTORY¯PORT@"
MtMoonName:           db "MT.MOON@"
SafariZoneName:       db "SAFARI ZONE@"
SeafoamIslandsName:   db "SEAFOAM¯ISLANDS@"
BoneyardName:		  db "THE¯BONEYARD@"
Route1Name:           db "ROUTE 1@"
Route2Name:           db "ROUTE 2@"
Route3Name:           db "ROUTE 3@"
Route4Name:           db "ROUTE 4@"
Route5Name:           db "ROUTE 5@"
Route6Name:           db "ROUTE 6@"
Route7Name:           db "ROUTE 7@"
Route8Name:           db "ROUTE 8@"
Route9Name:           db "ROUTE 9@"
Route10Name:          db "ROUTE 10@"
Route11Name:          db "ROUTE 11@"
Route12Name:          db "ROUTE 12@"
Route13Name:          db "ROUTE 13@"
Route14Name:          db "ROUTE 14@"
Route15Name:          db "ROUTE 15@"
Route16Name:          db "ROUTE 16@"
Route17Name:          db "ROUTE 17@"
Route18Name:          db "ROUTE 18@"
Route19Name:          db "ROUTE 19@"
Route20Name:          db "ROUTE 20@"
Route21Name:          db "ROUTE 21@"
Route22Name:          db "ROUTE 22@"
Route23Name:          db "ROUTE 23@"
Route24Name:          db "ROUTE 24@"
SeaRoute1Name:        db "SEA ROUTE 1@"
SeaRoute2Name:        db "SEA ROUTE 2@"
SeaRoute3Name:        db "SEA ROUTE 3@"
SeaRoute4Name:        db "SEA ROUTE 4@"
SeaRoute5Name:        db "SEA ROUTE 5@"
SeaRoute6Name:        db "SEA ROUTE 6@"
SeaRoute7Name:        db "SEA ROUTE 7@"
PavonaOasisName:      db "PAVONA¯OASIS@"
CarnationZooName:     db "CARNATION¯ZOO@"
DarkCaveName:         db "DARK CAVE@"
OccidentForestName:   db "OCCIDENT¯FOREST@"
BoreasForestName:     db "BOREAS¯FOREST@"
FastShipName:         db "S.S. MAKO@"
OrientemForestName:   db "ORIENTEM¯FOREST@"
MachopsDenName:       db "MACHOP'S¯DEN@"
RemnantCaveName:	  db "REMNANT¯CAVE@"
MoltenPeakName:		  db "MOLTEN¯PEAK@"
GenesisIslandName:	  db "GENESIS¯ISLAND@"
UndergroundName:      db "UNDERGROUND@"
LostLandName:		  db "LOST LAND@"
PastMapName:		  db "NO SIGNAL@"
BattleTowerName:      db "BATTLE¯TOWER@"
SpecialMapName:       db "SPECIAL@"
