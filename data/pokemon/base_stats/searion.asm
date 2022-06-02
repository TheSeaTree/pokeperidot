	db SEARION ; 107

	db  70,  75,  74,  55,  86, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIRE ; type
	db 45 ; catch rate
	db 88 ; base exp
	db NO_ITEM, CHARCOAL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/searion/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, CURSE, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PLAY_ROUGH, PROTECT, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SAFEGUARD, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, TOXIC, WATERFALL, SURF, DRAIN_KISS, BODY_SLAM, GROWTH, BUBBLEBEAM
	; end
