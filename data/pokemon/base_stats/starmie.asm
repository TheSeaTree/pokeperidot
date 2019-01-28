	db STARMIE ; 121

	db  60,  75,  85, 115, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db 60 ; catch rate
	db 207 ; base exp
	db STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/starmie/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm WHIRLPOOL, BLIZZARD, DOUBLE_TEAM, ENDURE, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, LIGHT_SCREEN, NASTY_PLOT, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SWAGGER, TELEPORT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, WATERFALL, SURF, NIGHTMARE, DREAM_EATER, BUBBLEBEAM
	; end
