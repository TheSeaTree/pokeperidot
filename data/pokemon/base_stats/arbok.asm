	db ARBOK ; 024

	db  60,  95,  69,  80,  65,  79
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/arbok/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, TOXIC, HEADBUTT, CURSE, WATERFALL, HYPER_BEAM, LEECH_LIFE, STRENGTH, RETURN, PROTECT, ENDURE, CRUNCH, DRAGONBREATH, SLUDGE_BOMB, EARTHQUAKE, IRON_HEAD, THIEF, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, GIGA_DRAIN, DRAGON_DANCE, BULLDOZE, BODY_SLAM
	; end
