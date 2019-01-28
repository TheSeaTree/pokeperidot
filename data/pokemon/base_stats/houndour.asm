	db HOUNDOUR ; 228

	db  45,  60,  30,  65,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 120 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/houndour/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CRUNCH, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, NASTY_PLOT, PLAY_ROUGH, PROTECT, REST, RETURN, ROAR, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, SLUDGE_BOMB, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, TOXIC, BODY_SLAM, DESTINY_BOND, NIGHTMARE, DREAM_EATER
	; end
