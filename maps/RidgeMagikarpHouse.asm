	const_def 2 ; object constants
	const VIOLET_MAGIKARP_GUY1
	const VIOLET_MAGIKARP_GUY2

RidgeMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CheckMagikarp:
	faceplayer
	opentext
	checkevent EVENT_DIVE_BOMB_MAGIKARP
	iftrue .DiveBombUnlocked
	writetext MagikarpGuruIntroText
	yesorno
	iffalse .Decline

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
.DiveBombUnlocked
	writetext MagikarpGuruAfterText
	waitbutton
	closetext
	setevent EVENT_DIVE_BOMB_MAGIKARP
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
	warpfacing DOWN, RIDGE_VILLAGE, 37, 15
	end
	
.Decline
	writetext DoNotShowMagikarpText
	waitbutton
	closetext
	end
	
BuyMagikarp:
	faceplayer
	opentext
	checkflag ENGINE_BOUGHT_MAGIKARP_TODAY
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
	checkevent EVENT_DIVE_BOMB_MAGIKARP
	iffalse .NormalEgg
	special MagikarpGiftMon
	writetext SpecialMagikarpEggText
	waitbutton
.NormalEgg
	setflag ENGINE_BOUGHT_MAGIKARP_TODAY
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
	line "to be a MAGIKARP"
	cont "fan too?"
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
	
DoNotShowMagikarpText:
	text "No…?"
	
	para "Maybe some day you"
	line "may learn how to"
	cont "truly appreciate"
	cont "MAGIKARP."
	done

MagikarpGuruAfterText:
	text "You are the only"
	line "person I know who"
	cont "is a true MAGIKARP"
	cont "fan like my bro-"
	cont "ther and I."
	
	para "Go talk to my bro-"
	line "ther. We have been"
	cont "experimenting with"
	cont "teaching MAGIKARP"
	cont "how to use a new"
	cont "move through our"
	cont "EGGs."
	
	para "It's a brand-new"
	line "move that only"
	cont "our MAGIKARP know!"
	
	para "Maybe some other"
	line "#MON could"
	cont "learn it too…"
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
	
SpecialMagikarpEggText:
	text "That MAGIKARP will"
	line "know our special"
	cont "move, DIVE BOMB!"
	
	para "We don't sell those"
	line "EGGs to just any-"
	cont "one, it's just"
	cont "thanks for being a"
	cont "true believer in"
	cont "MAGIKARP."
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
	line "have enough money"
	cont "for an EGG."
	done

MagikarpEggNoRoomText:
	text "You'll need a free"
	line "spot in your party"
	cont "if you want to"
	cont "carry an EGG."
	done

RidgeMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RIDGE_VILLAGE, 2
	warp_event  3,  7, RIDGE_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CheckMagikarp, -1
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BuyMagikarp, -1
