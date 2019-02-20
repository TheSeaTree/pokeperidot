landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  68,  68, NewBarkTownName
	landmark  68,  86, Route1Name
	landmark  68, 100, CherrygroveCityName
	landmark  68, 108, Route30Name
	landmark  76, 108, Route2Name
	landmark 100, 116, AzaleaTownName
	landmark 100, 100, Route3Name
	landmark 116, 100, Route4Name
	landmark 124,  84, Route5Name
	landmark 132,  68, VioletCityName
	landmark 132,  60, Route6Name
	landmark 122,  60, Route7Name
	landmark 108,  76, UndergroundName
	landmark 100,  68, Route8Name
	landmark  84,  68, GoldenrodCityName
	landmark 100,  92, DiglettsCaveName
	landmark 100,  84, CianwoodCityName
	landmark  60, 100, UnionCaveName
	landmark  52,  76, Route9Name
	landmark  52,  68, IlexForestName
	landmark  52,  52, EcruteakCityName
	landmark  52,  60, PaintersForestName
	landmark 108,  68, Route10Name
	landmark  76,  52, NationalParkName
	landmark  84,  36, OlivineCityName
	landmark  28,  68, MahoganyTownName
	landmark  36, 108, BlackthornCityName
	landmark  84,  52, Route11Name
	landmark  64,  52, Route12Name
	landmark  28,  44, Route13Name
	landmark  28,  82, Route14Name
	landmark  36,  96, Route15Name
	landmark  16, 128, Route16Name
	landmark  16, 128, Route17Name
	landmark  16, 128, Route18Name
	landmark  16, 128, Route19Name
	landmark  16, 128, Route20Name
	landmark  140, 36, VictoryRoadName
	landmark  140, 28, IndigoPlateauName
	landmark  16, 128, BattleTowerName

NewBarkTownName:     db "ELKHORN¯TOWN@"
CherrygroveCityName: db "PAVONA¯VILLAGE@"
VioletCityName:      db "RIDGE¯VILLAGE@"
AzaleaTownName:      db "PECTINIA¯CITY@"
GoldenrodCityName:   db "FAVIA¯TOWN@"
EcruteakCityName:    db "STAGHORN¯TOWN@"
PaintersForestName:  db "PAINTER'S¯FOREST@"
OlivineCityName:     db "CYNARIA¯CITY@"
CianwoodCityName:    db "HELIO¯TOWN@"
MahoganyTownName:    db "MAHOGANY¯TOWN@"
BlackthornCityName:  db "BLACKTHORN¯CITY@"
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
Route30Name:	     db "PAVONA¯OASIS@"
DarkCaveName:        db "DARK CAVE@"
IlexForestName:      db "WEST¯FOREST@"
BurnedTowerName:     db "BURNED¯TOWER@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
DiglettsCaveName:    db "DIGLETT'S¯CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
BattleTowerName:     db "BATTLE¯TOWER@"
SpecialMapName:      db "SPECIAL@"
