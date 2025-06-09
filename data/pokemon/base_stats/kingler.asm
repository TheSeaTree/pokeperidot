	db KINGLER ; 099

	db  55, 130, 115,  75,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/kingler/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, BULLDOZE, CUT, DOUBLE_TEAM, EARTHQUAKE, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, LEECH_LIFE, PROTECT, RAIN_DANCE, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, WATERFALL, SURF, BODY_SLAM, BUBBLEBEAM, DIG
	; end
