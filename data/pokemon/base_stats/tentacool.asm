	db TENTACOOL ; 072

	db  40,  40,  35,  70,  50, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/tentacool/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, CUT, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, ICE_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, SAFEGUARD, SLEEP_TALK, SLUDGE_BOMB, SUBSTITUTE, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, WATERFALL, SURF, BUBBLEBEAM
	; end