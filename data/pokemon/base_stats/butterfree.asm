	db BUTTERFREE ; 012

	db  60,  45,  50,  70,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 160 ; base exp
	db GLOW_SCALES, SILVERPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/butterfree/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, DOUBLE_TEAM, ENDURE, FLY, GIGA_DRAIN, HIDDEN_POWER, HURRICANE, HYPER_BEAM, LIGHT_SCREEN, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SAFEGUARD, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, TELEPORT, THIEF, TOXIC, NIGHTMARE, DREAM_EATER, DRAIN_KISS
	; end
