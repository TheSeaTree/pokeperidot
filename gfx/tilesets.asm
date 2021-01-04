tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

Tileset0GFX:
TilesetJohtoGFX:
TilesetMountainGFX:
TilesetVolcanoGFX:
INCBIN "gfx/tilesets/johto.2bpp.lz"

Tileset0Meta:
TilesetJohtoMeta:
INCBIN "data/tilesets/johto_metatiles.bin"

Tileset0Coll:
TilesetJohtoColl:
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

TilesetLighthouseAttr:
INCBIN "data/tilesets/lighthouse_attributes.bin"

TilesetGameCornerColl:
INCLUDE "data/tilesets/game_corner_collision.asm"


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX:
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta:
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl:
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPortGFX:
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta:
INCBIN "data/tilesets/port_metatiles.bin"

TilesetPortColl:
INCLUDE "data/tilesets/port_collision.asm"

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


SECTION "Tileset Data 3", ROMX

TilesetTowerGFX:
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta:
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl:
INCLUDE "data/tilesets/tower_collision.asm"

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

TilesetGameCornerGFX:
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta:
INCBIN "data/tilesets/game_corner_metatiles.bin"


TilesetTrainStationGFX:
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta:
INCBIN "data/tilesets/train_station_metatiles.bin"

TilesetTrainStationColl:
INCLUDE "data/tilesets/train_station_collision.asm"


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

TilesetRadioTowerMeta:
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl:
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetUndergroundGFX:
INCBIN "gfx/tilesets/underground.2bpp.lz"

TilesetUndergroundMeta:
INCBIN "data/tilesets/underground_metatiles.bin"

TilesetUndergroundColl:
INCLUDE "data/tilesets/underground_collision.asm"

TilesetGateGFX:
INCBIN "gfx/tilesets/gate.2bpp.lz"


SECTION "Tileset Data 5", ROMX

TilesetPokeComCenterGFX:
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"

TilesetPokeComCenterMeta:
INCBIN "data/tilesets/pokecom_center_metatiles.bin"

TilesetPokeComCenterColl:
INCLUDE "data/tilesets/pokecom_center_collision.asm"

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

TilesetBattleTowerOutsideGFX:
TilesetJohtoCityGFX:
INCBIN "gfx/tilesets/johto_city.2bpp.lz"

TilesetForestGFX:
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetTraditionalHouseGFX:
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta:
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetTraditionalHouseColl:
INCLUDE "data/tilesets/traditional_house_collision.asm"


SECTION "Tileset Data 6", ROMX

TilesetChampionsRoomGFX:
INCBIN "gfx/tilesets/champions_room.2bpp.lz"

TilesetChampionsRoomMeta:
INCBIN "data/tilesets/champions_room_metatiles.bin"

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

TilesetBattleTowerOutsideMeta:
INCBIN "data/tilesets/battle_tower_outside_metatiles.bin"

TilesetBattleTowerOutsideColl:
INCLUDE "data/tilesets/battle_tower_outside_collision.asm"


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


SECTION "Tileset Data 8", ROMX


TilesetJohtoCityMeta:
INCBIN "data/tilesets/johto_city_metatiles.bin"

TilesetForestMeta:
INCBIN "data/tilesets/forest_metatiles.bin"

TilesetJohtoCityColl:
INCLUDE "data/tilesets/johto_city_collision.asm"

TilesetForestColl:
INCLUDE "data/tilesets/forest_collision.asm"

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


SECTION "Tileset Data 9", ROMX

Tileset0Attr:
TilesetJohtoAttr:
INCBIN "data/tilesets/johto_attributes.bin"

TilesetHouseAttr:
INCBIN "data/tilesets/house_attributes.bin"

TilesetPlayersHouseAttr:
INCBIN "data/tilesets/players_house_attributes.bin"

TilesetPokecenterAttr:
INCBIN "data/tilesets/pokecenter_attributes.bin"

TilesetGateAttr:
INCBIN "data/tilesets/gate_attributes.bin"

TilesetPortAttr:
INCBIN "data/tilesets/port_attributes.bin"

TilesetLabAttr:
INCBIN "data/tilesets/lab_attributes.bin"

TilesetIcePathAttr:
INCBIN "data/tilesets/ice_path_attributes.bin"

TilesetVolcanoAttr:
INCBIN "data/tilesets/volcano_attributes.bin"



SECTION "Tileset Data 10", ROMX

TilesetFacilityAttr:
INCBIN "data/tilesets/facility_attributes.bin"

TilesetMartAttr:
INCBIN "data/tilesets/mart_attributes.bin"

TilesetMansionAttr:
INCBIN "data/tilesets/mansion_attributes.bin"

TilesetGameCornerAttr:
INCBIN "data/tilesets/game_corner_attributes.bin"

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

TilesetPokeComCenterAttr:
INCBIN "data/tilesets/pokecom_center_attributes.bin"

TilesetBattleTowerAttr:
INCBIN "data/tilesets/battle_tower_attributes.bin"

TilesetTowerAttr:
INCBIN "data/tilesets/tower_attributes.bin"

TilesetBattleTowerOutsideAttr:
INCBIN "data/tilesets/battle_tower_outside_attributes.bin"

SECTION "Tileset Data 11", ROMX

TilesetCaveAttr:
INCBIN "data/tilesets/cave_attributes.bin"

TilesetParkAttr:
INCBIN "data/tilesets/park_attributes.bin"

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
