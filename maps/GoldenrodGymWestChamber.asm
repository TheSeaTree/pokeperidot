	const_def 2 ; object constants
	const GOLDENRODWESTROOM_ROCKER1
	const GOLDENRODWESTROOM_BIKER
	const GOLDENRODWESTROOM_ROCKER2

GoldenrodGymWestChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBikerJerry:
	trainer BIKER, JERRY, EVENT_BEAT_BIKER_JERRY, BikerJerryText, BikerJerryWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJerryAfterText
	waitbutton
	closetext
	end	
	
TrainerGuitaristConrad:
	trainer GUITARIST, CONRAD, EVENT_BEAT_GUITARIST_CONRAD, GuitaristConradText, GuitaristConradWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristConradAfterText
	waitbutton
	closetext
	end	
	
TrainerGuitaristBobby:
	trainer GUITARIST, BOBBY, EVENT_BEAT_GUITARIST_BOBBY, GuitaristBobbyText, GuitaristBobbyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristBobbyAfterText
	waitbutton
	closetext
	end	

GoldenrodGymWestChamberLightsOn:
	opentext
	writetext GoldenrodGymWestChamberLightsOnText
	yesorno
	iffalse .no
	scall WestChamberLightsOnSTD
	moveobject GOLDENRODWESTROOM_ROCKER1, 11, 18
	moveobject GOLDENRODWESTROOM_BIKER,    2, 12
	moveobject GOLDENRODWESTROOM_ROCKER2, 11,  4
	appear GOLDENRODWESTROOM_ROCKER1
	appear GOLDENRODWESTROOM_BIKER
	appear GOLDENRODWESTROOM_ROCKER2
	special FadeInQuickly
.no
	closetext
	end
	
WestChamberLightsOnSTD:
	jumpstd lightuproom
	end
	
GoldenrodGymWestChamberLeaderSwitch:
	checkevent GOLDENROD_LEADER_DOOR_3
	iftrue .flipped
	opentext
	writetext GoldenrodGymWestChamberLeaderSwitchText
	yesorno
	iffalse .no
	playsound SFX_ENTER_DOOR
	waitsfx
	setevent GOLDENROD_LEADER_DOOR_3
.no
	closetext
	end
	
.flipped
	jumptext GoldenrodGymWestChamberLeaderSwitchStuckText

GuitaristConradText:
	text "You have entered"
	line "a real house of"
	cont "pain by turning on"
	cont "those lights!"
	done
	
GuitaristConradWinText:
	text "My #MON have"
	line "all fallen."
	done
	
GuitaristConradAfterText:
	text "I will get my"
	line "vengeance someday!"
	done
	
GuitaristBobbyText:
	text "Get ready."
	
	para "My #MON are"
	line "going to wreck"
	cont "you!"
	done
	
GuitaristBobbyWinText:
	text "You made me break"
	line "a string!"
	done
	
GuitaristBobbyAfterText:
	text "Defeat is a bitter"
	line "pill to swallow,"
	cont "but we all need to"
	cont "take it sometimes."
	done
	
BikerJerryText:
	text "Loud bikes, and"
	line "loud music! That"
	cont "is what I live"
	cont "for!"
	done
	
BikerJerryWinText:
	text "What did you say?"
	line "speak up!"
	done
	
BikerJerryAfterText:
	text "Some of the guys"
	line "like to joke that"
	cont "the leader here is"
	cont "not even human."
	
	para "He spends so much"
	line "time locked up in"
	cont "his chamber alone."
	
	para "…I hope the guys"
	line "are only joking."
	done
	
GoldenrodGymWestChamberLightsOnText:
	text "This must be a"
	line "switch to turn on"
	cont "the lights."
	
	para "Flip it?"
	done
	
GoldenrodGymWestChamberLeaderSwitchText:
	text "It's labeled as"
	line "LEADER SWITCH 3."
	
	para "Flip it?"
	done
	
GoldenrodGymWestChamberLeaderSwitchStuckText:
	text "The switch won't"
	line "budge anymore!"
	done

GoldenrodGymWestChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  9, GOLDENROD_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13,  8, BGEVENT_UP, GoldenrodGymWestChamberLightsOn
	bg_event 11, 16, BGEVENT_UP, GoldenrodGymWestChamberLeaderSwitch

	db 3 ; object events
	object_event  0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGuitaristBobby, -1
	object_event  0, -4, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBikerJerry, -1
	object_event  0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristConrad, -1
