	db EKANS ; 023

	db  35,  60,  44,  55,  40,  54
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 255 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ekans/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, HEADBUTT, CURSE, WATERFALL, LEECH_LIFE, STRENGTH, RETURN, PROTECT, ENDURE, CRUNCH, DRAGONBREATH, SLUDGE_BOMB, EARTHQUAKE, IRON_HEAD, THIEF, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, GIGA_DRAIN, DRAGON_DANCE, BULLDOZE, BODY_SLAM, DIG
	; end
