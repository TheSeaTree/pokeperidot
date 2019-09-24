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
	landmark  68, 116, Route30Name ;Oasis
	landmark  84, 116, Route2Name
	landmark 100, 124, AzaleaTownName
	landmark 108, 116, Route3Name
	landmark 124, 100, Route4Name
	landmark 128,  92, Route5Name
	landmark 132,  84, VioletCityName
	landmark 128,  76, Route6Name
	landmark 100,  80, Route7Name ; ROUTE_8
	landmark  84,  84, GoldenrodCityName
	landmark 108,  84, Route8Name ; ROUTE_10_NORTH
	landmark 100, 108, DiglettsCaveName
	landmark 100, 100, CianwoodCityName
	landmark  60, 108, UnionCaveName
	landmark  52,  92, Route9Name
	landmark  52,  84, IlexForestName
	landmark  52,  68, EcruteakCityName
	landmark  52,  60, PaintersForestName
	landmark  76,  76, Route11Name
	landmark  64,  68, Route12Name
	landmark  68,  58, Route13Name
	landmark  72,  44, Route14Name
	landmark  84,  44, OlivineCityName
	landmark  84,  36, MahoganyTownName
	landmark  64,  36, Route15Name ; ROUTE_18
	landmark  52,  36, CarnationTownName
	landmark  44,  36, SafariZoneName
	landmark  44,  44, Route16Name ; ROUTE_19
	landmark  36,  52, Route17Name ; ROUTE_20
	landmark  36,  60, BlackthornCityName
	landmark  42,  68, Route18Name ; ROUTE_21
	landmark  20,  52, OrchidCityName
	landmark  96,  44, Route19Name ; ROUTE_15
	landmark 100,  58, Route20Name ; ROUTE_16
	landmark 114,  36, Route21Name ; ROUTE_17
	landmark 114,  68, Route22Name ; ROUTE_7
	landmark 116,  60, LostLandName
	landmark 140,  36, VictoryRoadName
	landmark 140,  28, IndigoPlateauName
	landmark   0,   0, UndergroundName
	landmark  20,  20, BattleTowerName

NewBarkTownName:     db "ELKHORN¯TOWN@"
CherrygroveCityName: db "PAVONA¯VILLAGE@"
VioletCityName:      db "RIDGE¯VILLAGE@"
AzaleaTownName:      db "PECTINIA¯CITY@"
GoldenrodCityName:   db "FAVIA¯TOWN@"
EcruteakCityName:    db "STAGHORN¯TOWN@"
PaintersForestName:  db "PAINTER'S¯FOREST@"
OlivineCityName:     db "CYNARIA¯COAST@"
CianwoodCityName:    db "HELIO¯TOWN@"
MahoganyTownName:    db "CYNARIA¯CITY@"
CarnationTownName:   db "CARNATION¯TOWN@"
BlackthornCityName:  db "ACROPORA¯CITY@"
OrchidCityName:      db "ORCHID¯CITY@"
LakeOfRageName:      db "LAKE OF¯RAGE@"
SilverCaveName:      db "SILVER CAVE@"
SproutTowerName:     db "SPROUT¯TOWER@"
RuinsOfAlphName:     db "RUINS¯OF ALPH@"
UnionCaveName:       db "UNION CAVE@"
SlowpokeWellName:    db "SLOWPOKE¯WELL@"
RadioTowerName:      db "RADIO TOWER@"
PowerPlantName:      db "POWER PLANT@"
NationalParkName:    db "NATIONAL¯PARK@"
TinTowerName:        db "TIN TOWER@"
LighthouseName:      db "LIGHTHOUSE@"
WhirlIslandsName:    db "WHIRL¯ISLANDS@"
MtMortarName:        db "MT.MORTAR@"
DragonsDenName:      db "DRAGON'S¯DEN@"
IcePathName:         db "ICE PATH@"
NotApplicableName:   db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
IndigoPlateauName:   db "INDIGO¯PLATEAU@"
VictoryRoadName:     db "VICTORY¯ROAD@"
MtMoonName:          db "MT.MOON@"
RockTunnelName:      db "ROCK TUNNEL@"
LavRadioTowerName:   db "LAV¯RADIO TOWER@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
SeafoamIslandsName:  db "SEAFOAM¯ISLANDS@"
PokemonMansionName:  db "#MON¯MANSION@"
CeruleanCaveName:    db "CERULEAN¯CAVE@"
Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 3@"
Route4Name:          db "ROUTE 4@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 9@"
Route10Name:         db "ROUTE 10@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
Route21Name:         db "ROUTE 21@"
Route22Name:         db "ROUTE 22@"
Route30Name:	     db "PAVONA¯OASIS@"
CarnationZooName:    db "CARNATION¯ZOO@"
DarkCaveName:        db "DARK CAVE@"
IlexForestName:      db "WEST¯FOREST@"
BurnedTowerName:     db "BURNED¯TOWER@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
DiglettsCaveName:    db "DIGLETT'S¯CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
LostLandName:		 db "LOST LAND@"
BattleTowerName:     db "BATTLE¯TOWER@"
SpecialMapName:      db "SPECIAL@"
