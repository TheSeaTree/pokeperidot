BattleTowerMons:
; 10 groups of 21 mons.

BattleTowerMons1:

	db JOLTEON
	db FOCUS_SASH
	db THUNDERBOLT, HIDDEN_POWER, GROWTH, BATON_PASS
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 13, 14, 14 ; DVs
	db 24, 24, 61, 61 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 20 ; Atk
	bigdw 25 ; Def
	bigdw 36 ; Spd
	bigdw 33 ; SAtk
	bigdw 40 ; SDef
	db "SANDA-SU@@@"

	db ESPEON
	db LEFTOVERS
	db GROWTH, PSYCHIC_M, HIDDEN_POWER, MORNING_SUN
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 12, 15, 15 ; DVs
	db 61, 16, 24,  8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 20 ; Atk
	bigdw 25 ; Def
	bigdw 40 ; Spd
	bigdw 33 ; SAtk
	bigdw 36 ; SDef
	db "E-HUi@@@@@@"

	db UMBREON
	db MINT_BERRY
	db CHARM, PURSUIT, TOXIC, REST
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 14, 14, 15 ; DVs
	db 32, 32, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 47 ; HP
	bigdw 47 ; Max HP
	bigdw 27 ; Atk
	bigdw 36 ; Def
	bigdw 27 ; Spd
	bigdw 26 ; SAtk
	bigdw 40 ; SDef
	db "BURAtuKI-@@"

	db WOBBUFFET
	db FOCUS_BAND
	db COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 7, 15, 13, 7 ; DVs
	db 32, 32, 40, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 67 ; HP
	bigdw 67 ; Max HP
	bigdw 14 ; Atk
	bigdw 25 ; Def
	bigdw 20 ; Spd
	bigdw 20 ; SAtk
	bigdw 25 ; SDef
	db "SO-NANSU@@@"

	db KANGASKHAN
	db SILK_SCARF
	db RETURN, HYPER_BEAM, EARTHQUAKE, DRAIN_PUNCH
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	dn 14, 14, 12, 15 ; DVs
	db 32, 8, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 50 ; HP
	bigdw 50 ; Max HP
	bigdw 33 ; Atk
	bigdw 30 ; Def
	bigdw 32 ; Spd
	bigdw 22 ; SAtk
	bigdw 30 ; SDef
	db "GARU-RA@@@@"

	db SCYTHER
	db SCOPE_LENS
	db RAZOR_WIND, X_SCISSOR, AGILITY, BATON_PASS
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 33300
	bigdw 30000
	bigdw 30000
	dn 15, 14, 15, 13 ; DVs
	db 16, 24, 48, 61 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 43 ; HP
	bigdw 43 ; Max HP
	bigdw 26 ; Atk
	bigdw 30 ; Def
	bigdw 35 ; Spd
	bigdw 25 ; SAtk
	bigdw 30 ; SDef
	db "SANI-GO@@@@"

	db MILTANK
	db LEFTOVERS
	db BODY_SLAM, MILK_DRINK, HEAL_BELL, TOXIC
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 35000
	dn 11, 11, 13, 15 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 48 ; HP
	bigdw 48 ; Max HP
	bigdw 30 ; Atk
	bigdw 35 ; Def
	bigdw 34 ; Spd
	bigdw 28 ; SAtk
	bigdw 28 ; SDef
	db "MIRUTANKU@@"

	db AERODACTYL
	db FOCUS_SASH
	db STONE_EDGE, HIDDEN_POWER, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 12, 13, 15, 11 ; DVs
	db 8, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 45 ; HP
	bigdw 45 ; Max HP
	bigdw 35 ; Atk
	bigdw 27 ; Def
	bigdw 40 ; Spd
	bigdw 26 ; SAtk
	bigdw 29 ; SDef
	db "PUTERA@@@@@"

	db LAPRAS
	db TRICK_MIRROR
	db DRAGON_DANCE, SURF, ICE_BEAM, THUNDERBOLT
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 13, 14, 11 ; DVs
	db 32, 24, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 55 ; HP
	bigdw 55 ; Max HP
	bigdw 31 ; Atk
	bigdw 30 ; Def
	bigdw 26 ; Spd
	bigdw 31 ; SAtk
	bigdw 33 ; SDef
	db "RAPURASU@@@"

	db SEARION
	db LEFTOVERS
	db SURF, FLAMETHROWER, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 35000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 11, 11, 15 ; DVs
	db 24, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 43 ; HP
	bigdw 43 ; Max HP
	bigdw 29 ; Atk
	bigdw 29 ; Def
	bigdw 25 ; Spd
	bigdw 31 ; SAtk
	bigdw 34 ; SDef
	db "NIyu-RA@@@@"

	db PORYGON2
	db BERRY_JUICE
	db SHARPEN, TRI_ATTACK, HIDDEN_POWER, AGILITY
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	dn 15, 11, 15, 15 ; DVs
	db 16, 16, 24, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 46 ; HP
	bigdw 46 ; Max HP
	bigdw 30 ; Atk
	bigdw 32 ; Def
	bigdw 26 ; Spd
	bigdw 35 ; SAtk
	bigdw 33 ; SDef
	db "PORIGON2@@@"

	db MISDREAVUS
	db FOCUS_SASH
	db HYPNOSIS, PERISH_SONG, MEAN_LOOK, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 14, 13, 15 ; DVs
	db 32, 8, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 20 ; Atk
	bigdw 26 ; Def
	bigdw 31 ; Spd
	bigdw 31 ; SAtk
	bigdw 31 ; SDef
	db "MUUMA@@@@@@"

	db HOUNDOUR
	db HEAT_CHARM
	db FLAMETHROWER, SOLARBEAM, CRUNCH, ROAR
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 33000
	bigdw 30000
	dn 15, 13, 15, 14 ; DVs
	db 24, 16, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 38 ; HP
	bigdw 38 ; Max HP
	bigdw 26 ; Atk
	bigdw 20 ; Def
	bigdw 27 ; Spd
	bigdw 30 ; SAtk
	bigdw 24 ; SDef
	db "DERUBIRU@@@"

	db STANTLER
	db SILK_SCARF
	db SWORDS_DANCE, RETURN, SHADOW_BALL, THUNDER_WAVE
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 13, 15, 13 ; DVs
	db 48, 32, 24, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 43 ; HP
	bigdw 43 ; Max HP
	bigdw 33 ; Atk
	bigdw 26 ; Def
	bigdw 31 ; Spd
	bigdw 31 ; SAtk
	bigdw 27 ; SDef
	db "KIRINRIKI@@"

	db BLISSEY
	db LEFTOVERS
	db PLAY_ROUGH, SOFTBOILED, THUNDER_WAVE, TELEPORT
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 32000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 13, 15, 12, 14 ; DVs
	db 32, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 80 ; HP
	bigdw 80 ; Max HP
	bigdw 10 ; Atk
	bigdw 16 ; Def
	bigdw 25 ; Spd
	bigdw 29 ; SAtk
	bigdw 41 ; SDef
	db "HAPINASU@@@"

	db CLEFAIRY
	db LEFTOVERS
	db COSMIC_POWER, MINIMIZE, MOONLIGHT, DRAIN_KISS
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 14, 15, 7 ; DVs
	db 32, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 43 ; HP
	bigdw 43 ; Max HP
	bigdw 23 ; Atk
	bigdw 23 ; Def
	bigdw 21 ; Spd
	bigdw 26 ; SAtk
	bigdw 27 ; SDef
	db "KABIGON@@@@"

	db EXEGGUTOR
	db SKILL_BELT
	db TOXIC, BARRAGE, PSYCHIC_M, LEECH_SEED
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 8, 15, 14 ; DVs
	db 16, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 48 ; HP
	bigdw 48 ; Max HP
	bigdw 27 ; Atk
	bigdw 31 ; Def
	bigdw 25 ; Spd
	bigdw 39 ; SAtk
	bigdw 31 ; SDef
	db "NAtuSI-@@@@"

	db HERACROSS
	db FOCUS_SASH
	db REVERSAL, MEGAHORN, COUNTER, EARTHQUAKE
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 7, 15, 7 ; DVs
	db 24, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 45 ; HP
	bigdw 45 ; Max HP
	bigdw 39 ; Atk
	bigdw 29 ; Def
	bigdw 31 ; Spd
	bigdw 22 ; SAtk
	bigdw 33 ; SDef
	db "HERAKUROSU@"

	db FERRODON
	db BERRY_JUICE
	db IRON_TAIL, DRAGONBREATH, EARTHQUAKE, ROAR
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 14, 15, 15 ; DVs
	db 24, 16, 16, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 44 ; HP
	bigdw 44 ; Max HP
	bigdw 32 ; Atk
	bigdw 34 ; Def
	bigdw 24 ; Spd
	bigdw 29 ; SAtk
	bigdw 32 ; SDef
	db "ANNO-N@@@@@"

	db FARFETCH_D
	db STICK
	db CUT, RAZOR_WIND, HIDDEN_POWER, AGILITY
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 11, 15, 15 ; DVs
	db 32, 16, 24, 48 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 32 ; Atk
	bigdw 25 ; Def
	bigdw 26 ; Spd
	bigdw 25 ; SAtk
	bigdw 26 ; SDef
	db "KENTAROSU@@"

	db MR__MIME
	db FOCUS_SASH
	db NASTY_PLOT, PSYCHIC_M, MOONBLAST, FIRE_PUNCH
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 3, 6, 7 ; DVs
	db 32, 16, 16, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 17 ; Atk
	bigdw 27 ; Def
	bigdw 32 ; Spd
	bigdw 34 ; SAtk
	bigdw 38 ; SDef
	db "BARIYA-DO@@"


