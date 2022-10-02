	db ELEKID ; 239

	db  45,  63,  37,  95,  65,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 106 ; base exp
	db PRZCUREBERRY, PRZCUREBERRY ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/elekid/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DOUBLE_TEAM, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, ICE_PUNCH, ICY_WIND, LIGHT_SCREEN, NASTY_PLOT, PROTECT, PSYCHIC_M, RAIN_DANCE, REST, RETURN, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBSTITUTE, SWAGGER, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, THUNDER_WAVE, TOXIC, BODY_SLAM, DRAIN_PUNCH
	; end
