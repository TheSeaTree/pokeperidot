INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	db SKULL_BASH
	db RAZOR_WIND
	db PETAL_DANCE
	db AGILITY
	db CHARM
	db LIGHT_SCREEN
	db SAFEGUARD
	db FALSE_SWIPE
	db -1 ; end

CharmanderEggMoves:
	db BELLY_DRUM
	db ANCIENTPOWER
	db BITE
	db OUTRAGE
	db DIVE_BOMB
	db METAL_CLAW
	db -1 ; end

SquirtleEggMoves:
	db AQUA_JET
	db MIRROR_COAT
	db HAZE
	db MIST
	db CONFUSION
	db FORESIGHT
	db FLAIL
	db DRAGONBREATH
	db RECOVER
	db SIGNAL_BEAM
	db -1 ; end

PsyduckEggMoves:
	db HAZE
	db CONFUSE_RAY
	db CROSS_CHOP
	db ENCORE
	db FUTURE_SIGHT
	db FORESIGHT
	db HYPNOSIS
	db PSYBEAM
	db TRI_ATTACK
	db ENCORE
	db SKULL_BASH
	db EXTREMESPEED
	db SEISMIC_TOSS
	db PAY_DAY
	db RAGE
	db BIDE
	db DYNAMICPUNCH
	db IRON_TAIL
	db U_TURN
	db PETAL_DANCE
	db -1 ; end

RinringEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db FLAIL
	db IRON_TAIL
	db SCREECH
	db FLAME_WHEEL
	db COUNTER
	db REVERSAL
	db DESTINY_BOND
	db U_TURN
	db BATON_PASS
	db PAY_DAY
	db PETAL_DANCE
	db -1 ; end

SpearowEggMoves:
	db FAINT_ATTACK
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db BRAVE_BIRD
	db WHIRLWIND
	db STEEL_WING
	db RAZOR_WIND
	db U_TURN
	db DIVE_BOMB
	db PAY_DAY
	db -1 ; end

EkansEggMoves:
	db PURSUIT
	db SPITE
	db DRAGONBREATH
	db DRAGON_DANCE
	db IRON_TAIL
	db -1 ; end

PikachuEggMoves:
	db REVERSAL
	db BIDE
	db PRESENT
	db ENCORE
	db DOUBLESLAP
	db FLAIL
	db SIGNAL_BEAM
	db EXTREMESPEED
	db PAY_DAY
	db PETAL_DANCE
	db SURF
	db -1 ; end

SandshrewEggMoves:
	db FLAIL
	db COUNTER
	db RAPID_SPIN
	db METAL_CLAW
	db SPIKES
	db X_SCISSOR
	db AMNESIA
	db AGILITY
	db STONE_EDGE
	db -1 ; end

NidoranFEggMoves:
	db SUPERSONIC
	db DISABLE
	db DOUBLE_EDGE
	db FOCUS_ENERGY
	db AMNESIA
	db COUNTER
	db PECK
	db SKULL_BASH
	db STONE_EDGE
	db -1 ; end

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db DOUBLE_EDGE
	db CONFUSION
	db AMNESIA
	db COUNTER
	db BITE
	db STONE_EDGE
	db -1 ; end
	
ClefairyEggMoves:
	db PRESENT
	db METRONOME
	db AMNESIA
	db BELLY_DRUM
	db MIMIC
	db SIGNAL_BEAM
	db PETAL_DANCE
	db -1 ; end

VulpixEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db FLARE_BLITZ
	db ENCORE
	db DRAIN_KISS
	db -1 ; end
	
JigglypuffEggMoves:
	db PERISH_SONG
	db PRESENT
	db FAINT_ATTACK
	db MEAN_LOOK
	db EXPLOSION
	db PAIN_SPLIT
	db BATON_PASS
	db DRAIN_KISS
	db SCREECH
	db PETAL_DANCE
	db -1 ; end

