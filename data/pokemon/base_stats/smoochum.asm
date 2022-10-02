	db SMOOCHUM ; 238

	db  45,  30,  15,  65,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db ICE, PSYCHIC ; type
	db 45 ; catch rate
	db 87 ; base exp
	db ICE_BERRY, ICE_BERRY ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/smoochum/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm BLIZZARD, CALM_MIND, DOUBLE_TEAM, ENDURE, HIDDEN_POWER, ICE_BEAM, ICE_PUNCH, ICY_WIND, LIGHT_SCREEN, NASTY_PLOT, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SUBSTITUTE, SWAGGER, TELEPORT, THIEF, TOXIC, LOVELY_KISS, SWEET_KISS, DRAIN_KISS, BODY_SLAM, NIGHTMARE, DREAM_EATER
	; end
