	db SMOLA ; 054

	db  45,  60,  35,  60,  55,  35
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 80 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/smola/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, ROAR, TOXIC, HEADBUTT, CURSE, ICE_BEAM, BLIZZARD, WATERFALL, ICY_WIND, RETURN, PROTECT, ENDURE, CRUNCH, SLUDGE_BOMB, THIEF, WHIRLPOOL, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, RAIN_DANCE, SWORDS_DANCE, SURF, WATERFALL, BUBBLEBEAM
	; end
