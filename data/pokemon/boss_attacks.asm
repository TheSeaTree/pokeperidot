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

; The following are used for boss encounters, as checked inn engine\pokemon\evolve.asm

AerodactylBossAttacks:
	db  0 ; no more evolutions
	db  1, STONE_EDGE
	db  1, RAZOR_WIND
	db  1, EARTHQUAKE
	db  1, FIRE_BLAST
	db  0 ; no more level-up moves

MarowakBossAttacks:
	db  0 ; no more evolutions
	db  1, BONEMERANG
	db  1, ROCK_SLIDE
	db  1, SKULL_BASH
	db  1, THRASH
	db  0 ; no more level-up moves

MukBossAttacks:
	db  0 ; no more evolutions
	db  1, SLUDGE_BOMB
	db  1, CRUNCH
	db  1, COSMIC_POWER
	db  1, RECOVER
	db  0 ; no more level-up moves

GengarBossAttacks:
	db  0 ; no more evolutions
	db  1, SHADOW_BALL
	db  1, PLAY_ROUGH
	db  1, DRAIN_PUNCH
	db  1, WILL_O_WISP
	db  0 ; no more level-up moves

SkarmoryBossAttacks:
	db  0 ; no more evolutions
	db  1, IRON_HEAD
	db  1, BRAVE_BIRD
	db  1, DRILL_PECK
	db  1, SPIKES
	db  0 ; no more level-up moves

TentacruelBossAttacks:
	db  0 ; no more evolutions
	db  1, SURF
	db  1, TOXIC
	db  1, GIGA_DRAIN
	db  1, MIRROR_COAT
	db  0 ; no more level-up moves

MachampBossAttacks:
	db  0 ; no more evolutions
	db  1, CROSS_CHOP
	db  1, STONE_EDGE
	db  1, PURSUIT
	db  1, BULLET_PUNCH
	db  0 ; no more level-up moves

CelebiBossAttacks:
	db  0 ; no more evolutions
	; First Encounter (Level 15)
	db  1, PSYWAVE
	db  1, LEECH_SEED
	db  1, SUBSTITUTE
	db  1, HEAL_BELL
	; Second Encounter
	db  18, RECOVER
	db  18, EARTHQUAKE
	db  18, ANCIENTPOWER
	db  18, HYPER_BEAM
	; Third Encounter
	db  21, PROTECT
	db  21, LEECH_SEED
	db  21, COSMIC_POWER
	db  21, FUTURE_SIGHT
	; Fourth Encounter
	db  23, NASTY_PLOT
	db  23, GIGA_DRAIN
	db  23, SHADOW_BALL
	db  23, PLAY_ROUGH
	; Final Encounter
	db 70, FUTURE_SIGHT
	db 70, GIGA_DRAIN
	db 70, RECOVER
	db 70, HEAL_BELL
	db  0 ; no more level-up moves

BoneyardMonAttacks: ; Shared between Cubone and Houndour
	db 0 ; no more evolutions
	; Houndour (Egg Moves)
	db  1, BITE
	db  1, FIRE_SPIN
	db  1, WILL_O_WISP
	db  1, BONEMERANG
	; Cubone
	db 26, LEER
	db 26, FOCUS_ENERGY
	db 26, RAGE
	; Cubone (Egg Moves)
	db 27, BRICK_BREAK
	db 27, FALSE_SWIPE
	db 27, SKULL_BASH
	db 0 ; no more level-up moves
