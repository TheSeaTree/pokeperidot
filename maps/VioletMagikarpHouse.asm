	const_def 2 ; object constants
	const VIOLET_MAGIKARP_GUY

VioletMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CheckHappyMon1:
	faceplayer
	opentext
	checkevent EVENT_GURU_SELLING_MAGIKARP
	iftrue .SellingMagikarp
	checkevent EVENT_GOT_MAGIKARP
	iftrue .GotMagikarp
	checkevent EVENT_QUALIFIED_FOR_MAGIKARP
	iftrue .Qualified
	writetext MagikarpGuruIntroText
	waitbutton

	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .NoMagikarp
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext MagikapGuruShowMagikarpMaleText
	jump .continue
.Girl
	writetext MagikapGuruShowMagikarpFemaleText
.continue
	waitbutton
	writebyte MAGIKARP
	special FindPartyMonThatSpeciesYourTrainerID
	iffalse .NotYourMagikarp

	waitbutton
	special GetFirstPokemonHappiness
	ifless 250 - 1, .MagikarpInProgress
	ifless  50 - 1, .UnhappyMagikarp
	writetext MagikarpGuruHaveMagikarpText
	waitbutton

	writetext MagikarpGuruGiveMagikarpText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
.GiftMagikarp
	writetext GiftMagikarpText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MAGIKARP, 35
	special MagikarpGiftMon
	setevent EVENT_GOT_MAGIKARP

.GotMagikarp
	writetext MagikarpGuruAfterText
	waitbutton
	closetext
	setflag ENGINE_DIVE_BOMB_MAGIKARP
	setevent EVENT_GURU_SELLING_MAGIKARP
	end

.PartyFull
	setevent EVENT_QUALIFIED_FOR_MAGIKARP
	writetext MagikarpGuruFullParty
	waitbutton
	closetext
	end

.NoMagikarp
	writetext MagikarpGuruNoMagikarpText
	waitbutton
	closetext
	end
	
.NotYourMagikarp
	writetext MagikarpGuruNotYourMagikarpText
	waitbutton
	closetext
	end
	
.MagikarpInProgress
	writetext MagikarpInProgressText
	waitbutton
	closetext
	end
	
.UnhappyMagikarp
	writetext MagikarpGuruUnhappyText
	waitbutton
	closetext
	warpfacing DOWN, VIOLET_CITY, 37, 15
	end
	
.Qualified
	writetext MagikarpGuruCheckPartyText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GiftMagikarp
	writetext MagikarpGuruFullPartyAfterText
	waitbutton
	closetext
	end
	
.SellingMagikarp
	checkflag ENGINE_DIVE_BOMB_MAGIKARP
	iftrue .SoldToday
	writetext MagikarpGuruSellingMoreText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Decline
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoomEgg
	takemoney YOUR_MONEY, 1000
	special PlaceMoneyTopRight
	farwritetext UnknownText_0x1bdfa5
	playsound SFX_GET_EGG_FROM_DAY_CARE_LADY
	waitsfx
	giveegg MAGIKARP, 5
	special MagikarpGiftMon
	setflag ENGINE_DIVE_BOMB_MAGIKARP
.SoldToday
	writetext SoldMagikarpTodayText
	waitbutton
	closetext
	end
	
.Decline
	writetext MagikarpEggDeclineText
	waitbutton
	closetext
	end

.NotEnoughMoney
	writetext MagikarpEggNotEnoughMoneyText
	waitbutton
	closetext
	end
	
.NoRoomEgg
	writetext MagikarpEggNoRoomText
	waitbutton
	closetext
	end

MagikarpGuruIntroText:
	text "Have you ever come"
	line "across a #MON"
	cont "as magnificent as"
	cont "MAGIKARP?"
	
	para "Of course not!"
	line "That was a rhetor-"
	cont "ical question!"
	
	para "Would you happen"
	line "to have a MAGIKARP"
	cont "to show me?"
	done
	
MagikapGuruShowMagikarpMaleText:
	text "<PLAYER> showed the"
	line "man his MAGIKARP."
	done
	
MagikapGuruShowMagikarpFemaleText:
	text "<PLAYER> showed the"
	line "man her MAGIKARP."
	done
	
MagikarpGuruHaveMagikarpText:
	text "Wow! What a perf-"
	line "ect example of a"
	cont "MAGIKARP. You must"
	cont "be so proud to"
	cont "share such a powe-"
	cont "rful bond with"
	cont "your MAGIKARP!"
	done
	
