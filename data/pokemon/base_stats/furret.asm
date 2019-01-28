	db FURRET ; 162

	db  85,  76,  64,  90,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp
	db BERRY, GOLD_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/furret/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, CRUNCH, CUT, DOUBLE_TEAM, ENDURE, FIRE_PUNCH, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICE_PUNCH, IRON_HEAD, PLAY_ROUGH, PROTECT, RAIN_DANCE, REST, RETURN, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDERPUNCH, TOXIC, SURF, BODY_SLAM
	; end
