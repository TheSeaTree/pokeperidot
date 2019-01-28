	db PARAS ; 046

	db  35,  70,  55,  25,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/paras/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, LEECH_LIFE, LIGHT_SCREEN, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, BODY_SLAM, GROWTH
	; end
