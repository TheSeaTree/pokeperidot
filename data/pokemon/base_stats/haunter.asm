	db HAUNTER ; 093

	db  45,  50,  45,  95, 115,  55
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/haunter/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, DOUBLE_TEAM, ENDURE, FIRE_PUNCH, GIGA_DRAIN, HIDDEN_POWER, ICE_PUNCH, ICY_WIND, NASTY_PLOT, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, TOXIC, NIGHTMARE, DREAM_EATER
	; end
