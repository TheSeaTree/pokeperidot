	db JUMPLUFF ; 189

	db  75,  55,  70, 110,  55,  95
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING ; type
	db 45 ; catch rate
	db 176 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/jumpluff/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HURRICANE, HYPER_BEAM, PLAY_ROUGH, PROTECT, PSYCH_UP, REFLECT, REST, RETURN, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TOXIC
	; end
