	db DONPHAN ; 232

	db  90, 120, 120,  50,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 60 ; catch rate
	db 189 ; base exp
	db FOCUS_SASH, FOCUS_SASH ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/donphan/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BULLDOZE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, PLAY_ROUGH, PROTECT, REST, RETURN, ROAR, ROCK_SLIDE, ROCK_SMASH, SANDSTORM, SLEEP_TALK, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, TOXIC, BODY_SLAM
	; end
