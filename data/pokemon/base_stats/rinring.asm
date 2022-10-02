	db RINRING ; 019

	db  50,  50,  35,  75,  35,  30
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 255 ; catch rate
	db 57 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/rinring/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CRUNCH, CUT, DOUBLE_TEAM, ENDURE, HIDDEN_POWER, ICY_WIND, NASTY_PLOT, PLAY_ROUGH, PROTECT, PSYCH_UP, RAIN_DANCE, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, TOXIC, BODY_SLAM, HEAL_BELL, NIGHTMARE, DREAM_EATER, DIG
	; end
