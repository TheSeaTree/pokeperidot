	db MISDREAVUS ; 200

	db  60,  60,  60,  85,  85,  85
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 147 ; base exp
	db NO_ITEM, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/misdreavus/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CALM_MIND, CURSE, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICY_WIND, NASTY_PLOT, PLAY_ROUGH, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, HEAL_BELL, NIGHTMARE, DREAM_EATER
	; end
