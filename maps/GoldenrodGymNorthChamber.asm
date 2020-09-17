	const_def 2 ; object constants
	const GOLDENRODNORTHROOM_ROCKER1
	const GOLDENRODNORTHROOM_SUPER_NERD
	const GOLDENRODNORTHROOM_ROCKER2
	const GOLDENRODNORTHROOM_ROCKER3

GoldenrodGymNorthChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerGuitaristTrevor:
	trainer GUITARIST, TREVOR, EVENT_BEAT_GUITARIST_TREVOR, GuitaristTrevorText, GuitaristTrevorWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristTrevorAfterText
	waitbutton
	closetext
	end	
	
TrainerPokemaniacCharlie:
	trainer POKEMANIAC, CHARLIE, EVENT_BEAT_POKEMANIAC_CHARLIE, PokemaniacCharlieText, PokemaniacCharlieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniaCharlieAfterText
	waitbutton
	closetext
	end	
	
TrainerGuitaristMarcel:
	trainer GUITARIST, MARCEL, EVENT_BEAT_GUITARIST_MARCEL, GuitaristMarcelText, GuitaristMarcelWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristMarcelAfterText
	waitbutton
	closetext
	end
	
TrainerGuitaristIvan:
	trainer GUITARIST, IVAN, EVENT_BEAT_GUITARIST_IVAN, GuitaristIvanText, GuitaristIvanWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristIvanAfterText
	waitbutton
	closetext
	end	
	
GoldenrodGymNorthChamberLightsOn:
	opentext
	writetext GoldenrodGymNorthChamberLightsOnText
	yesorno
	iffalse .no
	scall NorthChamberLightsOnSTD
	moveobject GOLDENRODNORTHROOM_ROCKER1, 	  13, 13
	moveobject GOLDENRODNORTHROOM_ROCKER2,    12,  5
	moveobject GOLDENRODNORTHROOM_ROCKER3,     7, 11
	moveobject GOLDENRODNORTHROOM_SUPER_NERD,  4,  7
	appear GOLDENRODNORTHROOM_ROCKER1
	appear GOLDENRODNORTHROOM_ROCKER2
	appear GOLDENRODNORTHROOM_ROCKER3
	appear GOLDENRODNORTHROOM_SUPER_NERD
	special FadeInQuickly
.no
	closetext
	end
	
NorthChamberLightsOnSTD:
	jumpstd lightuproom
	end
	
GoldenrodGymNorthChamberLeaderSwitch:
	checkevent GOLDENROD_LEADER_DOOR_2
	iftrue .flipped
	opentext
	writetext GoldenrodGymNorthChamberLeaderSwitchText
	yesorno
	iffalse .no
	playsound SFX_ENTER_DOOR
	waitsfx
	setevent GOLDENROD_LEADER_DOOR_2
.no
	closetext
	end
	
.flipped
	jumptext GoldenrodGymNorthChamberLeaderSwitchStuckText

PokemaniacCharlieText:
	text "What are you hop-"
	line "ing to find, young"
	cont "trainer?"
	
	para "A battle, perhaps?"
	done
	
PokemaniacCharlieWinText:
	text "The bond with my"
	line "#MON remains"
	cont "unbroken."
	done
	
PokemaniaCharlieAfterText:
	text "You show great"
	line "courage revealing"
	cont "all of these trai-"
	cont "ners."
	done
	
GuitaristMarcelText:
	text "You cannot run!"
	
	para "The damage has"
	line "been done, and you"
	cont "must pay!"
	done
	
GuitaristMarcelWinText:
	text "My dreams of"
	line "victory have"
	cont "dissolved."
	done
	
GuitaristMarcelAfterText:
	text "I go my many"
	line "names."
	
	para "Pseudonyms are"
	line "just a part of the"
	cont "rock star life."
	done
	
GuitaristTrevorText:
	text "You dare show us"
	line "the light?"
	done
	
GuitaristTrevorWinText:
	text "I'm blacking out!"
	done
	
GuitaristTrevorAfterText:
	text "This GYM is dark"
	line "for a reason!"
	done
	
GuitaristIvanText:
	text "You're not one of"
	line "us!"
	
	para "Get out of here,"
	line "you poser!"
	done

GuitaristIvanWinText:
	text "What? Was I the"
	line "poser all along?"
	done

GuitaristIvanAfterText:
	text "Appearances are"
	line "everything in this"
	cont "scene."
	
	para "Fit in, or get"
	line "out!"
	done

GoldenrodGymNorthChamberLightsOnText:
	text "This must be a"
	line "switch to turn on"
	cont "the lights."

	para "Flip it?"
	done
	
GoldenrodGymNorthChamberLeaderSwitchText:
	text "It's labeled as"
	line "LEADER SWITCH 2."
	
	para "Flip it?"
	done
	
GoldenrodGymNorthChamberLeaderSwitchStuckText:
	text "The switch won't"
	line "budge anymore!"
	done

GoldenrodGymNorthChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, GOLDENROD_GYM, 1
	warp_event 13, 17, GOLDENROD_GYM, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9, 12, BGEVENT_UP, GoldenrodGymNorthChamberLightsOn
	bg_event  8,  3, BGEVENT_UP, GoldenrodGymNorthChamberLeaderSwitch

	db 4 ; object events
	object_event 0, -2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristTrevor, -1
	object_event 0, -2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristMarcel, -1
	object_event 0, -2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristIvan, -1
	object_event 0, -2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, TrainerPokemaniacCharlie, -1
