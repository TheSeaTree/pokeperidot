	const_def 2 ; object constants

OccidentForestSwordsDanceHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SwordsDanceTMGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_SWORDS_DANCE
	iftrue .GotTM
	writetext SwordsDanceTMGuyText
	writebyte SCIZOR
	special FindPartyMonThatSpecies
	iftrue .HaveScizor
	writebyte SCYTHER
	special FindPartyMonThatSpecies
	iffalse .End
	waitbutton
	writetext SwordDanceTMGuyScytherText
	waitbutton
	jump .GiveTM
.HaveScizor
	writetext SwordDanceTMGuyScizorText
	waitbutton
.GiveTM
	verbosegiveitem TM_SWORDS_DANCE
	setevent EVENT_GOT_TM_SWORDS_DANCE
.GotTM
	writetext SwordDanceTMExplainText
.End
	waitbutton
	closetext
	end
	
SwordsDanceTMGuyText:
	text "I have dedicated"
	line "my entire life to"
	cont "mastering the most"
	cont "perfect sword"
	cont "technique."
	
	para "If you would like"
	line "me to share with"
	cont "you, show me you"
	cont "deserve it."
	
	para "I will only allow"
	line "a trainer who can"
	cont "tame a SCYTHER to"
	cont "learn my secrets."
	done
	
SwordDanceTMGuyScytherText:
	text "Ah! You have one!"
	
	para "From one swordsman"
	line "to another, take"
	cont "my TM."
	done
	
SwordDanceTMGuyScizorText:
	text "What? This is"
	line "SCYTHER's next"
	cont "step in evolution?"
	
	para "That's marvelous!"
	
	para "It would be an"
	line "honor for you to"
	cont "take my TM."
	
	para "You have surpassed"
	line "the master."
	done
	
SwordDanceTMExplainText:
	text "My TM contains"
	line "SWORDS DANCE."
	
	para "It will sharpen"
	line "your #MON's"
	cont "claws and double"
	cont "its ATTACK."
	
	para "It combines elega-"
	line "nce with ferocity!"
	done

OccidentForestSwordsDanceHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OCCIDENT_FOREST, 4
	warp_event  4,  7, OCCIDENT_FOREST, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SwordsDanceTMGuy, -1
