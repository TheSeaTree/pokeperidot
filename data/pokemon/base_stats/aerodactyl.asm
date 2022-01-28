	db AERODACTYL ; 142

	db  80, 105,  65, 130,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp
	db NO_ITEM, X_ATTACK ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 35 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/aerodactyl/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER, ROAR, TOXIC, HEADBUTT, CURSE, FLAMETHROWER, FIRE_BLAST, HURRICANE, WATERFALL, HYPER_BEAM, STRENGTH, RETURN, REFLECT, PROTECT, ENDURE, CRUNCH, DRAGONBREATH, ROCK_SMASH, FLY, ROCK_SLIDE, EARTHQUAKE, IRON_HEAD, THIEF, WHIRLPOOL, SWAGGER, SUBSTITUTE, REST, SLEEP_TALK, ATTRACT, DOUBLE_TEAM, SUNNY_DAY, RAIN_DANCE, SANDSTORM, DRAGON_DANCE, BULLDOZE
	; end