ZubatEggMoves:
	db QUICK_ATTACK
	db PURSUIT
	db FAINT_ATTACK
	db GUST
	db WHIRLWIND
	db HYPNOSIS
	db STEEL_WING
	db X_SCISSOR
	db AGILITY
	db -1 ; end

OddishEggMoves:
	db RAZOR_LEAF
	db FLAIL
	db SYNTHESIS
	db AGILITY
	db CHARM
	db LEECH_SEED
	db -1 ; end

ParasEggMoves:
	db FALSE_SWIPE
	db SCREECH
	db COUNTER
	db PSYBEAM
	db FLAIL
	db SWEET_SCENT
	db PURSUIT
	db METAL_CLAW
	db LEECH_SEED
	db -1 ; end

VenonatEggMoves:
	db SCREECH
	db GIGA_DRAIN
	db U_TURN
	db -1 ; end

DiglettEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db EXPLOSION
	db THRASH
	db STONE_EDGE
	db -1 ; end

MeowthEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db FLAIL
	db IRON_TAIL
	db SCREECH
	db FLAME_WHEEL
	db COUNTER
	db REVERSAL
	db U_TURN
	db PETAL_DANCE
	db -1 ; end

SMolaEggMoves:
	db HYDRO_PUMP
	db DOUBLE_EDGE
	db THRASH
	db OUTRAGE
	db ANCIENTPOWER
	db SWIFT
	db DESTINY_BOND
	db -1 ; end

MankeyEggMoves:
	db FORESIGHT
	db COUNTER
	db REVERSAL
	db ENCORE	
	db SCARY_FACE
	db PAY_DAY
	db STONE_EDGE
	db -1 ; end

GrowlitheEggMoves:
	db THRASH
	db FIRE_SPIN
	db WILD_CHARGE
	db MORNING_SUN
	db WILL_O_WISP
	db -1 ; end

PoliwagEggMoves:
	db MIST
	db BUBBLEBEAM
	db HAZE
	db MIND_READER
	db ENCORE
	db SCREECH
	db -1 ; end

AbraEggMoves:
	db ENCORE
	db BARRIER
	db -1 ; end

MachopEggMoves:
	db ENCORE
	db BULLET_PUNCH
	db REVERSAL
	db METRONOME
	db -1 ; end

BellsproutEggMoves:
	db ENCORE
	db SYNTHESIS
	db AGILITY
	db -1 ; end

TentacoolEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db BUBBLE
	db DESTINY_BOND
	db ACID_ARMOR
	db -1 ; end

GeodudeEggMoves:
	db AGILITY
	db COUNTER
	db SCREECH
	db -1 ; end

PonytaEggMoves:
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db QUICK_ATTACK
	db WILD_CHARGE
	db HORN_DRILL
	db MORNING_SUN
	db LOW_KICK
	db WILL_O_WISP
	db PAY_DAY
	db -1 ; end

SlowpokeEggMoves:
	db BELLY_DRUM
	db FUTURE_SIGHT
	db HYDRO_PUMP
	db NASTY_PLOT
	db PAY_DAY
	db -1 ; end

FarfetchDEggMoves:
	db FORESIGHT
	db MIRROR_MOVE
	db GUST
	db QUICK_ATTACK
	db FLAIL
	db STEEL_WING
	db MUD_SLAP
	db RECOVER
	db EXPLOSION
	db U_TURN
	db REVERSAL
	db BATON_PASS
	db WATER_GUN
	db PAY_DAY
	db -1 ; end

DoduoEggMoves:
	db QUICK_ATTACK
	db SUPERSONIC
	db HAZE
	db FAINT_ATTACK
	db FLAIL
	db MIRROR_MOVE
	db BRAVE_BIRD
	db -1 ; end

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db PECK
	db ENCORE
	db HORN_DRILL
	db IRON_TAIL
	db LIGHT_SCREEN
	db PAY_DAY
	db ICICLE_SPEAR
	db -1 ; end

GrimerEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db RECOVER
	db COSMIC_POWER
	db SCARY_FACE
	db PURSUIT
	db MOONBLAST
	db DESTINY_BOND
	db STONE_EDGE
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db DOUBLE_EDGE
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db LICK
	db PIN_MISSILE
	db -1 ; end

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db HAZE
	db MEAN_LOOK
	db DISABLE
	db SCARY_FACE
	db SMOG
	db ENCORE
	db -1 ; end

OnixEggMoves:
	db FLAIL
	db IRON_TAIL
	db ROLLOUT
	db MUD_SLAP
	db -1 ; end

DrowzeeEggMoves:
	db BARRIER
	db RECOVER
	db DESTINY_BOND
	db DRAIN_KISS
	db METRONOME
	db -1 ; end

KrabbyEggMoves:
	db HAZE
	db AMNESIA
	db FLAIL
	db ANCIENTPOWER
	db AGILITY
	db X_SCISSOR
	db -1 ; end

ExeggcuteEggMoves:
	db SYNTHESIS
	db MOONLIGHT
	db MEGA_DRAIN
	db ANCIENTPOWER
	db AGILITY
	db MEAN_LOOK
	db -1 ; end

CuboneEggMoves:
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db SKULL_BASH
	db PERISH_SONG
	db FALSE_SWIPE
	db STONE_EDGE
	db -1 ; end

SearionEggMoves:
	db CHARM
	db AMNESIA
	db HYDRO_PUMP
	db MIST
	db PERISH_SONG
	db FLAME_WHEEL
	db FLARE_BLITZ
	db EXPLOSION
	db EGG_BOMB
	db BARRAGE
	db -1 ; end
	
LickitungEggMoves:
	db BELLY_DRUM
	db SNORE
	db CALM_MIND
	db THRASH
	db OUTRAGE
	db -1 ; end

KoffingEggMoves:
	db SCREECH
	db PSYWAVE
	db PSYBEAM
	db DESTINY_BOND
	db PAIN_SPLIT
	db RECOVER
	db WILL_O_WISP
	db AMNESIA
	db -1 ; end

RhyhornEggMoves:
	db OUTRAGE
	db REVERSAL
	db THRASH
	db PURSUIT
	db COUNTER
	db IRON_TAIL
	db SKULL_BASH
	db PAY_DAY
	db -1 ; end

ChanseyEggMoves:
	db PRESENT
	db METRONOME
	db -1 ; end

TangelaEggMoves:
	db FLAIL
	db CONFUSION
	db MEGA_DRAIN
	db AMNESIA
	db AGILITY
	db LEECH_SEED
	db -1 ; end

KangaskhanEggMoves:
	db HEADBUTT
	db FORESIGHT
	db FOCUS_ENERGY
	db DISABLE
	db COUNTER
	db DOUBLE_EDGE
	db MILK_DRINK
	db HYDRO_PUMP
	db -1 ; end

HorseaEggMoves:
	db FLAIL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db DRAGON_RAGE
	db OUTRAGE
	db POISON_STING
	db PIN_MISSILE
	db SIGNAL_BEAM
	db U_TURN
	db -1 ; end

GoldeenEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db SIGNAL_BEAM
	db SKULL_BASH
	db U_TURN
	db -1 ; end

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIMIC
	db METRONOME
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db BATON_PASS
	db RAZOR_WIND
	db REVERSAL
	db SILVER_WIND
	db GUILLOTINE
	db STEEL_WING
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db FLAIL
	db QUICK_ATTACK
	db RAZOR_WIND
	db FOCUS_ENERGY
	db REVERSAL
	db STONE_EDGE
	db -1 ; end

MagikarpEggMoves:
	db DIVE_BOMB
	db -1

LaprasEggMoves:
	db AURORA_BEAM
	db FORESIGHT
	db HORN_DRILL
	db ANCIENTPOWER
	db FISSURE
	db OUTRAGE
	db SOLARBEAM
	db RECOVER
	db CHARM
	db SIGNAL_BEAM
	db -1 ; end

