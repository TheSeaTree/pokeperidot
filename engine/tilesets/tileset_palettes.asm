LoadSpecialMapPalette:
.continue
	ld a, [wMapTileset]
	cp TILESET_BATTLE_TOWER
	jr z, .battle_tower
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_CASTLE
	jr z, .castle
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	cp TILESET_TOWER
	jr z, .tower
	cp TILESET_MOUNTAIN
	jr z, .mountain
	cp TILESET_VOLCANO
	jr z, .volcano
	cp 	TILESET_CAVE
	jr z, .cave
	cp  TILESET_FACILITY
	jr z, .facility
	cp  TILESET_LIGHTHOUSE
	jr z, .lighthouse
	cp  TILESET_PORT
	jr z, .port
	cp  TILESET_GATE
	jr z, .gate
	cp  TILESET_ROOF
	jr z, .roof
	cp  TILESET_ELITE_FOUR_ROOM
	jr z, .elitefourroom
	cp  TILESET_CHAMPIONS_ROOM
	jr z, .championsroom
	cp  TILESET_POKEMON_LEAGUE
	jr z, .pokemonleague
	cp  TILESET_POKEMON_LEAGUE_OUTSIDE
	jr z, .pokemonleagueoutside
	cp  TILESET_LOST_LAND
	jr z, .lostland
	cp  TILESET_GAME_CORNER
	jr z, .gamecorner
	jr .do_nothing

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
	
.port
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

.do_nothing
	and a
	ret

LoadBattleTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerPalette:
INCLUDE "gfx/tilesets/battle_tower.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadCastlePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CastlePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

CastlePalette:
INCLUDE "gfx/tilesets/castle.pal"

LoadTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, TowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

TowerPalette:
INCLUDE "gfx/tilesets/tower.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

PortPalette:
INCLUDE "gfx/tilesets/port.pal"

LoadGatePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GatePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
GatePalette:
INCLUDE "gfx/tilesets/gate.pal"

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
INCLUDE "gfx/tilesets/game_corner.pal"

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

MountainPalette:
INCLUDE "gfx/tilesets/mountain.pal"

VolcanoPalette:
INCLUDE "gfx/tilesets/volcano.pal"

CavePalette:
INCLUDE "gfx/tilesets/cave.pal"

FacilityPalette:
INCLUDE "gfx/tilesets/facility.pal"

LighthousePalette:
INCLUDE "gfx/tilesets/lighthouse.pal"

RoofPalette:
INCLUDE "gfx/tilesets/roof.pal"

EliteFourRoomPalette:
INCLUDE "gfx/tilesets/elite_four_room.pal"

ChampionsRoomPalette:
INCLUDE "gfx/tilesets/champions_room.pal"

PokemonLeaguePalette:
INCLUDE "gfx/tilesets/pokemon_league.pal"

PokemonLeagueOutsidePalette:
INCLUDE "gfx/tilesets/pokemon_league_outside.pal"

LostLandPalette:
INCLUDE "gfx/tilesets/lost_land.pal"

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
