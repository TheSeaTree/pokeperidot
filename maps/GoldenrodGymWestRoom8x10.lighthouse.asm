	const_def 2 ; object constants
	const GOLDENRODWESTROOM_ROCKER1
	const GOLDENRODWESTROOM_BIKER
	const GOLDENRODWESTROOM_ROCKER2

GoldenrodGymWestRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBikerJerry:
	faceplayer
	checkevent EVENT_BEAT_BIKER_JERRY
	iftrue .FightDone
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	winlosstext GoldenrodWestRoomPlaceholderText, 0
	loadtrainer BIKER, JERRY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BIKER_JERRY
	end

.FightDone
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	end
	
TrainerGuitaristConrad:
	faceplayer
	checkevent EVENT_BEAT_GUITARIST_CONRAD
	iftrue .FightDone
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	winlosstext GoldenrodWestRoomPlaceholderText, 0
	loadtrainer GUITARIST, CONRAD
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUITARIST_CONRAD
	end

.FightDone
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	end
	
TrainerGuitaristBobby:
	faceplayer
	checkevent GOLDENROD_GYM_DOOR_5
	iftrue .FightDone
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	winlosstext GoldenrodWestRoomPlaceholderText, 0
	loadtrainer GUITARIST, BOBBY
	startbattle
	reloadmapafterbattle
	setevent GOLDENROD_GYM_DOOR_5
	end

.FightDone
	opentext
	writetext GoldenrodWestRoomPlaceholderText
	waitbutton
	closetext
	end	

LightsOn1:
	scall LightsOnSTD
	moveobject GOLDENRODWESTROOM_ROCKER1, 11, 18
	moveobject GOLDENRODWESTROOM_BIKER,    6, 23
	moveobject GOLDENRODWESTROOM_ROCKER2,  3, 30
	appear GOLDENRODWESTROOM_ROCKER1
	appear GOLDENRODWESTROOM_BIKER
	appear GOLDENRODWESTROOM_ROCKER2
	special FadeInQuickly
	end
	
LightsOnSTD:
	jumpstd lightuproom
	end
	
GoldenrodWestRoomPlaceholderText:
	text "?"
	done

GoldenrodGymWestRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  9, GOLDENROD_GYM, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 16, BGEVENT_UP, LightsOn1

	db 3 ; object events
	object_event  0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, ObjectEvent, -1 ; TrainerGuitaristBobby, -1
	object_event  0, -4, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvenet, -1 ; TrainerBikerJerry, -1
	object_event  0, -4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; TrainerGuitaristConrad, -1
