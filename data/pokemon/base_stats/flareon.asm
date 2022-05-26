	db FLAREON ; 136

	db  65, 130,  60,  65,  95, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 35 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/flareon/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CALM_MIND, CURSE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, TOXIC, BODY_SLAM, HEAL_BELL, GROWTH, DIG
	; end
