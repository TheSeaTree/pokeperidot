	db MARILL ; 183

	db  70,  20,  50,  40,  20,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 190 ; catch rate
	db 58 ; base exp
	db NO_ITEM, LIGHT_BUOY ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/marill/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, SUBMISSION, HEADBUTT, CURSE, ICE_PUNCH, ICE_BEAM, BLIZZARD, WATERFALL, HYPER_BEAM, ICY_WIND, STRENGTH, RETURN, PROTECT, ENDURE, ROCK_SMASH, IRON_HEAD, WHIRLPOOL, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, RAIN_DANCE, BULLDOZE, PLAY_ROUGH, SURF, BODY_SLAM, BUBBLEBEAM, DIG
	; end