BattleTowerMons2:

	db MURKROW
	db X_SPEED
	db THIEF, DRILL_PECK, BRAVE_BIRD, DOUBLE_TEAM
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 12, 15, 11, 12 ; DVs
	db 32, 32, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 72 ; HP
	bigdw 72 ; Max HP
	bigdw 57 ; Atk
	bigdw 40 ; Def
	bigdw 60 ; Spd
	bigdw 57 ; SAtk
	bigdw 40 ; SDef
	db "BURAtuKI-@@"

	db STARMIE
	db GOLD_BERRY
	db RECOVER, PSYCHIC_M, SURF, ICE_BEAM
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 13, 11, 13, 11 ; DVs
	db 16, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 72 ; HP
	bigdw 72 ; Max HP
	bigdw 53 ; Atk
	bigdw 57 ; Def
	bigdw 69 ; Spd
	bigdw 63 ; SAtk
	bigdw 57 ; SDef
	db "SUTA-MI-@@@"

	db GYARADOS
	db SHARP_BEAK
	db DRAGON_DANCE, DIVE_BOMB, SURF, HYPER_BEAM
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 10, 15, 13 ; DVs
	db 32, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 73 ; Atk
	bigdw 55 ; Def
	bigdw 56 ; Spd
	bigdw 55 ; SAtk
	bigdw 63 ; SDef
	db "GIyaRADOSU@"

	db STEELIX
	db MINT_BERRY
	db COIL, IRON_TAIL, EARTHQUAKE, REST
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 32, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 78 ; HP
	bigdw 78 ; Max HP
	bigdw 73 ; Atk
	bigdw 103 ; Def
	bigdw 35 ; Spd
	bigdw 45 ; SAtk
	bigdw 49 ; SDef
	db "HAGANE-RU@@"

	db ALAKAZAM
	db FOCUS_SASH
	db NASTY_PLOT, PSYCHIC_M, FIRE_PUNCH, FUTURE_SIGHT
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	dn 15, 13, 14, 15 ; DVs
	db 32, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 70 ; HP
	bigdw 70 ; Max HP
	bigdw 43 ; Atk
	bigdw 41 ; Def
	bigdw 71 ; Spd
	bigdw 77 ; SAtk
	bigdw 57 ; SDef
	db "HU-DEiN@@@@"

	db ARCANINE
	db CRASH_HELMET
	db FLARE_BLITZ, WILD_CHARGE, HYPER_BEAM, ROAR
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 35000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 11, 15, 11 ; DVs
	db 16, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 84 ; HP
	bigdw 84 ; Max HP
	bigdw 67 ; Atk
	bigdw 55 ; Def
	bigdw 61 ; Spd
	bigdw 63 ; SAtk
	bigdw 55 ; SDef
	db "UINDEi@@@@@"

	db HERACROSS
	db BLACKBELT
	db ENDURE, REVERSAL, MEGAHORN, EARTHQUAKE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 45000
	bigdw 30000
	bigdw 45000
	dn 13, 15, 13, 14 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 80 ; HP
	bigdw 80 ; Max HP
	bigdw 73 ; Atk
	bigdw 53 ; Def
	bigdw 57 ; Spd
	bigdw 39 ; SAtk
	bigdw 61 ; SDef
	db "HERAKUROSU@"

	db EXEGGUTOR
	db LEFTOVERS
	db AGILITY, PSYCHIC_M, EGG_BOMB, SOFTBOILED
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	dn 15, 13, 14, 11 ; DVs
	db 48, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 51 ; Atk
	bigdw 57 ; Def
	bigdw 45 ; Spd
	bigdw 73 ; SAtk
	bigdw 57 ; SDef
	db "NAtuSI-@@@@"

	db CONCHER
	db SKILL_BELT
	db ICICLE_SPEAR, HYDRO_PUMP, ICY_WIND, BARRIER
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	dn 15, 11, 11, 11 ; DVs
	db 10, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 76 ; HP
	bigdw 76 ; Max HP
	bigdw 41 ; Atk
	bigdw 57 ; Def
	bigdw 43 ; Spd
	bigdw 61 ; SAtk
	bigdw 95 ; SDef
	db "PUTERA@@@@@"

	db BLISSEY
	db BRIGHTPOWDER
	db SEISMIC_TOSS, THUNDER_WAVE, SOFTBOILED, FLAMETHROWER
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 11, 13, 15, 14 ; DVs
	db 32, 32, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 27 ; Atk
	bigdw 27 ; Def
	bigdw 45 ; Spd
	bigdw 53 ; SAtk
	bigdw 77 ; SDef
	db "HAPINASU@@@"

	db LAPRAS
	db LEFTOVERS
	db SING, ICE_BEAM, THUNDERBOLT, CONFUSE_RAY
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 30000
	bigdw 40000
	bigdw 55000
	bigdw 30000
	dn 15, 14, 13, 7 ; DVs
	db 24, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 100; HP
	bigdw 100; Max HP
	bigdw 57 ; Atk
	bigdw 55 ; Def
	bigdw 47 ; Spd
	bigdw 57 ; SAtk
	bigdw 61 ; SDef
	db "RAPURASU@@@"

	db PIKACHU
	db LIGHT_BALL
	db THUNDERBOLT, THUNDER_WAVE, EXTREMESPEED, SURF
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 15, 12, 15, 14 ; DVs
	db 24, 32, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 62 ; HP
	bigdw 62 ; Max HP
	bigdw 45 ; Atk
	bigdw 35 ; Def
	bigdw 59 ; Spd
	bigdw 43 ; SAtk
	bigdw 39 ; SDef
	db "PIKATIyuU@@"

	db SCIZOR
	db METAL_COAT
	db SWORDS_DANCE, X_SCISSOR, BULLET_PUNCH, PURSUIT
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	dn 15, 13, 15, 14 ; DVs
	db 48, 24, 48, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 76 ; HP
	bigdw 76 ; Max HP
	bigdw 75 ; Atk
	bigdw 63 ; Def
	bigdw 49 ; Spd
	bigdw 45 ; SAtk
	bigdw 55 ; SDef
	db "HAtuSAMU@@@"

	db MACHAMP
	db X_ATTACK
	db BULK_UP, MACH_PUNCH, THIEF, DRAIN_PUNCH
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 35000
	bigdw 50000
	bigdw 30000
	dn 15, 11, 15, 13 ; DVs
	db 32, 48, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 84 ; HP
	bigdw 84 ; Max HP
	bigdw 75 ; Atk
	bigdw 55 ; Def
	bigdw 45 ; Spd
	bigdw 49 ; SAtk
	bigdw 57 ; SDef
	db "EBIWARA-@@@"

	db TAUROS
	db SILK_SCARF
	db HYPER_BEAM, EARTHQUAKE, BODY_SLAM, SURF
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 15, 11, 14, 15 ; DVs
	db 8, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 78 ; HP
	bigdw 78 ; Max HP
	bigdw 63 ; Atk
	bigdw 61 ; Def
	bigdw 67 ; Spd
	bigdw 51 ; SAtk
	bigdw 51 ; SDef
	db "KENTAROSU@@"

	db AZUMARILL
	db LIGHT_BUOY
	db SURF, ICE_PUNCH, PLAY_ROUGH, AQUA_JET
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 14, 13, 15, 7 ; DVs
	db 24, 24, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 43 ; Atk
	bigdw 55 ; Def
	bigdw 43 ; Spd
	bigdw 43 ; SAtk
	bigdw 55 ; SDef
	db "MARIRURI@@@"

	db MILTANK
	db X_SP_DEF
	db CURSE, EARTHQUAKE, BODY_SLAM, MILK_DRINK
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 13, 15, 15, 14 ; DVs
	db 16, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 55 ; Atk
	bigdw 65 ; Def
	bigdw 63 ; Spd
	bigdw 51 ; SAtk
	bigdw 51 ; SDef
	db "MIRUTANKU@@"

	db WIGGLYTUFF
	db GOLD_BERRY
	db HYPER_BEAM, BLIZZARD, FIRE_BLAST, ATTRACT
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 12, 7, 15, 14 ; DVs
	db 5, 5, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 47 ; Atk
	bigdw 35 ; Def
	bigdw 39 ; Spd
	bigdw 50 ; SAtk
	bigdw 40 ; SDef
	db "PUKURIN@@@@"

	db WIGGLYTUFF
	db X_ACCURACY
	db SING, HYPER_BEAM, FIRE_BLAST, SUBMISSION
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 12, 7, 7, 7 ; DVs
	db 24, 8, 8, 8 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 104; HP
	bigdw 104; Max HP
	bigdw 51 ; Atk
	bigdw 41 ; Def
	bigdw 41 ; Spd
	bigdw 53 ; SAtk
	bigdw 43 ; SDef
	db "PUKURIN@@@@"

	db NIDOKING
	db BERRY
	db SLUDGE_BOMB, EARTHQUAKE, FIRE_PUNCH, THUNDERPUNCH
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 5, 6, 4, 6 ; DVs
	db 16, 16, 24, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 60 ; Atk
	bigdw 54 ; Def
	bigdw 57 ; Spd
	bigdw 57 ; SAtk
	bigdw 53 ; SDef
	db "NIDOKINGU@@"

	db QUAGSIRE
	db LEFTOVERS
	db CURSE, EARTHQUAKE, SURF, RECOVER
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 5, 5, 4, 7 ; DVs
	db 16, 16, 24, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 57 ; Atk
	bigdw 57 ; Def
	bigdw 37 ; Spd
	bigdw 49 ; SAtk
	bigdw 49 ; SDef
	db "NUO-@@@@@@@"


BattleTowerMons3:

	db JOLTEON
	db FOCUS_SASH
	db AGILITY, THUNDERBOLT, BATON_PASS, HIDDEN_POWER
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	dn 15, 13, 14, 13 ; DVs
	db 48, 24, 61, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 71 ; Atk
	bigdw 68 ; Def
	bigdw 110 ; Spd
	bigdw 98 ; SAtk
	bigdw 89 ; SDef
	db "SANDA-SU@@@"

	db POLIWRATH
	db CRASH_HELMET
	db BULK_UP, SUBMISSION, EARTHQUAKE, ROCK_SLIDE
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 55000
	bigdw 55000
	bigdw 55000
	bigdw 50000
	dn 13, 13, 15, 11 ; DVs
	db 32, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 89 ; Atk
	bigdw 89 ; Def
	bigdw 74 ; Spd
	bigdw 74 ; SAtk
	bigdw 86 ; SDef
	db "NIyoROBON@@"

	db OCTANK
	db LEFTOVERS
	db OCTAZOOKA, FIRE_BLAST, EARTHQUAKE, RECOVER
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 118 ; HP
	bigdw 118 ; Max HP
	bigdw 101 ; Atk
	bigdw 89 ; Def
	bigdw 53 ; Spd
	bigdw 101 ; SAtk
	bigdw 89 ; SDef
	db "SUTA-MI-@@@"

	db JYNX
	db SKILL_BELT
	db NASTY_PLOT, ICICLE_SPEAR, PSYCHIC_M, LOVELY_KISS
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	dn 15, 11, 14, 14 ; DVs
	db 32, 32, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 62 ; Atk
	bigdw 53 ; Def
	bigdw 89 ; Spd
	bigdw 101 ; SAtk
	bigdw 89 ; SDef
	db "RU-ZIyuRA@@"

	db DUGTRIO
	db FOCUS_BAND
	db EARTHQUAKE, STONE_EDGE, IRON_HEAD, SCREECH
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 50000
	dn 14, 15, 15, 15 ; DVs
	db 16, 8, 24, 61 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 92 ; Atk
	bigdw 62 ; Def
	bigdw 104 ; Spd
	bigdw 62 ; SAtk
	bigdw 74 ; SDef
	db "DAGUTORIO@@"

	db SNOWMAD
	db X_SP_ATK
	db THIEF, ICE_BEAM, CRUNCH, PLAY_ROUGH
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 15, 13, 11 ; DVs
	db 32, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 92 ; Atk
	bigdw 83 ; Def
	bigdw 95 ; Spd
	bigdw 86 ; SAtk
	bigdw 68 ; SDef
	db "KIREIHANA@@"

	db BLISSEY
	db LEFTOVERS
	db TOXIC, REFLECT, SOFTBOILED, PROTECT
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 45000
	bigdw 30000
	bigdw 45000
	dn 15, 11, 14, 13 ; DVs
	db 10, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 217 ; HP
	bigdw 217 ; Max HP
	bigdw 32 ; Atk
	bigdw 33 ; Def
	bigdw 59 ; Spd
	bigdw 73 ; SAtk
	bigdw 109 ; SDef
	db "HAPINASU@@@"

	db HOUNDOOM
	db HEAT_CHARM
	db FIRE_BLAST, SOLARBEAM, WILL_O_WISP, DESTINY_BOND
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	dn 15, 13, 14, 13 ; DVs
	db 8, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 112 ; HP
	bigdw 112 ; Max HP
	bigdw 86 ; Atk
	bigdw 62 ; Def
	bigdw 89 ; Spd
	bigdw 98 ; SAtk
	bigdw 80 ; SDef
	db "HERUGA-@@@@"

	db MACHAMP
	db X_SPEED
	db CROSS_CHOP, THIEF, HYPER_BEAM, FIRE_BLAST
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	dn 15, 13, 11, 14 ; DVs
	db 8, 16, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 110 ; Atk
	bigdw 80 ; Def
	bigdw 65 ; Spd
	bigdw 71 ; SAtk
	bigdw 83 ; SDef
	db "KAIRIKI-@@@"

	db CROBAT
	db GOLD_BERRY
	db SLUDGE_BOMB, HURRICANE, LEECH_LIFE, U_TURN
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 14, 15, 13, 12 ; DVs
	db 16, 8, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 118 ; HP
	bigdw 118 ; Max HP
	bigdw 86 ; Atk
	bigdw 80 ; Def
	bigdw 110 ; Spd
	bigdw 74 ; SAtk
	bigdw 80 ; SDef
	db "KUROBAtuTO@"

	db PORYGON2
	db MIRACLEBERRY
	db TOXIC, PSYCHIC_M, RECOVER, PROTECT
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 30000
	bigdw 40000
	bigdw 55000
	bigdw 30000
	dn 13, 15, 13, 11 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 118 ; HP
	bigdw 118 ; Max HP
	bigdw 80 ; Atk
	bigdw 86 ; Def
	bigdw 68 ; Spd
	bigdw 95 ; SAtk
	bigdw 89 ; SDef
	db "PORIGON2@@@"

	db MAROWAK
	db THICK_CLUB
	db BONEMERANG, RETURN, HYPER_BEAM, SWORDS_DANCE
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 30000
	dn 13, 13, 14, 11 ; DVs
	db 16, 32, 8, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 103 ; HP
	bigdw 103 ; Max HP
	bigdw 80 ; Atk
	bigdw 98 ; Def
	bigdw 59 ; Spd
	bigdw 62 ; SAtk
	bigdw 80 ; SDef
	db "GARAGARA@@@"

	db ELECTABUZZ
	db SILVER_BERRY
	db BULK_UP, THUNDERBOLT, SUBMISSION, ICE_PUNCH
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	dn 11, 13, 14, 15 ; DVs
	db 32, 16, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 82 ; Atk
	bigdw 67 ; Def
	bigdw 95 ; Spd
	bigdw 89 ; SAtk
	bigdw 83 ; SDef
	db "MARUMAIN@@@"

	db LAPRAS
	db POWER_HERB
	db SURF, FREEZE_DRY, SOLARBEAM, SING
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 35000
	bigdw 50000
	bigdw 30000
	dn 15, 13, 14, 11 ; DVs
	db 24, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 145 ; HP
	bigdw 145 ; Max HP
	bigdw 83 ; Atk
	bigdw 80 ; Def
	bigdw 68 ; Spd
	bigdw 83 ; SAtk
	bigdw 89 ; SDef
	db "RAPURASU@@@"

	db LANTURN
	db MINT_BERRY
	db THUNDER, SURF, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 13, 13, 14, 11 ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 142 ; HP
	bigdw 142 ; Max HP
	bigdw 87 ; Atk
	bigdw 87 ; Def
	bigdw 73 ; Spd
	bigdw 78 ; SAtk
	bigdw 78 ; SDef
	db "RANTA-N@@@@"

	db GIRAFARIG
	db MIRACLEBERRY
	db FUTURE_SIGHT, PSYCHIC_M, RETURN, AGILITY
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 15, 15, 7 ; DVs
	db 24, 16, 32, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 109 ; HP
	bigdw 109 ; Max HP
	bigdw 80 ; Atk
	bigdw 71 ; Def
	bigdw 83 ; Spd
	bigdw 86 ; SAtk
	bigdw 71 ; SDef
	db "E-HUi@@@@@@"

	db TENTACRUEL
	db MYSTERYBERRY
	db BARRIER, GIGA_DRAIN, HYDRO_PUMP, MIRROR_COAT
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 47000
	bigdw 45000
	dn 15, 14, 15, 14 ; DVs
	db 48, 8, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 115 ; HP
	bigdw 115 ; Max HP
	bigdw 74 ; Atk
	bigdw 71 ; Def
	bigdw 92 ; Spd
	bigdw 80 ; SAtk
	bigdw 104 ; SDef
	db "DOKUKURAGE@"

	db GENGAR
	db SPELL_TAG
	db SHADOW_BALL, ICE_PUNCH, HYPNOSIS, DESTINY_BOND
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 7, 15, 7 ; DVs
	db 24, 24, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 103 ; HP
	bigdw 103 ; Max HP
	bigdw 71 ; Atk
	bigdw 68 ; Def
	bigdw 98 ; Spd
	bigdw 110 ; SAtk
	bigdw 77 ; SDef
	db "GENGA-@@@@@"

	db GRANBULL
	db TRICK_MIRROR
	db PLAY_ROUGH, FLAMETHROWER, HIDDEN_POWER, ROAR
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 13, 4, 5 ; DVs
	db 16, 24, 24, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 104 ; Atk
	bigdw 77 ; Def
	bigdw 59 ; Spd
	bigdw 68 ; SAtk
	bigdw 68 ; SDef
	db "RINGUMA@@@@"

	db FEAROW
	db SILVER_BERRY
	db BRAVE_BIRD, HYPER_BEAM, THIEF, U_TURN
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 6, 7, 7, 7 ; DVs
	db 16, 8, 32, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 86 ; Atk
	bigdw 71 ; Def
	bigdw 92 ; Spd
	bigdw 69 ; SAtk
	bigdw 69 ; SDef
	db "ONIDORIRU@@"

	db PRIMEAPE
	db BLACKBELT
	db SUBMISSION, ENDURE, REVERSAL, EARTHQUAKE
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 7, 6, 7 ; DVs
	db 8, 16, 24, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 95 ; Atk
	bigdw 68 ; Def
	bigdw 89 ; Spd
	bigdw 68 ; SAtk
	bigdw 74 ; SDef
	db "OKORIZARU@@"


