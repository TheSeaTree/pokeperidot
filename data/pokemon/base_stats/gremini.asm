	db GREMINI ; 237

	db  50,  60,  80,  50,  60,  80
	;   hp  atk  def  spd  sat  sdf

	db GHOST, DARK ; type
	db 90 ; catch rate
	db 162 ; base exp
	db NO_ITEM, SMOKE_BALL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/gremini/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CALM_MIND, BULK_UP, HIDDEN_POWER, TOXIC, HEADBUTT, CURSE, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, THUNDERBOLT, THUNDER, HYPER_BEAM, THUNDER_WAVE, ICY_WIND, RETURN, REFLECT, LIGHT_SCREEN, SAFEGUARD, PROTECT, ENDURE, PSYCHIC_M, SHADOW_BALL, TELEPORT, SLUDGE_BOMB, IRON_HEAD, THIEF, SWAGGER, NASTY_PLOT, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, SANDSTORM, SOLARBEAM, BULLDOZE, PLAY_ROUGH, NIGHTMARE, DREAM_EATER
	; end
