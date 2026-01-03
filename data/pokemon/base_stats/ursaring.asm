	db URSARING ; 217

	db  90, 130,  75,  55,  75,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 60 ; catch rate
	db 189 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ursaring/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, BULK_UP, CRUNCH, CUT, DOUBLE_TEAM, DRAIN_PUNCH, EARTHQUAKE, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_PUNCH, PLAY_ROUGH, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