BattleTowerMons4:

	db TAUROS
	db GOLD_BERRY
	db RETURN, HYPER_BEAM, EARTHQUAKE, FIRE_BLAST
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 15, 14 ; DVs
	db 32, 8, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 147 ; HP
	bigdw 147 ; Max HP
	bigdw 122 ; Atk
	bigdw 118 ; Def
	bigdw 130 ; Spd
	bigdw 98 ; SAtk
	bigdw 98 ; SDef
	db "KENTAROSU@@"

	db KINGDRA
	db LEFTOVERS
	db OCTAZOOKA, DRAGONBREATH, FLAMETHROWER, BLIZZARD
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 14, 15 ; DVs
	db 16, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 147 ; HP
	bigdw 147 ; Max HP
	bigdw 118 ; Atk
	bigdw 118 ; Def
	bigdw 110 ; Spd
	bigdw 118 ; SAtk
	bigdw 118 ; SDef
	db "KINGUDORA@@"

	db TANGROWTH
	db QUICK_CLAW
	db LEECH_SEED, GIGA_DRAIN, GLARE, EARTHQUAKE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 13, 13, 13 ; DVs
	db 16, 8, 48, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 167 ; HP
	bigdw 167 ; Max HP
	bigdw 106 ; Atk
	bigdw 142 ; Def
	bigdw 82 ; Spd
	bigdw 130 ; SAtk
	bigdw 82 ; SDef
	db "KABIGON@@@@"

	db PILOSWINE
	db MINT_BERRY
	db EARTHQUAKE, FREEZE_DRY, STONE_EDGE, REST
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 14, 11 ; DVs
	db 16, 32, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 167 ; HP
	bigdw 167 ; Max HP
	bigdw 122 ; Atk
	bigdw 106 ; Def
	bigdw 82 ; Spd
	bigdw 90 ; SAtk
	bigdw 90 ; SDef
	db "RAPURASU@@@"

	db STEELIX
	db X_SP_DEF
	db CURSE, IRON_HEAD, EARTHQUAKE, STONE_EDGE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 15, 13, 11 ; DVs
	db 16, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 147 ; HP
	bigdw 147 ; Max HP
	bigdw 142 ; Atk
	bigdw 202 ; Def
	bigdw 66 ; Spd
	bigdw 86 ; SAtk
	bigdw 94 ; SDef
	db "HAGANE-RU@@"

	db ALAKAZAM
	db X_DEFEND
	db PSYCHIC_M, THUNDERPUNCH, RECOVER, FIRE_PUNCH
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 13, 14, 15 ; DVs
	db 16, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 131 ; HP
	bigdw 131 ; Max HP
	bigdw 82 ; Atk
	bigdw 78 ; Def
	bigdw 138 ; Spd
	bigdw 150 ; SAtk
	bigdw 110 ; SDef
	db "HU-DEiN@@@@"

	db STARMIE
	db BRIGHTPOWDER
	db PSYCHIC_M, THUNDER, SURF, MINIMIZE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	dn 15, 13, 11, 14 ; DVs
	db 16, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 102 ; Atk
	bigdw 110 ; Def
	bigdw 134 ; Spd
	bigdw 122 ; SAtk
	bigdw 110 ; SDef
	db "SUTA-MI-@@@"

	db WIGGLYTUFF
	db GOLD_BERRY
	db PERISH_SONG, MEAN_LOOK, DISABLE, REST
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 11, 15, 14, 7 ; DVs
	db 8, 8, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 199 ; HP
	bigdw 199 ; Max HP
	bigdw 98 ; Atk
	bigdw 78 ; Def
	bigdw 78 ; Spd
	bigdw 102 ; SAtk
	bigdw 82 ; SDef
	db "SO-NANSU@@@"

	db GOLEM
	db FOCUS_BAND
	db EXPLOSION, EARTHQUAKE, COUNTER, ROCK_SLIDE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	dn 13, 13, 14, 13 ; DVs
	db 8, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 151 ; HP
	bigdw 151 ; Max HP
	bigdw 130 ; Atk
	bigdw 146 ; Def
	bigdw 78 ; Spd
	bigdw 86 ; SAtk
	bigdw 94 ; SDef
	db "GORO-NIya@@"

	db SCIZOR
	db SILVER_BERRY
	db AGILITY, GUILLOTINE, IRON_HEAD, REVERSAL
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 11, 13, 15, 14 ; DVs
	db 48, 8, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 143 ; HP
	bigdw 143 ; Max HP
	bigdw 146 ; Atk
	bigdw 122 ; Def
	bigdw 94 ; Spd
	bigdw 86 ; SAtk
	bigdw 106 ; SDef
	db "HAtuSAMU@@@"

	db GREMINI
	db MIRACLEBERRY
	db DOUBLE_TEAM, SHADOW_BALL, THIEF, RECOVER
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 11, 11 ; DVs
	db 16, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 127 ; HP
	bigdw 127 ; Max HP
	bigdw 90 ; Atk
	bigdw 106 ; Def
	bigdw 82 ; Spd
	bigdw 90 ; SAtk
	bigdw 106 ; SDef
	db "DAGUTORIO@@"

	db SLOWBRO
	db LEFTOVERS
	db SURF, PSYCHIC_M, FLAMETHROWER, RECOVER
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 11, 15, 12, 15 ; DVs
	db 24, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 163 ; HP
	bigdw 163 ; Max HP
	bigdw 102 ; Atk
	bigdw 130 ; Def
	bigdw 66 ; Spd
	bigdw 112 ; SAtk
	bigdw 106 ; SDef
	db "YADORAN@@@@"

	db PERSIAN
	db X_ATTACK
	db RETURN, PLAY_ROUGH, THIEF, BUBBLEBEAM
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 11, 12, 14, 15 ; DVs
	db 32, 16, 32, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 139 ; HP
	bigdw 139 ; Max HP
	bigdw 98 ; Atk
	bigdw 90 ; Def
	bigdw 134 ; Spd
	bigdw 94 ; SAtk
	bigdw 94 ; SDef
	db "PORIGON2@@@"

	db ARCANINE
	db TRICK_MIRROR
	db FLAMETHROWER, WILD_CHARGE, PLAY_ROUGH, WILL_O_WISP
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 11, 11 ; DVs
	db 24, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 159 ; HP
	bigdw 159 ; Max HP
	bigdw 130 ; Atk
	bigdw 106 ; Def
	bigdw 118 ; Spd
	bigdw 122 ; SAtk
	bigdw 106 ; SDef
	db "UINDEi@@@@@"

	db PARASECT
	db BIG_MUSHROOM
	db SPORE, GIGA_DRAIN, LEECH_LIFE, CRABHAMMER
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 10, 7, 15 ; DVs
	db 40, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 118 ; Atk
	bigdw 106 ; Def
	bigdw 66 ; Spd
	bigdw 90 ; SAtk
	bigdw 106 ; SDef
	db "HUoRETOSU@@"

	db TUNGTYED
	db MINT_BERRY
	db BODY_SLAM, FUTURE_SIGHT, CALM_MIND, REST
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 15, 15, 7 ; DVs
	db 10, 25, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 133 ; HP
	bigdw 133 ; Max HP
	bigdw 86 ; Atk
	bigdw 139 ; Def
	bigdw 83 ; Spd
	bigdw 124 ; SAtk
	bigdw 88 ; SDef
	db "OMUSUTA-@@@"

	db DODRIO
	db CRASH_HELMET
	db DOUBLE_EDGE, BRAVE_BIRD, HI_JUMP_KICK, SWORDS_DANCE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 14 ; DVs
	db 24, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 130 ; Atk
	bigdw 98 ; Def
	bigdw 122 ; Spd
	bigdw 90 ; SAtk
	bigdw 90 ; SDef
	db "RIZA-DON@@@"

	db NIDOQUEEN
	db BRIGHTPOWDER
	db ATTRACT, BODY_SLAM, EARTHQUAKE, SWAGGER
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 7, 14, 7 ; DVs
	db 24, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 159 ; HP
	bigdw 159 ; Max HP
	bigdw 107 ; Atk
	bigdw 111 ; Def
	bigdw 103 ; Spd
	bigdw 102 ; SAtk
	bigdw 110 ; SDef
	db "NAtuSI-@@@@"

	db HYPNO
	db TWISTEDSPOON
	db HYPNOSIS, PSYCHIC_M, SHADOW_BALL, NASTY_PLOT
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 7, 7, 10 ; DVs
	db 25, 15, 15, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 155 ; HP
	bigdw 155 ; Max HP
	bigdw 100 ; Atk
	bigdw 98 ; Def
	bigdw 95 ; Spd
	bigdw 100 ; SAtk
	bigdw 134 ; SDef
	db "SURI-PA-@@@"

	db WEEZING
	db BLACK_SLUDGE
	db SLUDGE_BOMB, WILL_O_WISP, AMNESIA, RECOVER
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 5, 6, 11 ; DVs
	db 16, 24, 32, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 139 ; HP
	bigdw 139 ; Max HP
	bigdw 114 ; Atk
	bigdw 138 ; Def
	bigdw 90 ; Spd
	bigdw 110 ; SAtk
	bigdw 98 ; SDef
	db "BETOBETON@@"

	db MAGMAR
	db CHARCOAL
	db NASTY_PLOT, FLAMETHROWER, THUNDERPUNCH, HIDDEN_POWER
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 14, 15, 15 ; DVs
	db 32, 24, 24, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 139 ; HP
	bigdw 139 ; Max HP
	bigdw 118 ; Atk
	bigdw 87 ; Def
	bigdw 116 ; Spd
	bigdw 122 ; SAtk
	bigdw 110 ; SDef
	db "EREBU-@@@@@"


