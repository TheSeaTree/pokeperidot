	db ELECTABUZZ ; 125

	db  65,  83,  57, 105,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp
	db PRZCUREBERRY, PRZCUREBERRY ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/electabuzz/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_PUNCH, LIGHT_SCREEN, NASTY_PLOT, PROTECT, PSYCHIC_M, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, THUNDER_WAVE, TOXIC, BODY_SLAM, DRAIN_PUNCH
	; end
