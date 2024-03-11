	db ARIADOS ; 168

	db  70,  90,  70,  40,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 90 ; catch rate
	db 134 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ariados/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, HYPER_BEAM, LEECH_LIFE, RETURN, PROTECT, ENDURE, PSYCHIC_M, SLUDGE_BOMB, ROCK_SMASH, IRON_HEAD, THIEF, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, STRENGTH, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SWORDS_DANCE, BULLDOZE, BODY_SLAM, GROWTH, DIG
	; end
