	db MEGANIUM ; 154

	db  80,  82, 100,  80,  83, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 208 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/meganium/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, HEADBUTT, STRENGTH, RETURN, REFLECT, LIGHT_SCREEN, SAFEGUARD, PROTECT, ENDURE, ROCK_SMASH, CUT, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, PLAY_ROUGH, HYPER_BEAM, PETAL_DANCE, BODY_SLAM
	; end
