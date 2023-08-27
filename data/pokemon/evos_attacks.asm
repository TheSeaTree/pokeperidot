INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_HOLD, item, time of day, species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvoTypeSizes::
	db 2 ; EVOLVE_LEVEL
	db 2 ; EVOLVE_ITEM
	db 2 ; EVOLVE_TRADE
	db 2 ; EVOLVE_HAPPINESS
	db 2 ; EVOLVE_HOLD


EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 15, RAZOR_LEAF
	db 19, SLEEP_POWDER
	db 21, SWEET_SCENT
	db 25, GROWTH
	db 27, DOUBLE_EDGE
	db 33, SYNTHESIS
	db 37, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 3, GROWL
	db 7, LEECH_SEED
	db 9, VINE_WHIP
	db 13, POISONPOWDER
	db 15, RAZOR_LEAF
	db 20, SLEEP_POWDER
	db 23, SWEET_SCENT
	db 28, GROWTH
	db 31, DOUBLE_EDGE
	db 39, SYNTHESIS
	db 44, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 3, GROWL
	db 7, LEECH_SEED
	db 9, VINE_WHIP
	db 13, POISONPOWDER
	db 15, RAZOR_LEAF
	db 20, SLEEP_POWDER
	db 23, SWEET_SCENT
	db 28, GROWTH
	db 31, DOUBLE_EDGE
	db 32, GIGA_DRAIN
	db 45, SYNTHESIS
	db 50, PETAL_DANCE
	db 53, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, SMOKESCREEN
	db 16, RAGE
	db 20, FIRE_PUNCH
	db 25, SCARY_FACE
	db 28, DRAGON_RAGE
	db 34, CUT
	db 37, FLAMETHROWER
	db 43, FIRE_SPIN
	db 46, FLARE_BLITZ
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, SMOKESCREEN
	db 17, RAGE
	db 23, FIRE_PUNCH
	db 28, SCARY_FACE
	db 31, DRAGON_RAGE
	db 39, CUT
	db 43, FLAMETHROWER
	db 50, FIRE_SPIN
	db 54, FLARE_BLITZ
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, SMOKESCREEN
	db 7, EMBER
	db 10, SMOKESCREEN
	db 17, RAGE
	db 23, FIRE_PUNCH
	db 28, SCARY_FACE
	db 32, DRAGON_RAGE
	db 36, WING_ATTACK
	db 41, CUT
	db 47, FLAMETHROWER
	db 56, FIRE_SPIN
	db 62, FLARE_BLITZ
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, DEFENSE_CURL
	db 13, BUBBLE
	db 16, BITE
	db 19, RAPID_SPIN
	db 22, PROTECT
	db 25, BUBBLEBEAM
	db 31, SKULL_BASH
	db 37, RAIN_DANCE
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, DEFENSE_CURL
	db 13, BUBBLE
	db 17, BITE
	db 21, RAPID_SPIN
	db 25, PROTECT
	db 37, SKULL_BASH
	db 45, RAIN_DANCE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 1, DEFENSE_CURL
	db 1, BODY_PRESS
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, DEFENSE_CURL
	db 13, BUBBLE
	db 17, BITE
	db 21, RAPID_SPIN
	db 25, PROTECT
	db 40, SKULL_BASH
	db 54, RAIN_DANCE
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 7, HARDEN
	db 25, BIDE
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 10, GUST
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 13, SLEEP_POWDER
	db 17, PSYBEAM
	db 19, SILVER_WIND
	db 23, SUPERSONIC
	db 25, SAFEGUARD
	db 29, WHIRLWIND
	db 31, QUIVER_DANCE
	db 35, SIGNAL_BEAM
	db 40, U_TURN
	db 43, RAZOR_WIND
	db 50, HURRICANE
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 7, HARDEN
	db 25, BIDE
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHARPEN
	db 10, WING_ATTACK
	db 11, FURY_ATTACK
	db 14, RAGE
	db 17, PURSUIT
	db 20, PIN_MISSILE
	db 23, SPIKES
	db 25, BRICK_BREAK
	db 26, FOCUS_ENERGY
	db 29, AGILITY
	db 32, TWINEEDLE
	db 35, SLUDGE_BOMB
	db 38, OUTRAGE
	db 40, U_TURN
	db 44, X_SCISSOR
	db 50, MEGAHORN
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, FURY_SWIPES
	db 16, AQUA_JET
	db 19, DISABLE
	db 22, SCREECH
	db 25, SIGNAL_BEAM
	db 28, WATERFALL
	db 31, AGILITY
	db 34, PSYCH_UP
	db 37, AMNESIA
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, FURY_SWIPES
	db 16, AQUA_JET
	db 19, DISABLE
	db 22, SCREECH
	db 25, SIGNAL_BEAM
	db 28, WATERFALL
	db 31, AGILITY
	db 34, PSYBEAM
	db 38, PSYCH_UP
	db 41, AMNESIA
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

SkelegonEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, HARDEN
	db 1, LEER
	db 5, ROCK_THROW
	db 9, BITE
	db 12, SCARY_FACE
	db 15, ANCIENTPOWER
	db 18, BULLDOZE
	db 21, SCREECH
	db 24, CURSE
	db 27, CRUNCH
	db 33, EARTHQUAKE
	db 37, ROCK_SLIDE
	db 42, THRASH
	db 47, SANDSTORM
	db 53, RAZOR_WIND
	db 57, HYPER_BEAM
	db 60, STONE_EDGE
	db 0 ; no more level-up moves130

RinringEvosAttacks:
	db EVOLVE_HAPPINESS, TR_NITE, NYANELL
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 6, BITE
	db 14, FURY_SWIPES
	db 17, SCREECH
	db 22, FAINT_ATTACK
	db 27, HEAL_BELL
	db 33, CUT
	db 38, PURSUIT
	db 41, CRUNCH
	db 0 ; no more level-up moves

NyanellEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 6, BITE
	db 14, FURY_SWIPES
	db 17, SCREECH
	db 22, FAINT_ATTACK
	db 27, HEAL_BELL
	db 33, CUT
	db 38, PURSUIT
	db 41, CRUNCH
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, PECK
	db 4, LEER
	db 8, PURSUIT
	db 11, FURY_ATTACK
	db 15, WING_ATTACK
	db 18, MIRROR_MOVE
	db 25, AGILITY
	db 29, FOCUS_ENERGY
	db 32, DOUBLE_TEAM
	db 36, DRILL_PECK
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, LEER
	db 7, LEER
	db 8, PURSUIT
	db 11, FURY_ATTACK
	db 15, WING_ATTACK
	db 18, MIRROR_MOVE
	db 27, AGILITY
	db 32, FOCUS_ENERGY
	db 38, DOUBLE_TEAM
	db 41, DRILL_PECK
	db 58, EXTREMESPEED
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 4, POISON_STING
	db 9, BITE
	db 14, SCREECH
	db 20, ACID
	db 23, GLARE
	db 25, COIL
	db 28, SLUDGE
	db 38, SLUDGE_BOMB
	db 41, HAZE
	db 49, GUNK_SHOT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, BITE
	db 4, POISON_STING
	db 9, BITE
	db 14, SCREECH
	db 22, CRUNCH
	db 20, ACID
	db 26, GLARE
	db 28, COIL
	db 32, SLUDGE
	db 48, SLUDGE_BOMB
	db 51, HAZE
	db 63, GUNK_SHOT
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 18, THUNDER_WAVE
	db 23, DOUBLE_TEAM
	db 26, SPARK
	db 37, BODY_SLAM
	db 42, THUNDERBOLT
	db 45, AGILITY
	db 53, LIGHT_SCREEN
	db 58, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 3, SAND_ATTACK
	db 5, POISON_STING
	db 7, ROLLOUT
	db 9, RAPID_SPIN
	db 11, FURY_CUTTER
	db 14, BULLDOZE
	db 17, SWIFT
	db 20, FURY_SWIPES
	db 26, CUT
	db 30, DIG
	db 34, IRON_HEAD
	db 38, SWORDS_DANCE
	db 42, SANDSTORM
	db 46, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 3, SAND_ATTACK
	db 5, POISON_STING
	db 7, ROLLOUT
	db 9, RAPID_SPIN
	db 11, FURY_CUTTER
	db 14, BULLDOZE
	db 17, SWIFT
	db 20, FURY_SWIPES
	db 28, CUT
	db 33, DIG
	db 38, IRON_HEAD
	db 43, SWORDS_DANCE
	db 48, SANDSTORM
	db 53, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 7, TAIL_WHIP
	db 9, BITE
	db 13, POISON_STING
	db 19, FURY_SWIPES
	db 21, DOUBLE_KICK
	db 34, CRUNCH
	db 43, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 7, TAIL_WHIP
	db 9, BITE
	db 13, POISON_STING
	db 20, FURY_SWIPES
	db 23, DOUBLE_KICK
	db 36, CRUNCH
	db 45, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SPIKES
	db 1, SCRATCH
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 35, BODY_SLAM
	db 43, EARTHQUAKE
	db 46, ATTRACT
	db 58, BODY_PRESS
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 7, FOCUS_ENERGY
	db 9, PECK
	db 13, POISON_STING
	db 19, FURY_ATTACK
	db 21, HORN_ATTACK
	db 37, SLUDGE_BOMB
	db 45, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 7, FOCUS_ENERGY
	db 9, PECK
	db 13, POISON_STING
	db 20, FURY_ATTACK
	db 23, HORN_ATTACK
	db 36, SLUDGE_BOMB
	db 43, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SPIKES
	db 1, HORN_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 35, THRASH
	db 43, EARTHQUAKE
	db 46, ATTRACT
	db 58, MEGAHORN
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, DRAIN_KISS
	db 1, ENCORE
	db 7, SING
	db 10, DOUBLESLAP
	db 13, DEFENSE_CURL
	db 25, MINIMIZE
	db 31, METRONOME
	db 34, COSMIC_POWER
	db 40, BODY_SLAM
	db 43, MOONLIGHT
	db 46, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DRAIN_KISS
	db 1, METRONOME
	db 1, MOONLIGHT
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 4, TAIL_WHIP
	db 7, ROAR
	db 10, QUICK_ATTACK
	db 12, CONFUSE_RAY
	db 15, FIRE_SPIN
	db 20, WILL_O_WISP
	db 23, FAINT_ATTACK
	db 28, DOUBLE_TEAM
	db 31, PSYBEAM
	db 36, FLAMETHROWER
	db 42, FIRE_BLAST
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAMETHROWER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, NASTY_PLOT
	db 43, NASTY_PLOT
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, DOUBLESLAP
	db 29, REST
	db 34, BODY_SLAM
	db 39, DOUBLE_EDGE
	db 44, PERISH_SONG
	db 55, EXPLOSION
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DISABLE
	db 1, DEFENSE_CURL
	db 1, DOUBLESLAP
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 5, SUPERSONIC
	db 11, BITE
	db 13, WING_ATTACK
	db 17, CONFUSE_RAY
	db 19, U_TURN
	db 23, SCREECH
	db 25, SLUDGE
	db 29, MEAN_LOOK
	db 31, LEECH_LIFE
	db 35, HAZE
	db 37, SLUDGE_BOMB
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, ABSORB
	db 5, SUPERSONIC
	db 11, BITE
	db 13, WING_ATTACK
	db 17, CONFUSE_RAY
	db 19, U_TURN
	db 24, SCREECH
	db 27, SLUDGE
	db 32, MEAN_LOOK
	db 35, LEECH_LIFE
	db 38, MOONLIGHT
	db 40, HAZE
	db 43, SLUDGE_BOMB
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 5, SWEET_SCENT
	db 9, ACID
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 19, MEGA_DRAIN
	db 27, MOONLIGHT
	db 31, GIGA_DRAIN
	db 35, TOXIC
	db 43, MOONBLAST
	db 51, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 5, SWEET_SCENT
	db 9, ACID
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 19, MEGA_DRAIN
	db 29, MOONLIGHT
	db 34, GIGA_DRAIN
	db 39, TOXIC
	db 49, SOLARBEAM
	db 51, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, HEAL_BELL
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 59, PETAL_DANCE
	db 69, SOLARBEAM
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 6, STUN_SPORE
	db 6, POISONPOWDER
	db 9, FURY_SWIPES
	db 11, ABSORB
	db 17, FURY_CUTTER
	db 21, SPORE
	db 25, LEECH_LIFE
	db 33, GROWTH
	db 38, GIGA_DRAIN
	db 43, X_SCISSOR
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 1, ABSORB
	db 6, STUN_SPORE
	db 6, POISONPOWDER
	db 9, FURY_SWIPES
	db 11, ABSORB
	db 17, FURY_CUTTER
	db 22, SPORE
	db 29, LEECH_LIFE
	db 37, GROWTH
	db 44, GIGA_DRAIN
	db 51, X_SCISSOR
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 5, SUPERSONIC
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 17, SILVER_WIND
	db 20, PSYBEAM
	db 23, STUN_SPORE
	db 25, SIGNAL_BEAM
	db 29, SLEEP_POWDER
	db 35, LEECH_LIFE
	db 41, SLUDGE_BOMB
	db 47, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 5, SUPERSONIC
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 17, SILVER_WIND
	db 20, PSYBEAM
	db 23, STUN_SPORE
	db 25, SIGNAL_BEAM
	db 29, SLEEP_POWDER
	db 37, LEECH_LIFE
	db 47, SLUDGE_BOMB
	db 55, PSYCHIC_M
	db 63, QUIVER_DANCE
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SAND_ATTACK
	db 1, SCRATCH
	db 4, GROWL
	db 10, MUD_SLAP
	db 16, BULLDOZE
	db 28, CUT
	db 31, DIG
	db 35, IRON_HEAD
	db 39, EARTHQUAKE
	db 43, STONE_EDGE
	db 50, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, SAND_ATTACK
	db 1, SCRATCH
	db 4, GROWL
	db 10, MUD_SLAP
	db 16, BULLDOZE
	db 30, CUT
	db 35, DIG
	db 41, IRON_HEAD
	db 47, EARTHQUAKE
	db 53, STONE_EDGE
	db 60, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 6, BITE
	db 14, FURY_SWIPES
	db 17, SCREECH
	db 22, FAINT_ATTACK
	db 30, PAY_DAY
	db 33, CUT
	db 38, NASTY_PLOT
	db 41, CRUNCH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, BITE
	db 6, BITE
	db 14, FURY_SWIPES
	db 17, SCREECH
	db 22, FAINT_ATTACK
	db 28, SWIFT
	db 37, CUT
	db 44, NASTY_PLOT
	db 49, CRUNCH
	db 0 ; no more level-up moves

SMolaEvosAttacks:
	db EVOLVE_LEVEL, 32, ANCOR
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 4, BITE
	db 8, FOCUS_ENERGY
	db 11, BUBBLEBEAM
	db 18, SCREECH
	db 22, SWAGGER
	db 29, SCARY_FACE
	db 36, CRUNCH
	db 39, AGILITY
	db 43, DOUBLE_EDGE
	db 0 ; no more level-up moves

AncorEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, BITE
	db 1, RAGE
	db 1, FOCUS_ENERGY
	db 4, RAGE
	db 8, FOCUS_ENERGY
	db 11, BUBBLEBEAM
	db 18, SCREECH
	db 22, SWAGGER
	db 29, SCARY_FACE
	db 32, BIND
	db 34, IRON_TAIL
	db 40, CRUNCH
	db 48, SKULL_BASH
	db 51, DOUBLE_EDGE
	db 55, STONE_EDGE
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 1, SCRATCH
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 6, FURY_SWIPES
	db 8, MUD_SLAP
	db 12, PURSUIT
	db 15, SEISMIC_TOSS
	db 19, SWAGGER
	db 22, FAINT_ATTACK
	db 26, SCREECH
	db 29, U_TURN
	db 32, BRICK_BREAK
	db 35, CROSS_CHOP
	db 38, SUBMISSION
	db 42, THRASH
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 1, SCRATCH
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 1, COUNTER
	db 6, FURY_SWIPES
	db 8, MUD_SLAP
	db 12, PURSUIT
	db 15, SEISMIC_TOSS
	db 19, SWAGGER
	db 22, FAINT_ATTACK
	db 26, SCREECH
	db 30, U_TURN
	db 34, BRICK_BREAK
	db 38, CROSS_CHOP
	db 44, SUBMISSION
	db 47, THRASH
	db 53, OUTRAGE
	db 60, EXPLOSION
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, ROAR
	db 8, BITE
	db 10, LEER
	db 14, QUICK_ATTACK
	db 17, FLAME_WHEEL
	db 28, DOUBLE_EDGE
	db 30, AGILITY
	db 34, FLAMETHROWER
	db 39, CRUNCH
	db 43, OUTRAGE
	db 45, FLARE_BLITZ
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, BITE
	db 1, DOUBLE_EDGE
	db 1, FLAME_WHEEL
	db 34, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 8, HYPNOSIS
	db 11, BUBBLE
	db 15, DOUBLESLAP
	db 18, RAIN_DANCE
	db 21, BODY_SLAM
	db 25, BUBBLEBEAM
	db 28, MUD_SLAP
	db 31, BELLY_DRUM
	db 35, AMNESIA
	db 38, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_HOLD, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 8, HYPNOSIS
	db 11, BUBBLE
	db 15, DOUBLESLAP
	db 18, RAIN_DANCE
	db 21, BODY_SLAM
	db 27, BUBBLEBEAM
	db 32, MUD_SLAP
	db 37, BELLY_DRUM
	db 43, AMNESIA
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, SUBMISSION
	db 32, DRAIN_PUNCH
	db 43, DYNAMICPUNCH
	db 50, BODY_PRESS
	db 55, MIND_READER
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, REFLECT
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 43, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSION
	db 1, METRONOME
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, REFLECT
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 43, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, BRICK_BREAK
	db 1, LEER
	db 3, FOCUS_ENERGY
	db 7, KARATE_CHOP
	db 9, FORESIGHT
	db 15, SEISMIC_TOSS
	db 21, PURSUIT
	db 25, DRAIN_PUNCH
	db 29, MACH_PUNCH
	db 33, BULK_UP
	db 37, VITAL_THROW
	db 39, CROSS_CHOP
	db 41, BULLDOZE
	db 44, DYNAMICPUNCH
	db 49, SUBMISSION
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, MACHAMP
	db 0 ; no more evolutions
	db 1, BRICK_BREAK
	db 1, LEER
	db 1, BULLET_PUNCH
	db 3, FOCUS_ENERGY
	db 7, KARATE_CHOP
	db 9, FORESIGHT
	db 15, SEISMIC_TOSS
	db 21, PURSUIT
	db 25, DRAIN_PUNCH
	db 33, MACH_PUNCH
	db 37, BULK_UP
	db 43, VITAL_THROW
	db 47, CROSS_CHOP
	db 50, BULLDOZE
	db 57, DYNAMICPUNCH
	db 61, SUBMISSION
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, BRICK_BREAK
	db 1, LEER
	db 1, BULLET_PUNCH
	db 1, BODY_PRESS
	db 3, FOCUS_ENERGY
	db 7, KARATE_CHOP
	db 9, FORESIGHT
	db 15, SEISMIC_TOSS
	db 21, PURSUIT
	db 25, DRAIN_PUNCH
	db 33, MACH_PUNCH
	db 37, BULK_UP
	db 43, VITAL_THROW
	db 47, CROSS_CHOP
	db 49, FORESIGHT
	db 50, BULLDOZE
	db 54, STONE_EDGE
	db 57, DYNAMICPUNCH
	db 61, SUBMISSION
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 23, ACID
	db 29, SWEET_SCENT
	db 33, FALSE_SWIPE
	db 39, RAZOR_LEAF
	db 41, SLUDGE_BOMB
	db 45, BODY_SLAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db EVOLVE_ITEM, SUN_STONE, MANDRABEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 24, ACID
	db 32, SWEET_SCENT
	db 41, FALSE_SWIPE
	db 44, RAZOR_LEAF
	db 47, SLUDGE_BOMB
	db 54, BODY_SLAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 44, PETAL_DANCE
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, WATER_GUN
	db 4, ACID
	db 8, WRAP
	db 12, SUPERSONIC
	db 16, BUBBLEBEAM
	db 20, SCREECH
	db 24, BIND
	db 32, ACID_ARMOR
	db 36, SLUDGE_BOMB
	db 40, SURF
	db 44, TOXIC
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, WATER_GUN
	db 1, ACID
	db 1, WRAP
	db 12, SUPERSONIC
	db 16, BUBBLEBEAM
	db 20, SCREECH
	db 24, BIND
	db 30, MEAN_LOOK
	db 34, ACID_ARMOR
	db 40, SLUDGE_BOMB
	db 46, SURF
	db 52, TOXIC
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 10, ROLLOUT
	db 16, ROCK_THROW
	db 22, BULLDOZE
	db 24, EXPLOSION
	db 31, SANDSTORM
	db 34, EARTHQUAKE
	db 40, DOUBLE_EDGE
	db 42, STONE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 10, ROLLOUT
	db 16, ROCK_THROW
	db 22, BULLDOZE
	db 24, EXPLOSION
	db 32, RAPID_SPIN
	db 36, SANDSTORM
	db 40, EARTHQUAKE
	db 50, DOUBLE_EDGE
	db 54, STONE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BRICK_BREAK
	db 1, DEFENSE_CURL
	db 10, ROLLOUT
	db 16, ROCK_THROW
	db 22, BULLDOZE
	db 24, EXPLOSION
	db 32, RAPID_SPIN
	db 36, SANDSTORM
	db 40, EARTHQUAKE
	db 50, DOUBLE_EDGE
	db 54, STONE_EDGE
	db 60, IRON_HEAD
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, QUICK_ATTACK
	db 4, TAIL_WHIP
	db 9, EMBER
	db 13, FLAME_WHEEL
	db 17, HEADBUTT
	db 25, FIRE_SPIN
	db 29, DOUBLE_EDGE
	db 37, AGILITY
	db 41, FIRE_BLAST
	db 49, FLARE_BLITZ
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, QUICK_ATTACK
	db 4, TAIL_WHIP
	db 9, EMBER
	db 13, FLAME_WHEEL
	db 17, HEADBUTT
	db 25, FIRE_SPIN
	db 29, DOUBLE_EDGE
	db 37, AGILITY
	db 41, FIRE_BLAST
	db 45, MEGAHORN
	db 49, FLARE_BLITZ
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_HOLD, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 5, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, BUBBLEBEAM
	db 32, PSYBEAM
	db 36, RECOVER
	db 41, AMNESIA
	db 45, PSYCHIC_M
	db 49, RAIN_DANCE
	db 54, PSYCH_UP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 5, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, BUBBLEBEAM
	db 32, PSYBEAM
	db 36, RECOVER
	db 37, DEFENSE_CURL
	db 43, AMNESIA
	db 49, PSYCHIC_M
	db 55, RAIN_DANCE
	db 62, PSYCH_UP
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SUPERSONIC
	db 5, THUNDERSHOCK
	db 11, THUNDER_WAVE
	db 13, LIGHT_SCREEN
	db 17, SONICBOOM
	db 19, SPARK
	db 31, IRON_HEAD
	db 35, SCREECH
	db 37, THUNDERBOLT
	db 41, LOCK_ON
	db 49, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SUPERSONIC
	db 1, MEAN_LOOK
	db 5, THUNDERSHOCK
	db 11, THUNDER_WAVE
	db 13, LIGHT_SCREEN
	db 17, SONICBOOM
	db 19, SPARK
	db 30, TRI_ATTACK
	db 33, IRON_HEAD
	db 39, SCREECH
	db 43, THUNDERBOLT
	db 49, LOCK_ON
	db 63, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db EVOLVE_HAPPINESS, TR_MORNDAY, SIRFETCH_D
	db 0 ; no more evolutions
	db 1, PECK
	db 1, FURY_CUTTER
	db 1, LEER
	db 7, FURY_ATTACK
	db 9, WING_ATTACK
	db 19, CUT
	db 25, SWORDS_DANCE
	db 31, AGILITY
	db 45, FALSE_SWIPE
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 8, RAGE
	db 12, FURY_ATTACK
	db 15, PURSUIT
	db 22, AGILITY
	db 31, TRI_ATTACK
	db 36, SWORDS_DANCE
	db 40, HI_JUMP_KICK
	db 43, DRILL_PECK
	db 50, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 8, RAGE
	db 12, FURY_ATTACK
	db 15, PURSUIT
	db 22, AGILITY
	db 31, TRI_ATTACK
	db 38, SWORDS_DANCE
	db 43, HI_JUMP_KICK
	db 47, DRILL_PECK
	db 56, THRASH
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 3, GROWL
	db 11, WATER_GUN
	db 11, ICY_WIND
	db 13, ENCORE
	db 21, REST
	db 27, AURORA_BEAM
	db 31, AQUA_JET
	db 35, SING
	db 37, DOUBLE_EDGE
	db 47, ICE_BEAM
	db 51, SAFEGUARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 3, GROWL
	db 11, WATER_GUN
	db 11, ICY_WIND
	db 13, ENCORE
	db 21, REST
	db 25, FREEZE_DRY
	db 27, AURORA_BEAM
	db 31, AQUA_JET
	db 34, HORN_DRILL
	db 39, DOUBLE_EDGE
	db 42, SIGNAL_BEAM
	db 55, ICE_BEAM
	db 61, SAFEGUARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 4, HARDEN
	db 7, BITE
	db 12, DISABLE
	db 18, SLUDGE
	db 21, MINIMIZE
	db 26, FAINT_ATTACK
	db 29, SLUDGE_BOMB
	db 32, CRUNCH
	db 37, SCREECH
	db 40, GUNK_SHOT
	db 43, ACID_ARMOR
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, MOONBLAST
	db 1, BRICK_BREAK
	db 1, POUND
	db 1, POISON_GAS
	db 4, HARDEN
	db 7, BITE
	db 12, DISABLE
	db 18, SLUDGE
	db 21, MINIMIZE
	db 26, FAINT_ATTACK
	db 29, SLUDGE_BOMB
	db 32, CRUNCH
	db 37, SCREECH
	db 40, GUNK_SHOT
	db 46, ACID_ARMOR
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db EVOLVE_HOLD, SLOWPOKETAIL, CONCHER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 4, HARDEN
	db 8, SUPERSONIC
	db 13, ICY_WIND
	db 16, PROTECT
	db 20, LEER
	db 25, WHIRLPOOL
	db 32, ICICLE_SPEAR
	db 37, AURORA_BEAM
	db 52, ICE_BEAM
	db 61, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 13, SPIKE_CANNON
	db 28, SPIKES
	db 50, BLIZZARD
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 5, SPITE
	db 8, MEAN_LOOK
	db 10, POISON_GAS
	db 12, CURSE
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, BITE
	db 26, WILL_O_WISP
	db 29, SHADOW_BALL
	db 33, DREAM_EATER
	db 40, DESTINY_BOND
	db 47, NIGHTMARE
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 5, SPITE
	db 8, MEAN_LOOK
	db 10, POISON_GAS
	db 12, CURSE
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, BITE
	db 30, WILL_O_WISP
	db 33, SHADOW_BALL
	db 39, DOUBLESLAP
	db 46, DREAM_EATER
	db 50, DESTINY_BOND
	db 61, NIGHTMARE
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 5, SPITE
	db 8, MEAN_LOOK
	db 10, POISON_GAS
	db 12, CURSE
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, BITE
	db 25, NASTY_PLOT
	db 30, WILL_O_WISP
	db 33, SHADOW_BALL
	db 39, DOUBLESLAP
	db 46, DREAM_EATER
	db 50, DESTINY_BOND
	db 61, NIGHTMARE
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_HOLD, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 1, WRAP
	db 4, CURSE
	db 7, ROCK_THROW
	db 10, COIL
	db 13, RAGE
	db 16, SPIKES
	db 20, IRON_HEAD
	db 22, BULLDOZE
	db 25, DRAGONBREATH
	db 28, BODY_SLAM
	db 31, SCREECH
	db 34, ROCK_SLIDE
	db 37, DIG
	db 40, IRON_TAIL
	db 43, EARTHQUAKE
	db 46, STONE_EDGE
	db 49, DOUBLE_EDGE
	db 52, SANDSTORM
	db 58, SHARPEN
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 5, DISABLE
	db 9, CONFUSION
	db 13, HEADBUTT
	db 17, POISON_GAS
	db 21, CALM_MIND
	db 25, PSYBEAM
	db 27, DRAIN_PUNCH
	db 31, PSYCH_UP
	db 33, DREAM_EATER
	db 33, NIGHTMARE
	db 36, PSYCHIC_M
	db 38, MEAN_LOOK
	db 40, SWAGGER
	db 42, NASTY_PLOT
	db 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 1, MIND_READER
	db 5, DISABLE
	db 9, CONFUSION
	db 13, HEADBUTT
	db 17, POISON_GAS
	db 21, CALM_MIND
	db 25, PSYBEAM
	db 29, DRAIN_PUNCH
	db 33, PSYCH_UP
	db 35, DREAM_EATER
	db 35, NIGHTMARE
	db 41, PSYCHIC_M
	db 43, MEAN_LOOK
	db 45, SWAGGER
	db 53, NASTY_PLOT
	db 61, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 5, BIND
	db 9, LEER
	db 11, HARDEN
	db 15, BUBBLEBEAM
	db 19, BULLDOZE
	db 21, METAL_CLAW
	db 25, HEADBUTT
	db 29, PROTECT
	db 31, GUILLOTINE
	db 35, BODY_SLAM
	db 41, CRABHAMMER
	db 45, FLAIL
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 5, BIND
	db 9, LEER
	db 11, HARDEN
	db 15, BUBBLEBEAM
	db 19, BULLDOZE
	db 21, METAL_CLAW
	db 25, HEADBUTT
	db 32, PROTECT
	db 37, GUILLOTINE
	db 44, BODY_SLAM
	db 56, CRABHAMMER
	db 63, FLAIL
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SONICBOOM
	db 9, SPARK
	db 9, THUNDER_WAVE
	db 11, ROLLOUT
	db 13, SCREECH
	db 20, SWIFT
	db 26, EXPLOSION
	db 29, LIGHT_SCREEN
	db 32, RAPID_SPIN
	db 37, THUNDERBOLT
	db 46, IRON_HEAD
	db 48, MIRROR_COAT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SONICBOOM
	db 9, SPARK
	db 9, THUNDER_WAVE
	db 11, ROLLOUT
	db 13, SCREECH
	db 20, SWIFT
	db 26, EXPLOSION
	db 29, LIGHT_SCREEN
	db 32, RAPID_SPIN
	db 41, THUNDERBOLT
	db 54, IRON_HEAD
	db 58, MIRROR_COAT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 7, REFLECT
	db 11, LEECH_SEED
	db 15, MEGA_DRAIN
	db 19, STUN_SPORE
	db 21, POISONPOWDER
	db 23, SLEEP_POWDER
	db 27, CONFUSION
	db 30, SWEET_SCENT
	db 35, SOFTBOILED
	db 43, SOLARBEAM
	db 47, PSYCHIC_M
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 7, REFLECT
	db 11, LEECH_SEED
	db 15, MEGA_DRAIN
	db 19, STUN_SPORE
	db 21, POISONPOWDER
	db 23, SLEEP_POWDER
	db 27, PSYCHIC_M
	db 34, EGG_BOMB
	db 40, HEADBUTT
	db 47, SOLARBEAM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, GROWL
	db 3, TAIL_WHIP
	db 7, BONE_CLUB
	db 11, HEADBUTT
	db 13, LEER
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 23, RAGE
	db 27, ROCK_THROW
	db 31, THRASH
	db 37, EARTHQUAKE
	db 43, DOUBLE_EDGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, BONEMERANG
	db 1, LEER
	db 33, THRASH
	db 43, EARTHQUAKE
	db 53, DOUBLE_EDGE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks: ; Concher
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 13, BITE
	db 28, CRUNCH
	db 50, BLIZZARD
	db 0 ; no more level-up moves

SearionEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, WATER_GUN
	db 1, EMBER
	db 1, GROWL
	db 19, ENCORE
	db 21, FLAME_WHEEL
	db 24, BUBBLE
	db 28, BUBBLEBEAM
	db 33, DOUBLESLAP
	db 36, AQUA_JET
	db 44, FLAMETHROWER
	db 49, HYDRO_PUMP
	db 56, FIRE_BLAST
	db 60, EXPLOSION
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db EVOLVE_LEVEL, 33, TUNGTYED
	db 0 ; no more evolutions
	db 1, LICK
	db 5, SUPERSONIC
	db 9, DEFENSE_CURL
	db 13, BITE
	db 17, WRAP
	db 21, HEADBUTT
	db 25, DISABLE
	db 29, BODY_SLAM
	db 33, PSYBEAM
	db 37, AMNESIA
	db 45, REST
	db 49, SCREECH
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 4, SMOG
	db 7, SMOKESCREEN
	db 12, BITE
	db 18, SLUDGE
	db 23, EXPLOSION
	db 26, HAZE
	db 29, IRON_HEAD
	db 34, SLUDGE_BOMB
	db 37, RECOVER
	db 40, DESTINY_BOND
	db 42, GUNK_SHOT
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 4, SMOG
	db 7, SMOKESCREEN
	db 12, BITE
	db 18, SLUDGE
	db 23, EXPLOSION
	db 26, HAZE
	db 29, IRON_HEAD
	db 34, SLUDGE_BOMB
	db 40, RECOVER
	db 46, DESTINY_BOND
	db 51, GUNK_SHOT
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 5, FURY_ATTACK
	db 9, SCARY_FACE
	db 13, ROCK_THROW
	db 17, HEADBUTT
	db 21, BULLDOZE
	db 29, ROCK_SLIDE
	db 37, DOUBLE_EDGE
	db 41, STONE_EDGE
	db 45, EARTHQUAKE
	db 49, MEGAHORN
	db 53, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 5, FURY_ATTACK
	db 9, SCARY_FACE
	db 13, ROCK_THROW
	db 17, HEADBUTT
	db 21, BULLDOZE
	db 29, ROCK_SLIDE
	db 37, DOUBLE_EDGE
	db 41, STONE_EDGE
	db 48, EARTHQUAKE
	db 55, MEGAHORN
	db 62, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, DEFENSE_CURL
	db 1, POUND
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, REST
	db 12, DOUBLESLAP
	db 16, SOFTBOILED
	db 23, MINIMIZE
	db 27, DOUBLE_EDGE
	db 31, SING
	db 42, EGG_BOMB
	db 46, LIGHT_SCREEN
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db EVOLVE_LEVEL, 33, TANGROWTH
	db 0 ; no more evolutions
	db 1, POUND
	db 1, MEAN_LOOK
	db 1, SCARY_FACE
	db 4, SLEEP_POWDER
	db 7, VINE_WHIP
	db 10, ABSORB
	db 14, POISONPOWDER
	db 17, WRAP
	db 20, GROWTH
	db 23, MEGA_DRAIN
	db 27, PURSUIT
	db 30, STUN_SPORE
	db 33, ANCIENTPOWER
	db 36, GIGA_DRAIN
	db 43, BODY_SLAM
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, LEER
	db 10, TAIL_WHIP
	db 13, BITE
	db 19, DOUBLESLAP
	db 22, RAGE
	db 25, BODY_SLAM
	db 28, PROTECT
	db 34, DIZZY_PUNCH
	db 37, CRUNCH
	db 43, ENDURE
	db 46, OUTRAGE
	db 50, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, QUICK_ATTACK
	db 5, SMOKESCREEN
	db 9, LEER
	db 13, WATER_GUN
	db 17, TWISTER
	db 21, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 32, SLUDGE
	db 36, AGILITY
	db 41, DRAGONBREATH
	db 46, DRAGON_DANCE
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_HOLD, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, QUICK_ATTACK
	db 5, SMOKESCREEN
	db 9, LEER
	db 13, WATER_GUN
	db 17, TWISTER
	db 21, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 32, SLUDGE
	db 38, AGILITY
	db 45, DRAGONBREATH
	db 52, DRAGON_DANCE
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 5, SUPERSONIC
	db 8, HORN_ATTACK
	db 13, FLAIL
	db 16, BUBBLEBEAM
	db 24, FURY_ATTACK
	db 29, AGILITY
	db 32, WATERFALL
	db 37, HORN_DRILL
	db 45, MEGAHORN
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 5, SUPERSONIC
	db 8, HORN_ATTACK
	db 13, FLAIL
	db 16, BUBBLEBEAM
	db 24, FURY_ATTACK
	db 29, AGILITY
	db 32, WATERFALL
	db 40, HORN_DRILL
	db 54, MEGAHORN
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 4, WATER_GUN
	db 7, RAPID_SPIN
	db 10, RECOVER
	db 13, PSYWAVE
	db 16, SWIFT
	db 18, BUBBLEBEAM
	db 24, IRON_HEAD
	db 31, MINIMIZE
	db 40, CONFUSE_RAY
	db 42, PSYCHIC_M
	db 46, LIGHT_SCREEN
	db 49, COSMIC_POWER
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYDRO_PUMP
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, BUBBLEBEAM
	db 40, CONFUSE_RAY
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 1, BARRIER
	db 1, POUND
	db 1, CONFUSION
	db 11, DOUBLESLAP
	db 15, MIMIC
	db 15, PSYWAVE
	db 17, CALM_MIND
	db 18, ENCORE
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 25, PSYBEAM
	db 29, SUBSTITUTE
	db 39, MOONBLAST
	db 43, PSYCHIC_M
	db 46, BATON_PASS
	db 50, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_HOLD, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 4, FURY_CUTTER
	db 5, FOCUS_ENERGY
	db 9, PURSUIT
	db 13, FALSE_SWIPE
	db 21, AGILITY
	db 25, WING_ATTACK
	db 29, U_TURN
	db 33, RAZOR_WIND
	db 37, DOUBLE_TEAM
	db 41, X_SCISSOR
	db 57, SWORDS_DANCE
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 1, FREEZE_DRY
	db 5, LICK
	db 8, LOVELY_KISS
	db 11, ICY_WIND
	db 15, DOUBLESLAP
	db 18, ICE_PUNCH
	db 25, MEAN_LOOK
	db 30, DRAIN_KISS
	db 33, DRAIN_PUNCH
	db 38, SWEET_KISS
	db 44, BODY_SLAM
	db 55, PERISH_SONG
	db 60, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, THUNDERSHOCK
	db 9, THUNDERSHOCK
	db 8, KARATE_CHOP
	db 15, SPARK
	db 19, THUNDER_WAVE
	db 26, LIGHT_SCREEN
	db 29, THUNDERPUNCH
	db 36, THUNDERBOLT
	db 42, SCREECH
	db 49, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, SMOG
	db 8, SMOKESCREEN
	db 12, FAINT_ATTACK
	db 15, FIRE_SPIN
	db 19, WILL_O_WISP
	db 26, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 36, FLAMETHROWER
	db 42, SUNNY_DAY
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIND
	db 1, FOCUS_ENERGY
	db 4, HORN_ATTACK
	db 8, SEISMIC_TOSS
	db 11, HARDEN
	db 18, VITAL_THROW
	db 22, DIG
	db 26, BRICK_BREAK
	db 29, X_SCISSOR
	db 33, SUBMISSION
	db 40, SWORDS_DANCE
	db 46, CROSS_CHOP
	db 50, GUILLOTINE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, TAIL_WHIP
	db 5, RAGE
	db 8, HORN_ATTACK
	db 11, SCARY_FACE
	db 15, PURSUIT
	db 19, REST
	db 24, BITE
	db 29, HEADBUTT
	db 35, DOUBLE_EDGE
	db 43, MEGAHORN
	db 48, SWAGGER
	db 55, THRASH
	db 71, HYPER_BEAM
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THRASH
	db 20, BITE
	db 21, LEER
	db 24, TWISTER
	db 27, ICY_WIND
	DB 30, WATERFALL
	db 33, SCARY_FACE
	db 36, DRAGON_RAGE
	db 39, CRUNCH
	db 42, HYDRO_PUMP
	db 45, DRAGON_DANCE
	db 48, HURRICANE
	db 51, RAIN_DANCE
	db 54, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, GROWL
	db 1, WATER_GUN
	db 4, MIST
	db 7, CONFUSE_RAY
	db 10, ICY_WIND
	db 14, BUBBLEBEAM
	db 18, BODY_SLAM
	db 22, RAIN_DANCE
	db 27, PERISH_SONG
	db 32, ICE_BEAM
	db 35, HAZE
	db 37, FREEZE_DRY
	db 43, SAFEGUARD
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 17, BITE
	db 17, SWIFT
	db 20, HEAL_BELL
	db 25, HEADBUTT
	db 29, CHARM
	db 33, BATON_PASS
	db 37, DOUBLE_EDGE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 17, BUBBLEBEAM
	db 20, AURORA_BEAM
	db 29, ACID_ARMOR
	db 33, HAZE
	db 37, SURF
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 17, DOUBLE_KICK
	db 20, SPARK
	db 25, PIN_MISSILE
	db 29, AGILITY
	db 33, THUNDER_WAVE
	db 37, THUNDERBOLT
	db 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, FLAME_WHEEL
	db 25, FIRE_SPIN
	db 29, SCARY_FACE
	db 33, SMOG
	db 37, FLAMETHROWER
	db 45, FLARE_BLITZ
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_HOLD, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 7, PSYBEAM
	db 12, AGILITY
	db 18, RECOVER
	db 23, TRI_ATTACK
	db 29, SIGNAL_BEAM
	db 34, SHARPEN
	db 40, THUNDERBOLT
	db 45, LOCK_ON
	db 50, HYPER_BEAM
	db 62, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 7, BITE
	db 10, WATER_GUN
	db 16, ROLLOUT
	db 19, LEER
	db 25, DIG
	db 28, BUBBLEBEAM
	db 34, PROTECT
	db 37, ANCIENTPOWER
	db 42, SPIKE_CANNON
	db 46, ROCK_SLIDE
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, STONE_EDGE
	db 7, BITE
	db 10, WATER_GUN
	db 16, ROLLOUT
	db 19, LEER
	db 25, DIG
	db 29, BUBBLEBEAM
	db 34, PROTECT
	db 37, ANCIENTPOWER
	db 46, SPIKE_CANNON
	db 56, ROCK_SLIDE
	db 75, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 6, ABSORB
	db 11, LEER
	db 16, DIG
	db 21, SAND_ATTACK
	db 24, AQUA_JET
	db 26, ENDURE
	db 31, BUBBLEBEAM
	db 36, X_SCISSOR
	db 41, ROCK_SLIDE
	db 46, ANCIENTPOWER
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, STONE_EDGE
	db 1, FURY_CUTTER
	db 6, ABSORB
	db 11, LEER
	db 16, DIG
	db 21, SAND_ATTACK
	db 24, AQUA_JET
	db 26, ENDURE
	db 31, BUBBLEBEAM
	db 36, MEGA_DRAIN
	db 40, CUT
	db 45, ROCK_SLIDE
	db 54, ANCIENTPOWER
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, SUPERSONIC
	db 1, BITE
	db 1, SCARY_FACE
	db 9, ROAR
	db 17, AGILITY
	db 22, WING_ATTACK
	db 25, ANCIENTPOWER
	db 33, CRUNCH
	db 41, DOUBLE_EDGE
	db 46, ROCK_SLIDE
	db 52, RAZOR_WIND
	db 57, IRON_HEAD
	db 65, HYPER_BEAM
	db 73, STONE_EDGE
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, METRONOME
	db 4, DEFENSE_CURL
	db 9, AMNESIA
	db 12, LICK
	db 25, BODY_SLAM
	db 28, REST
	db 28, SNORE
	db 33, SLEEP_TALK
	db 34, DOUBLE_EDGE
	db 36, ROLLOUT
	db 41, MEAN_LOOK
	db 44, BELLY_DRUM
	db 49, CRUNCH
	db 50, BODY_PRESS
	db 52, HYPER_BEAM
	db 57, BULLDOZE
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1,  GUST
	db 1,  ICY_WIND
	db 1,  MIST
	db 3,  TRI_ATTACK
	db 13, FREEZE_DRY
	db 25, AGILITY
	db 30, WHIRLWIND
	db 37, MIND_READER
	db 40, RAZOR_WIND
	db 44, ICE_BEAM
	db 50, U_TURN
	db 61, REFLECT
	db 65, BLIZZARD
	db 73, BRAVE_BIRD
	db 92, HURRICANE
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1,  PECK
	db 1,  THUNDERSHOCK
	db 1,  THUNDER_WAVE
	db 3,  TRI_ATTACK
	db 13, SPARK
	db 25, AGILITY
	db 30, WHIRLWIND
	db 37, PROTECT
	db 40, DRILL_PECK
	db 44, THUNDERBOLT
	db 50, U_TURN
	db 61, LIGHT_SCREEN
	db 65, THUNDER
	db 73, BRAVE_BIRD
	db 92, HURRICANE
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1,  WING_ATTACK
	db 1,  EMBER
	db 1,  WILL_O_WISP
	db 3,  TRI_ATTACK
	db 13, FIRE_SPIN
	db 25, AGILITY
	db 30, WHIRLWIND
	db 37, ENDURE
	db 40, RAZOR_WIND
	db 44, FLAMETHROWER
	db 50, U_TURN
	db 61, SAFEGUARD
	db 65, FIRE_BLAST
	db 73, BRAVE_BIRD
	db 92, HURRICANE
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, AGILITY
	db 31, ROAR
	db 35, WATERFALL
	db 41, DRAGONBREATH
	db 45, SAFEGUARD
	db 51, DRAGON_DANCE
	db 55, OUTRAGE
	db 61, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, AGILITY
	db 31, ROAR
	db 39, WATERFALL
	db 47, DRAGONBREATH
	db 53, SAFEGUARD
	db 61, DRAGON_DANCE
	db 67, OUTRAGE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 5, THUNDER_WAVE
	db 11, TWISTER
	db 15, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, AGILITY
	db 31, ROAR
	db 39, WATERFALL
	db 47, DRAGONBREATH
	db 53, SAFEGUARD
	db 55, RAZOR_WIND
	db 61, DRAGON_DANCE
	db 67, OUTRAGE
	db 75, HYPER_BEAM
	db 81, HURRICANE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, FOCUS_ENERGY
	db 1, DISABLE
	db 1, SAFEGUARD
	db 8, SWIFT
	db 15, FUTURE_SIGHT
	db 22, PSYCH_UP
	db 36, PSYBEAM
	db 50, RECOVER
	db 57, PSYCHIC_M
	db 64, BARRIER
	db 70, SHADOW_BALL
	db 79, AMNESIA
	db 86, MIST
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, TRANSFORM
	db 10, RETURN
	db 10, METRONOME
	db 30, PSYCHIC_M
	db 40, BARRIER
	db 50, U_TURN
	db 60, ANCIENTPOWER
	db 70, AMNESIA
	db 80, BATON_PASS
	db 90, NASTY_PLOT
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 13, SYNTHESIS
	db 17, REFLECT
	db 20, MEGA_DRAIN
	db 28, SWEET_SCENT
	db 31, LIGHT_SCREEN
	db 34, BODY_SLAM
	db 39, SAFEGUARD
	db 42, HEAL_BELL
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 13, SYNTHESIS
	db 17, REFLECT
	db 22, MEGA_DRAIN
	db 32, SWEET_SCENT
	db 36, LIGHT_SCREEN
	db 40, BODY_SLAM
	db 46, SAFEGUARD
	db 50, HEAL_BELL
	db 54, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 13, SYNTHESIS
	db 17, REFLECT
	db 22, MEGA_DRAIN
	db 32, PETAL_DANCE
	db 34, SWEET_SCENT
	db 40, LIGHT_SCREEN
	db 46, BODY_SLAM
	db 54, SAFEGUARD
	db 60, HEAL_BELL
	db 66, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 19, FLAME_WHEEL
	db 22, DEFENSE_CURL
	db 31, SWIFT
	db 38, FLAMETHROWER
	db 49, ROLLOUT
	db 55, DOUBLE_EDGE
	db 58, FIRE_BLAST
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 20, FLAME_WHEEL
	db 24, DEFENSE_CURL
	db 31, SWIFT
	db 42, FLAMETHROWER
	db 57, ROLLOUT
	db 64, DOUBLE_EDGE
	db 68, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 20, FLAME_WHEEL
	db 24, DEFENSE_CURL
	db 31, SWIFT
	db 43, FLAMETHROWER
	db 61, ROLLOUT
	db 69, DOUBLE_EDGE
	db 74, FIRE_BLAST
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 8, RAGE
	db 13, BITE
	db 15, SCARY_FACE
	db 20, ICE_PUNCH
	db 22, FLAIL
	db 27, CRUNCH
	db 34, CUT
	db 36, SCREECH
	db 41, THRASH
	db 43, WATERFALL
	db 48, SUBMISSION
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 8, RAGE
	db 13, BITE
	db 15, SCARY_FACE
	db 21, ICE_PUNCH
	db 24, FLAIL
	db 30, CRUNCH
	db 39, CUT
	db 42, SCREECH
	db 48, THRASH
	db 51, WATERFALL
	db 57, SUBMISSION
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 8, RAGE
	db 13, BITE
	db 15, SCARY_FACE
	db 21, ICE_PUNCH
	db 24, FLAIL
	db 32, CRUNCH
	db 45, CUT
	db 50, SCREECH
	db 58, THRASH
	db 63, WATERFALL
	db 71, SUBMISSION
	db 76, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, FORESIGHT
	db 5, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 13, FURY_SWIPES
	db 18, BITE
	db 25, BODY_SLAM
	db 28, REST
	db 31, CRUNCH
	db 36, AMNESIA
	db 39, BODY_SLAM
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, FORESIGHT
	db 5, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 13, FURY_SWIPES
	db 15, AGILITY
	db 20, BITE
	db 25, BODY_SLAM
	db 29, REST
	db 33, CRUNCH
	db 38, COIL
	db 42, AMNESIA
	db 46, BODY_SLAM
	db 56, DOUBLE_EDGE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 4, HYPNOSIS
	db 7, PECK
	db 10, CONFUSION
	db 16, PSYBEAM
	db 23, PSYCHIC_M
	db 25, DOUBLE_EDGE
	db 25, NASTY_PLOT
	db 28, REFLECT
	db 31, RAZOR_WIND
	db 35, MEAN_LOOK
	db 37, RECOVER
	db 40, MOONBLAST
	db 46, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 4, HYPNOSIS
	db 7, PECK
	db 10, CONFUSION
	db 16, PSYBEAM
	db 20, WING_ATTACK
	db 27, PSYCHIC_M
	db 31, DOUBLE_EDGE
	db 33, REFLECT
	db 35, RAZOR_WIND
	db 38, MEAN_LOOK
	db 43, RECOVER
	db 47, MOONBLAST
	db 55, DREAM_EATER
	db 0 ; no more level-up moves

