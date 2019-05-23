	db LAPRAS ; 131

	db 130,  85,  80,  60,  85,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 40 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/lapras/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, BULLDOZE, CURSE, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_HEAD, PROTECT, PSYCHIC_M, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SAFEGUARD, SLEEP_TALK, STRENGTH, SUBSTITUTE, SWAGGER, THUNDER, THUNDERBOLT, TOXIC, WATERFALL, SURF, BODY_SLAM, HEAL_BELL, NIGHTMARE, DREAM_EATER, BUBBLEBEAM
	; end
