	db CHARIZARD ; 006

	db  78,  84,  78, 100, 109,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/charizard/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CRUNCH, CUT, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, EARTHQUAKE, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, FLY, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, PROTECT, REFLECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
