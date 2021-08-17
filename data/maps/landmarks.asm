landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  68,  84, NewBarkTownName
	landmark  68,  96, Route1Name
	landmark  68, 108, CherrygroveCityName
	landmark  60, 108, Route30Name ;Oasis
	landmark  84, 116, Route2Name
	landmark 100, 124, AzaleaTownName
	landmark 108, 116, Route3Name
	landmark 124, 100, Route4Name
	landmark 132, 108, ViridianForestName
	landmark 128,  92, Route5Name
	landmark 132,  84, VioletCityName
	landmark 128,  76, Route6Name
	landmark 100,  80, Route7Name ; ROUTE_8
	landmark  84,  84, GoldenrodCityName
	landmark 108,  84, Route8Name ; ROUTE_10_NORTH
	landmark 100, 110, DiglettsCaveName
	landmark 100, 108, PalerockMountainName
	landmark 100, 100, CianwoodCityName
	landmark  60, 108, UnionCaveName
	landmark  52,  92, Route9Name
	landmark  52,  84, IlexForestName
	landmark  52,  68, EcruteakCityName
	landmark  52,  60, PaintersForestName
	landmark  76,  76, Route10Name
	landmark  64,  68, Route11Name
	landmark  68,  58, Route12Name
	landmark  72,  44, Route13Name
	landmark  72,  42, BoneyardName
	landmark  84,  44, OlivineCityName
	landmark  84,  36, MahoganyTownName
	landmark  64,  36, Route14Name ; ROUTE_18
	landmark  52,  36, CarnationTownName
	landmark  44,  36, SafariZoneName
	landmark  44,  44, Route15Name ; ROUTE_19
	landmark  36,  52, Route16Name ; ROUTE_20
	landmark  36,  60, BlackthornCityName
	landmark  42,  68, Route17Name ; ROUTE_21
	landmark  26,  60, Route20Name ; ROUTE_24
	landmark  26,  60, Route21Name ; ROUTE_25
	landmark  28,  60, MoltenPeakName
	landmark  20,  60, Route18Name ; ROUTE_22
	landmark  20,  52, OrchidCityName
	landmark  96,  44, SeaRoute1Name
	landmark 100,  58, SeaRoute2Name
	landmark 106,  58, RemnantCaveName
	landmark 116,  44, SeaRoute3Name
	landmark 116,  68, SeaRoute4Name
	landmark 132,  60, SeaRoute5Name
	landmark 132,  44, SeaRoute6Name
	landmark 140,  40, Route19Name ; ROUTE_23
	landmark 140,  36, VictoryRoadName
	landmark 140,  28, PokemonLeagueName
	landmark 118,  34, FastShipName
	landmark  -8,  -8, LostLandName

NewBarkTownName:      db "ELKHORN¯TOWN@"
CherrygroveCityName:  db "PAVONA¯VILLAGE@"
VioletCityName:       db "RIDGE¯VILLAGE@"
AzaleaTownName:       db "PECTINIA¯CITY@"
GoldenrodCityName:    db "FAVIA¯TOWN@"
EcruteakCityName:     db "STAGHORN¯TOWN@"
PaintersForestName:   db "PAINTER'S¯FOREST@"
OlivineCityName:      db "RUGOSA¯COAST@"
PalerockMountainName: db "PALEROCK¯MOUNTAIN@"
CianwoodCityName:     db "HEPATICA¯TOWN@"
MahoganyTownName:     db "RUGOSA¯CITY@"
CarnationTownName:    db "CARNATION¯TOWN@"
BlackthornCityName:   db "ACROPORA¯CITY@"
OrchidCityName:       db "ORCHID¯CITY@"
LakeOfRageName:       db "LAKE OF¯RAGE@"
SilverCaveName:       db "SILVER CAVE@"
SproutTowerName:      db "SPROUT¯TOWER@"
RuinsOfAlphName:      db "RUINS¯OF ALPH@"
UnionCaveName:        db "PAVONA¯PASS@"
SlowpokeWellName:     db "SLOWPOKE¯WELL@"
RadioTowerName:       db "RADIO TOWER@"
PowerPlantName:       db "POWER PLANT@"
NationalParkName:     db "NATIONAL¯PARK@"
TinTowerName:         db "TIN TOWER@"
LighthouseName:       db "LIGHTHOUSE@"
WhirlIslandsName:     db "WHIRL¯ISLANDS@"
MtMortarName:         db "MT.MORTAR@"
DragonsDenName:       db "DRAGON'S¯DEN@"
IcePathName:          db "ICE PATH@"
NotApplicableName:    db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PokemonLeagueName:    db "#MON¯LEAGUE@"
VictoryRoadName:      db "VICTORY¯PORT@"
MtMoonName:           db "MT.MOON@"
RockTunnelName:       db "ROCK TUNNEL@"
LavRadioTowerName:    db "LAV¯RADIO TOWER@"
SilphCoName:          db "SILPH CO.@"
SafariZoneName:       db "SAFARI ZONE@"
SeafoamIslandsName:   db "SEAFOAM¯ISLANDS@"
PokemonMansionName:   db "#MON¯MANSION@"
CeruleanCaveName:     db "CERULEAN¯CAVE@"
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
SeaRoute1Name:        db "SEA ROUTE 1@"
SeaRoute2Name:        db "SEA ROUTE 2@"
SeaRoute3Name:        db "SEA ROUTE 3@"
SeaRoute4Name:        db "SEA ROUTE 4@"
SeaRoute5Name:        db "SEA ROUTE 5@"
SeaRoute6Name:        db "SEA ROUTE 6@"
Route30Name:	      db "PAVONA¯OASIS@"
CarnationZooName:     db "CARNATION¯ZOO@"
DarkCaveName:         db "DARK CAVE@"
IlexForestName:       db "OCCIDENT¯FOREST@"
BurnedTowerName:      db "BURNED¯TOWER@"
FastShipName:         db "FAST SHIP@"
ViridianForestName:   db "ORIENTEM¯FOREST@"
DiglettsCaveName:     db "MACHOP'S¯DEN@"
RemnantCaveName:	  db "REMNANT¯CAVE@"
MoltenPeakName:		  db "MOLTEN¯PEAK@"
UndergroundName:      db "UNDERGROUND@"
LostLandName:		  db "LOST LAND@"
BattleTowerName:      db "BATTLE¯TOWER@"
SpecialMapName:       db "SPECIAL@"
