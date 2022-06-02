	db PINECO ; 204

	db  50,  65,  90,  15,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 190 ; catch rate
	db 60 ; base exp
	db FOCUS_SASH, FOCUS_SASH ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/pineco/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, LIGHT_SCREEN, PROTECT, REFLECT, REST, RETURN, ROCK_SLIDE, SANDSTORM, SLEEP_TALK, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER_WAVE, TOXIC, BODY_SLAM, DIG
	; end
