	const_def 2 ; object constants

AcroporaCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerHikerVincent:
	trainer HIKER, VINCENT, EVENT_BEAT_HIKER_VINCENT, HikerVincentText, HikerVincentWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerVincentAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerZeke:
	trainer HIKER, ZEKE, EVENT_BEAT_HIKER_ZEKE, HikerZekeText, HikerZekeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerZekeAfterText
	waitbutton
	closetext
	end	
	
TrainerPokefanMDoug:
	trainer POKEFANM, DOUG, EVENT_BEAT_POKEFANM_DOUG, PokefanMDougText, PokefanMDougWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanMDougAfterText
	waitbutton
	closetext
	end
	
AcroporaCave2FBoulder:
	jumpstd strengthboulder
	
HikerVincentText:
	text "I train up here to"
	line "avoid the wild"
	cont "#MON in the"
	cont "lower level."
	done

HikerVincentWinText:
	text "At least I'm not"
	line "in the dark."
	done

HikerVincentAfterText:	
	text "I once stood guard"
	line "in the basement."
	
	para "All of the wild"
	line "#MON ambushes"
	cont "left my team too"
	cont "weak for trainers!"
	done

HikerZekeText:
	text "A GYM challenge in"
	line "a cave."
	
	para "I'm in my element!"
	done

HikerZekeWinText:
	text "I was supposed to"
	line "win! Do over!"
	done

HikerZekeAfterText:
	text "I tell girls that"
	line "I'm a GYM trainer."
	
	para "They just don't"
	line "understand that"
	cont "this cave is"
	cont "pretty much a"
	cont "legitimate GYM!"
	done
	
PokefanMDougText:
	text "You stand no match"
	line "against my duo of"
	cont "trios!"
	done
	
PokefanMDougWinText:
	text "Quality over"
	line "quantity?"
	
	para "No, that's quitter"
	line "talk!"
	done

PokefanMDougAfterText:
	text "Someday my DIGLETT"
	line "will grow strong"
	cont "enough to evolve,"
	cont "then you'll be in"
	cont "for it!"
	
	para "There's no way you"
	line "could handle 12"
	cont "#MON at once!"
	done

AcroporaCave2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 11, ACROPORA_CAVE_1F, 2
	warp_event  3,  7, ACROPORA_CAVE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerHikerVincent, -1
	object_event 14,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanMDoug, -1
	object_event 11,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerHikerZeke, -1
	object_event 16,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave2FBoulder, EVENT_BEAT_ALAN
