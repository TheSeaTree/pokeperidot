	db DUNSPARCE ; 206

	db 100,  70,  70,  45,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 190 ; catch rate
	db 75 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dunsparce/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BULLDOZE, BULK_UP, CALM_MIND, CRUNCH, CURSE, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, FLY, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, IRON_HEAD, PROTECT, PSYCH_UP, RAIN_DANCE, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, BODY_SLAM, NIGHTMARE, DREAM_EATER
	; end
