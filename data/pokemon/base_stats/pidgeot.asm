	db PIDGEOT ; 018

	db  83,  80,  75,  101,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/pidgeot/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, DOUBLE_TEAM, ENDURE, FLY, HIDDEN_POWER, HURRICANE, HYPER_BEAM, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, TOXIC
	; end
