	db ANCOR ; 055

	db  80,  95, 100,  50,  80,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, STEEL ; type
	db 75 ; catch rate
	db 174 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ancor/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, ROAR, TOXIC, HEADBUTT, CURSE, ICE_BEAM, BLIZZARD, WATERFALL, HYPER_BEAM, ICY_WIND, STRENGTH, RETURN, PROTECT, ENDURE, CRUNCH, SLUDGE_BOMB, ROCK_SMASH, EARTHQUAKE, IRON_HEAD, THIEF, WHIRLPOOL, SWAGGER, SUBSTITUTE, SUBMISSION, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, RAIN_DANCE, SWORDS_DANCE, BULLDOZE, SURF, WATERFALL, BUBBLEBEAM
	; end
