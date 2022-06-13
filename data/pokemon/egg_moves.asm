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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
	db BODY_PRESS
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
	db BRICK_BREAK
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
	db EXTREMESPEED
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
	db DYNAMICPUNCH
	db SURF
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db AMNESIA
	db BELLY_DRUM
	db MIMIC
	db SIGNAL_BEAM
	db PETAL_DANCE
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db CRABHAMMER
	db BRICK_BREAK
	db MOONLIGHT
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
	db DYNAMICPUNCH
	db BULLET_PUNCH
	db MACH_PUNCH
	db BRICK_BREAK
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
	db BRICK_BREAK
	db -1 ; end

AbraEggMoves:
	db ENCORE
	db BARRIER
	db DYNAMICPUNCH
	db -1 ; end

MachopEggMoves:
	db ENCORE
	db BULLET_PUNCH
	db REVERSAL
	db METRONOME
	db STONE_EDGE
	db SCARY_FACE
	db FALSE_SWIPE
	db BODY_PRESS
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
	db CONFUSE_RAY
	db -1 ; end

GeodudeEggMoves:
	db AGILITY
	db COUNTER
	db SCREECH
	db BRICK_BREAK
	db CROSS_CHOP
	db BODY_PRESS
	db -1 ; end

PonytaEggMoves:
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db QUICK_ATTACK
	db WILD_CHARGE
	db HORN_DRILL
	db MORNING_SUN
	db WILL_O_WISP
	db PAY_DAY
	db -1 ; end

SlowpokeEggMoves:
	db BELLY_DRUM
	db FUTURE_SIGHT
	db HYDRO_PUMP
	db NASTY_PLOT
	db PAY_DAY
	db BRICK_BREAK
	db BODY_PRESS
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
	db BRICK_BREAK
	db -1 ; end

DoduoEggMoves:
	db QUICK_ATTACK
	db SUPERSONIC
	db HAZE
	db FAINT_ATTACK
	db FLAIL
	db MIRROR_MOVE
	db BRAVE_BIRD
	db DOUBLE_EDGE
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
	db BODY_PRESS
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
	db BODY_PRESS
	db -1 ; end

DrowzeeEggMoves:
	db BARRIER
	db RECOVER
	db DESTINY_BOND
	db DRAIN_KISS
	db METRONOME
	db DYNAMICPUNCH
	db BRICK_BREAK
	db MIND_READER
	db -1 ; end

KrabbyEggMoves:
	db HAZE
	db AMNESIA
	db FLAIL
	db ANCIENTPOWER
	db AGILITY
	db X_SCISSOR
	db BRICK_BREAK
	db BODY_PRESS
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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
	db BODY_PRESS
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
	db BODY_PRESS
	db -1 ; end

ChanseyEggMoves:
	db PRESENT
	db METRONOME
	db DYNAMICPUNCH
	db BRICK_BREAK
	db COUNTER
	db -1 ; end

TangelaEggMoves:
	db FLAIL
	db CONFUSION
	db MEGA_DRAIN
	db AMNESIA
	db AGILITY
	db LEECH_SEED
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
	db MIND_READER
	db BODY_PRESS
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db BATON_PASS
	db RAZOR_WIND
	db REVERSAL
	db SILVER_WIND
	db GUILLOTINE
	db STEEL_WING
	db BRICK_BREAK
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db FLAIL
	db QUICK_ATTACK
	db RAZOR_WIND
	db FOCUS_ENERGY
	db REVERSAL
	db STONE_EDGE
	db BODY_PRESS
	db -1 ; end

TaurosEggMoves:
	db PRESENT
	db REVERSAL
	db FLAIL
	db OUTRAGE
	db BULK_UP
	db FLARE_BLITZ
	db WILD_CHARGE
	db -1

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
	db BODY_PRESS
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
	db BRICK_BREAK
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
	db BODY_PRESS
	db -1 ; end

ChikoritaEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db FLAIL
	db PRESENT
	db GROWTH
	db SLEEP_POWDER
	db STUN_SPORE
	db BODY_PRESS
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
	db BRICK_BREAK
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
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db ZAP_CANNON
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
	db BRICK_BREAK
	db RAZOR_WIND
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
	db DYNAMICPUNCH
	db BRICK_BREAK
	db -1 ; end

SudowoodoEggMoves:
	db EXPLOSION
	db HARDEN
	db ROLLOUT
	db DEFENSE_CURL
	db SPIKES
	db SEISMIC_TOSS
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
	db DYNAMICPUNCH
	db BRICK_BREAK
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
	db DYNAMICPUNCH
	db BRICK_BREAK
	db SEISMIC_TOSS
	db BODY_PRESS
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
	db MOONBLAST
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
	db BODY_PRESS
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
	db DYNAMICPUNCH
	db COUNTER
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
	db BODY_PRESS
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
	db DYNAMICPUNCH
	db -1 ; end

