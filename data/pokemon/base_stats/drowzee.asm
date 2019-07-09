	db DROWZEE ; 096

	db  60,  48,  45,  42,  43,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 190 ; catch rate
	db 102 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/drowzee/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CALM_MIND, DOUBLE_TEAM, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, ICE_PUNCH, LIGHT_SCREEN, NASTY_PLOT, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SAFEGUARD, SHADOW_BALL, SLEEP_TALK, SUBMISSION, SUBSTITUTE, SWAGGER, TELEPORT, THIEF, THUNDERPUNCH, THUNDER_WAVE, TOXIC, BODY_SLAM, DRAIN_PUNCH, NIGHTMARE, DREAM_EATER
	; end