EeveeEggMoves:
	db FLAIL
	db CHARM
	db DESTINY_BOND
	db MIST
	db PAY_DAY
	db MIMIC
	db SIGNAL_BEAM
	db SKULL_BASH
	db FUTURE_SIGHT
	db -1 ; end

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SUPERSONIC
	db HAZE
	db SPIKES
	db PIN_MISSILE
	db -1 ; end

KabutoEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db FLAIL
	db CONFUSE_RAY
	db SCREECH
	db DOUBLE_EDGE
	db -1 ; end

AerodactylEggMoves:
	db WHIRLWIND
	db PURSUIT
	db FORESIGHT
	db DIVE_BOMB
	db STEEL_WING
	db DRAGON_RAGE
	db -1 ; end

SnorlaxEggMoves:
	db LICK
	db CHARM
	db FISSURE
	db ROAR
	db PURSUIT
	db COUNTER
	db ENCORE
	db PAY_DAY
	db -1 ; end

DratiniEggMoves:
	db COIL
	db MIST
	db HAZE
	db SUPERSONIC
	db DRAGON_RAGE
	db AQUA_JET
	db IRON_TAIL
	db FIRE_SPIN
	db HYDRO_PUMP
	db STONE_EDGE
	db DIVE_BOMB
	db -1 ; end

ChikoritaEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db FLAIL
	db PRESENT
	db GROWTH
	db -1 ; end

CyndaquilEggMoves:
	db FURY_SWIPES
	db QUICK_ATTACK
	db REVERSAL
	db THRASH
	db FORESIGHT
	db SUBMISSION
	db WILD_CHARGE
	db DOUBLE_EDGE
	db DOUBLE_KICK
	db PRESENT
	db WILL_O_WISP
	db -1 ; end

TotodileEggMoves:
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
	db RAZOR_WIND
	db METAL_CLAW
	db AQUA_JET
	db OUTRAGE
	db MEAN_LOOK
	db PRESENT
	db -1 ; end

SentretEggMoves:
	db DOUBLE_EDGE
	db PURSUIT
	db FOCUS_ENERGY
	db REVERSAL
	db IRON_TAIL
	db U_TURN
	db EXTREMESPEED
	db BELLY_DRUM
	db -1 ; end

HoothootEggMoves:
	db MIRROR_MOVE
	db SUPERSONIC
	db FAINT_ATTACK
	db WING_ATTACK
	db WHIRLWIND
	db BRAVE_BIRD
	db AGILITY
	db NIGHT_SHADE
	db FUTURE_SIGHT
	db -1 ; end

CubboltEggMoves:
	db THRASH
	db FLARE_BLITZ
	db WILD_CHARGE
	db ENDURE
	db SIGNAL_BEAM
	db -1 ; end

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db SIGNAL_BEAM
	db TWINEEDLE
	db MEGAHORN
	db X_SCISSOR
	db -1 ; end

ChinchouEggMoves:
	db FLAIL
	db SUPERSONIC
	db SCREECH
	db AMNESIA
	db PSYBEAM
	db AGILITY
	db -1 ; end

CurstrawEggMoves:
	db SPITE
	db PAIN_SPLIT
	db DISABLE
	db MEAN_LOOK
	db HAZE
	db PSYWAVE
	db -1

ShifurEggMoves:
	db PRESENT
	db COUNTER
	db SPITE
	db FORESIGHT
	db BITE
	db DOUBLESLAP
	db PURSUIT
	db ENCORE
	db BODY_SLAM
	db -1 ; end

NatuEggMoves:
	db HAZE
	db DRILL_PECK
	db QUICK_ATTACK
	db FAINT_ATTACK
	db HYPNOSIS
	db SING
	db STEEL_WING
	db RECOVER
	db FUTURE_SIGHT
	db RAPID_SPIN
	db DESTINY_BOND
	db U_TURN
	db BATON_PASS
	db -1 ; end

MareepEggMoves:
	db THUNDERBOLT
	db DOUBLE_EDGE
	db SCREECH
	db IRON_TAIL
	db SAND_ATTACK
	db AGILITY
	db -1 ; end

