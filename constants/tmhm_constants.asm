add_tm: MACRO
if !DEF(TM01)
TM01 = const_value
	enum_start 1
endc
	define _\@_1, "TM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_hm: MACRO
if !DEF(HM01)
HM01 = const_value
endc
	define _\@_1, "HM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_mt: MACRO
	enum \1_TMNUM
ENDM

	const_def

; see data/moves/tmhm_moves.asm for moves
	add_tm CALM_MIND
	add_tm BULK_UP
	add_tm HIDDEN_POWER
	add_tm ROAR
	add_tm TOXIC
	add_tm SUBMISSION
	add_tm HEADBUTT
	add_tm CURSE
	add_tm FIRE_PUNCH
	add_tm FLAMETHROWER
	add_tm FIRE_BLAST
	add_tm ICE_PUNCH
	add_tm ICE_BEAM
	add_tm BLIZZARD
	add_tm THUNDERPUNCH
	add_tm THUNDERBOLT
	add_tm THUNDER
	add_tm HURRICANE
	add_tm WATERFALL
	add_tm HYPER_BEAM
	add_tm THUNDER_WAVE
	add_tm LEECH_LIFE
	add_tm DIG
	add_tm STRENGTH
	add_tm RETURN
	add_tm REFLECT
	add_tm LIGHT_SCREEN
	add_tm SAFEGUARD
	add_tm PROTECT
	add_tm ENDURE
	add_tm PSYCHIC_M
	add_tm CRUNCH
	add_tm SHADOW_BALL
	add_tm DRAGONBREATH
	add_tm TELEPORT
	add_tm PSYCH_UP
	add_tm SLUDGE_BOMB
	add_tm ROCK_SMASH
	add_tm FLY
	add_tm ROCK_SLIDE
	add_tm EARTHQUAKE
	add_tm IRON_HEAD
	add_tm CUT
	add_tm THIEF
	add_tm WHIRLPOOL
	add_tm SWAGGER
	add_tm NASTY_PLOT
	add_tm SUBSTITUTE
	add_tm REST
	add_tm SLEEP_TALK
	add_tm ATTRACT
	add_tm DOUBLE_TEAM
	add_tm SUNNY_DAY
	add_tm RAIN_DANCE
	add_tm SANDSTORM
	add_tm SOLARBEAM
	add_tm GIGA_DRAIN
	add_tm DRAGON_DANCE
	add_tm SWORDS_DANCE
	add_tm BULLDOZE
	add_tm PLAY_ROUGH
NUM_TMS = const_value - TM01

	add_hm SURF         ; f5
NUM_HMS = const_value - HM01

	add_mt SWEET_KISS
	add_mt LOVELY_KISS
	add_mt DRAIN_KISS
	add_mt PETAL_DANCE
	add_mt BODY_SLAM
	add_mt DRAIN_PUNCH
	add_mt DESTINY_BOND
	add_mt HEAL_BELL
	add_mt GROWTH
	add_mt NIGHTMARE
	add_mt DREAM_EATER
	add_mt BUBBLEBEAM
	add_mt ICY_WIND
	add_mt SKETCH

NUM_TM_HM_TUTOR = __enum__ + -1
