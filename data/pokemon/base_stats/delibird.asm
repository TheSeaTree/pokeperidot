	db DELIBIRD ; 225

	db  45,  55,  45,  75,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 45 ; catch rate
	db 183 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/delibird/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, DOUBLE_TEAM, FLY, HEADBUTT, HIDDEN_POWER, HURRICANE, ICE_BEAM, ICE_PUNCH, ICY_WIND, LIGHT_SCREEN, NASTY_PLOT, PLAY_ROUGH, PROTECT, RAIN_DANCE, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SWAGGER, THIEF, TOXIC, BODY_SLAM, DESTINY_BOND
	; end
