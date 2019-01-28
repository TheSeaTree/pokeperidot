	db EXEGGUTOR ; 103

	db  95,  95,  85,  55, 125,  85
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC ; type
	db 45 ; catch rate
	db 212 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/exeggutor/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CURSE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FLAMETHROWER, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PROTECT, PSYCHIC_M, PSYCH_UP, REFLECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TELEPORT, THIEF, TOXIC, NIGHTMARE, DREAM_EATER
	; end