BattleTowerMons5:

	db VILEPLUME
	db BLACK_SLUDGE
	db AGILITY, MOONBLAST, GIGA_DRAIN, HIDDEN_POWER
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 50000
	bigdw 55000
	dn 14, 12, 15, 15 ; DVs
	db 48, 24, 8, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 131 ; Atk
	bigdw 136 ; Def
	bigdw 101 ; Spd
	bigdw 151 ; SAtk
	bigdw 141 ; SDef
	db "KINGUDORA@@"

	db HOUNDOOM
	db TRICK_MIRROR
	db CRUNCH, BONEMERANG, REVERSAL, ENDURE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 13, 13, 15, 12 ; DVs
	db 24, 16, 24, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 141 ; Atk
	bigdw 101 ; Def
	bigdw 146 ; Spd
	bigdw 161 ; SAtk
	bigdw 131 ; SDef
	db "HERUGA-@@@@"

	db ELECTIGER
	db CRASH_HELMET
	db WILD_CHARGE, FLARE_BLITZ, WATERFALL, PLAY_ROUGH
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 55000
	dn 15, 13, 12, 15 ; DVs
	db 16, 16, 24, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 192 ; HP
	bigdw 192 ; Max HP
	bigdw 139 ; Atk
	bigdw 123 ; Def
	bigdw 137 ; Spd
	bigdw 150 ; SAtk
	bigdw 147 ; SDef
	db "TUBOTUBO@@@"

	db SNORLAX
	db MINT_BERRY
	db HYPER_BEAM, EARTHQUAKE, SURF, REST
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	dn 15, 13, 14, 15 ; DVs
	db 8, 16, 24, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 266 ; HP
	bigdw 266 ; Max HP
	bigdw 161 ; Atk
	bigdw 116 ; Def
	bigdw 81  ; Spd
	bigdw 116 ; SAtk
	bigdw 161 ; SDef
	db "KABIGON@@@@"

	db FERRODON
	db LEFTOVERS
	db IRON_HEAD, EARTHQUAKE, ROCK_SLIDE, COIL
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 60000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	dn 13, 13, 13, 13 ; DVs
	db 24, 16, 16, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 183 ; HP
	bigdw 183 ; Max HP
	bigdw 141 ; Atk
	bigdw 151 ; Def
	bigdw 104 ; Spd
	bigdw 126 ; SAtk
	bigdw 141 ; SDef
	db "RAPURASU@@@"

	db JOLTEON
	db FOCUS_SASH
	db THUNDERBOLT, HIDDEN_POWER, THUNDER_WAVE, CALM_MIND
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 60000
	bigdw 57000
	bigdw 55000
	bigdw 55000
	dn 15, 13, 15, 15 ; DVs
	db 24, 24, 32, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 171 ; HP
	bigdw 171 ; Max HP
	bigdw 115 ; Atk
	bigdw 111 ; Def
	bigdw 181 ; Spd
	bigdw 161 ; SAtk
	bigdw 146 ; SDef
	db "SANDA-SU@@@"

	db NYANELL
	db X_ATTACK
	db THIEF, CRUNCH, U_TURN, IRON_TAIL
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	dn 13, 15, 14, 13 ; DVs
	db 32, 24, 32, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 141 ; Atk
	bigdw 111 ; Def
	bigdw 161 ; Spd
	bigdw 116 ; SAtk
	bigdw 106 ; SDef
	db "HAtuSAMU@@@"

	db SLOWKING
	db GOLD_BERRY
	db TELEPORT, SURF, FUTURE_SIGHT, RECOVER
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 13, 15, 13, 14 ; DVs
	db 32, 24, 24, 16 ; PP
	db 15 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 393 ; HP
	bigdw 393 ; Max HP
	bigdw 248 ; Atk
	bigdw 258 ; Def
	bigdw 158 ; Spd
	bigdw 298 ; SAtk
	bigdw 318 ; SDef
	db "YADOKINGU@@"

	db MACHAMP
	db BLACKBELT
	db MACH_PUNCH, DYNAMICPUNCH, PURSUIT, FORESIGHT
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 44000
	dn 15, 15, 14, 12 ; DVs
	db 48, 8, 32, 61 ; PP
	db 13 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 196 ; HP
	bigdw 196 ; Max HP
	bigdw 181 ; Atk
	bigdw 131 ; Def
	bigdw 106 ; Spd
	bigdw 116 ; SAtk
	bigdw 136 ; SDef
	db "KAIRIKI-@@@"

	db YANMA
	db SCOPE_LENS
	db ATTRACT, SWORDS_DANCE, RAZOR_WIND, LEECH_LIFE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 44000
	bigdw 40000
	bigdw 45000
	bigdw 40000
	dn  4, 14, 15, 14 ; DVs
	db 24, 48, 32, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 171 ; HP
	bigdw 171 ; Max HP
	bigdw 116 ; Atk
	bigdw 96 ; Def
	bigdw 146 ; Spd
	bigdw 126 ; SAtk
	bigdw 96 ; SDef
	db "SUTA-MI-@@@"

	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, STONE_EDGE, IRON_HEAD, FISSURE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	dn 15, 7, 15, 14 ; DVs
	db 16, 8, 24, 8 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 141 ; HP
	bigdw 141 ; Max HP
	bigdw 151 ; Atk
	bigdw 101 ; Def
	bigdw 171 ; Spd
	bigdw 101 ; SAtk
	bigdw 121 ; SDef
	db "DAGUTORIO@@"

	db ARBOK
	db POISON_BARB
	db GUNK_SHOT, EARTHQUAKE, CRUNCH, COIL
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 54000
	bigdw 40000
	bigdw 50000
	dn 7, 13, 15, 14 ; DVs
	db 8, 16, 24, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 166 ; HP
	bigdw 166 ; Max HP
	bigdw 146 ; Atk
	bigdw 120 ; Def
	bigdw 131 ; Spd
	bigdw 116 ; SAtk
	bigdw 130 ; SDef
	db "MARUMAIN@@@"

	db AERODACTYL
	db SILVER_BERRY
	db DRAGON_DANCE, EARTHQUAKE, DIVE_BOMB, STONE_EDGE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	dn 15, 13, 13, 13 ; DVs
	db 32, 16, 8, 8 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 186 ; HP
	bigdw 186 ; Max HP
	bigdw 156 ; Atk
	bigdw 116 ; Def
	bigdw 181 ; Spd
	bigdw 111 ; SAtk
	bigdw 126 ; SDef
	db "PUTERA@@@@@"

	db CROBAT
	db SHARP_BEAK
	db HAZE, HURRICANE, SLUDGE_BOMB, LEECH_LIFE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 14, 14, 15, 15 ; DVs
	db 48, 8, 16, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 191 ; HP
	bigdw 191 ; Max HP
	bigdw 141 ; Atk
	bigdw 131 ; Def
	bigdw 181 ; Spd
	bigdw 121 ; SAtk
	bigdw 131 ; SDef
	db "KUROBAtuTO@"

	db DITTO
	db METAL_POWDER
	db TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 40000
	bigdw 50000
	dn 15, 13, 13, 14 ; DVs
	db 16, 0, 0, 0 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 99 ; Atk
	bigdw 99 ; Def
	bigdw 99 ; Spd
	bigdw 99 ; SAtk
	bigdw 99 ; SDef
	db "SANDA-@@@@@"

	db SKARMORY
	db POWER_HERB
	db IRON_HEAD, FLY, SPIKES, PURSUIT
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	dn 13, 7, 14, 13 ; DVs
	db 24, 24, 32, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 171 ; HP
	bigdw 171 ; Max HP
	bigdw 131 ; Atk
	bigdw 191 ; Def
	bigdw 121 ; Spd
	bigdw 91 ; SAtk
	bigdw 121 ; SDef
	db "EA-MUDO@@@@"

	db FORRETRESS
	db SILK_SCARF
	db RAPID_SPIN, SIGNAL_BEAM, EXPLOSION, SWAGGER
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 45000
	bigdw 40000
	dn 12, 15, 13, 13 ; DVs
	db 61, 24, 8, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 141 ; Atk
	bigdw 191 ; Def
	bigdw 91 ; Spd
	bigdw 111 ; SAtk
	bigdw 111 ; SDef
	db "HUoRETOSU@@"

	db STANTLER
	db MIRACLEBERRY
	db RETURN, HI_JUMP_KICK, PSYCHIC_M, MEGAHORN
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 45000
	dn 13, 13, 13, 13 ; DVs
	db 32, 16, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 179 ; HP
	bigdw 179 ; Max HP
	bigdw 146 ; Atk
	bigdw 113 ; Def
	bigdw 136 ; Spd
	bigdw 136 ; SAtk
	bigdw 116 ; SDef
	db "HAGANE-RU@@"

	db GIRAFARIG
	db SCOPE_LENS
	db PSYCHIC_M, HYPER_BEAM, SHADOW_BALL, EARTHQUAKE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 4, 5, 5, 6 ; DVs
	db 16, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 176 ; HP
	bigdw 176 ; Max HP
	bigdw 131 ; Atk
	bigdw 116 ; Def
	bigdw 136 ; Spd
	bigdw 141 ; SAtk
	bigdw 116 ; SDef
	db "KIRINRIKI@@"

	db GYARADOS
	db DAMP_CHARM
	db HYDRO_PUMP, HURRICANE, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 7, 5, 6, 5 ; DVs
	db 8, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 201 ; HP
	bigdw 201 ; Max HP
	bigdw 176 ; Atk
	bigdw 130 ; Def
	bigdw 132 ; Spd
	bigdw 131 ; SAtk
	bigdw 151 ; SDef
	db "GIyaRADOSU@"

	db RAPIDASH
	db CHARCOAL
	db FIRE_BLAST, WILD_CHARGE, MORNING_SUN, HYPNOSIS
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 4, 5, 5, 6 ; DVs
	db 8, 16, 8, 32 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 171 ; HP
	bigdw 171 ; Max HP
	bigdw 151 ; Atk
	bigdw 121 ; Def
	bigdw 156 ; Spd
	bigdw 131 ; SAtk
	bigdw 131 ; SDef
	db "HURI-ZA-@@@"


