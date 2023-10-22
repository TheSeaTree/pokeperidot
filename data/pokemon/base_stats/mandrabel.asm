	db MANDRABEL ; 071

	db  80,  70,  75,  90, 105,  70
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FAIRY ; type
	db 45 ; catch rate
	db 191 ; base exp
	db NO_ITEM, PINK_BOW ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/mandrabel/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, LEECH_LIFE, PLAY_ROUGH, PROTECT, REFLECT, REST, RETURN, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, LOVELY_KISS, SWEET_KISS, DRAIN_KISS, BODY_SLAM, GROWTH
	; end
