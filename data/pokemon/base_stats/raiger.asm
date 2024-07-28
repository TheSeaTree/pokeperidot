	db RAIGER ; 166

	db  86,  88,  72,  86,  99,  96
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, DARK ; type
	db 75 ; catch rate
	db 213 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/raiger/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, BULK_UP, CRUNCH, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, PLAY_ROUGH, PROTECT, RAIN_DANCE, REST, RETURN, ROAR, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, BODY_SLAM, HEAL_BELL, WATERFALL, DIG
	; end
