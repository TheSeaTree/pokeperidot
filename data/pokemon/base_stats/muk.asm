	db MUK ; 089

	db 105, 105,  75,  50,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 75 ; catch rate
	db 157 ; base exp
	db NO_ITEM, BLACK_SLUDGE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/muk/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CRUNCH, CURSE, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, ICE_PUNCH, PROTECT, RAIN_DANCE, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
