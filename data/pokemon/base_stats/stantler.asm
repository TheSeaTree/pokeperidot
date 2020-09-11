	db STANTLER ; 234

	db  73,  95,  62,  85,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 165 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/stantler/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CALM_MIND, DOUBLE_TEAM, EARTHQUAKE, ENDURE, HEADBUTT, HIDDEN_POWER, LIGHT_SCREEN, PROTECT, PSYCHIC_M, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, SHADOW_BALL, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, STRENGTH, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, BODY_SLAM, NIGHTMARE, DREAM_EATER
	; end
