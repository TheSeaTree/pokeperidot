tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

Tileset0GFX:
TilesetJohtoGFX:
TilesetMountainGFX:
TilesetVolcanoGFX:
TilesetOceanGFX:
INCBIN "gfx/tilesets/johto.2bpp.lz"

Tileset0Meta:
TilesetJohtoMeta:
TilesetOceanMeta:
INCBIN "data/tilesets/johto_metatiles.bin"

Tileset0Coll:
TilesetJohtoColl:
TilesetOceanColl:
INCLUDE "data/tilesets/johto_collision.asm"

TilesetIcePathGFX:
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

TilesetIcePathMeta:
INCBIN "data/tilesets/ice_path_metatiles.bin"

TilesetIcePathColl:
INCLUDE "data/tilesets/ice_path_collision.asm"

TilesetPlayersRoomGFX:
INCBIN "gfx/tilesets/players_room.2bpp.lz"

TilesetPlayersRoomMeta:
INCBIN "data/tilesets/players_room_metatiles.bin"

TilesetPlayersRoomColl:
INCLUDE "data/tilesets/players_room_collision.asm"


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX:
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta:
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl:
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPlayersHouseGFX:
INCBIN "gfx/tilesets/players_house.2bpp.lz"

TilesetPlayersHouseMeta:
INCBIN "data/tilesets/players_house_metatiles.bin"

TilesetPlayersHouseColl:
INCLUDE "data/tilesets/players_house_collision.asm"

TilesetMansionGFX:
INCBIN "gfx/tilesets/mansion.2bpp.lz"

TilesetMansionMeta:
INCBIN "data/tilesets/mansion_metatiles.bin"

TilesetMansionColl:
INCLUDE "data/tilesets/mansion_collision.asm"

TilesetLighthouseAttr:
INCBIN "data/tilesets/lighthouse_attributes.bin"


SECTION "Tileset Data 3", ROMX


TilesetLabGFX:
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta:
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl:
INCLUDE "data/tilesets/lab_collision.asm"

TilesetMartGFX:
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta:
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl:
INCLUDE "data/tilesets/mart_collision.asm"

TilesetTrainStationGFX:
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta:
INCBIN "data/tilesets/train_station_metatiles.bin"

TilesetTrainStationColl:
INCLUDE "data/tilesets/train_station_collision.asm"

TilesetGateAttr:
INCBIN "data/tilesets/gate_attributes.bin"

TilesetCastleGFX:
INCBIN "gfx/tilesets/castle.2bpp.lz"

TilesetCastleMeta:
INCBIN "data/tilesets/castle_metatiles.bin"

TilesetCastleColl:
INCLUDE "data/tilesets/castle_collision.asm"


SECTION "Tileset Data 4", ROMX

TilesetEliteFourRoomGFX:
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"

TilesetEliteFourRoomMeta:
INCBIN "data/tilesets/elite_four_room_metatiles.bin"

TilesetEliteFourRoomColl:
INCLUDE "data/tilesets/elite_four_room_collision.asm"

TilesetParkGFX:
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkMeta:
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl:
INCLUDE "data/tilesets/park_collision.asm"

TilesetRadioTowerGFX:
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetUndergroundGFX:
INCBIN "gfx/tilesets/underground.2bpp.lz"

TilesetUndergroundMeta:
INCBIN "data/tilesets/underground_metatiles.bin"

TilesetUndergroundColl:
INCLUDE "data/tilesets/underground_collision.asm"


SECTION "Tileset Data 5", ROMX

TilesetLostLandGFX:
INCBIN "gfx/tilesets/lost_land.2bpp.lz"

TilesetLostLandMeta:
INCBIN "data/tilesets/lost_land_metatiles.bin"

TilesetLostLandColl:
INCLUDE "data/tilesets/lost_land_collision.asm"

TilesetBattleTowerGFX:
INCBIN "gfx/tilesets/battle_tower.2bpp.lz"

TilesetBattleTowerMeta:
INCBIN "data/tilesets/battle_tower_metatiles.bin"

TilesetBattleTowerColl:
INCLUDE "data/tilesets/battle_tower_collision.asm"

TilesetGateMeta:
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl:
INCLUDE "data/tilesets/gate_collision.asm"

TilesetJohtoCityGFX:
INCBIN "gfx/tilesets/johto_city.2bpp.lz"

