	db ARCANINE ; 059

	db  90, 110,  80,  95, 100,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 213 ; base exp
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/arcanine/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, ROAR, TOXIC, SUBMISSION, HEADBUTT, FLAMETHROWER, FIRE_BLAST, HYPER_BEAM, STRENGTH, RETURN, REFLECT, SAFEGUARD, PROTECT, ENDURE, CRUNCH, DRAGONBREATH, TELEPORT, ROCK_SMASH, IRON_HEAD, THIEF, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, SOLARBEAM, BULLDOZE, PLAY_ROUGH, BODY_SLAM, DIG
	; end
