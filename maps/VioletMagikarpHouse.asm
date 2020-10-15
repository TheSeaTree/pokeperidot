	const_def 2 ; object constants
	const VIOLET_MAGIKARP_GUY

VioletMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CheckHappyMon1:
	faceplayer
	opentext
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
	line "take good care of"
	cont "that MAGIKARP."
	
	para "Its special move,"
	line "DIVE BOMB, can"
	cont "even be passed"
	cont "down through EGGs!"
	
	para "Maybe you could"
	line "teach it to other"
	cont "#MON this way…"
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
