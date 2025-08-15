	db SNOWMAD ; 176

	db  65, 105,  95, 105,  95,  70
	;   hp  atk  def  spd  sat  sdf

	db ICE, DARK ; type
	db 75 ; catch rate
	db 124 ; base exp
	db NO_ITEM, QUICK_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/snowmad/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BULLDOZE, BULK_UP, CRUNCH, CURSE, CUT, DOUBLE_TEAM, EARTHQUAKE, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICE_PUNCH, ICY_WIND, IRON_HEAD, NASTY_PLOT, PLAY_ROUGH, PROTECT, PSYCH_UP, RAIN_DANCE, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SWAGGER, SWORDS_DANCE, THIEF, THUNDERPUNCH, TOXIC, BODY_SLAM, DRAIN_PUNCH, GROWTH, DREAM_EATER, BUBBLEBEAM, DIG
	; end
