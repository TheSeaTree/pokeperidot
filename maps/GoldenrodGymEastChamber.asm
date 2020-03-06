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
	trainer GUITARIST, LEE, EVENT_BEAT_GUITARIST_LEE, GoldenrodEastRoomPlaceholderText, GoldenrodEastRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodEastRoomPlaceholderText
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
	setevent GOLDENROD_LEADER_DOOR_1
	closetext
	end

GoldenrodEastRoomPlaceholderText:
	text "?"
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