BattleTowerMons6:

	db KINGDRA
	db TRICK_MIRROR
	db DRAGON_DANCE, DRAGONBREATH, SURF, ICE_BEAM
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 50000
	bigdw 60000
	bigdw 60000
	dn 13, 13, 15, 14 ; DVs
	db 32, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 215 ; HP
	bigdw 215 ; Max HP
	bigdw 174 ; Atk
	bigdw 174 ; Def
	bigdw 162 ; Spd
	bigdw 174 ; SAtk
	bigdw 174 ; SDef
	db "KINGUDORA@@"

	db TYRANITAR
	db LEFTOVERS
	db CRUNCH, EARTHQUAKE, STONE_EDGE, PURSUIT
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	dn 15, 13, 14, 13 ; DVs
	db 24, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 245 ; HP
	bigdw 245 ; Max HP
	bigdw 221 ; Atk
	bigdw 192 ; Def
	bigdw 134 ; Spd
	bigdw 174 ; SAtk
	bigdw 180 ; SDef
	db "BANGIRASU@@"

	db FURRET
	db SILVER_BERRY
	db BELLY_DRUM, EXTREMESPEED, THIEF, BRICK_BREAK
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	dn 15, 11, 14, 15 ; DVs
	db 16, 8, 32, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 227 ; HP
	bigdw 227 ; Max HP
	bigdw 152 ; Atk
	bigdw 137 ; Def
	bigdw 168 ; Spd
	bigdw 114 ; SAtk
	bigdw 126 ; SDef
	db "HERUGA-@@@@"

	db PORYGON2
	db MIRACLEBERRY
	db SHARPEN, RECOVER, TRI_ATTACK, THIEF
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	dn 13, 13, 13, 14 ; DVs
	db 16, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 227 ; HP
	bigdw 227 ; Max HP
	bigdw 156 ; Atk
	bigdw 168 ; Def
	bigdw 132 ; Spd
	bigdw 186 ; SAtk
	bigdw 174 ; SDef
	db "PORIGON2@@@"

	db POLIWRATH
	db X_SPEED
	db SUBMISSION, EARTHQUAKE, ROCK_SLIDE, LOVELY_KISS
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 14, 15 ; DVs
	db 8, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 233 ; HP
	bigdw 233 ; Max HP
	bigdw 162 ; Atk
	bigdw 174 ; Def
	bigdw 144 ; Spd
	bigdw 144 ; SAtk
	bigdw 168 ; SDef
	db "KAIRIKI-@@@"

	db ZAPDOS
	db DAMP_CHARM
	db THUNDER, HURRICANE, HIDDEN_POWER, THUNDER_WAVE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 14, 13, 15, 15 ; DVs
	db 16, 8, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 233 ; HP
	bigdw 233 ; Max HP
	bigdw 168 ; Atk
	bigdw 162 ; Def
	bigdw 180 ; Spd
	bigdw 210 ; SAtk
	bigdw 168 ; SDef
	db "SANDA-@@@@@"

	db WOBBUFFET
	db GOLD_BERRY
	db COUNTER, MIRROR_COAT, DESTINY_BOND, ENCORE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	dn 15, 13, 14, 13 ; DVs
	db 20, 20, 5, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 100 ; Atk
	bigdw 160 ; Def
	bigdw 100 ; Spd
	bigdw 100 ; SAtk
	bigdw 130 ; SDef
	db "SO-NANSU@@@"

	db AERODACTYL
	db X_ACCURACY
	db HYPER_BEAM, DIVE_BOMB, EARTHQUAKE, STONE_EDGE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	dn 15, 13, 13, 13 ; DVs
	db 8, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 221 ; HP
	bigdw 221 ; Max HP
	bigdw 186 ; Atk
	bigdw 138 ; Def
	bigdw 216 ; Spd
	bigdw 132 ; SAtk
	bigdw 150 ; SDef
	db "PUTERA@@@@@"

	db DRAGONITE
	db BITTER_BERRY
	db COIL, DIVE_BOMB, OUTRAGE, IRON_TAIL
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	dn 13, 13, 15, 13 ; DVs
	db 32, 8, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 235 ; HP
	bigdw 235 ; Max HP
	bigdw 221 ; Atk
	bigdw 174 ; Def
	bigdw 156 ; Spd
	bigdw 180 ; SAtk
	bigdw 180 ; SDef
	db "KAIRIyu-@@@"

	db MUK
	db BLACK_SLUDGE
	db SLUDGE_BOMB, CRUNCH, RECOVER, COSMIC_POWER
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 14, 15 ; DVs
	db 10, 5, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 251 ; HP
	bigdw 251 ; Max HP
	bigdw 186 ; Atk
	bigdw 150 ; Def
	bigdw 120 ; Spd
	bigdw 138 ; SAtk
	bigdw 180 ; SDef
	db "BURAtuKI-@@"

	db VAPOREON
	db MYSTIC_WATER
	db CALM_MIND, REST, SLEEP_TALK, SURF
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 40000
	bigdw 55000
	bigdw 50000
	dn 15, 13, 14, 13 ; DVs
	db 32, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 281 ; HP
	bigdw 281 ; Max HP
	bigdw 138 ; Atk
	bigdw 132 ; Def
	bigdw 138 ; Spd
	bigdw 192 ; SAtk
	bigdw 174 ; SDef
	db "UINDEi@@@@@"

	db URSARING
	db SILK_SCARF
	db REST, SNORE, CRUNCH, BRICK_BREAK
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 15, 11, 14, 11 ; DVs
	db 16, 24, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 233 ; HP
	bigdw 233 ; Max HP
	bigdw 216 ; Atk
	bigdw 150 ; Def
	bigdw 126 ; Spd
	bigdw 150 ; SAtk
	bigdw 150 ; SDef
	db "EA-MUDO@@@@"

	db BLISSEY
	db LUCKY_PUNCH
	db SOFTBOILED, TOXIC, HEAL_BELL, PSYCHIC_M
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	dn 15, 11, 12, 13 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 431 ; HP
	bigdw 431 ; Max HP
	bigdw 72 ; Atk
	bigdw 72 ; Def
	bigdw 126 ; Spd
	bigdw 150 ; SAtk
	bigdw 222 ; SDef
	db "HAPINASU@@@"

	db SEARION
	db SILK_SCARF
	db SURF, FLAMETHROWER, EGG_BOMB, SWAGGER
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 10, 15, 12 ; DVs
	db 24, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 209 ; HP
	bigdw 209 ; Max HP
	bigdw 150 ; Atk
	bigdw 149 ; Def
	bigdw 126 ; Spd
	bigdw 164 ; SAtk
	bigdw 180 ; SDef
	db "KABIGON@@@@"

	db HERACROSS
	db X_ATTACK
	db BRICK_BREAK, MEGAHORN, EARTHQUAKE, COUNTER
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 13, 15, 14, 13 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 221 ; HP
	bigdw 221 ; Max HP
	bigdw 210 ; Atk
	bigdw 150 ; Def
	bigdw 162 ; Spd
	bigdw 108 ; SAtk
	bigdw 174 ; SDef
	db "HERAKUROSU@"

	db JYNX
	db NEVERMELTICE
	db BLIZZARD, PSYCHIC_M, HIDDEN_POWER, FREEZE_DRY
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 13, 15, 15 ; DVs
	db 8, 16, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 203 ; HP
	bigdw 203 ; Max HP
	bigdw 120 ; Atk
	bigdw 102 ; Def
	bigdw 174 ; Spd
	bigdw 198 ; SAtk
	bigdw 174 ; SDef
	db "RU-ZIyuRA@@"

	db GOLDUCK
	db BRIGHTPOWDER
	db CALM_MIND, SURF, ICE_BEAM, PETAL_DANCE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 14 ; DVs
	db 15, 10, 40, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 221 ; HP
	bigdw 221 ; Max HP
	bigdw 159 ; Atk
	bigdw 154 ; Def
	bigdw 162 ; Spd
	bigdw 174 ; SAtk
	bigdw 156 ; SDef
	db "KAMEtuKUSU@"

	db RHYDON
	db FOCUS_BAND
	db EARTHQUAKE, COUNTER, IRON_HEAD, STONE_EDGE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 11, 15, 10 ; DVs
	db 16, 32, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 251 ; HP
	bigdw 251 ; Max HP
	bigdw 216 ; Atk
	bigdw 204 ; Def
	bigdw 108 ; Spd
	bigdw 114 ; SAtk
	bigdw 114 ; SDef
	db "SAIDON@@@@@"

	db MANDRABEL
	db SCOPE_LENS
	db MOONBLAST, GIGA_DRAIN, HIDDEN_POWER, LOVELY_KISS
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 12, 15, 15 ; DVs
	db 24, 8, 24, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 221 ; HP
	bigdw 221 ; Max HP
	bigdw 144 ; Atk
	bigdw 150 ; Def
	bigdw 168 ; Spd
	bigdw 186 ; SAtk
	bigdw 144 ; SDef
	db "SANDOPAN@@@"

	db PARASECT
	db BIG_MUSHROOM
	db SPORE, LEECH_LIFE, BRICK_BREAK, HIDDEN_POWER
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 13, 12, 15, 15 ; DVs
	db 24, 24, 24, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 197 ; HP
	bigdw 197 ; Max HP
	bigdw 174 ; Atk
	bigdw 156 ; Def
	bigdw 96 ; Spd
	bigdw 132 ; SAtk
	bigdw 156 ; SDef
	db "PARASEKUTO@"

	db MISDREAVUS
	db SILVER_BERRY
	db WILL_O_WISP, PAIN_SPLIT, NIGHT_SHADE, SUBSTITUTE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 15, 11, 14, 11 ; DVs
	db 24, 32, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 197 ; HP
	bigdw 197 ; Max HP
	bigdw 132 ; Atk
	bigdw 132 ; Def
	bigdw 162 ; Spd
	bigdw 162 ; SAtk
	bigdw 162 ; SDef
	db "GORO-NIya@@"