SlugmaEggMoves:
	db ACID_ARMOR
	db PAIN_SPLIT
	db FIRE_SPIN
	db EXPLOSION
	db STONE_EDGE
	db BODY_PRESS
	db -1 ; end

SwinubEggMoves:
	db DOUBLE_EDGE
	db BITE
	db ANCIENTPOWER
	db FISSURE
	db SPIKES
	db STONE_EDGE
	db FREEZE_DRY
	db BODY_PRESS
	db -1 ; end

CorsolaEggMoves:
	db SCREECH
	db MIST
	db AMNESIA
	db BARRIER
	db CONFUSE_RAY
	db ICICLE_SPEAR
	db BIDE
	db BODY_PRESS
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
	db BODY_PRESS
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
	db FREEZE_DRY
	db BRICK_BREAK
	db -1 ; end

MantineEggMoves:
	db TWISTER
	db HYDRO_PUMP
	db HAZE
	db MIRROR_COAT
	db AMNESIA
	db BARRAGE
	db BODY_PRESS
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db BRAVE_BIRD
	db X_SCISSOR
	db DOUBLE_EDGE
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
	db BODY_PRESS
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

SmeargleEggMoves:
	db POUND
	db KARATE_CHOP
	db DOUBLESLAP 
	db COMET_PUNCH
	db DIVE_BOMB
	db PAY_DAY
	db FIRE_PUNCH 
	db ICE_PUNCH
	db THUNDERPUNCH 
	db SCRATCH
	db BODY_PRESS
	db GUILLOTINE
	db RAZOR_WIND
	db SWORDS_DANCE 
	db CUT
	db GUST
	db WING_ATTACK
	db WHIRLWIND
	db FLY
	db BIND
	db SILVER_WIND
	db VINE_WHIP
	db ICICLE_SPEAR 
	db DOUBLE_KICK
	db BULK_UP
	db COIL
	db SAND_ATTACK
	db HEADBUTT
	db HORN_ATTACK
	db FURY_ATTACK
	db HORN_DRILL
	db TACKLE
	db BODY_SLAM
	db WRAP
	db FLARE_BLITZ
	db THRASH
	db DOUBLE_EDGE
	db TAIL_WHIP
	db POISON_STING
	db TWINEEDLE
	db PIN_MISSILE
	db LEER
	db BITE
	db GROWL
	db ROAR
	db SING
	db SUPERSONIC
	db SONICBOOM
	db ACID
	db EMBER
	db FLAMETHROWER
	db MIST
	db WATER_GUN
	db HYDRO_PUMP
	db SURF
	db ICE_BEAM
	db BLIZZARD
	db PSYBEAM
	db BUBBLEBEAM
	db AURORA_BEAM
	db HYPER_BEAM
	db PECK
	db DRILL_PECK
	db SUBMISSION
	db BRICK_BREAK
	db COUNTER
	db SEISMIC_TOSS
	db STRENGTH
	db ABSORB
	db MEGA_DRAIN
	db LEECH_SEED
	db GROWTH
	db RAZOR_LEAF
	db SOLARBEAM
	db POISONPOWDER
	db STUN_SPORE
	db SLEEP_POWDER
	db PETAL_DANCE
	db STRING_SHOT
	db DRAGON_RAGE
	db FIRE_SPIN
	db THUNDERSHOCK
	db THUNDERBOLT
	db THUNDER_WAVE
	db THUNDER
	db ROCK_THROW
	db EARTHQUAKE
	db FISSURE
	db DIG
	db TOXIC
	db CONFUSION
	db PSYCHIC_M
	db HYPNOSIS
	db DRAGON_DANCE
	db AGILITY
	db QUICK_ATTACK
	db RAGE
	db TELEPORT
	db NIGHT_SHADE
	db MIMIC
	db SCREECH
	db DOUBLE_TEAM
	db RECOVER
	db HARDEN
	db MINIMIZE
	db SMOKESCREEN
	db X_SCISSOR
	db DEFENSE_CURL
	db BARRIER
	db LIGHT_SCREEN
	db HAZE
	db REFLECT
	db FOCUS_ENERGY
	db BIDE
	db METRONOME
	db MIRROR_MOVE
	db COSMIC_POWER
	db EGG_BOMB
	db LICK
	db SMOG
	db SLUDGE
	db BONE_CLUB
	db FIRE_BLAST
	db WATERFALL
	db AQUA_JET
	db SWIFT
	db SKULL_BASH
	db SPIKE_CANNON
	db QUIVER_DANCE
	db AMNESIA
	db DRAIN_PUNCH
	db SOFTBOILED
	db HI_JUMP_KICK
	db GLARE
	db DREAM_EATER
	db POISON_GAS
	db BARRAGE
	db LEECH_LIFE
	db LOVELY_KISS
	db BRAVE_BIRD
	db TRANSFORM
	db BUBBLE
	db DIZZY_PUNCH
	db SPORE
	db WILL_O_WISP
	db PSYWAVE
	db SPLASH
	db ACID_ARMOR
	db CRABHAMMER
	db EXPLOSION
	db FURY_SWIPES
	db BONEMERANG
	db REST
	db ROCK_SLIDE
	db CALM_MIND
	db SHARPEN
	db CONVERSION
	db TRI_ATTACK
	db WILD_CHARGE
	db SUBSTITUTE
	db STONE_EDGE
	db SKETCH
	db BULLET_PUNCH
	db THIEF
	db IRON_HEAD
	db MIND_READER
	db NIGHTMARE
	db FLAME_WHEEL
	db SNORE
	db CURSE
	db FLAIL
	db CONVERSION2
	db AEROBLAST
	db COTTON_SPORE
	db REVERSAL
	db SPITE
	db FREEZE_DRY
	db PROTECT
	db MACH_PUNCH
	db SCARY_FACE
	db FAINT_ATTACK
	db SWEET_KISS
	db BELLY_DRUM
	db SLUDGE_BOMB
	db MUD_SLAP
	db OCTAZOOKA
	db SPIKES
	db ZAP_CANNON
	db DESTINY_BOND
	db PERISH_SONG
	db ICY_WIND
	db PLAY_ROUGH
	db MOONBLAST
	db LOCK_ON
	db OUTRAGE
	db SANDSTORM
	db GIGA_DRAIN
	db ENDURE
	db CHARM
	db ROLLOUT
	db FALSE_SWIPE
	db SWAGGER
	db MILK_DRINK
	db SPARK
	db FURY_CUTTER
	db STEEL_WING
	db ATTRACT
	db SLEEP_TALK
	db HEAL_BELL
	db RETURN
	db PRESENT
	db U_TURN
	db SAFEGUARD
	db PAIN_SPLIT
	db SACRED_FIRE
	db BULLDOZE
	db DYNAMICPUNCH
	db MEGAHORN
	db DRAGONBREATH
	db BATON_PASS
	db ENCORE
	db RAPID_SPIN
	db SWEET_SCENT
	db IRON_TAIL
	db METAL_CLAW
	db VITAL_THROW
	db MORNING_SUN
	db SYNTHESIS
	db HIDDEN_POWER
	db CROSS_CHOP
	db TWISTER
	db RAIN_DANCE
	db SUNNY_DAY
	db CRUNCH
	db MIRROR_COAT
	db PSYCH_UP
	db EXTREMESPEED
	db ANCIENTPOWER
	db SHADOW_BALL
	db FUTURE_SIGHT
	db ROCK_SMASH
	db WHIRLPOOL
	db DRAIN_KISS
	db NASTY_PLOT
	db HURRICANE
	db SIGNAL_BEAM
	; fallthrough
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
	db MACH_PUNCH
	db RECOVER
	db ICICLE_SPEAR
	db PETAL_DANCE
	db METRONOME
	db FREEZE_DRY
	db DYNAMICPUNCH
	db -1 ; end

ElekidEggMoves:
	db MACH_PUNCH
	db KARATE_CHOP
	db BARRIER
	db CROSS_CHOP
	db DYNAMICPUNCH
	db FLAMETHROWER
	db METRONOME
	db BRICK_BREAK
	db -1 ; end

MagbyEggMoves:
	db MACH_PUNCH
	db KARATE_CHOP
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db DYNAMICPUNCH
	db SLUDGE
	db THUNDERBOLT
	db METRONOME
	db BRICK_BREAK
	db -1 ; end

MiltankEggMoves:
	db PRESENT
	db REVERSAL
	db SEISMIC_TOSS
	db WILD_CHARGE
	db DIZZY_PUNCH
	db DOUBLE_EDGE
	db DYNAMICPUNCH
	db TWISTER
	db -1 ; end

LarvitarEggMoves:
	db PURSUIT
	db HEADBUTT
	db OUTRAGE
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db IRON_TAIL
	db BRICK_BREAK
	db BODY_PRESS
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
	db BRICK_BREAK
	db -1

NoEggMoves:
	db -1 ; end
