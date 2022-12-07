	db TUNGTYED ; 215

	db 120,  70,  95,  40,  90, 100
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC ; type
	db 60 ; catch rate
	db 132 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/tungtyed/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BULLDOZE, CURSE, CUT, DOUBLE_TEAM, DRAGONBREATH, EARTHQUAKE, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICE_PUNCH, ICY_WIND, PROTECT, PSYCH_UP, PSYCHIC_M, RAIN_DANCE, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SHADOW_BALL, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, THUNDER_WAVE, TOXIC, SURF, BODY_SLAM, HEAL_BELL, NIGHTMARE, DREAM_EATER, BUBBLEBEAM, GROWTH, DIG
	; end
