	db MANKEY ; 056

	db  40,  80,  35,  70,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/mankey/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, BULK_UP, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, ICE_PUNCH, PLAY_ROUGH, PROTECT, PSYCH_UP, RAIN_DANCE, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
