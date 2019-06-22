	db SLOWPOKE ; 079

	db  90,  65,  65,  15,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db 190 ; catch rate
	db 99 ; base exp
	db NO_ITEM, SLOWPOKETAIL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/slowpoke/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BULLDOZE, CALM_MIND, CURSE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, ICE_BEAM, ICY_WIND, LIGHT_SCREEN, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SAFEGUARD, SHADOW_BALL, SLEEP_TALK, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, TELEPORT, THUNDER_WAVE, TOXIC, SURF, BODY_SLAM, NIGHTMARE, DREAM_EATER, BUBBLEBEAM, DIG
	; end
