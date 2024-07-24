	db CELEBI ; 251

	db 100, 100, 100, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, GRASS ; type
	db 3 ; catch rate
	db 64 ; base exp
	db LEGENDS_AURA, GOLD_BERRY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/celebi/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CALM_MIND, CUT, DOUBLE_TEAM, EARTHQUAKE, ENDURE, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, NASTY_PLOT, PLAY_ROUGH, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SAFEGUARD, SANDSTORM, SHADOW_BALL, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TELEPORT, THUNDER_WAVE, TOXIC, HEAL_BELL, NIGHTMARE, DREAM_EATER
	; end
