	db CHARMELEON ; 005

	db  58,  64,  58,  80,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/charmeleon/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CRUNCH, CUT, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, EARTHQUAKE, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, PROTECT, REFLECT, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
