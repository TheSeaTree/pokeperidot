	db FERRODON ; 248

	db  77,  90, 100,  53,  75,  90
	;   hp  atk  def  spd  sat  sdf

	db STEEL, DRAGON ; type
	db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ferrodon/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm BULLDOZE, CRUNCH, CURSE, CUT, DOUBLE_TEAM, DRAGONBREATH, DRAGON_DANCE, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, IRON_HEAD, PROTECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SLEEP_TALK, STRENGTH, SUBSTITUTE, SWAGGER, SWORDS_DANCE, THUNDER_WAVE, TOXIC, WATERFALL, SURF, BODY_SLAM, DIG
	; end