BattleTowerMons7:

	db RAICHU
	db LIGHT_BALL
	db THUNDERBOLT, SURF, HIDDEN_POWER, DOUBLE_TEAM
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 56000
	bigdw 55000
	bigdw 50000
	bigdw 60000
	dn 15, 13, 15, 14 ; DVs
	db 24, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 229 ; HP
	bigdw 229 ; Max HP
	bigdw 196 ; Atk
	bigdw 147 ; Def
	bigdw 210 ; Spd
	bigdw 196 ; SAtk
	bigdw 182 ; SDef
	db "SANDA-SU@@@"

	db ANCOR
	db LEFTOVERS
	db SWORDS_DANCE, IRON_HEAD, EARTHQUAKE, SURF
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 50000
	dn 11, 15, 14, 15 ; DVs
	db 48, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 237 ; HP
	bigdw 237 ; Max HP
	bigdw 200 ; Atk
	bigdw 205 ; Def
	bigdw 161 ; Spd
	bigdw 182 ; SAtk
	bigdw 140 ; SDef
	db "SIyaWA-ZU@@"

	db UMBREON
	db MYSTERYBERRY
	db MOONLIGHT, SAND_ATTACK, PURSUIT, TOXIC
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 54000
	bigdw 60000
	bigdw 55000
	bigdw 50000
	bigdw 58000
	dn 13, 13, 13, 13 ; DVs
	db 8, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 278 ; HP
	bigdw 278 ; Max HP
	bigdw 161 ; Atk
	bigdw 224 ; Def
	bigdw 161 ; Spd
	bigdw 154 ; SAtk
	bigdw 252 ; SDef
	db "BURAtuKI-@@"

	db ARTICUNO
	db LEFTOVERS
	db REFLECT, FREEZE_DRY, HIDDEN_POWER, U_TURN
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 55000
	bigdw 58000
	bigdw 50000
	dn 14, 13, 14, 13 ; DVs
	db 32, 32, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 271 ; HP
	bigdw 271 ; Max HP
	bigdw 189 ; Atk
	bigdw 210 ; Def
	bigdw 189 ; Spd
	bigdw 203 ; SAtk
	bigdw 245 ; SDef
	db "HAPINASU@@@"

	db SNORLAX
	db MINT_BERRY
	db CURSE, REST, BODY_SLAM, EARTHQUAKE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	bigdw 50000
	dn 13, 13, 13, 13 ; DVs
	db 16, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 365 ; HP
	bigdw 365 ; Max HP
	bigdw 217 ; Atk
	bigdw 156 ; Def
	bigdw 105 ; Spd
	bigdw 152 ; SAtk
	bigdw 215 ; SDef
	db "KABIGON@@@@"

	db NINETALES
	db POWER_HERB
	db FLAMETHROWER, SOLARBEAM, DREAM_EATER, HYPNOSIS
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 58000
	bigdw 50000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	dn 13, 13, 12, 13 ; DVs
	db 24, 16, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 247 ; HP
	bigdw 247 ; Max HP
	bigdw 176 ; Atk
	bigdw 175 ; Def
	bigdw 210 ; Spd
	bigdw 183 ; SAtk
	bigdw 210 ; SDef
	db "HERUGA-@@@@"

	db SKELEGON
	db TRICK_MIRROR
	db DRAGON_DANCE, SHADOW_BALL, FLAMETHROWER, EARTHQUAKE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	dn 13, 11, 13, 15 ; DVs
	db 32, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 265 ; HP
	bigdw 265 ; Max HP
	bigdw 221 ; Atk
	bigdw 184 ; Def
	bigdw 175 ; Spd
	bigdw 189 ; SAtk
	bigdw 168 ; SDef
	db "BANGIRASU@@"

	db MAGNETON
	db LIGHT_CLAY
	db THUNDERBOLT, TELEPORT, LIGHT_SCREEN, REFLECT
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	dn 13, 11, 13, 15 ; DVs
	db 15, 20, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 215 ; HP
	bigdw 215 ; Max HP
	bigdw 154 ; Atk
	bigdw 203 ; Def
	bigdw 168 ; Spd
	bigdw 238 ; SAtk
	bigdw 168 ; SDef
	db "SANDA-@@@@@"

	db EXEGGUTOR
	db GOLD_BERRY
	db EGG_BOMB, FLAMETHROWER, EARTHQUAKE, ENDURE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	dn 13, 13, 14, 13 ; DVs
	db 16, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 278 ; HP
	bigdw 278 ; Max HP
	bigdw 203 ; Atk
	bigdw 189 ; Def
	bigdw 147 ; Spd
	bigdw 245 ; SAtk
	bigdw 189 ; SDef
	db "NAtuSI-@@@@"

	db ESPEON
	db GOLD_BERRY
	db PSYCHIC_M, SHADOW_BALL, FUTURE_SIGHT, DESTINY_BOND
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	bigdw 50000
	dn 15, 13, 14, 11 ; DVs
	db 16, 24, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 236 ; HP
	bigdw 236 ; Max HP
	bigdw 161 ; Atk
	bigdw 154 ; Def
	bigdw 224 ; Spd
	bigdw 252 ; SAtk
	bigdw 203 ; SDef
	db "BURAtuKI-@@"

	db GYARADOS
	db BRIGHTPOWDER
	db DRAGON_DANCE, HURRICANE, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 11, 14, 15 ; DVs
	db 32, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 278 ; HP
	bigdw 278 ; Max HP
	bigdw 245 ; Atk
	bigdw 180 ; Def
	bigdw 183 ; Spd
	bigdw 182 ; SAtk
	bigdw 210 ; SDef
	db "GIyaRADOSU@"

	db QUAGSIRE
	db MIRACLEBERRY
	db EARTHQUAKE, ICE_PUNCH, RECOVER, TOXIC
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn  6, 14, 13, 13 ; DVs
	db 16, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 278 ; HP
	bigdw 278 ; Max HP
	bigdw 189 ; Atk
	bigdw 189 ; Def
	bigdw 119 ; Spd
	bigdw 161 ; SAtk
	bigdw 161 ; SDef
	db "NUO-@@@@@@@"

	db SIRFETCH_D
	db STICK
	db CUT, RAZOR_WIND, BRICK_BREAK, STEEL_WING
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	dn 15, 13, 14, 13 ; DVs
	db 32, 32, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 268 ; HP
	bigdw 268 ; Max HP
	bigdw 215 ; Atk
	bigdw 170 ; Def
	bigdw 182 ; Spd
	bigdw 158 ; SAtk
	bigdw 184 ; SDef
	db "RINGUMA@@@@"

	db MR__MIME
	db KINGS_ROCK
	db MOONBLAST, FIRE_PUNCH, PSYCHIC_M, CALM_MIND
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 11, 13, 15, 11 ; DVs
	db 24, 24, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 201 ; HP
	bigdw 201 ; Max HP
	bigdw 133 ; Atk
	bigdw 161 ; Def
	bigdw 196 ; Spd
	bigdw 210 ; SAtk
	bigdw 238 ; SDef
	db "BARIYA-DO@@"

	db PRIMEAPE
	db X_ACCURACY
	db CROSS_CHOP, THIEF, STONE_EDGE, HYPER_BEAM
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 11, 13, 14, 15 ; DVs
	db 8, 32, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 236 ; HP
	bigdw 236 ; Max HP
	bigdw 217 ; Atk
	bigdw 154 ; Def
	bigdw 203 ; Spd
	bigdw 154 ; SAtk
	bigdw 168 ; SDef
	db "OKORIZARU@@"

	db GIRAFARIG
	db FOCUS_SASH
	db DOUBLE_TEAM, BATON_PASS, PSYCHIC_M, PLAY_ROUGH
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 13 ; DVs
	db 16, 61, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 243 ; HP
	bigdw 243 ; Max HP
	bigdw 182 ; Atk
	bigdw 161 ; Def
	bigdw 189 ; Spd
	bigdw 196 ; SAtk
	bigdw 161 ; SDef
	db "KIRINRIKI@@"

	db DUNSPARCE
	db LEFTOVERS
	db COIL, BODY_SLAM, CRUNCH, AMNESIA
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 14 ; DVs
	db 15, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 285 ; HP
	bigdw 285 ; Max HP
	bigdw 168 ; Atk
	bigdw 168 ; Def
	bigdw 133 ; Spd
	bigdw 161 ; SAtk
	bigdw 161 ; SDef
	db "SAWAMURA-@@"

	db BEEDRILL
	db X_SPEED
	db TWINEEDLE, SLUDGE_BOMB, BRICK_BREAK, THIEF
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 7, 15, 7 ; DVs
	db 24, 16, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 236 ; HP
	bigdw 236 ; Max HP
	bigdw 196 ; Atk
	bigdw 126 ; Def
	bigdw 175 ; Spd
	bigdw 133 ; SAtk
	bigdw 182 ; SDef
	db "HERAKUROSU@"

	db VENUSAUR
	db BLACK_SLUDGE
	db LEECH_SEED, GIGA_DRAIN, EARTHQUAKE, HIDDEN_POWER
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 14, 12, 15, 15 ; DVs
	db 16, 8, 16, 24 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 257 ; HP
	bigdw 257 ; Max HP
	bigdw 184 ; Atk
	bigdw 186 ; Def
	bigdw 182 ; Spd
	bigdw 210 ; SAtk
	bigdw 210 ; SDef
	db "HUSIGIBANA@"

	db CHARIZARD
	db SCOPE_LENS
	db DRAGON_DANCE, EARTHQUAKE, DIVE_BOMB, FLAMETHROWER
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 5, 6, 4, 4 ; DVs
	db 32, 16, 8, 16 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 254 ; HP
	bigdw 254 ; Max HP
	bigdw 187 ; Atk
	bigdw 179 ; Def
	bigdw 210 ; Spd
	bigdw 222 ; SAtk
	bigdw 189 ; SDef
	db "RIZA-DON@@@"

	db BLASTOISE
	db POWER_HERB
	db SURF, EARTHQUAKE, RAPID_SPIN, SKULL_BASH
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 14 ; DVs
	db 15, 10, 40, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 255 ; HP
	bigdw 255 ; Max HP
	bigdw 186 ; Atk
	bigdw 210 ; Def
	bigdw 179 ; Spd
	bigdw 189 ; SAtk
	bigdw 217 ; SDef
	db "KAMEtuKUSU@"