MarillEggMoves:
	db PRESENT
	db AMNESIA
	db FUTURE_SIGHT
	db BELLY_DRUM
	db PERISH_SONG
	db SUPERSONIC
	db FORESIGHT
	db AQUA_JET
	db DRAIN_KISS
	db -1 ; end

SudowoodoEggMoves:
	db EXPLOSION
	db HARDEN
	db ROLLOUT
	db DEFENSE_CURL
	db SPIKES
	db -1 ; end

HoppipEggMoves:
	db CONFUSION
	db GROWL
	db ENCORE
	db DOUBLE_EDGE
	db AMNESIA
	db AGILITY
	db PAY_DAY
	db -1 ; end

AipomEggMoves:
	db COUNTER
	db SCREECH
	db PURSUIT
	db AGILITY
	db SPITE
	db DOUBLESLAP
	db U_TURN
	db -1 ; end
	
SunkernEggMoves:
	db BIDE
	db ENCORE
	db SYNTHESIS
	db SWEET_SCENT
	db -1 ; end

YanmaEggMoves:
	db WHIRLWIND
	db REVERSAL
	db LEECH_LIFE
	db FAINT_ATTACK
	db DOUBLE_EDGE
	db PURSUIT
	db -1 ; end

WooperEggMoves:
	db ANCIENTPOWER
	db COUNTER
	db ENCORE
	db DOUBLE_KICK
	db RECOVER
	db HYDRO_PUMP
	db -1 ; end

MurkrowEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db QUICK_ATTACK
	db MIRROR_MOVE
	db WING_ATTACK
	db BRAVE_BIRD
	db CONFUSE_RAY
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db WILL_O_WISP
	db -1 ; end

GirafarigEggMoves:
	db DOUBLE_EDGE
	db AMNESIA
	db FORESIGHT
	db FUTURE_SIGHT
	db RECOVER
	db DOUBLE_KICK
	db MIRROR_COAT
	db RAZOR_WIND
	db MEAN_LOOK
	db DESTINY_BOND
	db SIGNAL_BEAM
	db -1 ; end

PinecoEggMoves:
	db PIN_MISSILE
	db FLAIL
	db SWIFT
	db COUNTER
	db DOUBLE_EDGE
	db SPIKES
	db REVERSAL
	db SIGNAL_BEAM
	db -1 ; end

DunsparceEggMoves:
	db BIDE
	db ANCIENTPOWER
	db BITE
	db RAGE
	db WILD_CHARGE
	db COIL
	db AGILITY
	db AMNESIA
	db BATON_PASS
	db -1 ; end

GligarEggMoves:
	db METAL_CLAW
	db WING_ATTACK
	db RAZOR_WIND
	db COUNTER
	db STEEL_WING
	db AGILITY
	db BATON_PASS
	db DOUBLE_EDGE
	db STONE_EDGE
	db -1 ; end

SnubbullEggMoves:
	db METRONOME
	db FAINT_ATTACK
	db PRESENT
	db LICK
	db LEER
	db WILD_CHARGE
	db DOUBLE_EDGE
	db MIMIC
	db STONE_EDGE
	db -1 ; end

QwilfishEggMoves:
	db FLAIL
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db AQUA_JET
	db SCARY_FACE
	db SIGNAL_BEAM
	db -1 ; end

ShuckleEggMoves:
	db EXPLOSION
	db ROLLOUT
	db DEFENSE_CURL
	db -1 ; end

HeracrossEggMoves:
	db HARDEN
	db BIDE
	db FLAIL
	db COUNTER
	db FORESIGHT	
	db REVERSAL
	db DOUBLE_EDGE
	db SEISMIC_TOSS
	db MEGAHORN
	db SPIKES
	db STONE_EDGE
	db -1 ; end

TeddiursaEggMoves:
	db BITE
	db DOUBLE_EDGE
	db SEISMIC_TOSS
	db FOCUS_ENERGY
	db COUNTER
	db METAL_CLAW
	db CROSS_CHOP
	db BELLY_DRUM
	db STONE_EDGE
	db -1 ; end

