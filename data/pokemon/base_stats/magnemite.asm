	db MAGNEMITE ; 081

	db  25,  35,  70,  45,  95,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 190 ; catch rate
	db 89 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/magnemite/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, IRON_HEAD, LIGHT_SCREEN, PROTECT, PSYCH_UP, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SUBSTITUTE, SUNNY_DAY, SWAGGER, TELEPORT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC
	; end