TilesetTraditionalHouseGFX:
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseColl:
INCLUDE "data/tilesets/traditional_house_collision.asm"


SECTION "Tileset Data 6", ROMX

TilesetTraditionalHouseMeta:
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetChampionsRoomColl:
INCLUDE "data/tilesets/champions_room_collision.asm"

TilesetHouseGFX:
INCBIN "gfx/tilesets/house.2bpp.lz"

TilesetHouseMeta:
INCBIN "data/tilesets/house_metatiles.bin"

TilesetHouseColl:
INCLUDE "data/tilesets/house_collision.asm"

TilesetLighthouseGFX:
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"

TilesetLighthouseMeta:
INCBIN "data/tilesets/lighthouse_metatiles.bin"

TilesetLighthouseColl:
INCLUDE "data/tilesets/lighthouse_collision.asm"

TilesetPokemonLeagueOutsideMeta:
INCBIN "data/tilesets/pokemon_league_outside_metatiles.bin"

TilesetPokemonLeagueOutsideColl:
INCLUDE "data/tilesets/pokemon_league_outside_collision.asm"

TilesetGateGFX:
INCBIN "gfx/tilesets/gate.2bpp.lz"


SECTION "Tileset Data 7", ROMX

TilesetCaveGFX:
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveMeta:
INCBIN "data/tilesets/cave_metatiles.bin"

TilesetCaveColl:
INCLUDE "data/tilesets/cave_collision.asm"

TilesetRuinsOfAlphGFX:
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"

TilesetRuinsOfAlphMeta:
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"

TilesetRuinsOfAlphColl:
INCLUDE "data/tilesets/ruins_of_alph_collision.asm"

TilesetGameCornerGFX:
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta:
INCBIN "data/tilesets/game_corner_metatiles.bin"

TilesetGameCornerColl:
INCLUDE "data/tilesets/game_corner_collision.asm"

TilesetGameCornerAttr:
INCBIN "data/tilesets/game_corner_attributes.bin"


SECTION "Tileset Data 8", ROMX

TilesetJohtoCityMeta:
INCBIN "data/tilesets/johto_city_metatiles.bin"

TilesetForestMeta:
INCBIN "data/tilesets/forest_metatiles.bin"

TilesetJohtoCityColl:
INCLUDE "data/tilesets/johto_city_collision.asm"

TilesetMountainMeta:
INCBIN "data/tilesets/mountain_metatiles.bin"

TilesetVolcanoMeta:
INCBIN "data/tilesets/volcano_metatiles.bin"

TilesetMountainColl:
INCLUDE "data/tilesets/mountain_collision.asm"

TilesetVolcanoColl:
INCLUDE "data/tilesets/volcano_collision.asm"

TilesetRoofGFX:
INCBIN "gfx/tilesets/roof.2bpp.lz"

TilesetRoofMeta:
INCBIN "data/tilesets/roof_metatiles.bin"

TilesetRoofAttr:
INCBIN "data/tilesets/roof_attributes.bin"

TilesetRoofColl:
INCLUDE "data/tilesets/roof_collision.asm"


SECTION "Tileset Data 9", ROMX

TilesetFacilityGFX:
INCBIN "gfx/tilesets/facility.2bpp.lz"

TilesetFacilityMeta:
INCBIN "data/tilesets/facility_metatiles.bin"

TilesetFacilityColl:
INCLUDE "data/tilesets/facility_collision.asm"

Tileset0Attr:
TilesetJohtoAttr:
TilesetOceanAttr:
INCBIN "data/tilesets/johto_attributes.bin"

TilesetHouseAttr:
INCBIN "data/tilesets/house_attributes.bin"

TilesetPlayersHouseAttr:
INCBIN "data/tilesets/players_house_attributes.bin"

TilesetPokecenterAttr:
INCBIN "data/tilesets/pokecenter_attributes.bin"

TilesetLabAttr:
INCBIN "data/tilesets/lab_attributes.bin"

TilesetVolcanoAttr:
INCBIN "data/tilesets/volcano_attributes.bin"


SECTION "Tileset Data 10", ROMX

TilesetFacilityAttr:
INCBIN "data/tilesets/facility_attributes.bin"

TilesetMartAttr:
INCBIN "data/tilesets/mart_attributes.bin"

TilesetMansionAttr:
INCBIN "data/tilesets/mansion_attributes.bin"

