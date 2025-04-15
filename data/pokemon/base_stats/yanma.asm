	db YANMA ; 193

	db  65,  65,  45,  95,  75,  45
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 75 ; catch rate
	db 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/yanma/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DOUBLE_TEAM, DRAGONBREATH, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HURRICANE, HYPER_BEAM, LEECH_LIFE, PROTECT, PSYCHIC_M, PSYCH_UP, REST, RETURN, ROAR, SHADOW_BALL, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, SWEET_KISS, DREAM_EATER
	; end