SlugmaEggMoves:
	db ACID_ARMOR
	db PAIN_SPLIT
	db FIRE_SPIN
	db EXPLOSION
	db STONE_EDGE
	db -1 ; end

SwinubEggMoves:
	db DOUBLE_EDGE
	db BITE
	db ANCIENTPOWER
	db ICICLE_SPEAR
	db FISSURE
	db SPIKES
	db STONE_EDGE
	db -1 ; end

CorsolaEggMoves:
	db SCREECH
	db MIST
	db AMNESIA
	db BARRIER
	db CONFUSE_RAY
	db ICICLE_SPEAR
	db BIDE
	db -1 ; end

RemoraidEggMoves:
	db AURORA_BEAM
	db OCTAZOOKA
	db SUPERSONIC
	db HAZE
	db SCREECH
	db FLAIL
	db RECOVER
	db POISON_STING
	db -1 ; end

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db RAPID_SPIN
	db PRESENT
	db DESTINY_BOND
	db SPIKES
	db COUNTER
	db SING
	db BRAVE_BIRD
	db BODY_SLAM
	db SIGNAL_BEAM
	db PAY_DAY
	db ICICLE_SPEAR
	db -1 ; end

MantineEggMoves:
	db TWISTER
	db HYDRO_PUMP
	db HAZE
	db MIRROR_COAT
	db AMNESIA
	db BARRAGE
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db BRAVE_BIRD
	db X_SCISSOR
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db PURSUIT
	db COUNTER
	db SPITE
	db REVERSAL
	db DESTINY_BOND
	db BONEMERANG
	db WILL_O_WISP
	db SCARY_FACE
	db -1 ; end

PhanpyEggMoves:
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db ROLLOUT
	db COUNTER
	db FISSURE
	db DOUBLE_EDGE
	db MUD_SLAP
	db FLARE_BLITZ
	db IRON_HEAD
	db ENCORE
	db -1 ; end

StantlerEggMoves:
	db SPITE
	db DISABLE
	db BITE
	db WILD_CHARGE
	db FLARE_BLITZ
	db CONFUSION
	db THRASH
	db DOUBLE_KICK
	db MEGAHORN
	db RAGE
	db SIGNAL_BEAM
	db -1 ; end

GreminiEggMoves:
	db DISABLE
	db FORESIGHT
	db PURSUIT
	db CONFUSE_RAY
	db GUNK_SHOT
	db MOONLIGHT
	db MEAN_LOOK
	db -1
	
SmoochumEggMoves:
	db RECOVER
	db ICICLE_SPEAR
	db PETAL_DANCE
	db METRONOME
	db -1 ; end

ElekidEggMoves:
	db KARATE_CHOP
	db BARRIER
	db CROSS_CHOP
	db DYNAMICPUNCH
	db FLAMETHROWER
	db METRONOME
	db -1 ; end

MagbyEggMoves:
	db KARATE_CHOP
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db DYNAMICPUNCH
	db SLUDGE
	db THUNDERBOLT
	db METRONOME
	db -1 ; end

MiltankEggMoves:
	db PRESENT
	db REVERSAL
	db SEISMIC_TOSS
	db WILD_CHARGE
	db DIZZY_PUNCH
	db DOUBLE_EDGE
	db CHARM
	db -1 ; end

LarvitarEggMoves:
	db PURSUIT
	db HEADBUTT
	db OUTRAGE
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db IRON_TAIL
	db -1 ; end
	
FerrodonEggMoves:
	db FOCUS_ENERGY
	db MUD_SLAP
	db COUNTER
	db RAGE
	db DOUBLE_EDGE
	db DEFENSE_CURL
	db ROLLOUT
	db THRASH
	db FLAIL
	db SKULL_BASH
	db ANCIENTPOWER
	db STONE_EDGE
	db -1

NoEggMoves:
	db -1 ; end
