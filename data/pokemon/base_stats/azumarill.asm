	db AZUMARILL ; 184

	db 100,  50,  80,  60,  50,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 75 ; catch rate
	db 153 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, SUBMISSION, HEADBUTT, CURSE, ICE_PUNCH, ICE_BEAM, BLIZZARD, WATERFALL, HYPER_BEAM, ICY_WIND, STRENGTH, RETURN, PROTECT, ENDURE, ROCK_SMASH, IRON_HEAD, WHIRLPOOL, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, RAIN_DANCE, BULLDOZE, PLAY_ROUGH, SURF, BODY_SLAM, BUBBLEBEAM, DIG, DRAIN_KISS, DRAIN_PUNCH
	; end
