	db AIPOM ; 190

	db  55,  80,  55,  85,  40,  55
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 94 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/aipom/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm  CRUNCH, HIDDEN_POWER, TOXIC, HEADBUTT, CURSE, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, THUNDERBOLT, THUNDER, HYPER_BEAM, THUNDER_WAVE, STRENGTH, RETURN, SAFEGUARD, PROTECT, ENDURE, SHADOW_BALL, ROCK_SMASH, CUT, THIEF, SWAGGER, NASTY_PLOT, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, SOLARBEAM, BODY_SLAM, DRAIN_PUNCH, NIGHTMARE, DREAM_EATER, DIG
	; end
