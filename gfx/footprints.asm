; Footprints are 2x2 tiles each, but are stored as a 16x64-tile image
; (32 rows of 8 footprints per row).
; That means there's a row of the top two tiles for eight footprints,
; then a row of the bottom two tiles for those eight footprints.

; These macros help extract the first and the last two tiles, respectively.
primary_type   EQUS "0,                 2 * LEN_1BPP_TILE"
secondary_type EQUS "2 * LEN_1BPP_TILE, 2 * LEN_1BPP_TILE"

; Entries correspond to Pokémon species, two apiece, 8 tops then 8 bottoms

; 001-008 first type
INCBIN "gfx/types/grass.1bpp",  primary_type ;Bulbasaur
INCBIN "gfx/types/grass.1bpp",    primary_type ;Ivysaur
INCBIN "gfx/types/grass.1bpp",   primary_type ;Venusaur
INCBIN "gfx/types/none.1bpp", primary_type ;Charmander
INCBIN "gfx/types/none.1bpp", primary_type ;Charmeleon
INCBIN "gfx/types/none.1bpp",  primary_type ;Charizard
INCBIN "gfx/types/none.1bpp",   primary_type ;Squirtle
INCBIN "gfx/types/none.1bpp",  primary_type ;Wartortle
; 001-008 second type
INCBIN "gfx/types/poison.1bpp",  secondary_type ;Bulbasaur
INCBIN "gfx/types/poison.1bpp",    secondary_type ;Ivysaur
INCBIN "gfx/types/poison.1bpp",   secondary_type ;Venusaur
INCBIN "gfx/types/fire.1bpp", secondary_type ;Charmander
INCBIN "gfx/types/fire.1bpp", secondary_type ;Charmeleon
INCBIN "gfx/types/flying.1bpp",  secondary_type ;Charizard
INCBIN "gfx/types/water.1bpp",   secondary_type ;Squirtle
INCBIN "gfx/types/water.1bpp",  secondary_type ;Wartortle
; 009-016 first type
INCBIN "gfx/types/none.1bpp",  primary_type ;Blastoise
INCBIN "gfx/types/none.1bpp",   primary_type ;Caterpie
INCBIN "gfx/types/none.1bpp",    primary_type ;Metapod
INCBIN "gfx/types/bug.1bpp", primary_type ;Butterfree
INCBIN "gfx/types/bug.1bpp",     primary_type ;Weedle
INCBIN "gfx/types/bug.1bpp",     primary_type ;Kakuna
INCBIN "gfx/types/bug.1bpp",   primary_type ;Beedrill
INCBIN "gfx/types/none.1bpp",     primary_type ;Psyduck
; 009-016 second type
INCBIN "gfx/types/water.1bpp",  secondary_type ;Blastoise
INCBIN "gfx/types/bug.1bpp",   secondary_type ;Caterpie
INCBIN "gfx/types/bug.1bpp",    secondary_type ;Metapod
INCBIN "gfx/types/flying.1bpp", secondary_type ;Butterfree
INCBIN "gfx/types/poison.1bpp",     secondary_type ;Weedle
INCBIN "gfx/types/poison.1bpp",     secondary_type ;Kakuna
INCBIN "gfx/types/poison.1bpp",   secondary_type ;Beedrill
INCBIN "gfx/types/water.1bpp",     secondary_type ;Psyduck
; 017-024 first type
INCBIN "gfx/types/none.1bpp",  primary_type ;Golduck
INCBIN "gfx/types/rock.1bpp",    primary_type ;Skelegon
INCBIN "gfx/types/none.1bpp",    primary_type ;Rinring
INCBIN "gfx/types/none.1bpp",   primary_type ;Nyanell
INCBIN "gfx/types/normal.1bpp",    primary_type ;Spearow
INCBIN "gfx/types/normal.1bpp",     primary_type ;Fearow
INCBIN "gfx/types/none.1bpp",      primary_type ;Ekans
INCBIN "gfx/types/none.1bpp",      primary_type ;Arbok
; 017-024 second type
INCBIN "gfx/types/water.1bpp",  secondary_type ;Golduck
INCBIN "gfx/types/ghost.1bpp",    secondary_type ;Skelegon
INCBIN "gfx/types/dark.1bpp",    secondary_type ;Rinring
INCBIN "gfx/types/dark.1bpp",   secondary_type ;Nyanell
INCBIN "gfx/types/flying.1bpp",    secondary_type ;Spearow
INCBIN "gfx/types/flying.1bpp",     secondary_type ;Fearow
INCBIN "gfx/types/poison.1bpp",      secondary_type ;Ekans
INCBIN "gfx/types/poison.1bpp",      secondary_type ;Arbok
; 025-032 first type
INCBIN "gfx/types/none.1bpp",    primary_type ;Pikachu
INCBIN "gfx/types/none.1bpp",     primary_type ;Raichu
INCBIN "gfx/types/none.1bpp",  primary_type ;Sandshrew
INCBIN "gfx/types/none.1bpp",  primary_type ;Sandslash
INCBIN "gfx/types/none.1bpp",  primary_type ;NidoranF
INCBIN "gfx/types/none.1bpp",   primary_type ;Nidorina
INCBIN "gfx/types/poison.1bpp",  primary_type ;Nidoqueen
INCBIN "gfx/types/none.1bpp",  primary_type ;NidoranM
; 025-032 second type
INCBIN "gfx/types/electric.1bpp",    secondary_type ;Pikachu
INCBIN "gfx/types/electric.1bpp",     secondary_type ;Raichu
INCBIN "gfx/types/ground.1bpp",  secondary_type ;Sandshrew
INCBIN "gfx/types/ground.1bpp",  secondary_type ;Sandslash
INCBIN "gfx/types/poison.1bpp",  secondary_type ;NidoranF
INCBIN "gfx/types/poison.1bpp",   secondary_type ;Nidorina
INCBIN "gfx/types/ground.1bpp",  secondary_type ;Nidoqueen
INCBIN "gfx/types/poison.1bpp",  secondary_type ;NidoranM
; 033-040 first type
INCBIN "gfx/types/none.1bpp",   primary_type ;Nidorino
INCBIN "gfx/types/poison.1bpp",   primary_type ;Nidoking
INCBIN "gfx/types/none.1bpp",   primary_type ;Clefairy
INCBIN "gfx/types/none.1bpp",   primary_type ;Clefable
INCBIN "gfx/types/none.1bpp",     primary_type ;Vulpix
INCBIN "gfx/types/none.1bpp",  primary_type ;Ninetales
INCBIN "gfx/types/normal.1bpp", primary_type ;Jigglypuff
INCBIN "gfx/types/normal.1bpp", primary_type ;Wigglytuff
; 033-040 second type
INCBIN "gfx/types/poison.1bpp",   secondary_type ;Nidorino
INCBIN "gfx/types/ground.1bpp",   secondary_type ;Nidoking
INCBIN "gfx/types/fairy.1bpp",   secondary_type ;Clefairy
INCBIN "gfx/types/fairy.1bpp",   secondary_type ;Clefable
INCBIN "gfx/types/fire.1bpp",     secondary_type ;Vulpix
INCBIN "gfx/types/fire.1bpp",  secondary_type ;Ninetales
INCBIN "gfx/types/fairy.1bpp", secondary_type ;Jigglypuff
INCBIN "gfx/types/fairy.1bpp", secondary_type ;Wigglytuff
; 041-048 first type
INCBIN "gfx/types/poison.1bpp",      primary_type ;Zubat
INCBIN "gfx/types/poison.1bpp",     primary_type ;Golbat
INCBIN "gfx/types/grass.1bpp",     primary_type ;Oddish
INCBIN "gfx/types/grass.1bpp",      primary_type ;Gloom
INCBIN "gfx/types/grass.1bpp",  primary_type ;Vileplume
INCBIN "gfx/types/bug.1bpp",      primary_type ;Paras
INCBIN "gfx/types/bug.1bpp",   primary_type ;Parasect
INCBIN "gfx/types/bug.1bpp",    primary_type ;Venonat
; 041-048 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Zubat
INCBIN "gfx/types/flying.1bpp",     secondary_type ;Golbat
INCBIN "gfx/types/poison.1bpp",     secondary_type ;Oddish
INCBIN "gfx/types/poison.1bpp",      secondary_type ;Gloom
INCBIN "gfx/types/poison.1bpp",  secondary_type ;Vileplume
INCBIN "gfx/types/grass.1bpp",      secondary_type ;Paras
INCBIN "gfx/types/grass.1bpp",   secondary_type ;Parasect
INCBIN "gfx/types/poison.1bpp",    secondary_type ;Venonat
; 049-056 first type
INCBIN "gfx/types/bug.1bpp",   primary_type ;Venomoth
INCBIN "gfx/types/none.1bpp",    primary_type ;Diglett
INCBIN "gfx/types/none.1bpp",    primary_type ;Dugtrio
INCBIN "gfx/types/none.1bpp",     primary_type ;Meowth
INCBIN "gfx/types/none.1bpp",    primary_type ;Persian
INCBIN "gfx/types/none.1bpp",    primary_type ;S'Mola
INCBIN "gfx/types/water.1bpp",    primary_type ;Ancor
INCBIN "gfx/types/none.1bpp",     primary_type ;Mankey
; 049-056 second type
INCBIN "gfx/types/poison.1bpp",   secondary_type ;Venomoth
INCBIN "gfx/types/ground.1bpp",    secondary_type ;Diglett
INCBIN "gfx/types/ground.1bpp",    secondary_type ;Dugtrio
INCBIN "gfx/types/normal.1bpp",     secondary_type ;Meowth
INCBIN "gfx/types/normal.1bpp",    secondary_type ;Persian
INCBIN "gfx/types/water.1bpp",    secondary_type ;S'Mola
INCBIN "gfx/types/steel.1bpp",    secondary_type ;Ancor
INCBIN "gfx/types/fighting.1bpp",     secondary_type ;Mankey
; 057-064 first type
INCBIN "gfx/types/none.1bpp",   primary_type ;Primeape
INCBIN "gfx/types/none.1bpp",  primary_type ;Growlithe
INCBIN "gfx/types/none.1bpp",   primary_type ;Arcanine
INCBIN "gfx/types/none.1bpp",    primary_type ;Poliwag
INCBIN "gfx/types/none.1bpp",  primary_type ;Poliwhirl
INCBIN "gfx/types/water.1bpp",  primary_type ;Poliwrath
INCBIN "gfx/types/none.1bpp",       primary_type ;Abra
INCBIN "gfx/types/none.1bpp",    primary_type ;Kadabra
; 057-064 second type
INCBIN "gfx/types/fighting.1bpp",   secondary_type ;Primeape
INCBIN "gfx/types/fire.1bpp",  secondary_type ;Growlithe
INCBIN "gfx/types/fire.1bpp",   secondary_type ;Arcanine
INCBIN "gfx/types/water.1bpp",    secondary_type ;Poliwag
INCBIN "gfx/types/water.1bpp",  secondary_type ;Poliwhirl
INCBIN "gfx/types/fighting.1bpp",  secondary_type ;Poliwrath
INCBIN "gfx/types/psychic.1bpp",       secondary_type ;Abra
INCBIN "gfx/types/psychic.1bpp",    secondary_type ;Kadabra
; 065-072 first type
INCBIN "gfx/types/none.1bpp",   primary_type ;Alakazam
INCBIN "gfx/types/none.1bpp",     primary_type ;Machop
INCBIN "gfx/types/none.1bpp",    primary_type ;Machoke
INCBIN "gfx/types/none.1bpp",    primary_type ;Machamp
INCBIN "gfx/types/grass.1bpp", primary_type ;Bellsprout
INCBIN "gfx/types/grass.1bpp", primary_type ;Weepinbell
INCBIN "gfx/types/grass.1bpp", primary_type ;Victreebel
INCBIN "gfx/types/water.1bpp",  primary_type ;Tentacool
; 065-072 second type
INCBIN "gfx/types/psychic.1bpp",   secondary_type ;Alakazam
INCBIN "gfx/types/fighting.1bpp",     secondary_type ;Machop
INCBIN "gfx/types/fighting.1bpp",    secondary_type ;Machoke
INCBIN "gfx/types/none.1bpp",    secondary_type ;Machamp
INCBIN "gfx/types/poison.1bpp", secondary_type ;Bellsprout
INCBIN "gfx/types/poison.1bpp", secondary_type ;Weepinbell
INCBIN "gfx/types/poison.1bpp", secondary_type ;Victreebel
INCBIN "gfx/types/poison.1bpp",  secondary_type ;Tentacool
; 073-080 first type
INCBIN "gfx/types/water.1bpp", primary_type ;Tentacruel
INCBIN "gfx/types/rock.1bpp",    primary_type ;Geodude
INCBIN "gfx/types/rock.1bpp",   primary_type ;Graveler
INCBIN "gfx/types/rock.1bpp",      primary_type ;Golem
INCBIN "gfx/types/none.1bpp",     primary_type ;Ponyta
INCBIN "gfx/types/none.1bpp",   primary_type ;Rapidash
INCBIN "gfx/types/water.1bpp",   primary_type ;Slowpoke
INCBIN "gfx/types/water.1bpp",    primary_type ;Slowbro
; 073-080 second type
INCBIN "gfx/types/poison.1bpp", secondary_type ;Tentacruel
INCBIN "gfx/types/ground.1bpp",    secondary_type ;Geodude
INCBIN "gfx/types/ground.1bpp",   secondary_type ;Graveler
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Golem
INCBIN "gfx/types/fire.1bpp",     secondary_type ;Ponyta
INCBIN "gfx/types/fire.1bpp",   secondary_type ;Rapidash
INCBIN "gfx/types/psychic.1bpp",   secondary_type ;Slowpoke
INCBIN "gfx/types/psychic.1bpp",    secondary_type ;Slowbro
; 081-088 first type
INCBIN "gfx/types/electric.1bpp",  primary_type ;Magnemite
INCBIN "gfx/types/electric.1bpp",   primary_type ;Magneton
INCBIN "gfx/types/normal.1bpp", primary_type ;Farfetch'd
INCBIN "gfx/types/normal.1bpp",      primary_type ;Doduo
INCBIN "gfx/types/normal.1bpp",     primary_type ;Dodrio
INCBIN "gfx/types/none.1bpp",       primary_type ;Seel
INCBIN "gfx/types/water.1bpp",    primary_type ;Dewgong
INCBIN "gfx/types/none.1bpp",     primary_type ;Grimer
; 081-088 second type
INCBIN "gfx/types/steel.1bpp",  secondary_type ;Magnemite
INCBIN "gfx/types/steel.1bpp",   secondary_type ;Magneton
INCBIN "gfx/types/flying.1bpp", secondary_type ;Farfetch'd
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Doduo
INCBIN "gfx/types/flying.1bpp",     secondary_type ;Dodrio
INCBIN "gfx/types/water.1bpp",       secondary_type ;Seel
INCBIN "gfx/types/ice.1bpp",    secondary_type ;Dewgong
INCBIN "gfx/types/poison.1bpp",     secondary_type ;Grimer
; 089-096 first type
INCBIN "gfx/types/none.1bpp",        primary_type ;Muk
INCBIN "gfx/types/none.1bpp",   primary_type ;Shellder
INCBIN "gfx/types/water.1bpp",   primary_type ;Cloyster
INCBIN "gfx/types/ghost.1bpp",     primary_type ;Gastly
INCBIN "gfx/types/ghost.1bpp",    primary_type ;Haunter
INCBIN "gfx/types/ghost.1bpp",     primary_type ;Gengar
INCBIN "gfx/types/rock.1bpp",       primary_type ;Onix
INCBIN "gfx/types/none.1bpp",    primary_type ;Drowzee
; 089-096 second type
INCBIN "gfx/types/poison.1bpp",        secondary_type ;Muk
INCBIN "gfx/types/water.1bpp",   secondary_type ;Shellder
INCBIN "gfx/types/ice.1bpp",   secondary_type ;Cloyster
INCBIN "gfx/types/poison.1bpp",     secondary_type ;Gastly
INCBIN "gfx/types/poison.1bpp",    secondary_type ;Haunter
INCBIN "gfx/types/poison.1bpp",     secondary_type ;Gengar
INCBIN "gfx/types/ground.1bpp",       secondary_type ;Onix
INCBIN "gfx/types/psychic.1bpp",    secondary_type ;Drowzee
; 097-104 first type
INCBIN "gfx/types/none.1bpp",      primary_type ;Hypno
INCBIN "gfx/types/none.1bpp",     primary_type ;Krabby
INCBIN "gfx/types/none.1bpp",    primary_type ;Kingler
INCBIN "gfx/types/none.1bpp",    primary_type ;Voltorb
INCBIN "gfx/types/none.1bpp",  primary_type ;Electrode
INCBIN "gfx/types/grass.1bpp",  primary_type ;Exeggcute
INCBIN "gfx/types/grass.1bpp",  primary_type ;Exeggutor
INCBIN "gfx/types/none.1bpp",     primary_type ;Cubone
; 097-104 second type
INCBIN "gfx/types/psychic.1bpp",      secondary_type ;Hypno
INCBIN "gfx/types/water.1bpp",     secondary_type ;Krabby
INCBIN "gfx/types/water.1bpp",    secondary_type ;Kingler
INCBIN "gfx/types/electric.1bpp",    secondary_type ;Voltorb
INCBIN "gfx/types/electric.1bpp",  secondary_type ;Electrode
INCBIN "gfx/types/psychic.1bpp",  secondary_type ;Exeggcute
INCBIN "gfx/types/psychic.1bpp",  secondary_type ;Exeggutor
INCBIN "gfx/types/ground.1bpp",     secondary_type ;Cubone
; 105-112 first type
INCBIN "gfx/types/none.1bpp",    primary_type ;Marowak
INCBIN "gfx/types/water.1bpp",  primary_type ;Concher
INCBIN "gfx/types/water.1bpp", primary_type ;Searion
INCBIN "gfx/types/none.1bpp",  primary_type ;Lickitung
INCBIN "gfx/types/none.1bpp",    primary_type ;Koffing
INCBIN "gfx/types/none.1bpp",    primary_type ;Weezing
INCBIN "gfx/types/rock.1bpp",    primary_type ;Rhyhorn
INCBIN "gfx/types/rock.1bpp",     primary_type ;Rhydon
; 105-112 second type
INCBIN "gfx/types/ground.1bpp",    secondary_type ;Marowak
INCBIN "gfx/types/ice.1bpp",  secondary_type ;Concher
INCBIN "gfx/types/fire.1bpp", secondary_type ;Searion
INCBIN "gfx/types/normal.1bpp",  secondary_type ;Lickitung
INCBIN "gfx/types/poison.1bpp",    secondary_type ;Koffing
INCBIN "gfx/types/poison.1bpp",    secondary_type ;Weezing
INCBIN "gfx/types/ground.1bpp",    secondary_type ;Rhyhorn
INCBIN "gfx/types/ground.1bpp",     secondary_type ;Rhydon
; 113-120 first type
INCBIN "gfx/types/none.1bpp",    primary_type ;Chansey
INCBIN "gfx/types/none.1bpp",    primary_type ;Tangela
INCBIN "gfx/types/none.1bpp", primary_type ;Kangaskhan
INCBIN "gfx/types/none.1bpp",     primary_type ;Horsea
INCBIN "gfx/types/none.1bpp",     primary_type ;Seadra 
INCBIN "gfx/types/none.1bpp",    primary_type ;Goldeen
INCBIN "gfx/types/none.1bpp",    primary_type ;Seaking
INCBIN "gfx/types/none.1bpp",     primary_type ;Staryu
; 113-120 second type
INCBIN "gfx/types/normal.1bpp",    secondary_type ;Chansey
INCBIN "gfx/types/grass.1bpp",    secondary_type ;Tangela
INCBIN "gfx/types/normal.1bpp", secondary_type ;Kangaskhan
INCBIN "gfx/types/water.1bpp",     secondary_type ;Horsea
INCBIN "gfx/types/water.1bpp",     secondary_type ;Seadra 
INCBIN "gfx/types/water.1bpp",    secondary_type ;Goldeen
INCBIN "gfx/types/water.1bpp",    secondary_type ;Seaking
INCBIN "gfx/types/water.1bpp",     secondary_type ;Staryu
; 121-128 first type
INCBIN "gfx/types/water.1bpp",    primary_type ;Starmie
INCBIN "gfx/types/psychic.1bpp",   primary_type ;Mr. Mime
INCBIN "gfx/types/bug.1bpp",    primary_type ;Scyther
INCBIN "gfx/types/ice.1bpp",       primary_type ;Jynx
INCBIN "gfx/types/none.1bpp", primary_type ;Electabuzz
INCBIN "gfx/types/none.1bpp",     primary_type ;Magmar
INCBIN "gfx/types/none.1bpp",     primary_type ;Pinsir
INCBIN "gfx/types/none.1bpp",     primary_type ;Tauros
; 121-128 second type
INCBIN "gfx/types/psychic.1bpp",    secondary_type ;Starmie
INCBIN "gfx/types/fairy.1bpp",   secondary_type ;Mr. Mime
INCBIN "gfx/types/flying.1bpp",    secondary_type ;Scyther
INCBIN "gfx/types/psychic.1bpp",       secondary_type ;Jynx
INCBIN "gfx/types/electric.1bpp", secondary_type ;Electabuzz
INCBIN "gfx/types/fire.1bpp",     secondary_type ;Magmar
INCBIN "gfx/types/bug.1bpp",     secondary_type ;Pinsir
INCBIN "gfx/types/normal.1bpp",     secondary_type ;Tauros
; 129-136 first type
INCBIN "gfx/types/none.1bpp",   primary_type ;Magikarp
INCBIN "gfx/types/water.1bpp",   primary_type ;Gyarados
INCBIN "gfx/types/water.1bpp",     primary_type ;Lapras
INCBIN "gfx/types/none.1bpp",      primary_type ;Ditto
INCBIN "gfx/types/none.1bpp",      primary_type ;Eevee
INCBIN "gfx/types/none.1bpp",   primary_type ;Vaporeon
INCBIN "gfx/types/none.1bpp",    primary_type ;Jolteon
INCBIN "gfx/types/none.1bpp",    primary_type ;Flareon
; 129-136 second type
INCBIN "gfx/types/water.1bpp",   secondary_type ;Magikarp
INCBIN "gfx/types/flying.1bpp",   secondary_type ;Gyarados
INCBIN "gfx/types/ice.1bpp",     secondary_type ;Lapras
INCBIN "gfx/types/normal.1bpp",      secondary_type ;Ditto
INCBIN "gfx/types/normal.1bpp",      secondary_type ;Eevee
INCBIN "gfx/types/water.1bpp",   secondary_type ;Vaporeon
INCBIN "gfx/types/electric.1bpp",    secondary_type ;Jolteon
INCBIN "gfx/types/fire.1bpp",    secondary_type ;Flareon
; 137-144 first type
INCBIN "gfx/types/none.1bpp",    primary_type ;Porygon
INCBIN "gfx/types/rock.1bpp",    primary_type ;Omanyte
INCBIN "gfx/types/rock.1bpp",    primary_type ;Omastar
INCBIN "gfx/types/rock.1bpp",     primary_type ;Kabuto
INCBIN "gfx/types/rock.1bpp",   primary_type ;Kabutops
INCBIN "gfx/types/rock.1bpp", primary_type ;Aerodactyl
INCBIN "gfx/types/none.1bpp",    primary_type ;Snorlax
INCBIN "gfx/types/ice.1bpp",   primary_type ;Articuno
; 137-144 second type
INCBIN "gfx/types/normal.1bpp",    secondary_type ;Porygon
INCBIN "gfx/types/water.1bpp",    secondary_type ;Omanyte
INCBIN "gfx/types/water.1bpp",    secondary_type ;Omastar
INCBIN "gfx/types/water.1bpp",     secondary_type ;Kabuto
INCBIN "gfx/types/water.1bpp",   secondary_type ;Kabutops
INCBIN "gfx/types/flying.1bpp", secondary_type ;Aerodactyl
INCBIN "gfx/types/normal.1bpp",    secondary_type ;Snorlax
INCBIN "gfx/types/flying.1bpp",   secondary_type ;Articuno
; 145-152 first type
INCBIN "gfx/types/electric.1bpp",    primary_type ;Zapdos
INCBIN "gfx/types/fire.1bpp",        primary_type ;Moltres
INCBIN "gfx/types/none.1bpp",      primary_type ;Dratini
INCBIN "gfx/types/none.1bpp",      primary_type ;Dragonair
INCBIN "gfx/types/dragon.1bpp",      primary_type ;Dragonite
INCBIN "gfx/types/none.1bpp",     primary_type ;Mewtwo
INCBIN "gfx/types/none.1bpp",     primary_type ;Mew
INCBIN "gfx/types/none.1bpp",       primary_type ;Chikorita
; 145-152 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Zapdos
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Moltres
INCBIN "gfx/types/dragon.1bpp",        secondary_type ;Dratini
INCBIN "gfx/types/dragon.1bpp",        secondary_type ;Dragonair
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Dragonite
INCBIN "gfx/types/psychic.1bpp",        secondary_type ;Mewtwo
INCBIN "gfx/types/psychic.1bpp",        secondary_type ;Mew
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Chikorita
; 153-160 first type
INCBIN "gfx/types/none.1bpp",       primary_type ;Bayleef
INCBIN "gfx/types/none.1bpp",       primary_type ;Meganium
INCBIN "gfx/types/none.1bpp",        primary_type ;Cyndaquil
INCBIN "gfx/types/none.1bpp",        primary_type ;Quilava
INCBIN "gfx/types/none.1bpp",        primary_type ;Typhlosion
INCBIN "gfx/types/none.1bpp",       primary_type ;Totodile
INCBIN "gfx/types/none.1bpp",       primary_type ;Croconaw
INCBIN "gfx/types/none.1bpp",       primary_type ;Feraligatr
; 153-160 second type
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Bayleef
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Meganium
INCBIN "gfx/types/fire.1bpp",        secondary_type ;Cyndaquil
INCBIN "gfx/types/fire.1bpp",        secondary_type ;Quilava
INCBIN "gfx/types/fire.1bpp",        secondary_type ;Typhlosion
INCBIN "gfx/types/water.1bpp",        secondary_type ;Totodile
INCBIN "gfx/types/water.1bpp",        secondary_type ;Croconaw
INCBIN "gfx/types/water.1bpp",        secondary_type ;Feraligatr
; 161-168 first type
INCBIN "gfx/types/none.1bpp",      primary_type ;Sentret
INCBIN "gfx/types/none.1bpp",      primary_type ;Furret
INCBIN "gfx/types/normal.1bpp",      primary_type ;Hoothoot
INCBIN "gfx/types/normal.1bpp",      primary_type ;Noctowl
INCBIN "gfx/types/none.1bpp",    primary_type ;Cubbolt
INCBIN "gfx/types/electric.1bpp",    primary_type ;Electiger
INCBIN "gfx/types/bug.1bpp",         primary_type ;Spinarak
INCBIN "gfx/types/bug.1bpp",         primary_type ;Ariados
; 161-168 second type
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Sentret
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Furret
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Hoothoot
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Noctowl
INCBIN "gfx/types/electric.1bpp",        secondary_type ;Cubbolt
INCBIN "gfx/types/dark.1bpp",     	 secondary_type ;Electiger
INCBIN "gfx/types/poison.1bpp",      secondary_type ;Spinarak
INCBIN "gfx/types/poison.1bpp",      secondary_type ;Ariados
; 169-176 first type
INCBIN "gfx/types/poison.1bpp",      primary_type ;Crobat
INCBIN "gfx/types/water.1bpp",       primary_type ;Chinchou
INCBIN "gfx/types/water.1bpp",       primary_type ;Lanturn
INCBIN "gfx/types/normal.1bpp",      primary_type ;Sirfetch'd
INCBIN "gfx/types/grass.1bpp",       primary_type ;Mandrabel
INCBIN "gfx/types/ghost.1bpp",       primary_type ;Curstraw
INCBIN "gfx/types/ice.1bpp",         primary_type ;Shifur
INCBIN "gfx/types/ice.1bpp",         primary_type ;Snowmad
; 169-176 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Crobat
INCBIN "gfx/types/electric.1bpp",    secondary_type ;Chinchou
INCBIN "gfx/types/electric.1bpp",    secondary_type ;Lanturn
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Sirfetch'd
INCBIN "gfx/types/fairy.1bpp",       secondary_type ;Mandrabel
INCBIN "gfx/types/normal.1bpp",      secondary_type ;Curstraw
INCBIN "gfx/types/normal.1bpp",      secondary_type ;Shifur
INCBIN "gfx/types/dark.1bpp",        secondary_type ;Snowmad
; 177-184 first type
INCBIN "gfx/types/psychic.1bpp",     primary_type ;Natu
INCBIN "gfx/types/psychic.1bpp",     primary_type ;Xatu
INCBIN "gfx/types/none.1bpp",    primary_type ;Mareep
INCBIN "gfx/types/none.1bpp",    primary_type ;Flaaffy
INCBIN "gfx/types/none.1bpp",    primary_type ;Ampharos
INCBIN "gfx/types/none.1bpp",       primary_type ;Bellossom
INCBIN "gfx/types/water.1bpp",       primary_type ;Marill
INCBIN "gfx/types/water.1bpp",       primary_type ;Azumarill
; 177-184 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Natu
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Xatu
INCBIN "gfx/types/electric.1bpp",        secondary_type ;Mareep
INCBIN "gfx/types/electric.1bpp",        secondary_type ;Flaaffy
INCBIN "gfx/types/electric.1bpp",        secondary_type ;Ampharos
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Bellossom
INCBIN "gfx/types/fairy.1bpp",       secondary_type ;Marill
INCBIN "gfx/types/fairy.1bpp",       secondary_type ;Azumarill
; 185-192 first type
INCBIN "gfx/types/none.1bpp",        primary_type ;Sudowoodo
INCBIN "gfx/types/none.1bpp",       primary_type ;Politoed
INCBIN "gfx/types/grass.1bpp",       primary_type ;Hoppip
INCBIN "gfx/types/grass.1bpp",       primary_type ;Skiploom
INCBIN "gfx/types/grass.1bpp",       primary_type ;Jumpluff
INCBIN "gfx/types/none.1bpp",      primary_type ;Aipom
INCBIN "gfx/types/none.1bpp",       primary_type ;Sunkern
INCBIN "gfx/types/none.1bpp",       primary_type ;Sunflora
; 185-192 second type
INCBIN "gfx/types/rock.1bpp",        secondary_type ;Sudowoodo
INCBIN "gfx/types/water.1bpp",        secondary_type ;Politoed
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Hoppio
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Skiploom
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Jumpluff
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Aipom
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Sunkern
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Sunflora
; 193-200 first type
INCBIN "gfx/types/bug.1bpp",         primary_type ;Yanma
INCBIN "gfx/types/water.1bpp",       primary_type ;Wooper
INCBIN "gfx/types/water.1bpp",       primary_type ;Quagsire
INCBIN "gfx/types/none.1bpp",     primary_type ;Espeon
INCBIN "gfx/types/none.1bpp",        primary_type ;Umbreon
INCBIN "gfx/types/dark.1bpp",        primary_type ;Murkow
INCBIN "gfx/types/water.1bpp",       primary_type ;Slowking
INCBIN "gfx/types/none.1bpp",       primary_type ;Misdreavus
; 193-200 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Yanma
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Wooper
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Quagsire
INCBIN "gfx/types/psychic.1bpp",        secondary_type ;Espeon
INCBIN "gfx/types/dark.1bpp",        secondary_type ;Umbreon
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Murkow
INCBIN "gfx/types/psychic.1bpp",     secondary_type ;Slowking
INCBIN "gfx/types/ghost.1bpp",        secondary_type ;Misdreavus
; 201-208 first type
INCBIN "gfx/types/none.1bpp",     primary_type ;Unown
INCBIN "gfx/types/none.1bpp",     primary_type ;Wobbuffet
INCBIN "gfx/types/normal.1bpp",      primary_type ;Girafarig
INCBIN "gfx/types/none.1bpp",         primary_type ;Pineco
INCBIN "gfx/types/bug.1bpp",         primary_type ;Forretress
INCBIN "gfx/types/none.1bpp",      primary_type ;Dunsparce
INCBIN "gfx/types/ground.1bpp",      primary_type ;Gligar
INCBIN "gfx/types/steel.1bpp",       primary_type ;Steelix
; 201-208 second type
INCBIN "gfx/types/psychic.1bpp",        secondary_type ;Unown
INCBIN "gfx/types/psychic.1bpp",        secondary_type ;Wobbuffet
INCBIN "gfx/types/psychic.1bpp",     secondary_type ;Girafarig
INCBIN "gfx/types/bug.1bpp",        secondary_type ;Pineco
INCBIN "gfx/types/steel.1bpp",       secondary_type ;Forretress
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Dunsparce
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Gligar
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Steelix
; 209-216 first type
INCBIN "gfx/types/none.1bpp",       primary_type ;Snubbull
INCBIN "gfx/types/none.1bpp",       primary_type ;Granbull
INCBIN "gfx/types/water.1bpp",       primary_type ;Qwilfish
INCBIN "gfx/types/bug.1bpp",         primary_type ;Scizor
INCBIN "gfx/types/bug.1bpp",         primary_type ;Shuckle
INCBIN "gfx/types/bug.1bpp",         primary_type ;Heracross
INCBIN "gfx/types/normal.1bpp",      primary_type ;Tungtyed
INCBIN "gfx/types/none.1bpp",      primary_type ;Teddiursa
; 209-216 second type
INCBIN "gfx/types/fairy.1bpp",        secondary_type ;Snubbull
INCBIN "gfx/types/fairy.1bpp",        secondary_type ;Granbull
INCBIN "gfx/types/poison.1bpp",      secondary_type ;Qwilfish
INCBIN "gfx/types/steel.1bpp",       secondary_type ;Scizor
INCBIN "gfx/types/rock.1bpp",        secondary_type ;Shuckle
INCBIN "gfx/types/fighting.1bpp",    secondary_type ;Heracross
INCBIN "gfx/types/psychic.1bpp",        secondary_type ;Tungtyed
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Teddiursa
; 217-224 first type
INCBIN "gfx/types/none.1bpp",      primary_type ;Ursaring
INCBIN "gfx/types/none.1bpp",        primary_type ;Slugma
INCBIN "gfx/types/fire.1bpp",        primary_type ;Magcargo
INCBIN "gfx/types/ice.1bpp",         primary_type ;Swinub
INCBIN "gfx/types/ice.1bpp",         primary_type ;Piloswine
INCBIN "gfx/types/water.1bpp",       primary_type ;Corsola
INCBIN "gfx/types/none.1bpp",       primary_type ;Remoraid
INCBIN "gfx/types/none.1bpp",       primary_type ;Octillery
; 217-224 second type
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Ursaring
INCBIN "gfx/types/fire.1bpp",        secondary_type ;Slugma
INCBIN "gfx/types/rock.1bpp",        secondary_type ;Magcargo
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Swinub
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Piloswine
INCBIN "gfx/types/rock.1bpp",        secondary_type ;Corsola
INCBIN "gfx/types/water.1bpp",        secondary_type ;Remoraid
INCBIN "gfx/types/water.1bpp",        secondary_type ;Octillery
; 225-232 first type
INCBIN "gfx/types/ice.1bpp",         primary_type ;Delibird
INCBIN "gfx/types/water.1bpp",       primary_type ;Mantine
INCBIN "gfx/types/steel.1bpp",       primary_type ;Skarmory
INCBIN "gfx/types/fire.1bpp",        primary_type ;Houndour
INCBIN "gfx/types/fire.1bpp",        primary_type ;Houndoom
INCBIN "gfx/types/water.1bpp",       primary_type ;Kingdra
INCBIN "gfx/types/none.1bpp",      primary_type ;Phanpy
INCBIN "gfx/types/none.1bpp",      primary_type ;Donphan
; 225-232 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Delibird
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Mantine
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Skarmory
INCBIN "gfx/types/dark.1bpp",        secondary_type ;Houndour
INCBIN "gfx/types/dark.1bpp",        secondary_type ;Houndoom
INCBIN "gfx/types/dragon.1bpp",      secondary_type ;Kingdra
INCBIN "gfx/types/ground.1bpp",        secondary_type ;Phanpy
INCBIN "gfx/types/ground.1bpp",        secondary_type ;Donphan
; 233-240 first type
INCBIN "gfx/types/none.1bpp",      primary_type ;Porygon2
INCBIN "gfx/types/none.1bpp",      primary_type ;Stantler
INCBIN "gfx/types/none.1bpp",      primary_type ;Smeargle
INCBIN "gfx/types/none.1bpp",       primary_type ;Tangrowth
INCBIN "gfx/types/ghost.1bpp",       primary_type ;Gremini
INCBIN "gfx/types/ice.1bpp",         primary_type ;Smoochum
INCBIN "gfx/types/none.1bpp",    primary_type ;Elekid
INCBIN "gfx/types/none.1bpp",        primary_type ;Magby
; 233-240 second type
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Porygon2
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Stantler
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Smeargle
INCBIN "gfx/types/grass.1bpp",        secondary_type ;Tangrowth
INCBIN "gfx/types/dark.1bpp",        secondary_type ;Gremini
INCBIN "gfx/types/psychic.1bpp",     secondary_type ;Smoochum
INCBIN "gfx/types/electric.1bpp",        secondary_type ;Elekid
INCBIN "gfx/types/fire.1bpp",        secondary_type ;Magby
; 241-248 first type
INCBIN "gfx/types/none.1bpp",      primary_type ;Miltank
INCBIN "gfx/types/none.1bpp",      primary_type ;Blissey
INCBIN "gfx/types/none.1bpp",    primary_type ;Raikou
INCBIN "gfx/types/none.1bpp",        primary_type ;Entei
INCBIN "gfx/types/none.1bpp",       primary_type ;Suicune 
INCBIN "gfx/types/rock.1bpp",        primary_type ;Larvitar
INCBIN "gfx/types/rock.1bpp",        primary_type ;Pupitar
INCBIN "gfx/types/rock.1bpp",        primary_type ;Tyranitar
; 241-248 second type
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Miltank
INCBIN "gfx/types/normal.1bpp",        secondary_type ;Blissey
INCBIN "gfx/types/electric.1bpp",        secondary_type ;Raikou
INCBIN "gfx/types/fire.1bpp",        secondary_type ;Entei
INCBIN "gfx/types/water.1bpp",        secondary_type ;Suicune 
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Larvitar
INCBIN "gfx/types/ground.1bpp",      secondary_type ;Pupitar
INCBIN "gfx/types/dark.1bpp",        secondary_type ;Tyranitar
; 249-256 first type
INCBIN "gfx/types/psychic.1bpp",     primary_type ;Lugia
INCBIN "gfx/types/fire.1bpp",      	 primary_type ;Ho-Oh
INCBIN "gfx/types/grass.1bpp",       primary_type ;Celebi
INCBIN "gfx/types/water.1bpp",       primary_type ;Octank
INCBIN "gfx/types/steel.1bpp",       primary_type ;Ferrodon
INCBIN "gfx/types/none.1bpp",        primary_type
INCBIN "gfx/types/none.1bpp",        primary_type
INCBIN "gfx/types/none.1bpp",        primary_type
; 249-256 second type
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Lugia
INCBIN "gfx/types/flying.1bpp",      secondary_type ;Ho-Oh
INCBIN "gfx/types/psychic.1bpp",     secondary_type ;Celebi
INCBIN "gfx/types/steel.1bpp",       secondary_type ;Octank
INCBIN "gfx/types/dragon.1bpp",      secondary_type	;Ferrodon
INCBIN "gfx/types/none.1bpp",        secondary_type
INCBIN "gfx/types/none.1bpp",        secondary_type
INCBIN "gfx/types/none.1bpp",        secondary_type
