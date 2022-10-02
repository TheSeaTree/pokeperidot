	db RAICHU ; 026

	db  60,  90,  55, 110,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp
	db BERRY, LIGHT_BALL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/raichu/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, NASTY_PLOT, PLAY_ROUGH, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, THUNDER_WAVE, TOXIC, BODY_SLAM, DIG
	; end
