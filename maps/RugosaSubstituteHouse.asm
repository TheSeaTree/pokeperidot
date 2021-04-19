	const_def 2 ; object constants
	const SUBHOUSE_GUY
	
RugosaSubstituteHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SubstituteGuyScript:
	faceplayer
	checkevent EVENT_GOT_TM_SUBSTITUTE
	iftrue .GotSubstitute
	opentext
	writetext SubstituteDollText
	waitbutton
	applymovement SUBHOUSE_GUY, SubstituteDollSpin
	variablesprite SPRITE_SUBSTITUTE_GUY, SPRITE_COOLTRAINER_M
	special LoadUsedSpritesGFX
	faceplayer
	opentext
	writetext SubstituteGuyText
	waitbutton
	verbosegiveitem TM_SUBSTITUTE
	closetext
	setevent EVENT_GOT_TM_SUBSTITUTE
	applymovement SUBHOUSE_GUY, SubstituteDollSpin
	variablesprite SPRITE_SUBSTITUTE_GUY, SPRITE_MONSTER
	special LoadUsedSpritesGFX
	faceplayer
.GotSubstitute
	opentext
	writetext SubstituteGuyAfterText
	waitbutton
	closetext
	end
	
SubstituteDollSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_resume

SubstituteDollText:
	text "Oh, hello there."
	
	para "What? I'm not a"
	line "talking doll, I'm"
	cont "simply hiding"
	cont "behind the doll."
	
	para "One moment,"
	line "please."
	done
	
SubstituteGuyText:
	text "See? I'm perfectly"
	line "…er mostly normal."
	
	para "I was mimicking a"
	line "move called"
	cont "SUBSTITUTE."
	
	para "Never heard of it?"
	line "Well, it lets your"
	cont "#MON spend a"
	cont "portion of its HP"
	cont "to create a doll"
	cont "to absorb hits for"
	cont "it."
	
	para "The doll can even"
	line "block status con-"
	cont "ditions!"
	
	para "Please, take one"
	line "of my SUBSTITUTE"
	cont "TMs!"
	cont "I would be happy"
	cont "to share!"
	done
	
SubstituteGuyAfterText:
	text "I may look like a"
	line "COOLTRAINER, but I"
	cont "don't like looking"
	cont "people in the eye."
	
	para "Hiding behind my"
	line "doll helps me to"
	cont "avoid facing"
	cont "them!"
	done
	
RugosaSubstituteHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUGOSA_CITY, 8
	warp_event  3,  7, RUGOSA_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_SUBSTITUTE_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SubstituteGuyScript, -1
