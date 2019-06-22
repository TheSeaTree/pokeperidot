	db ENTEI ; 244

	db 115, 115,  85, 100,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 3 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 80 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/entei/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm BULLDOZE, BULK_UP, CALM_MIND, CRUNCH, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, IRON_HEAD, PLAY_ROUGH, PROTECT, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SANDSTORM, SHADOW_BALL, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, TOXIC, BODY_SLAM, DIG
	; end
