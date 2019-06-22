	db ALAKAZAM ; 065

	db  55,  50,  45, 120, 135,  95
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 50 ; catch rate
	db 186 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/alakazam/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm  CALM_MIND, HIDDEN_POWER, TOXIC, SUBMISSION, HEADBUTT, CURSE, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, HYPER_BEAM, THUNDER_WAVE, RETURN, REFLECT, LIGHT_SCREEN, SAFEGUARD, PROTECT, ENDURE, PSYCHIC_M, SHADOW_BALL, TELEPORT, PSYCH_UP, THIEF, SWAGGER, NASTY_PLOT, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, BODY_SLAM, DRAIN_PUNCH, NIGHTMARE, DREAM_EATER, DIG
	; end
