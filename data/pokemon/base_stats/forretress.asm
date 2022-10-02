	db FORRETRESS ; 205

	db  75,  90, 140,  40,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db 75 ; catch rate
	db 118 ; base exp
	db FOCUS_SASH, FOCUS_SASH ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/forretress/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, IRON_HEAD, LIGHT_SCREEN, PROTECT, REFLECT, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SLEEP_TALK, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER_WAVE, TOXIC, BODY_SLAM, DIG
	; end
