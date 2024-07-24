LoadSpecialMapPalette:
.continue
	ld a, [wMapTileset]
	cp TILESET_BATTLE_TOWER
	jp z, .battle_tower
	cp TILESET_ICE_PATH
	jp z, .ice_path
	cp TILESET_CASTLE
	jp z, .castle
	cp TILESET_HOUSE
	jp z, .house
	cp TILESET_RADIO_TOWER
	jp z, .radio_tower
	cp TILESET_MANSION
	jp z, .mansion_mobile
	cp  TILESET_POKECOM_CENTER
	jp z, .pokecom
	cp TILESET_TOWER
	jp z, .tower
	cp TILESET_MOUNTAIN
	jp z, .mountain
	cp TILESET_VOLCANO
	jp z, .volcano
	cp 	TILESET_CAVE
	jp z, .cave
	cp  TILESET_FACILITY
	jp z, .facility
	cp  TILESET_LIGHTHOUSE
	jp z, .lighthouse
	cp TILESET_LAB
	jp z, .lab
	cp  TILESET_PORT
	jp z, .port
	cp  TILESET_GATE
	jp z, .gate
	cp  TILESET_ROOF
	jp z, .roof
	cp  TILESET_ELITE_FOUR_ROOM
	jp z, .elitefourroom
	cp  TILESET_CHAMPIONS_ROOM
	jp z, .championsroom
	cp  TILESET_POKEMON_LEAGUE
	jp z, .pokemonleague
	cp  TILESET_POKEMON_LEAGUE_OUTSIDE
	jp z, .pokemonleagueoutside
	cp  TILESET_LOST_LAND
	jp z, .lostland
	cp  TILESET_GAME_CORNER
	jp z, .gamecorner
	cp  TILESET_CYBERSPACE
	jp z, .cyberspace
	ld a, [wCurLandmark]
	cp GENESIS_ISLAND
	jp z, .genesisisland

.do_nothing
	and a
	ret

.battle_tower
	call LoadBattleTowerPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret
	
.castle
	call LoadCastlePalette
	scf
	ret

.tower
	call LoadTowerPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.pokecom
	call LoadPokecomPalette
	scf
	ret

.lab
	ld hl, LabPalette
	jp LoadEightTimeOfDayBGPalettes

.port
	ld a, [wMapGroup]
	cp GROUP_VICTORY_PORT
	jr z, .genesisisland
	ld a, [wMapNumber]
	cp GROUP_VICTORY_PORT
	jr z, .genesisisland

	ld hl, PortPalette
	jp LoadEightTimeOfDayBGPalettes

.gate
	call LoadGatePalette
	scf
	ret

.mountain
	ld hl, MountainPalette
	jp LoadEightTimeOfDayBGPalettes
	
.volcano
	ld hl, VolcanoPalette
	jp LoadEightTimeOfDayBGPalettes
	
.cave
	ld hl, CavePalette
	jp LoadEightTimeOfDayBGPalettes
	
.facility
	ld hl, FacilityPalette
	jp LoadEightTimeOfDayBGPalettes
	
.lighthouse
	ld hl, LighthousePalette
	jp LoadEightTimeOfDayBGPalettes

.roof
	ld hl, RoofPalette
	jp LoadEightTimeOfDayBGPalettes

.elitefourroom
	ld hl, EliteFourRoomPalette
	jp LoadEightTimeOfDayBGPalettes

.pokemonleague
	ld hl, PokemonLeaguePalette
	jp LoadEightTimeOfDayBGPalettes

.pokemonleagueoutside
	ld hl, PokemonLeagueOutsidePalette
	jp LoadEightTimeOfDayBGPalettes
	
.championsroom
	ld hl, ChampionsRoomPalette
	jp LoadEightTimeOfDayBGPalettes

.lostland
	ld hl, LostLandPalette
	jp LoadEightTimeOfDayBGPalettes

.gamecorner
	call LoadGameCornerPalette
	scf
	ret

.cyberspace
	ld hl, CyberspacePalette
	jp LoadEightTimeOfDayBGPalettes

.genesisisland
	ld hl, GenesisIslandPalette
	jp LoadEightTimeOfDayBGPalettes

LoadBattleTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerPalette:
INCLUDE "gfx/tilesets_pals/battle_tower.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets_pals/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets_pals/house.pal"

LoadCastlePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CastlePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

CastlePalette:
INCLUDE "gfx/tilesets_pals/castle.pal"

LoadTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, TowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

TowerPalette:
INCLUDE "gfx/tilesets_pals/tower.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets_pals/radio_tower.pal"

LabPalette:
INCLUDE "gfx/tilesets_pals/lab.pal"

MansionPalette1:
INCLUDE "gfx/tilesets_pals/mansion_1.pal"

PortPalette:
INCLUDE "gfx/tilesets_pals/port.pal"

LoadGatePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GatePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
GatePalette:
INCLUDE "gfx/tilesets_pals/gate.pal"

LoadPokecomPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokecomPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
PokecomPalette:
INCLUDE "gfx/tilesets_pals/pokecom_center.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

LoadGameCornerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GameCornerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
GameCornerPalette:
INCLUDE "gfx/tilesets_pals/game_corner.pal"

MansionPalette2:
INCLUDE "gfx/tilesets_pals/mansion_2.pal"

MountainPalette:
INCLUDE "gfx/tilesets_pals/mountain.pal"

VolcanoPalette:
INCLUDE "gfx/tilesets_pals/volcano.pal"

CavePalette:
INCLUDE "gfx/tilesets_pals/cave.pal"

FacilityPalette:
INCLUDE "gfx/tilesets_pals/facility.pal"

LighthousePalette:
INCLUDE "gfx/tilesets_pals/lighthouse.pal"

RoofPalette:
INCLUDE "gfx/tilesets_pals/roof.pal"

EliteFourRoomPalette:
INCLUDE "gfx/tilesets_pals/elite_four_room.pal"

ChampionsRoomPalette:
INCLUDE "gfx/tilesets_pals/champions_room.pal"

PokemonLeaguePalette:
INCLUDE "gfx/tilesets_pals/pokemon_league.pal"

PokemonLeagueOutsidePalette:
INCLUDE "gfx/tilesets_pals/pokemon_league_outside.pal"

LostLandPalette:
INCLUDE "gfx/tilesets_pals/lost_land.pal"

CyberspacePalette:
INCLUDE "gfx/tilesets_pals/cyberspace.pal"

GenesisIslandPalette:
INCLUDE "gfx/tilesets_pals/genesis_island.pal"

LoadEightTimeOfDayBGPalettes:
    ld a, [wTimeOfDayPal]
    and 3
    ld bc, 8 palettes
    call AddNTimes
    ld a, $5
    ld de, wBGPals1
    ld bc, 8 palettes
    call FarCopyWRAM
    scf
    ret
