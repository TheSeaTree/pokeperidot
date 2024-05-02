	db VILEPLUME ; 045

	db  75,  80,  85,  50, 110,  90
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/vileplume/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PROTECT, REFLECT, REST, RETURN, SAFEGUARD, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TOXIC, BODY_SLAM, DRAIN_PUNCH, GROWTH
	; end
