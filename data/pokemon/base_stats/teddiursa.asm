	db TEDDIURSA ; 216

	db  60,  80,  50,  40,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 120 ; catch rate
	db 124 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/teddiursa/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, BULK_UP, CRUNCH, CUT, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, ICE_PUNCH, PLAY_ROUGH, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
