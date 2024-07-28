	db MALLARK_Y ; 172

	db  92, 106,  75,  80,  63,  82
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 179 ; base exp
	db STICK, STICK ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/mallark_y/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, CUT, DOUBLE_TEAM, ENDURE, FLY, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, PROTECT, REFLECT, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SUBMISSION, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, BODY_SLAM
	; end
