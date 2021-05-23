	db CURSTRAW ; 174

	db  55,  90,  80,  50,  96,  105
	;   hp  atk  def  spd  sat  sdf

	db GHOST, NORMAL ; type
	db 45 ; catch rate
	db 167 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/igglybuff/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, HEADBUTT, CURSE, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, THUNDERBOLT, THUNDER, HYPER_BEAM, THUNDER_WAVE, LEECH_LIFE, RETURN, REFLECT, LIGHT_SCREEN, SAFEGUARD, PROTECT, ENDURE, PSYCHIC_M, SHADOW_BALL, TELEPORT, PSYCH_UP, THIEF, SWAGGER, NASTY_PLOT, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, PLAY_ROUGH, BODY_SLAM, ICY_WIND, NIGHTMARE, DREAM_EATER
	; end