TilesetEliteFourRoomAttr:
INCBIN "data/tilesets/elite_four_room_attributes.bin"

TilesetTraditionalHouseAttr:
INCBIN "data/tilesets/traditional_house_attributes.bin"

TilesetTrainStationAttr:
INCBIN "data/tilesets/train_station_attributes.bin"

TilesetChampionsRoomAttr:
INCBIN "data/tilesets/champions_room_attributes.bin"

TilesetPlayersRoomAttr:
INCBIN "data/tilesets/players_room_attributes.bin"

TilesetBattleTowerAttr:
INCBIN "data/tilesets/battle_tower_attributes.bin"


SECTION "Tileset Data 11", ROMX

TilesetRuinsOfAlphAttr:
INCBIN "data/tilesets/ruins_of_alph_attributes.bin"

TilesetRadioTowerAttr:
INCBIN "data/tilesets/radio_tower_attributes.bin"

TilesetUndergroundAttr:
INCBIN "data/tilesets/underground_attributes.bin"

TilesetJohtoCityAttr:
INCBIN "data/tilesets/johto_city_attributes.bin"

TilesetForestAttr:
INCBIN "data/tilesets/forest_attributes.bin"

TilesetMountainAttr:
INCBIN "data/tilesets/mountain_attributes.bin"

TilesetPokemonLeagueOutsideAttr:
INCBIN "data/tilesets/pokemon_league_outside_attributes.bin"

TilesetCastleAttr:
INCBIN "data/tilesets/castle_attributes.bin"


SECTION "Tileset Data 12", ROMX

TilesetPortGFX:
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta:
INCBIN "data/tilesets/port_metatiles.bin"

TilesetPortColl:
INCLUDE "data/tilesets/port_collision.asm"

TilesetPortAttr:
INCBIN "data/tilesets/port_attributes.bin"

TilesetTowerGFX:
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta:
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl:
INCLUDE "data/tilesets/tower_collision.asm"

TilesetCyberspaceColl:
INCLUDE "data/tilesets/cyberspace_collision.asm"

TilesetCyberspaceAttr:
INCBIN "data/tilesets/cyberspace_attributes.bin"

TilesetChampionsRoomMeta:
INCBIN "data/tilesets/champions_room_metatiles.bin"


SECTION "Tileset Data 13", ROMX

TilesetPokemonLeagueGFX:
INCBIN "gfx/tilesets/pokemon_league.2bpp.lz"

TilesetPokemonLeagueMeta:
INCBIN "data/tilesets/pokemon_league_metatiles.bin"

TilesetPokemonLeagueColl:
INCLUDE "data/tilesets/pokemon_league_collision.asm"

TilesetPokemonLeagueAttr:
INCBIN "data/tilesets/pokemon_league_attributes.bin"

TilesetPokemonLeagueOutsideGFX:
INCBIN "gfx/tilesets/pokemon_league_outside.2bpp.lz"

TilesetPokecomCenterMeta:
INCBIN "data/tilesets/pokecom_center_metatiles.bin"

TilesetPokecomCenterColl:
INCLUDE "data/tilesets/pokecom_center_collision.asm"

TilesetPokecomCenterAttr:
INCBIN "data/tilesets/pokecom_center_attributes.bin"

TilesetPokecomCenterGFX:
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"

TilesetChampionsRoomGFX:
INCBIN "gfx/tilesets/champions_room.2bpp.lz"


SECTION "Tileset Data 14", ROMX

TilesetLostLandAttr:
INCBIN "data/tilesets/lost_land_attributes.bin"

TilesetParkAttr:
INCBIN "data/tilesets/park_attributes.bin"

TilesetRadioTowerMeta:
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl:
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetForestGFX:
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetForestColl:
INCLUDE "data/tilesets/forest_collision.asm"

TilesetTowerAttr:
INCBIN "data/tilesets/tower_attributes.bin"

TilesetIcePathAttr:
INCBIN "data/tilesets/ice_path_attributes.bin"


SECTION "Tileset Data 15", ROMX

TilesetCyberspaceGFX:
INCBIN "gfx/tilesets/cyberspace.2bpp.lz"

TilesetCyberspaceMeta:
INCBIN "data/tilesets/cyberspace_metatiles.bin"

TilesetCaveAttr:
INCBIN "data/tilesets/cave_attributes.bin"
