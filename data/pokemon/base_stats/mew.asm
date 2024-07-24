	db MEW ; 151

	db 100, 100, 100, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 3 ; catch rate
	db 64 ; base exp
	db LEGENDS_AURA, LEGENDS_AURA ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/mew/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, BLIZZARD, BULLDOZE, BULK_UP, CALM_MIND, CRUNCH, CURSE, CUT, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, EARTHQUAKE, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, FLY, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HURRICANE, HYPER_BEAM, ICE_BEAM, ICE_PUNCH, ICY_WIND, IRON_HEAD, LEECH_LIFE, LIGHT_SCREEN, NASTY_PLOT, PLAY_ROUGH, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SAFEGUARD, SANDSTORM, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, THUNDER_WAVE, TOXIC, WATERFALL, SURF, SWEET_KISS, LOVELY_KISS, DRAIN_KISS, BODY_SLAM, DRAIN_PUNCH, HEAL_BELL, GROWTH, NIGHTMARE, DREAM_EATER, BUBBLEBEAM, DIG
	; end
