	const_def 2 ; object constants
	const PalerockCaveB1F_POKE_BALL1
	const PalerockCaveB1F_POKE_BALL2
	const PalerockCaveB1F_POKE_BALL3

PalerockCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerHikerOmar:
	trainer HIKER, OMAR, EVENT_BEAT_HIKER_OMAR, HikerOmarText, HikerOmarWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerOmarAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerDean:
	trainer HIKER, DEAN, EVENT_BEAT_HIKER_DEAN, HikerDeanText, HikerDeanWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDeanAfterText
	waitbutton
	closetext
	end	
	
TrainerBlackbeltClint:
	trainer BLACKBELT_T, CLINT, EVENT_BEAT_BLACKBELT_CLINT, BlackbeltClintText, BlackbeltClintWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltClintAfterText
	waitbutton
	closetext
	end	
	
TrainerFirebreatherRobin:
	trainer FIREBREATHER, ROBIN, EVENT_BEAT_FIREBREATHER_ROBIN, FirebreatherRobinText, FirebreatherRobinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebeatherRobinAfterText
	waitbutton
	closetext
	end	

TrainerBikerJared:
	trainer BIKER, JARED, EVENT_BEAT_BIKER_JARED, BikerJaredText, BikerJaredWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJaredAfterText
	waitbutton
	closetext
	end	

PalerockCaveB1FFocusSash:
	itemball FOCUS_SASH

PalerockCaveB1FPPUp:
	itemball PP_UP

PalerockCaveB1FRevive:
	itemball REVIVE

BikerJaredText:
	text "It doesn't matter"
	line "how I got my bike"
	cont "down here!"
	done
	
BikerJaredWinText:
	text "I don't need any"
	line "help getting it"
	cont "out, either!"
	done
	
BikerJaredAfterText:
	text "What? No, I'm just"
	line "staying here"
	cont "because I want to."
	done
	
FirebreatherRobinText:
	text "Are you having"
	line "trouble seeing?"
	
	para "Let me light"
	line "you up!"
	done
	
FirebreatherRobinWinText:
	text "Hey! Where'd you"
	line "go?"
	done
	
FirebeatherRobinAfterText:
	text "My #MON were"
	line "my only source of"
	cont "light."
	done
	
HikerOmarText:
	text "It's so calm and"
	line "cool down here."
	
	para "Let's change that."
	done
	
HikerOmarWinText:
	text "I want to go back"
	line "to how it was now!"
	done
	
HikerOmarAfterText:
	text "I much prefer the"
	line "quiet if it means"
	cont "I don't need to"
	cont "lose a #MON"
	cont "battle."
	done
	
HikerDeanText:
	text "You walked all the"
	line "way around the"
	cont "coastline to get"
	cont "here?"
	done

HikerDeanWinText:
	text "My hiking skills"
	line "have been shown up"
	cont "by a kid!"
	done

HikerDeanAfterText:
	text "My motto is to"
	line "always work smart-"
	cont "er, not harder."
	
	para "Efficiency is key"
	line "to a good hike."
	done
	
BlackbeltClintText:
	text "I'd like to see"
	line "you try and break"
	cont "through me!"
	done
	
BlackbeltClintWinText:
	text "Ah! No!"
	
	para "My secret tech-"
	line "nique!"
	done

BlackbeltClintAfterText:
	text "A FOCUS SASH will"
	line "allow your #MON"
	cont "to endure any one"
	cont "hit at full HP."
	
	para "Be careful, if it"
	line "breaks you cannot"
	cont "use it again."
	done

PalerockCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 29,  5, PALEROCK_CAVE_1F, 3
	warp_event 37, 11, PALEROCK_CAVE_1F, 4
	warp_event 27, 21, PALEROCK_CAVE_1F, 5
	warp_event 33, 25, PALEROCK_CAVE_1F, 6
	warp_event  7,  3, PALEROCK_CAVE_B2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 21, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerHikerOmar, -1
	object_event 18, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerDean, -1
	object_event 24, 24, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherRobin, -1
	object_event 16, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltClint, -1
	object_event 30, 21, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerJared, -1
	object_event 16, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockCaveB1FFocusSash, EVENT_ROCK_TUNNEL_B1F_FOCUS_SASH
	object_event 19,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockCaveB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 21, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockCaveB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
