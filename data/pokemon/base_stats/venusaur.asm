	db VENUSAUR ; 003

	db  80,  82,  83,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/venusaur/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CURSE, CUT, DOUBLE_TEAM, EARTHQUAKE, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PROTECT, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SAFEGUARD, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TOXIC, BODY_SLAM, GROWTH
	; end