BattleTowerMons8:

	db JOLTEON
	db MIRACLEBERRY
	db THUNDER_WAVE, THUNDERBOLT, IRON_TAIL, ROAR
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	bigdw 55000
	dn 15, 13, 14, 11 ; DVs
	db 20, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 263 ; HP
	bigdw 263 ; Max HP
	bigdw 179 ; Atk
	bigdw 170 ; Def
	bigdw 281 ; Spd
	bigdw 245 ; SAtk
	bigdw 221 ; SDef
	db "SANDA-SU@@@"

	db SNORLAX
	db LEFTOVERS
	db REST, BELLY_DRUM, SNORE, EARTHQUAKE
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 50000
	bigdw 55500
	bigdw 60000
	dn 13, 11, 14, 13 ; DVs
	db 10, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 248 ; Atk
	bigdw 170 ; Def
	bigdw 121 ; Spd
	bigdw 178 ; SAtk
	bigdw 250 ; SDef
	db "KABIGON@@@@"

	db HOUNDOOM
	db MINT_BERRY
	db REST, CRUNCH, FLAMETHROWER, SUNNY_DAY
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 55000
	bigdw 55000
	dn 15, 13, 13, 11 ; DVs
	db 10, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 280 ; HP
	bigdw 280 ; Max HP
	bigdw 217 ; Atk
	bigdw 152 ; Def
	bigdw 224 ; Spd
	bigdw 245 ; SAtk
	bigdw 197 ; SDef
	db "HERUGA-@@@@"

	db TAUROS
	db GOLD_BERRY
	db EARTHQUAKE, BODY_SLAM, IRON_TAIL, HYPER_BEAM
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	dn 15, 13, 13, 14 ; DVs
	db 10, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 276 ; HP
	bigdw 276 ; Max HP
	bigdw 233 ; Atk
	bigdw 221 ; Def
	bigdw 236 ; Spd
	bigdw 135 ; SAtk
	bigdw 183 ; SDef
	db "KENTAROSU@@"

	db LAPRAS
	db MINT_BERRY
	db REST, SURF, CONFUSE_RAY, PSYCHIC_M
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 15, 13, 11 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 366 ; HP
	bigdw 366 ; Max HP
	bigdw 205 ; Atk
	bigdw 201 ; Def
	bigdw 168 ; Spd
	bigdw 202 ; SAtk
	bigdw 218 ; SDef
	db "RAPURASU@@@"

	db TYRANITAR
	db MIRACLEBERRY
	db REST, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 15, 13, 11 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 318 ; HP
	bigdw 318 ; Max HP
	bigdw 286 ; Atk
	bigdw 249 ; Def
	bigdw 169 ; Spd
	bigdw 218 ; SAtk
	bigdw 226 ; SDef
	db "BANGIRASU@@"

	db GENGAR
	db NO_ITEM
	db THUNDERBOLT, SHADOW_BALL, CONFUSE_RAY, THIEF
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 55000
	bigdw 50000
	dn 13, 14, 13, 13 ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 247 ; HP
	bigdw 247 ; Max HP
	bigdw 173 ; Atk
	bigdw 165 ; Def
	bigdw 248 ; Spd
	bigdw 277 ; SAtk
	bigdw 189 ; SDef
	db "GENGA-@@@@@"

	db FORRETRESS
	db LEFTOVERS
	db EXPLOSION, TOXIC, SOLARBEAM, SWAGGER
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	dn 15, 13, 14, 13 ; DVs
	db 5, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 273 ; HP
	bigdw 273 ; Max HP
	bigdw 217 ; Atk
	bigdw 293 ; Def
	bigdw 133 ; Spd
	bigdw 165 ; SAtk
	bigdw 165 ; SDef
	db "HUoRETOSU@@"

	db KINGDRA
	db MINT_BERRY
	db REST, SURF, BLIZZARD, DRAGONBREATH
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 55000
	bigdw 50000
	dn 15, 11, 14, 13 ; DVs
	db 10, 15, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 273 ; HP
	bigdw 273 ; Max HP
	bigdw 225 ; Atk
	bigdw 214 ; Def
	bigdw 209 ; Spd
	bigdw 221 ; SAtk
	bigdw 221 ; SDef
	db "KINGUDORA@@"

	db DRAGONITE
	db GOLD_BERRY
	db THUNDER_WAVE, SURF, THUNDERBOLT, OUTRAGE
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	dn 13, 13, 13, 13 ; DVs
	db 20, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 284 ; Atk
	bigdw 221 ; Def
	bigdw 197 ; Spd
	bigdw 228 ; SAtk
	bigdw 228 ; SDef
	db "KAIRIyu-@@@"

	db PORYGON2
	db LEFTOVERS
	db PSYCHIC_M, RECOVER, HYPER_BEAM, TRI_ATTACK
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 40000
	bigdw 55000
	bigdw 50000
	dn 13, 15, 14, 13 ; DVs
	db 10, 20, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 293 ; HP
	bigdw 293 ; Max HP
	bigdw 197 ; Atk
	bigdw 213 ; Def
	bigdw 169 ; Spd
	bigdw 237 ; SAtk
	bigdw 221 ; SDef
	db "PORIGON2@@@"

	db JYNX
	db QUICK_CLAW
	db LOVELY_KISS, BLIZZARD, DREAM_EATER, PSYCHIC_M
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	dn 13, 15, 13, 15 ; DVs
	db 10, 5, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 264 ; HP
	bigdw 264 ; Max HP
	bigdw 149 ; Atk
	bigdw 127 ; Def
	bigdw 221 ; Spd
	bigdw 257 ; SAtk
	bigdw 225 ; SDef
	db "RU-ZIyuRA@@"

	db MANTINE
	db GOLD_BERRY
	db SURF, CONFUSE_RAY, BLIZZARD, WING_ATTACK
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	dn 13, 15, 13, 12 ; DVs
	db 15, 10, 5, 35 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 256 ; HP
	bigdw 256 ; Max HP
	bigdw 132 ; Atk
	bigdw 181 ; Def
	bigdw 180 ; Spd
	bigdw 196 ; SAtk
	bigdw 292 ; SDef
	db "MANTAIN@@@@"

	db SKARMORY
	db QUICK_CLAW
	db STEEL_WING, FLY, MUD_SLAP, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 35000
	bigdw 50000
	bigdw 50000
	dn 13, 13, 14, 15 ; DVs
	db 25, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 258 ; HP
	bigdw 258 ; Max HP
	bigdw 196 ; Atk
	bigdw 286 ; Def
	bigdw 183 ; Spd
	bigdw 137 ; SAtk
	bigdw 185 ; SDef
	db "EA-MUDO@@@@"

	db MOLTRES
	db CHARCOAL
	db FLAMETHROWER, BRAVE_BIRD, STEEL_WING, HYPER_BEAM
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 13, 13, 15, 14 ; DVs
	db 15, 5, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 300 ; HP
	bigdw 300 ; Max HP
	bigdw 225 ; Atk
	bigdw 213 ; Def
	bigdw 213 ; Spd
	bigdw 271 ; SAtk
	bigdw 207 ; SDef
	db "HUaIYA-@@@@"

	db AERODACTYL
	db MIRACLEBERRY
	db HYPER_BEAM, REST, EARTHQUAKE, ROAR
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 15, 15, 14, 13 ; DVs
	db 5, 10, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 282 ; HP
	bigdw 282 ; Max HP
	bigdw 237 ; Atk
	bigdw 177 ; Def
	bigdw 275 ; Spd
	bigdw 165 ; SAtk
	bigdw 189 ; SDef
	db "PUTERA@@@@@"

	db ELECTRODE
	db KINGS_ROCK
	db THUNDERBOLT, EXPLOSION, MIRROR_COAT, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 15, 15, 14, 15 ; DVs
	db 15, 5, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 250 ; HP
	bigdw 250 ; Max HP
	bigdw 153 ; Atk
	bigdw 181 ; Def
	bigdw 291 ; Spd
	bigdw 201 ; SAtk
	bigdw 201 ; SDef
	db "MARUMAIN@@@"

	db DUGTRIO
	db SCOPE_LENS
	db CUT, EARTHQUAKE, THIEF, MUD_SLAP
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	dn 15, 13, 13, 13 ; DVs
	db 20, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 214 ; HP
	bigdw 214 ; Max HP
	bigdw 201 ; Atk
	bigdw 145 ; Def
	bigdw 261 ; Spd
	bigdw 145 ; SAtk
	bigdw 177 ; SDef
	db "DAGUTORIO@@"

	db VICTREEBEL
	db QUICK_CLAW
	db GIGA_DRAIN, SLUDGE_BOMB, HYPER_BEAM, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 6, 5, 6, 5 ; DVs
	db 5, 10, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 260 ; HP
	bigdw 260 ; Max HP
	bigdw 217 ; Atk
	bigdw 151 ; Def
	bigdw 161 ; Spd
	bigdw 207 ; SAtk
	bigdw 143 ; SDef
	db "UTUBOtuTO@@"

	db PINSIR
	db GOLD_BERRY
	db HYPER_BEAM, SUBMISSION, STRENGTH, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 4, 6, 4 ; DVs
	db 5, 25, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 241 ; HP
	bigdw 241 ; Max HP
	bigdw 250 ; Atk
	bigdw 205 ; Def
	bigdw 185 ; Spd
	bigdw 133 ; SAtk
	bigdw 157 ; SDef
	db "KAIROSU@@@@"

	db GRANBULL
	db BRIGHTPOWDER
	db ROAR, SHADOW_BALL, HYPER_BEAM, THUNDERPUNCH
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 6, 5, 7 ; DVs
	db 20, 15, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 286 ; HP
	bigdw 286 ; Max HP
	bigdw 242 ; Atk
	bigdw 169 ; Def
	bigdw 119 ; Spd
	bigdw 146 ; SAtk
	bigdw 146 ; SDef
	db "GURANBURU@@"


BattleTowerMons9:

	db UMBREON
	db KINGS_ROCK
	db FAINT_ATTACK, MUD_SLAP, MOONLIGHT, CONFUSE_RAY
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	dn 15, 13, 14, 13 ; DVs
	db 20, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 349 ; HP
	bigdw 349 ; Max HP
	bigdw 203 ; Atk
	bigdw 278 ; Def
	bigdw 202 ; Spd
	bigdw 188 ; SAtk
	bigdw 314 ; SDef
	db "BURAtuKI-@@"

	db DRAGONITE
	db QUICK_CLAW
	db FIRE_BLAST, HYPER_BEAM, OUTRAGE, BLIZZARD
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 65000
	bigdw 50000
	bigdw 56000
	bigdw 60000
	bigdw 60000
	dn 15, 13, 14, 13 ; DVs
	db 5, 5, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 322 ; Atk
	bigdw 252 ; Def
	bigdw 229 ; Spd
	bigdw 263 ; SAtk
	bigdw 263 ; SDef
	db "KAIRIyu-@@@"

	db STARMIE
	db X_ACCURACY
	db THUNDER, HYDRO_PUMP, BLIZZARD, RECOVER
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	dn 13, 15, 13, 13 ; DVs
	db 16, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 291 ; HP
	bigdw 291 ; Max HP
	bigdw 223 ; Atk
	bigdw 241 ; Def
	bigdw 295 ; Spd
	bigdw 268 ; SAtk
	bigdw 241 ; SDef
	db "SUTA-MI-@@@"

	db CLOYSTER
	db LEFTOVERS
	db EXPLOSION, BLIZZARD, SURF, ICY_WIND
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 13, 11, 13, 15 ; DVs
	db 5, 5, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 266 ; HP
	bigdw 266 ; Max HP
	bigdw 248 ; Atk
	bigdw 398 ; Def
	bigdw 203 ; Spd
	bigdw 234 ; SAtk
	bigdw 162 ; SDef
	db "PARUSIeN@@@"

	db CROBAT
	db GOLD_BERRY
	db WING_ATTACK, HAZE, HYPER_BEAM, GIGA_DRAIN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 12, 15 ; DVs
	db 35, 30, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 243 ; Atk
	bigdw 221 ; Def
	bigdw 310 ; Spd
	bigdw 207 ; SAtk
	bigdw 225 ; SDef
	db "KUROBAtuTO@"

	db PORYGON2
	db QUICK_CLAW
	db TOXIC, PSYCHIC_M, RECOVER, PROTECT
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 15, 13, 14, 13 ; DVs
	db 10, 10, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 223 ; Atk
	bigdw 239 ; Def
	bigdw 190 ; Spd
	bigdw 266 ; SAtk
	bigdw 248 ; SDef
	db "PORIGON2@@@"

	db KINGDRA
	db LEFTOVERS
	db DRAGONBREATH, SURF, HYPER_BEAM, BLIZZARD
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 45000
	dn 13, 15, 13, 14 ; DVs
	db 20, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 248 ; Atk
	bigdw 255 ; Def
	bigdw 230 ; Spd
	bigdw 248 ; SAtk
	bigdw 248 ; SDef
	db "KINGUDORA@@"

	db TYRANITAR
	db QUICK_CLAW
	db HYPER_BEAM, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	dn 13, 15, 13, 14 ; DVs
	db 5, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 354 ; HP
	bigdw 354 ; Max HP
	bigdw 321 ; Atk
	bigdw 279 ; Def
	bigdw 185 ; Spd
	bigdw 250 ; SAtk
	bigdw 259 ; SDef
	db "BANGIRASU@@"

	db LAPRAS
	db MINT_BERRY
	db REST, SURF, THUNDERBOLT, PSYCHIC_M
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	dn 11, 13, 14, 15 ; DVs
	db 10, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 405 ; HP
	bigdw 405 ; Max HP
	bigdw 227 ; Atk
	bigdw 221 ; Def
	bigdw 187 ; Spd
	bigdw 237 ; SAtk
	bigdw 255 ; SDef
	db "RAPURASU@@@"

	db ESPEON
	db GOLD_BERRY
	db PSYCHIC_M, SHADOW_BALL, SUNNY_DAY, MORNING_SUN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 13, 15, 14 ; DVs
	db 10, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 294 ; HP
	bigdw 294 ; Max HP
	bigdw 194 ; Atk
	bigdw 185 ; Def
	bigdw 282 ; Spd
	bigdw 313 ; SAtk
	bigdw 250 ; SDef
	db "E-HUi@@@@@@"

	db MACHAMP
	db QUICK_CLAW
	db CROSS_CHOP, VITAL_THROW, FIRE_BLAST, EARTHQUAKE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 13, 14, 13 ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 337 ; HP
	bigdw 337 ; Max HP
	bigdw 314 ; Atk
	bigdw 221 ; Def
	bigdw 181 ; Spd
	bigdw 194 ; SAtk
	bigdw 230 ; SDef
	db "KAIRIKI-@@@"

	db SNORLAX
	db MIRACLEBERRY
	db FIRE_BLAST, SURF, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 13 ; DVs
	db 5, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 455 ; HP
	bigdw 455 ; Max HP
	bigdw 279 ; Atk
	bigdw 199 ; Def
	bigdw 135 ; Spd
	bigdw 194 ; SAtk
	bigdw 275 ; SDef
	db "KABIGON@@@@"

	db ARCANINE
	db MINT_BERRY
	db SUNNY_DAY, FLAMETHROWER, EXTREMESPEED, REST
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 55000
	dn 13, 15, 13, 14 ; DVs
	db 5, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 336 ; HP
	bigdw 336 ; Max HP
	bigdw 274 ; Atk
	bigdw 225 ; Def
	bigdw 247 ; Spd
	bigdw 262 ; SAtk
	bigdw 226 ; SDef
	db "UINDEi@@@@@"

	db BLISSEY
	db LEFTOVERS
	db SOLARBEAM, SUNNY_DAY, SOFTBOILED, FIRE_BLAST
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 11, 13, 15, 14 ; DVs
	db 10, 5, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 633 ; HP
	bigdw 633 ; Max HP
	bigdw 90 ; Atk
	bigdw 95 ; Def
	bigdw 180 ; Spd
	bigdw 214 ; SAtk
	bigdw 322 ; SDef
	db "HAPINASU@@@"

	db HOUNDOOM
	db BRIGHTPOWDER
	db FLAMETHROWER, CRUNCH, SUNNY_DAY, SOLARBEAM
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 13, 11, 15, 14 ; DVs
	db 15, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 235 ; Atk
	bigdw 164 ; Def
	bigdw 252 ; Spd
	bigdw 277 ; SAtk
	bigdw 223 ; SDef
	db "HERUGA-@@@@"

	db SKARMORY
	db QUICK_CLAW
	db SANDSTORM, STEEL_WING, TOXIC, RETURN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 15, 15, 7 ; DVs
	db 10, 25, 10, 20 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 279 ; HP
	bigdw 279 ; Max HP
	bigdw 223 ; Atk
	bigdw 333 ; Def
	bigdw 207 ; Spd
	bigdw 139 ; SAtk
	bigdw 193 ; SDef
	db "EA-MUDO@@@@"

	db SHUCKLE
	db LEFTOVERS
	db TOXIC, WRAP, PROTECT, ENCORE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 14 ; DVs
	db 10, 20, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 203 ; HP
	bigdw 203 ; Max HP
	bigdw 99 ; Atk
	bigdw 493 ; Def
	bigdw 90 ; Spd
	bigdw 97 ; SAtk
	bigdw 493 ; SDef
	db "TUBOTUBO@@@"

	db FLAREON
	db MINT_BERRY
	db HYPER_BEAM, FLAMETHROWER, SHADOW_BALL, ROAR
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 7, 15, 7 ; DVs
	db 5, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 293 ; HP
	bigdw 293 ; Max HP
	bigdw 315 ; Atk
	bigdw 175 ; Def
	bigdw 198 ; Spd
	bigdw 238 ; SAtk
	bigdw 265 ; SDef
	db "BU-SUTA-@@@"

	db MILTANK
	db LEFTOVERS
	db MILK_DRINK, EARTHQUAKE, ATTRACT, BODY_SLAM
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 4, 7, 5, 7 ; DVs
	db 10, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 322 ; HP
	bigdw 322 ; Max HP
	bigdw 194 ; Atk
	bigdw 245 ; Def
	bigdw 232 ; Spd
	bigdw 128 ; SAtk
	bigdw 182 ; SDef
	db "MIRUTANKU@@"

	db TAUROS
	db SILK_SCARF
	db THUNDERBOLT, HYPER_BEAM, ATTRACT, EARTHQUAKE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 6, 5, 7, 6 ; DVs
	db 15, 5, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 284 ; HP
	bigdw 284 ; Max HP
	bigdw 234 ; Atk
	bigdw 223 ; Def
	bigdw 254 ; Spd
	bigdw 126 ; SAtk
	bigdw 180 ; SDef
	db "KENTAROSU@@"

	db MUK
	db QUICK_CLAW
	db TOXIC, SLUDGE_BOMB, ATTRACT, GIGA_DRAIN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 5, 4, 4, 4 ; DVs
	db 10, 10, 15, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 342 ; HP
	bigdw 342 ; Max HP
	bigdw 241 ; Atk
	bigdw 185 ; Def
	bigdw 140 ; Spd
	bigdw 167 ; SAtk
	bigdw 230 ; SDef
	db "BETOBETON@@"


