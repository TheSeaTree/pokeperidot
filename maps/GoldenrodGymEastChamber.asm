	const_def 2 ; object constants
	const GOLDENRODEASTROOM_ROCKER1
	const GOLDENRODEASTROOM_ROCKER2
	const GOLDENRODEASTROOM_ROCKER3

GoldenrodGymEastChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerGuitaristAndy:
	trainer GUITARIST, ANDY, EVENT_BEAT_GUITARIST_ANDY, GoldenrodEastRoomPlaceholderText, GoldenrodEastRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodEastRoomPlaceholderText
	waitbutton
	closetext
	end	
	
TrainerGuitaristLee:
	trainer GUITARIST, LEE, EVENT_BEAT_GUITARIST_LEE, GuitaristLeeText, GuitaristLeeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristLeeAfterText
	waitbutton
	closetext
	end	

TrainerGuitaristColin:
	trainer GUITARIST, COLIN, EVENT_BEAT_GUITARIST_COLIN, GoldenrodEastRoomPlaceholderText, GoldenrodEastRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodEastRoomPlaceholderText
	waitbutton
	closetext
	end	
	
GoldenrodGymEastChamberLightsOn:
	opentext
	writetext GoldenrodGymEastChamberLightsOnText
	yesorno
	iffalse .no
	scall EastChamberLightsOnSTD
	moveobject GOLDENRODEASTROOM_ROCKER1, 13,  4
	moveobject GOLDENRODEASTROOM_ROCKER2,  4, 12
	moveobject GOLDENRODEASTROOM_ROCKER3, 12, 15
	appear GOLDENRODEASTROOM_ROCKER1
	appear GOLDENRODEASTROOM_ROCKER2
	appear GOLDENRODEASTROOM_ROCKER3
	special FadeInQuickly
.no
	closetext
	end

EastChamberLightsOnSTD:
	jumpstd lightuproom
	end
	
GoldenrodGymEastChamberLeaderSwitch:
	opentext
	writetext GoldenrodGymEastChamberLeaderSwitchText
	yesorno
	iffalse .no
	setevent GOLDENROD_LEADER_DOOR_1
.no
	closetext
	end

GoldenrodEastRoomPlaceholderText:
	text "?"
	done
	
GuitaristLeeText:
	text "Dude, some warning"
	line "before turning on"
	cont "the lights would"
	cont "have been nice!"
	done
	
GuitaristLeeWinText:
	text "My eyes haven't"
	line "adjusted yet!"
	done

GuitaristLeeAfterText:
	text "I like heavy music"
	line "and all, but the"
	cont "leader? He just"
	cont "freaks me out,"
	cont "man."
	done

GoldenrodGymEastChamberLightsOnText:
	text "This must be a"
	line "switch to turn on"
	cont "the lights."

	para "Flip it?"
	done

GoldenrodGymEastChamberLeaderSwitchText:
	text "It's labeled as"
	line "LEADER SWITCH 1."
	
	para "Flip it?"
	done

GoldenrodGymEastChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  1,  9, GOLDENROD_GYM, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  8, BGEVENT_UP, GoldenrodGymEastChamberLightsOn
	bg_event  4,  1, BGEVENT_UP, GoldenrodGymEastChamberLeaderSwitch

	db 3 ; object events
	object_event 0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristColin, -1
	object_event 0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristLee, -1
	object_event 0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristAndy, -1
