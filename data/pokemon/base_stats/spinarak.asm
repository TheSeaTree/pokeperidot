	db SPINARAK ; 167

	db  40,  60,  40,  30,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/spinarak/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, LEECH_LIFE, RETURN, PROTECT, ENDURE, PSYCHIC_M, SLUDGE_BOMB, IRON_HEAD, THIEF, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SWORDS_DANCE, BULLDOZE, BODY_SLAM, GROWTH
	; end
