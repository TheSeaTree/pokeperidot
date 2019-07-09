	db KOFFING ; 109

	db  40,  65,  95,  35,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/koffing/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FLAMETHROWER, HIDDEN_POWER, PROTECT, RAIN_DANCE, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, TOXIC
	; end
