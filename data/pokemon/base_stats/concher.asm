	db CONCHER ; 106

	db  70,  45,  85,  50,  95, 180
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 60 ; catch rate
	db 203 ; base exp
	db PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/concher/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, CALM_MIND, DOUBLE_TEAM, ENDURE, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_HEAD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SWAGGER, TELEPORT, TOXIC, WATERFALL, SURF, BUBBLEBEAM
	; end
