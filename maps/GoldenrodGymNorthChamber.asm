	const_def 2 ; object constants
	const GOLDENRODNORTHROOM_ROCKER1
	const GOLDENRODNORTHROOM_SUPER_NERD
	const GOLDENRODNORTHROOM_ROCKER2
	const GOLDENRODNORTHROOM_ROCKER3

GoldenrodGymNorthChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerGuitaristTrevor:
	trainer GUITARIST, TREVOR, EVENT_BEAT_GUITARIST_TREVOR, GoldenrodNorthRoomPlaceholderText, GoldenrodNorthRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	end	
	
TrainerPokemaniacCharlie:
	trainer POKEMANIAC, CHARLIE, EVENT_BEAT_POKEMANIAC_CHARLIE, GoldenrodNorthRoomPlaceholderText, GoldenrodNorthRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	end	
	
TrainerGuitaristMarcel:
	trainer GUITARIST, MARCEL, EVENT_BEAT_GUITARIST_MARCEL, GoldenrodNorthRoomPlaceholderText, GoldenrodNorthRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	end
	
TrainerGuitaristIvan:
	trainer GUITARIST, IVAN, EVENT_BEAT_GUITARIST_IVAN, GoldenrodNorthRoomPlaceholderText, GoldenrodNorthRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
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
	opentext
	writetext GoldenrodGymNorthChamberLeaderSwitchText
	yesorno
	iffalse .no
	setevent GOLDENROD_LEADER_DOOR_2
.no
	closetext
	end

GoldenrodNorthRoomPlaceholderText:
	text "?"
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
