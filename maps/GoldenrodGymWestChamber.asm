	const_def 2 ; object constants
	const GOLDENRODWESTROOM_ROCKER1
	const GOLDENRODWESTROOM_BIKER
	const GOLDENRODWESTROOM_ROCKER2

GoldenrodGymWestChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBikerJerry:
	trainer BIKER, JERRY, EVENT_BEAT_BIKER_JERRY, GoldenrodWestRoomPlaceholderText, GoldenrodWestRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	end	
	
TrainerGuitaristConrad:
	trainer GUITARIST, CONRAD, EVENT_BEAT_GUITARIST_CONRAD, GoldenrodWestRoomPlaceholderText, GoldenrodWestRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	end	
	
TrainerGuitaristBobby:
	trainer GUITARIST, BOBBY, EVENT_BEAT_GUITARIST_BOBBY, GoldenrodWestRoomPlaceholderText, GoldenrodWestRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	end	

GoldenrodGymWestChamberLightsOn:
	opentext
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
	opentext
	setevent GOLDENROD_LEADER_DOOR_3
	closetext
	end
	
GoldenrodWestRoomPlaceholderText:
	text "?"
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
	object_event  0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristBobby, -1
	object_event  0, -4, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerBikerJerry, -1
	object_event  0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGuitaristConrad, -1
