	db ONIX ; 095

	db  35,  85, 160,  70,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/onix/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CRUNCH, CURSE, DOUBLE_TEAM, DRAGON_DANCE, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, IRON_HEAD, PROTECT, PSYCH_UP, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SLEEP_TALK, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, TOXIC, BODY_SLAM, DIG
	; end
