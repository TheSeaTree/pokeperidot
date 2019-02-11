INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	db SKULL_BASH
	db RAZOR_WIND
	db PETAL_DANCE
	db AGILITY
	db -1 ; end

CharmanderEggMoves:
	db BELLY_DRUM
	db ANCIENTPOWER
	db BITE
	db OUTRAGE
	db DREAD_STORM
	db METAL_CLAW
	db -1 ; end

SquirtleEggMoves:
	db MIRROR_COAT
	db HAZE
	db MIST
	db CONFUSION
	db FORESIGHT
	db FLAIL
	db DRAGONBREATH
	db -1 ; end

PidgeyEggMoves:
	db PURSUIT
	db FAINT_ATTACK
	db FORESIGHT
	db STEEL_WING
	db SKY_ATTACK
	db SING
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
	db -1 ; end

SpearowEggMoves:
	db FAINT_ATTACK
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db SKY_ATTACK
	db WHIRLWIND
	db STEEL_WING
	db RAZOR_WIND
	db -1 ; end

EkansEggMoves:
	db PURSUIT
	db SPITE
	db DRAGONBREATH
	db DRAGON_DANCE
	db IRON_TAIL
	db -1 ; end

SandshrewEggMoves:
	db FLAIL
	db COUNTER
	db RAPID_SPIN
	db METAL_CLAW
	db -1 ; end

NidoranFEggMoves:
	db SUPERSONIC
	db DISABLE
	db DOUBLE_EDGE
	db FOCUS_ENERGY
	db AMNESIA
	db COUNTER
	db -1 ; end

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db DOUBLE_EDGE
	db CONFUSION
	db AMNESIA
	db COUNTER
	db -1 ; end

VulpixEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db FLARE_BLITZ
	db ENCORE
	db -1 ; end

ZubatEggMoves:
	db QUICK_ATTACK
	db PURSUIT
	db FAINT_ATTACK
	db GUST
	db WHIRLWIND
	db HYPNOSIS
	db STEEL_WING
	db -1 ; end

OddishEggMoves:
	db RAZOR_LEAF
	db FLAIL
	db SYNTHESIS
	db AGILITY
	db CHARM
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
	db BATON_PASS
	db SCREECH
	db GIGA_DRAIN
	db BUG_BUZZ
	db -1 ; end

DiglettEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db EXPLOSION
	db THRASH
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
	db -1 ; end

GrowlitheEggMoves:
	db THRASH
	db FIRE_SPIN
	db WILD_CHARGE
	db MORNING_SUN
	db -1 ; end

PoliwagEggMoves:
	db MIST
	db BUBBLEBEAM
	db HAZE
	db MIND_READER
	db ENCORE
	db -1 ; end

AbraEggMoves:
	db ENCORE
	db BARRIER
	db -1 ; end

MachopEggMoves:
	db ENCORE
	db BULLET_PUNCH
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
	db -1 ; end

GeodudeEggMoves:
	db AGILITY
	db COUNTER
	db SCREECH
	db -1 ; end

PonytaEggMoves:
	db FLAME_WHEEL
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db QUICK_ATTACK
	db WILD_CHARGE
	db HORN_DRILL
	db MORNING_SUN
	db LOW_KICK
	db -1 ; end

SlowpokeEggMoves:
	db BELLY_DRUM
	db FUTURE_SIGHT
	db HYDRO_PUMP
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
	db -1 ; end

DoduoEggMoves:
	db QUICK_ATTACK
	db SUPERSONIC
	db HAZE
	db FAINT_ATTACK
	db FLAIL
	db MIRROR_MOVE
	db SKY_ATTACK
	db -1 ; end

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db PECK
	db ENCORE
	db HORN_DRILL
	db IRON_TAIL
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
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db DOUBLE_EDGE
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db LICK
	db -1 ; end

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db HAZE
	db MEAN_LOOK
	db DISABLE
	db SCARY_FACE
	db SMOG
	db -1 ; end

OnixEggMoves:
	db FLAIL
	db IRON_TAIL
	db ROLLOUT
	db MUD_SLAP
	db SPIKES
	db -1 ; end

DrowzeeEggMoves:
	db BARRIER
	db RECOVER
	db -1 ; end

KrabbyEggMoves:
	db DIG
	db HAZE
	db AMNESIA
	db FLAIL
	db ANCIENTPOWER
	db AGILITY
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
	db -1 ; end
	
LickitungEggMoves:
	db BELLY_DRUM
	db SNORE
	db AMNESIA
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
	db -1 ; end

RhyhornEggMoves:
	db OUTRAGE
	db REVERSAL
	db THRASH
	db PURSUIT
	db COUNTER
	db IRON_TAIL
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
	db -1 ; end

HorseaEggMoves:
	db FLAIL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db DRAGON_RAGE
	db OUTRAGE
	db HYDRO_PUMP
	db -1 ; end

GoldeenEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db -1 ; end

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIMIC
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db BATON_PASS
	db RAZOR_WIND
	db REVERSAL
	db BUG_BUZZ
	db STRUGGLE_BUG
	db GUILLOTINE
	db STEEL_WING
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db FLAIL
	db QUICK_ATTACK
	db BUG_BUZZ
	db RAZOR_WIND
	db FOCUS_ENERGY
	db -1 ; end
	
TaurosEggMoves:
	db -1 ; end

LaprasEggMoves:
	db AURORA_BEAM
	db FORESIGHT
	db HORN_DRILL
	db ANCIENTPOWER
	db FISSURE
	db OUTRAGE
	db -1 ; end

