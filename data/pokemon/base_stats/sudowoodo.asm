	db SUDOWOODO ; 185

	db  70, 100, 115,  30,  30,  65
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 65 ; catch rate
	db 135 ; base exp
	db FOCUS_SASH, FOCUS_SASH ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/sudowoodo/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, CALM_MIND, CURSE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_PUNCH, HEADBUTT, HIDDEN_POWER, ICE_PUNCH, PROTECT, PSYCH_UP, REST, RETURN, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SLEEP_TALK, STRENGTH, SUBSTITUTE, SUBMISSION, SUNNY_DAY, SWAGGER, THIEF, THUNDERPUNCH, TOXIC, BODY_SLAM, DIG
	; end
