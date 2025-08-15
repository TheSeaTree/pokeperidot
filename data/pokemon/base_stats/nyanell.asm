	db NYANELL ; 020

	db  60,  90,  60,  110,  65,  55
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 90 ; catch rate
	db 116 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/nyanell/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CRUNCH, CUT, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICY_WIND, IRON_HEAD, NASTY_PLOT, PLAY_ROUGH, PROTECT, PSYCH_UP, RAIN_DANCE, REST, RETURN, ROAR, SHADOW_BALL, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, THUNDER, THUNDERBOLT, TOXIC, BODY_SLAM, HEAL_BELL, NIGHTMARE, DREAM_EATER, DIG
	; end
