	db DRAGONAIR ; 148

	db  61,  84,  65,  70,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp
	db NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 40 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonair/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, ATTRACT, BLIZZARD, BULLDOZE, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, ENDURE, FIRE_BLAST, FLAMETHROWER, FLY, HEADBUTT, HIDDEN_POWER, ICE_BEAM, ICY_WIND, IRON_HEAD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SLIDE, SAFEGUARD, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, WATERFALL, SURF, BODY_SLAM, BUBBLEBEAM
	; end
