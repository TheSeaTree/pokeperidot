	const_def 2 ; object constants
	

GoldenrodGymEastRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerGuitaristAndy:
	faceplayer
	checkevent GOLDENROD_GYM_DOOR_2
	iftrue .Door2
	checkevent GOLDENROD_GYM_DOOR_3
	iftrue .FightDone
	opentext
	writetext GuitaristAndyText
	waitbutton
	yesorno
	iffalse .End
	writetext DoorGuard2BeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, ANDY
	startbattle
	reloadmapafterbattle
	end
	
.Door2
	opentext
	writetext Door2or3AlreadyOpen
	waitbutton
	closetext
	end
	
.FightDone
	opentext
	writetext Door2OpenedText
	waitbutton
	closetext
	end
	
.End
	closetext
	end
	
TrainerGuitaristLee:
	faceplayer
	checkevent GOLDENROD_GYM_DOOR_3
	iftrue .Door3
	checkevent GOLDENROD_GYM_DOOR_2
	iftrue .FightDone
	opentext
	writetext GuitaristLeeText
	waitbutton
	yesorno
	iffalse .End
	writetext DoorGuard2BeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer GUITARIST, LEE
	startbattle
	reloadmapafterbattle
	end
	
.Door3
	opentext
	writetext Door2or3AlreadyOpen
	waitbutton
	closetext
	end
	
.FightDone
	opentext
	writetext Door2OpenedText
	waitbutton
	closetext
	end
	
.End
	closetext
	end

TrainerGuitaristColin:
	trainer GUITARIST, COLIN, EVENT_BEAT_GUITARIST_COLIN, GuitaristColinText, GuitaristColinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristColinAfterText
	waitbutton
	closetext
	end	

GoldenrodGymEastRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  1,  9, GOLDENROD_GYM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 13,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, ObjectEvent, -1 ; TrainerGuitaristColin, -1
	object_event  4, 12, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; TrainerGuitaristLee, -1
	object_event 12, 15, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; TrainerGuitaristAndy, -1
