	const_def 2 ; object constants

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerPokefanMDoug:
	trainer POKEFANM, DOUG, EVENT_BEAT_POKEFANM_DOUG, PokefanMDougText, PokefanMDougWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokefanMDougAfterText
	waitbutton
	closetext
	end
	
TrainerFirebreatherWayne:
	trainer FIREBREATHER, WAYNE, EVENT_BEAT_FIREBREATHER_WAYNE, FirebreatherWayneText, FirebreatherWayneWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherWayneAfterText
	waitbutton
	closetext
	end
	
TrainerPokemaniacTyler:
	trainer POKEMANIAC, TYLER, EVENT_BEAT_POKEMANIAC_TYLER, PokemaniacTylerText, PokemaniacTylerWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokemaniacTylerAfterText
	waitbutton
	closetext
	end

BirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoyText, BirdKeeperRoyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterText
	waitbutton
	closetext
	end

BikerJesse:
	trainer BIKER, JESSE, EVENT_BEAT_BIKER_JESSE, BikerJesseText, BikerJesseWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BikerJesseAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerAngie:
	trainer SWIMMERF, ANGIE, EVENT_BEAT_SWIMMER_ANGIE, SwimmerAngieText, SwimmerAngieWinText, 0, .AfterScript
	
.AfterScript
	endifjustbattled
	opentext
	writetext SwimmerAngieAfterText
	waitbutton
	closetext
	end
	
TrainerFisherDerrick:
	trainer FISHER, DERRICK, EVENT_BEAT_FISHER_DERRICK, FisherDerrickText, FisherDerrickWinText, 0, .AfterScript
	
.AfterScript
	endifjustbattled
	opentext
	writetext FisherDerrickAfterText
	waitbutton
	closetext
	end
	
TrainerLadDevin:
	trainer LAD, DEVIN, EVENT_BEAT_LAD_DEVIN, LadDevinText, LadDevinWinText, 0, .AfterScript
	
.AfterScript
	endifjustbattled
	opentext
	writetext LadDevinAfterText
	waitbutton
	closetext
	end
	
TrainerPokefanMRichard:
	trainer POKEFANM, RICHARD, EVENT_BEAT_POKEFANM_RICHARD, PokefanMRichardText, PokefanMRichardWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokefanMRichardAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerMLucas:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_LUCAS
	iftrue .FightDone
	checkevent EVENT_BEAT_FIREBREATHER_WAYNE
	iffalse .Explain
	checkevent EVENT_BEAT_POKEMANIAC_TYLER
	iffalse .Explain
	checkevent EVENT_BEAT_POKEFANM_DOUG
	iffalse .Explain
	checkevent EVENT_BEAT_BIRD_KEEPER_ROY
	iffalse .Explain
	checkevent EVENT_BEAT_BIKER_JESSE
	iffalse .Explain
	checkevent EVENT_BEAT_SWIMMER_ANGIE
	iffalse .Explain
	checkevent EVENT_BEAT_FISHER_DERRICK
	iffalse .Explain
	checkevent EVENT_BEAT_LAD_DEVIN
	iffalse .Explain
	checkevent EVENT_BEAT_POKEFANM_RICHARD
	iffalse .Explain
	writetext LucasYouDidIt
	waitbutton
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext LucasChallengeText
	waitbutton
	closetext
	winlosstext CooltrainerLucasWin, CooltrainerLucasLoss
	loadtrainer COOLTRAINERM, LUCAS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_LUCAS
	opentext
	jump .FightDone
	
.FightDone
	checkevent GOT_CYNDAQUIL
	iftrue .Cyndaquil
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext LucasGaveTotodile
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CYNDAQUIL, 10
	special CyndaquilGiftMon
	setevent GOT_CYNDAQUIL
	closetext
	end
	
.PartyFull
	writetext LucasNotEnoughRoom
	waitbutton
	closetext
	end
	
.Cyndaquil
	writetext AlreadyGotCyndaquil
	waitbutton
	closetext
	end
	
.Explain
	checkevent ROUTE_13_TALKED_TO_LUCAS
	iftrue .Waiting
	writetext LucasExplaination
	setevent ROUTE_13_TALKED_TO_LUCAS
	waitbutton
	closetext
	end
	
.Waiting
	writetext LucasMoreToGo
	waitbutton
	closetext
	end

Route13SharpBeak:
	itemball SHARP_BEAK

Route13FruitTree1:
	fruittree FRUITTREE_ROUTE_13_1

Route13FruitTree2:
	fruittree FRUITTREE_ROUTE_13_2
	
Route13Rock:
	jumpstd smashrock
	
PokefanMDougText:
	text "I am a"
	line "#MON trainer!"
	done
	
PokefanMDougWinText:
	text "I lost."
	done
	
PokefanMDougAfterText:
	text "I lost."
	done
	
FirebreatherWayneText:
	text "I am a"
	line "#MON trainer!"
	done
	
FirebreatherWayneWinText:
	text "I lost."
	done
	
FirebreatherWayneAfterText:
	text "I lost."
	done
	
