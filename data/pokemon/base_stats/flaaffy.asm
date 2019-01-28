	db FLAAFFY ; 180

	db  70,  55,  55,  45,  80,  60
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 120 ; catch rate
	db 117 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/flaaffy/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm  HIDDEN_POWER, TOXIC, HEADBUTT, CURSE, THUNDERPUNCH, THUNDERBOLT, THUNDER, THUNDER_WAVE, STRENGTH, RETURN, REFLECT, LIGHT_SCREEN, SAFEGUARD, PROTECT, ENDURE, ROCK_SMASH, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, RAIN_DANCE, PLAY_ROUGH, BODY_SLAM, HEAL_BELL
	; end
