	const_def 2 ; object constants

PavonaPassB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PavonaPassB1FBulldozeGuy:
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
	
PavonaPassTiredHiker:
	jumptextfaceplayer PavonaPassTiredHikerText
	
PavonaPassB1FFocusBand:
	itemball FOCUS_BAND
	
PavonaPassB1FMoonStone:
	itemball MOON_STONE
	
PavonaPassB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_PAVONA_PASS_B1F_HIDDEN_REVIVE
	
PavonaPassB1FHiddenDragonScale:
	hiddenitem DRAGON_SCALE, EVENT_PAVONA_PASS_B1F_HIDDEN_DRAGON_SCALE

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
	
PavonaPassTiredHikerText:
	text "You want a battle?"
	
	para "I'm sorry, I don't"
	line "train #MON."
	
	para "I just like to ex-"
	line "plore."
	
	para "Sometimes I find"
	line "hidden areas."
	done
	
FirebreatherDrewText:
	text "Hey you!"
	
	para "Don't think you"
	line "can sneak past my"
	cont "perfect hearing!"
	done
	
FirebreatherDrewWinText:
	text "The echo in here"
	line "messed with my"
	cont "senses!"
	done
	
FirebreatherDrewAfterText:
	text "I can't see a"
	line "thing with these"
	cont "glasses on."
	
	para "But they look"
	line "totally rad!"
	done
	
PokemaniacDexterText:
	text "My #MON are"
	line "like my family!"
	done
	
PokemaniacDexterWinText:
	text "Win as a family,"
	line "lose as a family."
	done
	
PokemaniacDexterAfterText:
	text "KANGASKHAN takes"
	line "care of us all."
	done
	
SuperNerdPatText:
	text "My concentration"
	line "is unmatched."
	
	para "I have taught this"
	line "to my #MON."
	done
	
SuperNerdPatWinText:
	text "I lost all FOCUS!"
	done
	
SuperNerdPatAfterText:
	text "I heard that some"
	line "trainers far away"
	cont "have taught their"
	cont "#MON to ENDURE"
	cont "hits without the"
	cont "use of a move or"
	cont "item."
	
	para "It sounds like a"
	line "lot of nonsense to"
	cont "me!"
	done
	
HikerCarterText:
	text "Hey you!"
	
	para "Quit slacking and"
	line "pick up a shovel!"
	done
	
HikerCarterWinText:
	text "Oh! You're not one"
	line "of mine!"
	done
	
HikerCarterAfterText:
	text "I have no room for"
	line "slackers in my"
	cont "crew!"
	
	para "We have a job to"
	line "do!"
	done
	
PavonaPassB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 37, 23, PAVONA_PASS_1F, 2
	warp_event 25, 23, PAVONA_PASS_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 22, 19, BGEVENT_ITEM, PavonaPassB1FHiddenRevive
	bg_event 22, 20, BGEVENT_ITEM, PavonaPassB1FHiddenDragonScale

	db 8 ; object events
	object_event 32,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PavonaPassB1FBulldozeGuy, -1
	object_event 16, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherDrew, -1
	object_event 35, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacDexter, -1
	object_event 18, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdPat, -1
	object_event 17,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerCarter, -1
	object_event  7, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PavonaPassTiredHiker, -1
	object_event 19, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaPassB1FFocusBand, EVENT_PAVONA_PASS_B1F_FOCUS_BAND
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaPassB1FMoonStone, EVENT_PAVONA_PASS_B1F_MOON_STONE
