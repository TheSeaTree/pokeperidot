	db RAIKOU ; 243

	db  90,  85,  75, 115, 115, 100
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 3 ; catch rate
	db 216 ; base exp
	db LEGENDS_AURA, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 80 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/raikou/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm BULLDOZE, CALM_MIND, CRUNCH, CUT, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, IRON_HEAD, LIGHT_SCREEN, PROTECT, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SANDSTORM, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, BODY_SLAM, DIG
	; end
