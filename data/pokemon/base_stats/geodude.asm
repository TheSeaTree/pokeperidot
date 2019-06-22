	db GEODUDE ; 074

	db  40,  80, 100,  20,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 255 ; catch rate
	db 86 ; base exp
	db NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/geodude/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CURSE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, IRON_HEAD, PROTECT, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
