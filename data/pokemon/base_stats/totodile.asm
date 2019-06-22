	db TOTODILE ; 158

	db  50,  65,  64,  43,  44,  48
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/totodile/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, CRUNCH, CUT, DOUBLE_TEAM, DRAGON_DANCE, ENDURE, HEADBUTT, HIDDEN_POWER, ICE_BEAM, ICE_PUNCH, ICY_WIND, PROTECT, RAIN_DANCE, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, SWORDS_DANCE, TOXIC, WATERFALL, SURF, BODY_SLAM, DIG
	; end