CubboltEvosAttacks: ; Little Tiger
	db EVOLVE_LEVEL, 33, ELECTIGER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 5, THUNDERSHOCK
	db 8, GROWL
	db 11, HEADBUTT
	db 15, SCARY_FACE
	db 20, BITE
	db 23, SPARK
	db 33, DOUBLE_EDGE
	db 36, THUNDERBOLT
	db 39, CRUNCH
	db 46, WILD_CHARGE
	db 0 ; no more level-up moves

ElectigerEvosAttacks: ; Big Tiger
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 5, THUNDERSHOCK
	db 8, GROWL
	db 11, HEADBUTT
	db 15, SCARY_FACE
	db 20, BITE
	db 23, SPARK
	db 33, DOUBLE_EDGE
	db 38, THUNDERBOLT
	db 42, CRUNCH
	db 51, WILD_CHARGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, TACKLE
	db 5, ABSORB
	db 12, SCARY_FACE
	db 15, NIGHT_SHADE
	db 23, MEGA_DRAIN
	db 26, BITE
	db 29, LEECH_LIFE
	db 33, AGILITY
	db 36, BIND
	db 40, PIN_MISSILE
	db 43, SLUDGE_BOMB
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, TACKLE
	db 5, ABSORB
	db 12, SCARY_FACE
	db 15, NIGHT_SHADE
	db 24, MEGA_DRAIN
	db 27, BITE
	db 32, LEECH_LIFE
	db 37, AGILITY
	db 41, BIND
	db 46, PIN_MISSILE
	db 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, BITE
	db 1, SUPERSONIC
	db 1, LICK
	db 5, SUPERSONIC
	db 7, LICK
	db 11, BITE
	db 13, WING_ATTACK
	db 17, CONFUSE_RAY
	db 19, U_TURN
	db 19, RAZOR_WIND
	db 24, SCREECH
	db 27, SLUDGE
	db 32, MEAN_LOOK
	db 35, LEECH_LIFE
	db 40, HAZE
	db 43, SLUDGE_BOMB
	db 48, HURRICANE
	db 51, PROTECT
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SUPERSONIC
	db 6, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 12, WATER_GUN
	db 17, CONFUSE_RAY
	db 20, BUBBLEBEAM
	db 23, SPARK
	db 25, SIGNAL_BEAM
	db 28, PSYBEAM
	db 31, FLAIL
	db 34, THUNDERBOLT
	db 39, DOUBLE_EDGE
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SUPERSONIC
	db 6, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 12, WATER_GUN
	db 17, CONFUSE_RAY
	db 20, BUBBLEBEAM
	db 23, SPARK
	db 25, SIGNAL_BEAM
	db 27, RECOVER
	db 29, PSYBEAM
	db 33, FLAIL
	db 37, THUNDERBOLT
	db 43, DOUBLE_EDGE
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

SirfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, FURY_CUTTER
	db 1, LEER
	db 7, FURY_ATTACK
	db 9, WING_ATTACK
	db 19, CUT
	db 22, SING
	db 25, SWORDS_DANCE
	db 31, AGILITY
	db 38, RAZOR_WIND
	db 45, FALSE_SWIPE
	db 50, HURRICANE
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

MandrabelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 32, DRAIN_KISS
	db 44, PETAL_DANCE
	db 50, MOONBLAST
	db 0 ; no more level-up moves

IgglybuffEvosAttacks: ; Curstraw
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, DESTINY_BOND
	db 1, SCREECH
	db 1, PERISH_SONG
	db 0 ; no more level-up moves

ShifurEvosAttacks:
	db EVOLVE_LEVEL, 28, SNOWMAD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, FREEZE_DRY
	db 1, LEER
	db 8, QUICK_ATTACK
	db 14, ICY_WIND
	db 16, FURY_SWIPES
	db 20, AGILITY
	db 22, METAL_CLAW
	db 28, AURORA_BEAM
	db 32, SCREECH
	db 35, CUT
	db 40, ICE_BEAM
	db 47, BLIZZARD
	db 0 ; no more level-up moves

SnowmadEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, FREEZE_DRY
	db 1, LEER
	db 8, QUICK_ATTACK
	db 14, ICY_WIND
	db 16, FURY_SWIPES
	db 20, AGILITY
	db 22, METAL_CLAW
	db 28, AURORA_BEAM
	db 30, FAINT_ATTACK
	db 33, SCREECH
	db 37, CRUNCH
	db 45, ICE_BEAM
	db 52, BLIZZARD
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1,  PECK
	db 1,  LEER
	db 6,  NIGHT_SHADE
	db 9,  TELEPORT
	db 17, CONFUSION
	db 20, ANCIENTPOWER
	db 26, PURSUIT
	db 28, RECOVER
	db 33, PSYCHIC_M
	db 38, COSMIC_POWER
	db 44, FUTURE_SIGHT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 6, NIGHT_SHADE
	db 9, TELEPORT
	db 17, CONFUSION
	db 20, ANCIENTPOWER
	db 25, RAZOR_WIND
	db 27, PURSUIT
	db 29, RECOVER
	db 35, PSYCHIC_M
	db 41, COSMIC_POWER
	db 49, FUTURE_SIGHT
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 12, HYPNOSIS
	db 15, SPARK
	db 18, DOUBLE_EDGE
	db 25, CONFUSE_RAY
	db 29, SIGNAL_BEAM
	db 32, THUNDERBOLT
	db 39, PSYBEAM
	db 43, LIGHT_SCREEN
	db 46, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 12, HYPNOSIS
	db 16, SPARK
	db 20, DOUBLE_EDGE
	db 29, CONFUSE_RAY
	db 33, SIGNAL_BEAM
	db 38, THUNDERBOLT
	db 47, PSYBEAM
	db 52, LIGHT_SCREEN
	db 56, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 12, HYPNOSIS
	db 16, SPARK
	db 20, DOUBLE_EDGE
	db 29, CONFUSE_RAY
	db 30, THUNDERPUNCH
	db 35, SIGNAL_BEAM
	db 40, THUNDERBOLT
	db 51, PSYBEAM
	db 57, LIGHT_SCREEN
	db 62, THUNDER
	db 65, DRAGONBREATH
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, SUNNY_DAY
	db 29, BATON_PASS
	db 39, QUIVER_DANCE
	db 49, PETAL_DANCE
	db 59, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 2, TAIL_WHIP
	db 7, BUBBLE
	db 10, DEFENSE_CURL
	db 10, ROLLOUT
	db 13, BUBBLEBEAM
	db 20, WATERFALL
	db 23, PLAY_ROUGH
	db 31, RAIN_DANCE
	db 37, DOUBLE_EDGE
	db 40, SUBMISSION
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 2, TAIL_WHIP
	db 7, BUBBLE
	db 10, DEFENSE_CURL
	db 10, ROLLOUT
	db 13, BUBBLEBEAM
	db 21, WATERFALL
	db 25, PLAY_ROUGH
	db 35, RAIN_DANCE
	db 42, DOUBLE_EDGE
	db 46, SUBMISSION
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, MIMIC
	db 5, FLAIL
	db 8, COUNTER
	db 12, ROCK_THROW
	db 15, MIMIC
	db 19, FAINT_ATTACK
	db 26, BODY_SLAM
	db 33, ROCK_SLIDE
	db 36, BRICK_BREAK
	db 43, DOUBLE_EDGE
	db 47, STONE_EDGE
	db 50, BODY_PRESS
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 32, SWAGGER
	db 43, PERISH_SONG
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 4, SYNTHESIS
	db 6, TAIL_WHIP
	db 8, TACKLE
	db 10, DRAIN_KISS
	db 12, POISONPOWDER
	db 14, STUN_SPORE
	db 16, SLEEP_POWDER
	db 19, RAZOR_LEAF
	db 22, LEECH_SEED
	db 25, MEGA_DRAIN
	db 28, RAZOR_WIND
	db 32, U_TURN
	db 35, BATON_PASS
	db 37, GIGA_DRAIN
	db 40, HURRICANE
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 4, SYNTHESIS
	db 6, TAIL_WHIP
	db 8, TACKLE
	db 10, DRAIN_KISS
	db 12, POISONPOWDER
	db 14, STUN_SPORE
	db 16, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 24, LEECH_SEED
	db 28, MEGA_DRAIN
	db 32, RAZOR_WIND
	db 38, U_TURN
	db 40, BATON_PASS
	db 44, GIGA_DRAIN
	db 48, HURRICANE
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 4, SYNTHESIS
	db 6, TAIL_WHIP
	db 8, TACKLE
	db 10, DRAIN_KISS
	db 12, POISONPOWDER
	db 14, STUN_SPORE
	db 16, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 24, LEECH_SEED
	db 29, MEGA_DRAIN
	db 34, RAZOR_WIND
	db 40, U_TURN
	db 46, BATON_PASS
	db 49, GIGA_DRAIN
	db 54, HURRICANE
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 4, SAND_ATTACK
	db 8, BITE
	db 11, BATON_PASS
	db 18, FURY_SWIPES
	db 22, SWIFT
	db 25, SCREECH
	db 29, AGILITY
	db 36, CRUNCH
	db 39, NASTY_PLOT
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF
	db 22, GIGA_DRAIN
	db 25, AGILITY
	db 28, MORNING_SUN
	db 34, SOLARBEAM
	db 37, DOUBLE_EDGE
	db 40, SUNNY_DAY
	db 40, MORNING_SUN
	db 43, PETAL_DANCE
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF
	db 22, GIGA_DRAIN
	db 25, ENCORE
	db 28, PETAL_DANCE
	db 34, SOLARBEAM
	db 37, DOUBLE_EDGE
	db 40, SUNNY_DAY
	db 40, MORNING_SUN
	db 43, PETAL_DANCE
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 6, QUICK_ATTACK
	db 11, PROTECT
	db 14, SONICBOOM
	db 17, DOUBLE_TEAM
	db 20, SILVER_WIND
	db 25, WING_ATTACK
	db 28, SUPERSONIC
	db 30, PURSUIT
	db 33, ANCIENTPOWER
	db 35, U_TURN
	db 38, HYPNOSIS
	db 43, RAZOR_WIND
	db 46, SCREECH
	db 49, SIGNAL_BEAM
	db 54, HURRICANE
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 9, MUD_SLAP
	db 15, BODY_SLAM
	db 23, AMNESIA
	db 29, REST
	db 33, EARTHQUAKE
	db 37, RAIN_DANCE
	db 43, MIST
	db 43, HAZE
	db 47, WATERFALL
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 9, MUD_SLAP
	db 15, BODY_SLAM
	db 24, AMNESIA
	db 31, REST
	db 36, EARTHQUAKE
	db 41, RAIN_DANCE
	db 43, REST
	db 45, SNORE
	db 48, MIST
	db 48, HAZE
	db 53, WATERFALL
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 16, CONFUSION
	db 17, SWIFT
	db 20, PSYBEAM
	db 29, PSYCH_UP
	db 33, MORNING_SUN
	db 37, PSYCHIC_M
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 16, PURSUIT
	db 17, CONFUSE_RAY
	db 20, FAINT_ATTACK
	db 25, CRUNCH
	db 29, SCREECH
	db 33, MOONLIGHT
	db 37, MEAN_LOOK
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 5, PURSUIT
	db 11, HAZE
	db 15, WING_ATTACK
	db 21, NIGHT_SHADE
	db 25, SWAGGER
	db 31, ENCORE
	db 35, FAINT_ATTACK
	db 41, MEAN_LOOK
	db 47, PERISH_SONG
	db 50, AGILITY
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 1, HIDDEN_POWER
	db 5, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, BUBBLEBEAM
	db 32, PSYBEAM
	db 36, NASTY_PLOT
	db 41, SWAGGER
	db 45, PSYCHIC_M
	db 54, PSYCH_UP
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, PSYWAVE
	db 5, SPITE
	db 10, LICK
	db 14, CONFUSE_RAY
	db 19, MEAN_LOOK
	db 23, NIGHT_SHADE
	db 28, PSYBEAM
	db 32, PAIN_SPLIT
	db 41, SHADOW_BALL
	db 46, PERISH_SONG
	db 50, DESTINY_BOND
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 99, AMNESIA
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LICK
	db 1, CONFUSION
	db 5, FORESIGHT
	db 10, BITE
	db 14, HEADBUTT
	db 19, PSYBEAM
	db 23, AGILITY
	db 32, PSYCHIC_M
	db 37, CRUNCH
	db 41, BATON_PASS
	db 46, NASTY_PLOT
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 8, EXPLOSION
	db 12, DOUBLE_EDGE
	db 17, RAPID_SPIN
	db 20, BIDE
	db 28, SPIKES
	db 34, EXPLOSION
	db 39, IRON_HEAD
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 8, EXPLOSION
	db 12, DOUBLE_EDGE
	db 17, RAPID_SPIN
	db 20, BIDE
	db 28, SPIKES
	db 36, EXPLOSION
	db 42, IRON_HEAD
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 5, DEFENSE_CURL
	db 13, GLARE
	db 16, ANCIENTPOWER
	db 18, BODY_SLAM
	db 21, BULLDOZE
	db 26, DOUBLE_EDGE
	db 28, COIL
	db 31, DIG
	db 36, SKULL_BASH
	db 41, RAZOR_WIND
	db 46, ENDURE
	db 48, FLAIL
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, SAND_ATTACK
	db 7, HARDEN
	db 13, QUICK_ATTACK
	db 16, FURY_CUTTER
	db 19, FAINT_ATTACK
	db 22, WING_ATTACK
	db 27, CUT
	db 30, U_TURN
	db 35, SCREECH
	db 40, X_SCISSOR
	db 50, SWORDS_DANCE
	db 55, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 1, WRAP
	db 4, CURSE
	db 14, ROCK_THROW
	db 17, COIL
	db 20, RAGE
	db 23, SPIKES
	db 27, IRON_HEAD
	db 29, BULLDOZE
	db 32, DRAGONBREATH
	db 35, IRON_HEAD
	db 38, SCREECH
	db 41, ROCK_SLIDE
	db 44, DIG
	db 45, STONE_EDGE
	db 47, IRON_TAIL
	db 50, EARTHQUAKE
	db 52, DOUBLE_EDGE
	db 55, SANDSTORM
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 7, BITE
	db 13, LICK
	db 19, HEADBUTT
	db 25, ROAR
	db 31, RAGE
	db 37, PLAY_ROUGH
	db 43, CRUNCH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 7, BITE
	db 13, LICK
	db 19, HEADBUTT
	db 27, ROAR
	db 35, RAGE
	db 43, PLAY_ROUGH
	db 51, CRUNCH
	db 59, OUTRAGE
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 1, POISON_STING
	db 4, HARDEN
	db 8, WATER_GUN
	db 16, MINIMIZE
	db 20, SPIKES
	db 24, FLAIL
	db 32, PIN_MISSILE
	db 36, THUNDER_WAVE
	db 40, SLUDGE_BOMB
	db 44, RECOVER
	db 48, DOUBLE_EDGE
	db 52, TOXIC
	db 56, WATERFALL
	db 60, DESTINY_BOND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, BULLET_PUNCH
	db 1, LEER
	db 4, FURY_CUTTER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, METAL_CLAW
	db 36, U_TURN
	db 41, X_SCISSOR
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db  1, STRING_SHOT
	db  1, HARDEN
	db  1, BIDE
	db  1, ROLLOUT
	db  5, ENCORE
	db  9, WRAP
	db 16, SAFEGUARD
	db 20, REST
	db 23, ROCK_THROW
	db 28, ACID_ARMOR
	db 34, ROCK_SLIDE
	db 40, BIND
	db 45, STONE_EDGE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, HORN_ATTACK
	db 12, ENDURE
	db 19, FURY_ATTACK
	db 23, BRICK_BREAK
	db 27, COUNTER
	db 35, DOUBLE_EDGE
	db 44, BODY_PRESS
	db 54, MEGAHORN
	db 60, DYNAMICPUNCH
	db 0 ; no more level-up moves

TungtyedEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 5, SUPERSONIC
	db 9, DEFENSE_CURL
	db 13, BITE
	db 17, WRAP
	db 21, HEADBUTT
	db 25, DISABLE
	db 29, BODY_SLAM
	db 33, PSYBEAM
	db 36, FUTURE_SIGHT
	db 40, AMNESIA
	db 44, PSYCHIC_M
	db 47, REST
	db 51, SCREECH
	db 60, EXPLOSION
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 1, FURY_SWIPES
	db 8, FURY_SWIPES
	db 15, FAINT_ATTACK
	db 22, SWEET_SCENT
	db 29, CUT
	db 36, CHARM
	db 43, REST
	db 43, SNORE
	db 47, BRICK_BREAK
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 1, FURY_SWIPES
	db 8, FURY_SWIPES
	db 15, FAINT_ATTACK
	db 22, SWEET_SCENT
	db 29, CUT
	db 38, SCARY_FACE
	db 47, REST
	db 49, SNORE
	db 50, BRICK_BREAK
	db 58, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 6, EMBER
	db 8, ROCK_THROW
	db 13, HARDEN
	db 15, SMOKESCREEN
	db 20, WILL_O_WISP
	db 22, ANCIENTPOWER
	db 29, ROCK_SLIDE
	db 34, FLAMETHROWER
	db 36, AMNESIA
	db 41, BODY_SLAM
	db 43, RECOVER
	db 48, FIRE_BLAST
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, BODY_PRESS
	db 6, EMBER
	db 8, ROCK_THROW
	db 13, HARDEN
	db 15, SMOKESCREEN
	db 20, WILL_O_WISP
	db 22, ANCIENTPOWER
	db 29, ROCK_SLIDE
	db 34, FLAMETHROWER
	db 36, AMNESIA
	db 38, ROLLOUT
	db 43, BODY_SLAM
	db 47, RECOVER
	db 50, STONE_EDGE
	db 54, FIRE_BLAST
	db 58, EARTHQUAKE
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, MUD_SLAP
	db 5, ICY_WIND
	db 10, FLAIL
	db 15, AURORA_BEAM
	db 20, MIST
	db 25, ENDURE
	db 30, ICICLE_SPEAR
	db 35, AMNESIA
	db 40, DOUBLE_EDGE
	db 45, EARTHQUAKE
	db 50, BLIZZARD
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, MUD_SLAP
	db 5, ICY_WIND
	db 10, FLAIL
	db 15, AURORA_BEAM
	db 20, MIST
	db 25, ENDURE
	db 30, ICICLE_SPEAR
	db 37, AMNESIA
	db 44, DOUBLE_EDGE
	db 51, EARTHQUAKE
	db 58, BLIZZARD
	db 60, THRASH
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 4, BUBBLE
	db 8, RECOVER
	db 10, BUBBLEBEAM
	db 17, ANCIENTPOWER
	db 20, SPIKE_CANNON
	db 27, FLAIL
	db 29, ACID_ARMOR
	db 35, ENDURE
	db 41, MIRROR_COAT
	db 47, EARTHQUAKE
	db 50, HYDRO_PUMP
	db 50, STONE_EDGE
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db  1, WATER_GUN
	db  4, AQUA_JET
	db  8, FOCUS_ENERGY
	db 12, PSYBEAM
	db 16, AURORA_BEAM
	db 20, BUBBLEBEAM
	db 24, LOCK_ON
	db 28, BARRAGE
	db 30, SIGNAL_BEAM
	db 32, ICE_BEAM
	db 36, HYDRO_PUMP
	db 44, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db EVOLVE_HOLD, METAL_COAT, OCTANK
	db 0 ; no more evolutions
	db  1, WATER_GUN
	db  4, AQUA_JET
	db  8, FOCUS_ENERGY
	db 12, PSYBEAM
	db 16, AURORA_BEAM
	db 20, BUBBLEBEAM
	db 24, LOCK_ON
	db 25, OCTAZOOKA
	db 25, WRAP
	db 30, BARRAGE
	db 34, SIGNAL_BEAM
	db 36, ICE_BEAM
	db 42, HYDRO_PUMP
	db 54, HYPER_BEAM
	db 58, ZAP_CANNON
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 25, BATON_PASS
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 1, SIGNAL_BEAM
	db 3, SUPERSONIC
	db 7, BUBBLEBEAM
	db 11, CONFUSE_RAY
	db 14, WING_ATTACK
	db 16, HEADBUTT
	db 23, PROTECT
	db 27, DOUBLE_EDGE
	db 32, AGILITY
	db 36, RAZOR_WIND
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 6, SAND_ATTACK
	db 9, METAL_CLAW
	db 15, WING_ATTACK
	db 17, FURY_ATTACK
	db 23, SWIFT
	db 26, DRILL_PECK
	db 28, SPIKES
	db 31, AGILITY
	db 34, STEEL_WING
	db 39, RAZOR_WIND
	db 45, BRAVE_BIRD
	db 52, IRON_HEAD
	db 58, BODY_PRESS
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, SMOG
	db 26, BITE
	db 18, FIRE_SPIN
	db 25, SCARY_FACE
	db 27, FAINT_ATTACK
	db 30, BONE_CLUB
	db 35, FLAMETHROWER
	db 43, CRUNCH
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, SMOG
	db 26, BITE
	db 18, FIRE_SPIN
	db 25, FLAME_WHEEL
	db 28, SCARY_FACE
	db 30, FAINT_ATTACK
	db 36, BONE_CLUB
	db 41, FLAMETHROWER
	db 52, CRUNCH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, QUICK_ATTACK
	db 5, SMOKESCREEN
	db 9, LEER
	db 13, WATER_GUN
	db 17, TWISTER
	db 21, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 32, PIN_MISSILE
	db 38, AGILITY
	db 45, DRAGONBREATH
	db 52, DRAGON_DANCE
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db  1, TACKLE
	db  1, GROWL
	db  1, DEFENSE_CURL
	db  1, MUD_SLAP
	db  6, FLAIL
	db 10, ROLLOUT
	db 15, BULLDOZE
	db 19, ENDURE
	db 24, BODY_SLAM
	db 28, CHARM
	db 33, DOUBLE_EDGE
	db 40, STONE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db  1, TACKLE
	db  1, GROWL
	db  1, DEFENSE_CURL
	db  1, MUD_SLAP
	db  6, FLAIL
	db 10, ROLLOUT
	db 15, BULLDOZE
	db 19, ENDURE
	db 24, BODY_SLAM
	db 25, RAPID_SPIN
	db 30, SANDSTORM
	db 37, SCARY_FACE
	db 43, EARTHQUAKE
	db 48, STONE_EDGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 7, PSYBEAM
	db 10, SHARPEN
	db 12, AGILITY
	db 18, RECOVER
	db 23, TRI_ATTACK
	db 29, SIGNAL_BEAM
	db 40, THUNDERBOLT
	db 45, LOCK_ON
	db 50, HYPER_BEAM
	db 62, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, LEER
	db 10, HYPNOSIS
	db 13, HEADBUTT
	db 16, SAND_ATTACK
	db 21, DOUBLE_EDGE
	db 23, CONFUSE_RAY
	db 27, CALM_MIND
	db 38, PSYCHIC_M
	db 43, HI_JUMP_KICK
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db  1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TangrowthEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, MEAN_LOOK
	db 1, SCARY_FACE
	db 1, BIND
	db 4, SLEEP_POWDER
	db 7, VINE_WHIP
	db 10, ABSORB
	db 17, WRAP
	db 14, POISONPOWDER
	db 20, GROWTH
	db 23, MEGA_DRAIN
	db 27, PURSUIT
	db 30, STUN_SPORE
	db 33, ANCIENTPOWER
	db 38, GIGA_DRAIN
	db 45, GLARE
	db 48, SOLARBEAM
	db 0 ; no more level-up moves

