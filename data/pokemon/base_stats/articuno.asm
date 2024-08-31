	db ARTICUNO ; 144

	db  90,  85, 100,  85,  95, 125
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 80 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/articuno/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, ROAR, TOXIC, ICE_BEAM, BLIZZARD, HURRICANE, HYPER_BEAM, LIGHT_SCREEN, ICY_WIND, RETURN, REFLECT, PROTECT, ENDURE, ROCK_SMASH, FLY, SWAGGER, NASTY_PLOT, SUBSTITUTE, REST, SLEEP_TALK, STRENGTH, DOUBLE_TEAM, RAIN_DANCE, SANDSTORM, BUBBLEBEAM
	; end
