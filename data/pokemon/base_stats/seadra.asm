	db SEADRA ; 117

	db  55,  65,  95,  85,  95,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 155 ; base exp
	db NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/seadra/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, ENDURE, HEADBUTT, HIDDEN_POWER, ICE_BEAM, ICY_WIND, IRON_HEAD, PROTECT, RAIN_DANCE, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SUBSTITUTE, SWAGGER, TOXIC, WATERFALL, SURF, BUBBLEBEAM
	; end
