	db NIDORAN_M ; 032

	db  46,  57,  40,  50,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/nidoran_m/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, CRUNCH, CUT, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, ICE_BEAM, PLAY_ROUGH, PROTECT, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SLIDE, SLEEP_TALK, SLUDGE_BOMB, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, TOXIC, LOVELY_KISS, SWEET_KISS, BODY_SLAM, DIG
	; end
