	const_def 2 ; object constants

UnionCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UnionCaveB1FBulldozeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_BULLDOZE
	iftrue .GotTM
	writetext BulldozeGuyLookingForDiglett
	waitbutton
	yesorno
	iftrue .GenderCheck
	writetext BulldozeGuyNo
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.GenderCheck
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext BulldozeGuyYesBoy
	jump .GiveTM
.Girl
	writetext BulldozeGuyYesGirl
.GiveTM
	waitbutton
	writetext BulldozeGuyGiveTM
	waitbutton
	verbosegiveitem TM_BULLDOZE
	setevent EVENT_GOT_TM_BULLDOZE
	writetext BulldozeTMExplain
	waitbutton
	closetext
	end

.GotTM
	writetext BulldozeGuyAfter
	waitbutton
	closetext
	end
	
TrainerFirebreatherDrew:
	trainer FIREBREATHER, DREW, EVENT_BEAT_FIREBREATHER_DREW, FirebreatherDrewText, FirebreatherDrewWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherDrewAfterText
	waitbutton
	closetext
	end		

TrainerPokemaniacDexter:
	trainer POKEMANIAC, DEXTER, EVENT_BEAT_POKEMANIAC_DEXTER, PokemaniacDexterText, PokemaniacDexterWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDexterAfterText
	waitbutton
	closetext
	end		

TrainerSuperNerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SuperNerdPatText, SuperNerdPatWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdPatAfterText
	waitbutton
	closetext
	end		

TrainerHikerCarter:
	trainer HIKER, CARTER, EVENT_BEAT_HIKER_CARTER, HikerCarterText, HikerCarterWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerCarterAfterText
	waitbutton
	closetext
	end		

BulldozeGuyLookingForDiglett:
	text "Augh…"
	
	para "Digging out this"
	line "cave is hard work."
	
	para "I'm about to hang"
	line "up my hard hat for"
	cont "good."
	
	para "If I skipped out"
	line "without finishing"
	cont "this tunnel, I can"
	cont "trust the boss"
	cont "won't find out,"
	cont "right?"
	done
	
BulldozeGuyYesBoy:
	text "Attaboy!"
	done
	
BulldozeGuyYesGirl:
	text "Attagirl!"
	done
	
BulldozeGuyGiveTM:
	text "Just to make sure"
	line "you don't blab to"
	cont "the boss, take"
	cont "this gift."
	done
	
BulldozeTMExplain:
	text "That move is"
	line "called BULLDOZE."
	
	para "My #MON used it"
	line "to stamp out the"
	cont "cave's floor."
	
	para "I won't be needing"
	line "it anymore. I'm"
	cont "quitting the"
	cont "mining business!"
	done
	
BulldozeGuyAfter:
	text "Ah!"
	
	para "Now I can relax"
	line "with a nice cold"
	cont "SODA POP!"
	done
	
BulldozeGuyNo:
	text "…Then you didn't"
	line "hear anything."
	
	para "I'm just working"
	line "on this tunnel."
	done
	
FirebreatherDrewText:
	text "I am a"
	line "#MON trainer."
	done
	
FirebreatherDrewWinText:
	text "I lost."
	done
	
FirebreatherDrewAfterText:
	text "I lost."
	done
	
PokemaniacDexterText:
	text "I am a"
	line "#MON trainer."
	done
	
PokemaniacDexterWinText:
	text "I lost."
	done
	
PokemaniacDexterAfterText:
	text "I lost."
	done
	
SuperNerdPatText:
	text "I am a"
	line "#MON trainer."
	done
	
SuperNerdPatWinText:
	text "I lost."
	done
	
SuperNerdPatAfterText:
	text "I lost."
	done
	
HikerCarterText:
	text "I am a"
	line "#MON trainer."
	done
	
HikerCarterWinText:
	text "I lost."
	done
	
HikerCarterAfterText:
	text "I lost."
	done
	
UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 37, 23, UNION_CAVE_1F, 2
	warp_event 25, 23, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 32,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBulldozeGuy, -1
	object_event 16, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherDrew, -1
	object_event 35, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacDexter, -1
	object_event 18, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdPat, -1
	object_event 17,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerCarter, -1
	object_event 19, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Item
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Item
