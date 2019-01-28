	db REMORAID ; 223

	db  35,  65,  35,  65,  65,  35
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 78 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/remoraid/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, DOUBLE_TEAM, ENDURE, FLAMETHROWER, HIDDEN_POWER, ICE_BEAM, ICY_WIND, PROTECT, PSYCHIC_M, RAIN_DANCE, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER_WAVE, TOXIC, WATERFALL, SURF, BUBBLEBEAM
	; end