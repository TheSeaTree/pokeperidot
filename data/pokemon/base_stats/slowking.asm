	db SLOWKING ; 199

	db  95,  75,  80,  30, 100, 110
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db 70 ; catch rate
	db 164 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/slowking/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BULLDOZE, CALM_MIND, CURSE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICE_PUNCH, ICY_WIND, LIGHT_SCREEN, NASTY_PLOT, PROTECT, PSYCHIC_M, TELEPORT, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SMASH, SAFEGUARD, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, THUNDER_WAVE, TOXIC, SURF, BODY_SLAM, DRAIN_PUNCH, NIGHTMARE, DREAM_EATER, BUBBLEBEAM, DIG
	; end
