	db GOLBAT ; 042

	db  75,  80,  70,  90,  65,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/golbat/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CRUNCH, CURSE, DOUBLE_TEAM, ENDURE, FLY, GIGA_DRAIN, HIDDEN_POWER, HURRICANE, LEECH_LIFE, NASTY_PLOT, PROTECT, RAIN_DANCE, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, TOXIC
	; end
