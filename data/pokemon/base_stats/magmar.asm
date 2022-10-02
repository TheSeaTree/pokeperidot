	db MAGMAR ; 126

	db  65,  95,  57,  93, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 167 ; base exp
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/magmar/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, NASTY_PLOT, PROTECT, PSYCHIC_M, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, TELEPORT, THIEF, THUNDERPUNCH, TOXIC, BODY_SLAM, DRAIN_PUNCH
	; end