GreminiEvosAttacks:
	db  0 ; no more evolutions
	db  1, DOUBLE_TEAM
	db  1, POUND
	db  5, DISABLE
	db  9, FORESIGHT
	db 14, LICK
	db 17, CONFUSE_RAY
	db 20, MEAN_LOOK
	db 23, FAINT_ATTACK
	db 27, PURSUIT
	db 30, CURSE
	db 36, RECOVER
	db 40, SHADOW_BALL
	db 46, DESTINY_BOND
	db 50, NIGHTMARE
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 9, SWEET_KISS
	db 13, ICY_WIND
	db 21, CONFUSION
	db 25, SING
	db 33, MEAN_LOOK
	db 37, PSYCHIC_M
	db 45, PERISH_SONG
	db 49, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 33, SCREECH
	db 41, THUNDERBOLT
	db 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 43, CONFUSE_RAY
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 5, DEFENSE_CURL
	db 8, HEADBUTT
	db 11, MILK_DRINK
	db 15, BIDE
	db 19, ROLLOUT
	db 24, BODY_SLAM
	db 29, CHARM
	db 35, HEAL_BELL
	db 41, DOUBLE_EDGE
	db 48, BRICK_BREAK
	db 50, BODY_PRESS
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, DEFENSE_CURL
	db 1, POUND
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, REST
	db 12, DOUBLESLAP
	db 16, SOFTBOILED
	db 23, MINIMIZE
	db 27, DOUBLE_EDGE
	db 31, SING
	db 42, EGG_BOMB
	db 46, LIGHT_SCREEN
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, LEER
	db 1, ROAR
	db 1, THUNDER_WAVE
	db 8, BITE
	db 15, TRI_ATTACK
	db 22, SPARK
	db 29, CRUNCH
	db 32, SAFEGUARD
	db 36, THUNDERBOLT
	db 40, EXTREMESPEED
	db 43, REFLECT
	db 48, AGILITY
	db 54, CALM_MIND
	db 57, THUNDER
	db 61, RAIN_DANCE
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, ROAR
	db 1, FIRE_SPIN
	db 8, BITE
	db 15, TRI_ATTACK
	db 22, FLAME_WHEEL
	db 29, HEADBUTT
	db 32, SAFEGUARD
	db 36, FLAMETHROWER
	db 40, EXTREMESPEED
	db 43, SWAGGER
	db 48, AGILITY
	db 54, CALM_MIND
	db 57, FIRE_BLAST
	db 61, SUNNY_DAY
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, LEER
	db 1, ROAR
	db 1, MIST
	db 8, BITE
	db 15, TRI_ATTACK
	db 22, BUBBLEBEAM
	db 29, AURORA_BEAM
	db 32, SAFEGUARD
	db 36, SURF
	db 40, EXTREMESPEED
	db 43, MIRROR_COAT
	db 48, AGILITY
	db 54, CALM_MIND
	db 57, HYDRO_PUMP
	db 61, RAIN_DANCE
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 5, SANDSTORM
	db 10, SCREECH
	db 23, SCARY_FACE
	db 28, THRASH
	db 37, ROCK_SLIDE
	db 41, CRUNCH
	db 46, EARTHQUAKE
	db 50, STONE_EDGE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, SANDSTORM
	db 1, SCREECH
	db 5, SANDSTORM
	db 10, SCREECH
	db 23, SCARY_FACE
	db 28, THRASH
	db 41, ROCK_SLIDE
	db 47, CRUNCH
	db 54, EARTHQUAKE
	db 60, STONE_EDGE
	db 67, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, SANDSTORM
	db 1, SCREECH
	db 5, SANDSTORM
	db 10, SCREECH
	db 23, SCARY_FACE
	db 28, THRASH
	db 41, ROCK_SLIDE
	db 47, CRUNCH
	db 54, EARTHQUAKE
	db 63, STONE_EDGE
	db 73, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db  1, GUST
	db  1, ANCIENTPOWER
	db  1, PSYCHIC_M
	db 11, SWIFT
	db 22, RAIN_DANCE
	db 33, SAFEGUARD
	db 44, AEROBLAST
	db 55, RECOVER
	db 66, HYDRO_PUMP
	db 77, CALM_MIND
	db 88, FUTURE_SIGHT
	db 99, BRAVE_BIRD
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db  1, GUST
	db  1, ANCIENTPOWER
	db  1, FLAMETHROWER
	db 11, SWIFT
	db 22, SUNNY_DAY
	db 33, SAFEGUARD
	db 44, SACRED_FIRE
	db 55, RECOVER
	db 66, STEEL_WING
	db 77, CALM_MIND
	db 88, FUTURE_SIGHT
	db 99, BRAVE_BIRD
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, MORNING_SUN
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 19, RAZOR_LEAF
	db 28, ANCIENTPOWER
	db 37, BATON_PASS
	db 46, PERISH_SONG
	db 50, PSYCHIC_M
	db 54, GIGA_DRAIN
	db 64, FUTURE_SIGHT
	db 60, U_TURN
	db 70, RECOVER
	db 0 ; no more level-up moves
	
OctankEvosAttacks:
	db 0 ; no more evolutions
	db  1, WATER_GUN
	db  4, AQUA_JET
	db  8, FOCUS_ENERGY
	db 12, PSYBEAM
	db 16, AURORA_BEAM
	db 20, BUBBLEBEAM
	db 24, LOCK_ON
	db 25, OCTAZOOKA
	db 25, WRAP
	db 30, BARRAGE
	db 34, SIGNAL_BEAM
	db 36, ICE_BEAM
	db 40, IRON_HEAD
	db 42, HYDRO_PUMP
	db 54, HYPER_BEAM
	db 58, ZAP_CANNON
	db 0 ; no more level-up moves

FerrodonEvosAttacks:
	db  0 ; no more evolutions
	db  1, TACKLE
	db  1, TAIL_WHIP
	db  1, HARDEN
	db  5, BONE_CLUB
	db  6, BITE
	db  9, METAL_CLAW
	db 13, SCARY_FACE
	db 18, DRAGON_RAGE
	db 21, BODY_SLAM
	db 25, ROAR
	db 27, IRON_HEAD
	db 31, DIG
	db 35, DRAGONBREATH
	db 40, COIL
	db 42, BODY_PRESS
	db 45, IRON_TAIL
	db 49, OUTRAGE
	db 55, FISSURE
	db  0 ; no more level-up moves