EeveeEggMoves:
	db FLAIL
	db CHARM
	db -1 ; end

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SUPERSONIC
	db HAZE
	db SPIKES
	db -1 ; end

KabutoEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db FLAIL
	db CONFUSE_RAY
	db SCREECH
	db DOUBLE_EDGE
	db -1 ; end

AerodactylEggMoves:
	db WHIRLWIND
	db PURSUIT
	db FORESIGHT
	db DREAD_STORM
	db STEEL_WING
	db DRAGON_RAGE
	db -1 ; end

SnorlaxEggMoves:
	db LICK
	db CHARM
	db DOUBLE_EDGE
	db FISSURE
	db ROAR
	db PURSUIT
	db COUNTER
	db -1 ; end

DratiniEggMoves:
	db COIL
	db MIST
	db HAZE
	db SUPERSONIC
	db DRAGON_RAGE
	db AQUA_JET
	db IRON_TAIL
	db DREAD_STORM
	db -1 ; end

ChikoritaEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db FLAIL
	db PRESENT
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
	db -1 ; end

HoothootEggMoves:
	db MIRROR_MOVE
	db SUPERSONIC
	db FAINT_ATTACK
	db WING_ATTACK
	db WHIRLWIND
	db SKY_ATTACK
	db AGILITY
	db NIGHT_SHADE
	db MEAN_LOOK
	db HYPNOSIS
	db -1 ; end

CubboltEggMoves:
	db THRASH
	db FLARE_BLITZ
	db WILD_CHARGE
	db -1 ; end

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db BUG_BUZZ
	db STRUGGLE_BUG
	db TWINEEDLE
	db MEGAHORN
	db -1 ; end

ChinchouEggMoves:
	db FLAIL
	db SUPERSONIC
	db SCREECH
	db AMNESIA
	db PSYBEAM
	db AGILITY
	db -1 ; end

PichuEggMoves:
	db REVERSAL
	db BIDE
	db PRESENT
	db ENCORE
	db DOUBLESLAP
	db FLAIL
	db -1 ; end

CleffaEggMoves:
	db PRESENT
	db METRONOME
	db AMNESIA
	db BELLY_DRUM
	db MIMIC
	db -1 ; end

IgglybuffEggMoves:
	db PERISH_SONG
	db PRESENT
	db FAINT_ATTACK
	db MEAN_LOOK
	db EXPLOSION
	db -1 ; end

ShifurEggMoves:
	db PRESENT
	db COUNTER
	db SPITE
	db FORESIGHT
	db BITE
	db DOUBLESLAP
	db PURSUIT
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
	db PAY_DAY
	db AGILITY
	db -1 ; end

AipomEggMoves:
	db COUNTER
	db SCREECH
	db PURSUIT
	db AGILITY
	db SPITE
	db DOUBLESLAP
	db -1 ; end

YanmaEggMoves:
	db WHIRLWIND
	db REVERSAL
	db LEECH_LIFE
	db BUG_BUZZ
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
	db -1 ; end

MurkrowEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db QUICK_ATTACK
	db MIRROR_MOVE
	db WING_ATTACK
	db SKY_ATTACK
	db CONFUSE_RAY
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
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
	db -1 ; end

PinecoEggMoves:
	db PIN_MISSILE
	db FLAIL
	db SWIFT
	db COUNTER
	db DOUBLE_EDGE
	db SPIKES
	db -1 ; end

DunsparceEggMoves:
	db BIDE
	db ANCIENTPOWER
	db BITE
	db RAGE
	db WILD_CHARGE
	db COIL
	db AGILITY
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
	db -1 ; end

QwilfishEggMoves:
	db FLAIL
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db AQUA_JET
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
	db -1 ; end

SneaselEggMoves:
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
	db -1 ; end

SlugmaEggMoves:
	db ACID_ARMOR
	db SMOKESCREEN
	db -1 ; end

SwinubEggMoves:
	db DOUBLE_EDGE
	db BITE
	db ANCIENTPOWER
	db ICICLE_SPEAR
	db FISSURE
	db SPIKES
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
	db -1 ; end

MantineEggMoves:
	db TWISTER
	db HYDRO_PUMP
	db HAZE
	db MIRROR_COAT
	db AMNESIA
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db SKY_ATTACK
	db SPIKES
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db PURSUIT
	db COUNTER
	db SPITE
	db REVERSAL
	db DESTINY_BOND
	db -1 ; end

PhanpyEggMoves:
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db WATER_GUN
	db ROLLOUT
	db COUNTER
	db FISSURE
	db DOUBLE_EDGE
	db MUD_SLAP
	db -1 ; end

StantlerEggMoves:
	db SPITE
	db DISABLE
	db BITE
	db WILD_CHARGE
	db CONFUSION
	db THRASH
	db DOUBLE_KICK
	db MEGAHORN
	db RAGE
	db -1 ; end

GreminiEggMoves:
	db RECOVER
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
	db -1 ; end

ElekidEggMoves:
	db KARATE_CHOP
	db BARRIER
	db CROSS_CHOP
	db DYNAMICPUNCH
	db -1 ; end

MagbyEggMoves:
	db KARATE_CHOP
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db DYNAMICPUNCH
	db -1 ; end

MiltankEggMoves:
	db PRESENT
	db REVERSAL
	db SEISMIC_TOSS
	db WILD_CHARGE
	db DIZZY_PUNCH
	db DOUBLE_EDGE
	db -1 ; end

LarvitarEggMoves:
	db PURSUIT
	db HEADBUTT
	db OUTRAGE
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db IRON_TAIL
	db -1 ; end

NoEggMoves:
	db -1 ; end
