	db POLITOED ; 186

	db  90,  75,  75,  70,  90, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 185 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/politoed/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, BULLDOZE, BULK_UP, DOUBLE_TEAM, EARTHQUAKE, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICE_PUNCH, ICY_WIND, PROTECT, PSYCHIC_M, RAIN_DANCE, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, THIEF, TOXIC, WATERFALL, SURF, LOVELY_KISS, SWEET_KISS, DRAIN_KISS, BODY_SLAM, GROWTH, BUBBLEBEAM, DIG
	; end
