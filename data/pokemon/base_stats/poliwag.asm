	db POLIWAG ; 060

	db  40,  50,  40,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/poliwag/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, BULK_UP, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, ICE_BEAM, ICY_WIND, PROTECT, PSYCHIC_M, RAIN_DANCE, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SWAGGER, THIEF, TOXIC, WATERFALL, SURF, LOVELY_KISS, SWEET_KISS, DRAIN_KISS, BODY_SLAM, GROWTH, BUBBLEBEAM
	; end