MagikarpGuruGiveMagikarpText:
	text "I want you to have"
	line "something."
	
	para "It's a MAGIKARP"
	line "that I taught a"
	cont "very rare move to!"

	para "Nobody else knows"
	line "about this move,"
	cont "so let's keep it"
	cont "betweem MAGIKARP"
	cont "enthusiasts, okay?"
	done

GiftMagikarpText:
	text "<PLAYER> received"
	line "MAGIKARP!"
	done

MagikarpGuruNoMagikarpText:
	text "Hm… You don't seem"
	line "to have a MAGIKARP"
	cont "on you right now."
	
	para "I love to see all"
	line "of the MAGIKARP I"
	cont "can, so please"
	cont "come back with one"
	cont "to show me!"
	done
	
MagikarpGuruNotYourMagikarpText:
	text "…While that is a"
	line "great MAGIKARP, it"
	cont "is not one that"
	cont "you caught on your"
	cont "own."
	
	para "How can one ever"
	line "truly bond with a"
	cont "MAGIKARP obtained"
	cont "in a trade?"
	done
	
MagikarpInProgressText:
	text "Thanks for sharing"
	line "your MAGIKARP, but"
	cont "it does not seem"
	cont "to fully trust you"
	cont "just yet."
	
	para "Don't worry! Not"
	line "many trainers are"
	cont "skilled enough to"
	cont "unlock the door to"
	cont "MAGIKARP's heart!"
	done
	
MagikarpGuruUnhappyText:
	text "……………"
	
	para "Wha- What have you"
	line "done to this poor"
	cont "#MON?"
	
	para "This is an insult"
	line "to all MAGIKARP…"
	
	para "I want you out of"
	line "my home now!"
	done
	
MagikarpGuruCheckPartyText:
	text "Hello, fellow"
	line "MAGIKARP lover!"
	
	para "You have made room"
	line "for my gift, yes?"
	done

MagikarpGuruFullParty:
	text "Does your PARTY"
	line "have enough space"
	cont "for my gift?"
	
	para "Surely a true mas-"
	line "ter of MAGIKARP"
	cont "would not want to"
	cont "simply leave this"
	cont "in a PC BOX."
	done
	
MagikarpGuruFullPartyAfterText:
	text "Still no room?"
	
	para "What are you wait-"
	line "ing for?"
	
	para "You can't find a"
	line "MAGIKARP like this"
	cont "anywhere else, I"
	cont "promise you."
	done
	
MagikarpGuruAfterText:
	text "I trust you will"
	line "cherish MAGIKARP"
	cont "as much as I did."
	
	para "It knows a special"
	line "move that MAGIKARP"
	cont "can't learn in the"
	cont "wild normally."
	
	para "I have many gener-"
	line "ations of MAGIKARP"
	cont "that know the move"
	cont "DIVE BOMB."
	
	para "It can only be le-"
	line "arned by MAGIKARP"
	cont "in an EGG."
	
	para "If you would like"
	line "more I should have"
	cont "EGGs for sale tom-"
	cont "morrow."
	done
	
MagikarpGuruSellingMoreText:
	text "Hey there!"
	
	para "Have you come to"
	line "buy a MAGIKARP"
	cont "EGG?"
	
	para "I can only get so"
	line "many EGGs in one"
	cont "day, so I can only"
	cont "sell you one."
	
	para "Would you like an"
	line "EGG for ¥1000?"
	done
	
SoldMagikarpTodayText:
	text "I don't have enough"
	line "EGGs to sell you"
	cont "another, but I"
	cont "will have more to-"
	cont "morrow."
	done
	
MagikarpEggDeclineText:
	text "That's okay. I"
	line "can keep this one"
	cont "to the side if you"
	cont "want me to."
	done

MagikarpEggNotEnoughMoneyText:
	text "Sorry, you don't"
	line "have enough money."
	
	para "This process is"
	line "expensive, and I"
	cont "am already cutting"
	cont "you a deal for be-"
	cont "ing such a big"
	cont "MAGIKARP fan."
	done
	
MagikarpEggNoRoomText:
	text "You'll need a free"
	line "spot in your party"
	cont "if you want to"
	cont "carry an EGG."
	done

VioletMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIOLET_CITY, 2
	warp_event  3,  7, VIOLET_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CheckHappyMon1, -1