PokemaniacTylerText:
	text "I am a"
	line "#MON trainer!"
	done
	
PokemaniacTylerWinText:
	text "I lost."
	done
	
PokemaniacTylerAfterText:
	text "I lost."
	done

BirdKeeperRoyText:
	text "I am a"
	line "#MON trainer!"
	done
	
BirdKeeperRoyWinText:
	text "I lost."
	done
	
BirdKeeperRoyAfterText:
	text "I lost."
	done
	
BikerJesseText:
	text "I'm gonna tear up"
	line "your team like I"
	cont "tear up this"
	cont "trail!"
	done
	
BikerJesseWinText:
	text "Oh man, wipeout!"
	done
	
BikerJesseAfterText:
	text "Burn rubber and"
	line "leave smoke. That"
	cont "is what I live by!"
	done
	
SwimmerAngieText:
	text "You creep! Can't"
	line "you see I'm"
	cont "changing into my"
	cont "swimsuit?"
	done
	
SwimmerAngieWinText:
	text "Just because you"
	line "won, it doesn't"
	cont "mean you can still"
	cont "look!"
	done

SwimmerAngieAfterText:
	text "What are you still"
	line "doing here?"
	cont "Get lost!"
	done
	
FisherDerrickText:
	text "My SLOWPOKE love"
	line "helping me fish"
	cont "for new #MON."
	done

FisherDerrickWinText:
	text "Argh! I can't do"
	line "anything with"
	cont "these dumb fish!"
	done

FisherDerrickAfterText:
	text "I should go visit"
	line "CYNARA COAST if" 
	cont "I want some really"
	cont "strong #MON."
	done
	
LadDevinText:
	text "Everyone I've"
	line "battled has been"
	cont "too distracted by"
	cont "ANGIE's swimsuit"
	cont "to focus!"
	done
	
LadDevinWinText: 
	text "Your laser focus!"
	line "I didn't stand a"
	cont "chance!"
	done
	
LadDevinAfterText:
	text "At least I still"
	line "get to see ANGIE"
	cont "myself."
	done

PokefanMRichardText:
	text "How could you cut"
	line "down these trees!"
	
	para "My #MON helped"
	line "me grow them!"
	done
	
PokefanMRichardWinText:
	text "You're a real"
	line "jerk, kid!"
	done
	
PokefanMRichardAfterText:
	text "I need to heal my"
	line "#MON before the"
	cont "trees will grow"
	cont "back."
	done
	
LucasExplaination:
	text "Hey, kid. I'm"
	line "LUCAS."
	
	para "I want to battle"
	line "only the strongest"
	cont "trainers I can on"
	cont "my way to the top."
	
	para "Since you made it"
	line "to this secluded"
	cont "little area, you"	
	cont "might be worthy"
	cont "of my time."
	
	para "Just to be sure, I"
	line "want you to beat"
	cont "every trainer on"
	cont "ROUTE 13."
	
	para "Then we'll see how"
	line "you stack up in"
	cont "comparison to me!"
	done
	
LucasMoreToGo:
	text "Some trainers are"
	line "telling me they"
	cont "haven't had the"
	cont "chance to battle"
	cont "you. What are you"
	cont "waiting for?"
	done
	
LucasYouDidIt:
	text "Seems you've won"
	line "against everyone"
	cont "here."
	
	para "I hope you've"
	line "prepared yourself."
	done
	
LucasChallengeText:	
	text "I won't hold back!"
	done
	
CooltrainerLucasWin:
	text "Is this what it's"
	line "like to actually"
	cont "lose?"
	
	para "I'm not mad, just…"
	
	para "I feel a drive to"
	line "improve."
	
	para "Thank you for this"
	line "experience."
	done
	
CooltrainerLucasLoss:
	text "Just who the heck"
	line "do you think I am?"
	done
	
LucasGaveTotodile:
	text "<PLAYER>"
	line "received"
	cont "CYNDAQUIL!"
	done
	
LucasNotEnoughRoom:
	text "You can't have"
	line "more than 6"
	cont "#MON at a time."
	
	para "Drop one off in"
	line "the PC and you"
	cont "can have my gift."
	done
	
AlreadyGotCyndaquil:
	text "Just you wait!"
	
	para "When my #MON"
	line "get stronger, I'll"
	cont "be coming for you!"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 16 ; object events
	object_event 40, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPokefanMDoug, -1
	object_event 47, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacTyler, -1
	object_event 50, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, BirdKeeperRoy, -1
	object_event 46,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherWayne, -1
	object_event 39,  6, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, BikerJesse, -1
	object_event 39, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13Rock, -1
	object_event 50,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13Rock, -1
	object_event 51,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13Rock, -1
	object_event 47, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13FruitTree1, -1
	object_event 22, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13FruitTree2, -1
	object_event 27, 14, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSwimmerAngie, -1
	object_event 27, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPokefanMRichard, -1
	object_event 31,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerMLucas, -1
	object_event 12, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLadDevin, -1
	object_event 34, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherDerrick, -1
	object_event 50, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route13SharpBeak, EVENT_13_SHARP_BEAK