BattleTowerMons10:

	db ENTEI ; Done
	db CHARCOAL
	db BULK_UP, ROCK_SMASH, EARTHQUAKE, FIRE_BLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 13, 14, 13 ; DVs
	db 32, 32, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 433 ; HP
	bigdw 433 ; Max HP
	bigdw 328 ; Atk
	bigdw 268 ; Def
	bigdw 298 ; Spd
	bigdw 278 ; SAtk
	bigdw 248 ; SDef
	db "HERUGA-@@@@"

	db MACHAMP
	db QUICK_CLAW
	db CROSS_CHOP, EARTHQUAKE, HYPER_BEAM, VITAL_THROW
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 13, 14, 15 ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 377 ; HP
	bigdw 377 ; Max HP
	bigdw 356 ; Atk
	bigdw 252 ; Def
	bigdw 204 ; Spd
	bigdw 226 ; SAtk
	bigdw 266 ; SDef
	db "KAIRIKI-@@@"

	db KINGDRA
	db LEFTOVERS
	db SURF, DRAGONBREATH, REST, TOXIC
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 13, 15, 15, 14 ; DVs
	db 15, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 349 ; HP
	bigdw 349 ; Max HP
	bigdw 282 ; Atk
	bigdw 286 ; Def
	bigdw 266 ; Spd
	bigdw 284 ; SAtk
	bigdw 284 ; SDef
	db "KINGUDORA@@"

	db RAIKOU ; Done
	db DAMP_CHARM
	db THUNDER, HIDDEN_POWER, ROAR, THUNDER_WAVE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	dn 14, 13, 15, 15 ; DVs
	db 16, 24, 32, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 268 ; Atk
	bigdw 248 ; Def
	bigdw 328 ; Spd
	bigdw 328 ; SAtk
	bigdw 298 ; SDef
	db "SANDA-SU@@@"

	db TAUROS
	db KINGS_ROCK
	db HYPER_BEAM, EARTHQUAKE, IRON_TAIL, THUNDERBOLT
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 14, 15 ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 341 ; HP
	bigdw 341 ; Max HP
	bigdw 290 ; Atk
	bigdw 276 ; Def
	bigdw 308 ; Spd
	bigdw 170 ; SAtk
	bigdw 230 ; SDef
	db "KENTAROSU@@"

	db SUICUNE ; Done
	db LEFTOVERS
	db CALM_MIND, SURF, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 13, 13, 14, 15 ; DVs
	db 32, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 403 ; HP
	bigdw 403 ; Max HP
	bigdw 248 ; Atk
	bigdw 328 ; Def
	bigdw 268 ; Spd
	bigdw 278 ; SAtk
	bigdw 328 ; SDef
	db "UINDEi@@@@@"

	db CHARIZARD
	db SCOPE_LENS
	db FLAMETHROWER, EARTHQUAKE, CUT, FLY
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 55000
	bigdw 55000
	dn 15, 14, 13, 15 ; DVs
	db 15, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 258 ; Atk
	bigdw 247 ; Def
	bigdw 289 ; Spd
	bigdw 311 ; SAtk
	bigdw 263 ; SDef
	db "RIZA-DON@@@"

	db ELECTRODE
	db BRIGHTPOWDER
	db THUNDER_WAVE, THUNDERBOLT, EXPLOSION, MIRROR_COAT
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	dn 15, 11, 14, 15 ; DVs
	db 20, 15, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 190 ; Atk
	bigdw 222 ; Def
	bigdw 366 ; Spd
	bigdw 248 ; SAtk
	bigdw 248 ; SDef
	db "MARUMAIN@@@"

	db RHYDON
	db MIRACLEBERRY
	db SURF, EARTHQUAKE, HYPER_BEAM, ROCK_SLIDE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 45000
	dn 15, 13, 14, 15 ; DVs
	db 15, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 404 ; HP
	bigdw 404 ; Max HP
	bigdw 350 ; Atk
	bigdw 329 ; Def
	bigdw 168 ; Spd
	bigdw 178 ; SAtk
	bigdw 178 ; SDef
	db "SAIDON@@@@@"

	db STEELIX
	db LEFTOVERS
	db EARTHQUAKE, HYPER_BEAM, SWAGGER, CRUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 60000
	bigdw 50000
	dn 15, 13, 13, 14 ; DVs
	db 10, 5, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 260 ; Atk
	bigdw 489 ; Def
	bigdw 152 ; Spd
	bigdw 198 ; SAtk
	bigdw 218 ; SDef
	db "HAGANE-RU@@"

	db FEAROW
	db KINGS_ROCK
	db DRILL_PECK, STEEL_WING, HYPER_BEAM, MUD_SLAP
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	dn 15, 13, 12, 15 ; DVs
	db 20, 25, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 324 ; HP
	bigdw 324 ; Max HP
	bigdw 270 ; Atk
	bigdw 216 ; Def
	bigdw 287 ; Spd
	bigdw 212 ; SAtk
	bigdw 212 ; SDef
	db "ONIDORIRU@@"

	db MISDREAVUS
	db FOCUS_BAND
	db PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 55000
	dn 11, 13, 14, 15 ; DVs
	db 5, 5, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 202 ; Atk
	bigdw 209 ; Def
	bigdw 258 ; Spd
	bigdw 263 ; SAtk
	bigdw 263 ; SDef
	db "MUUMA@@@@@@"

	db SNOWMAD
	db SCOPE_LENS
	db CUT, BLIZZARD, DREAM_EATER, FAINT_ATTACK
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 48000
	bigdw 45000
	bigdw 50000
	dn 15, 13, 14, 15 ; DVs
	db 20, 5, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 301 ; HP
	bigdw 301 ; Max HP
	bigdw 280 ; Atk
	bigdw 195 ; Def
	bigdw 316 ; Spd
	bigdw 160 ; SAtk
	bigdw 240 ; SDef
	db "NIyu-RA@@@@"

	db SCIZOR
	db QUICK_CLAW
	db STEEL_WING, HYPER_BEAM, CUT, TOXIC
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	dn 15, 11, 15, 14 ; DVs
	db 25, 5, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 333 ; HP
	bigdw 333 ; Max HP
	bigdw 350 ; Atk
	bigdw 282 ; Def
	bigdw 220 ; Spd
	bigdw 196 ; SAtk
	bigdw 246 ; SDef
	db "HAtuSAMU@@@"

	db BLISSEY
	db LEFTOVERS
	db THUNDERBOLT, BLIZZARD, FIRE_BLAST, SOFTBOILED
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 13, 13, 15, 14 ; DVs
	db 15, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 703 ; HP
	bigdw 703 ; Max HP
	bigdw 101 ; Atk
	bigdw 106 ; Def
	bigdw 188 ; Spd
	bigdw 226 ; SAtk
	bigdw 346 ; SDef
	db "HAPINASU@@@"

	db PILOSWINE
	db MINT_BERRY
	db REST, BLIZZARD, HYPER_BEAM, EARTHQUAKE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 7 ; DVs
	db 10, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 387 ; HP
	bigdw 387 ; Max HP
	bigdw 290 ; Atk
	bigdw 248 ; Def
	bigdw 190 ; Spd
	bigdw 194 ; SAtk
	bigdw 194 ; SDef
	db "INOMU-@@@@@"

	db EXEGGUTOR
	db QUICK_CLAW
	db PSYCHIC_M, TOXIC, EXPLOSION, GIGA_DRAIN
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 14, 15, 14 ; DVs
	db 10, 10, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 375 ; HP
	bigdw 375 ; Max HP
	bigdw 280 ; Atk
	bigdw 258 ; Def
	bigdw 200 ; Spd
	bigdw 338 ; SAtk
	bigdw 218 ; SDef
	db "NAtuSI-@@@@"

	db OMASTAR
	db LEFTOVERS
	db SURF, ANCIENTPOWER, BLIZZARD, TOXIC
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 11, 14, 7 ; DVs
	db 15, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 331 ; HP
	bigdw 331 ; Max HP
	bigdw 210 ; Atk
	bigdw 332 ; Def
	bigdw 198 ; Spd
	bigdw 304 ; SAtk
	bigdw 214 ; SDef
	db "OMUSUTA-@@@"

	db GOLEM
	db BRIGHTPOWDER
	db EXPLOSION, EARTHQUAKE, ROCK_SLIDE, FIRE_BLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 4, 4, 6 ; DVs
	db 5, 10, 10, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 329 ; HP
	bigdw 329 ; Max HP
	bigdw 282 ; Atk
	bigdw 316 ; Def
	bigdw 146 ; Spd
	bigdw 170 ; SAtk
	bigdw 190 ; SDef
	db "GORO-NIya@@"

	db MACHAMP
	db FOCUS_BAND
	db COUNTER, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 6, 7, 7, 6 ; DVs
	db 20, 15, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 265 ; HP
	bigdw 265 ; Max HP
	bigdw 270 ; Atk
	bigdw 220 ; Def
	bigdw 214 ; Spd
	bigdw 130 ; SAtk
	bigdw 280 ; SDef
	db "EBIWARA-@@@"

	db LANTURN
	db QUICK_CLAW
	db SURF, RAIN_DANCE, ZAP_CANNON, CONFUSE_RAY
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 7, 6, 5, 7 ; DVs
	db 15, 5, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 425 ; HP
	bigdw 425 ; Max HP
	bigdw 178 ; Atk
	bigdw 176 ; Def
	bigdw 192 ; Spd
	bigdw 214 ; SAtk
	bigdw 214 ; SDef
	db "RANTA-N@@@@"
