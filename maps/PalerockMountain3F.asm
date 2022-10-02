	const_def 2 ; object constants
	const PALEROCK3F_BOULDER1
	const PALEROCK3F_ROCKER1
	
PalerockMountain3F_MapScripts:
	db 0 ; scene scripts
	
	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_TILES, .Door
	
.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 3, PALEROCK3F_BOULDER1, .Boulder1
	db -1 ; end
	
.Boulder1:
	clearevent EVENT_BOULDER_IN_PALEROCK_2A
	jump .Press
	
.Press:
	playsound SFX_STRENGTH
	disappear PALEROCK3F_BOULDER1
	setevent EVENT_BOULDER_IN_PALEROCK_3A
	earthquake 10
	pause 10
	jump .ItFellThrough
	
.ItFellThrough
	opentext
	writetext Palerock3FBoulderFellText
	waitbutton
	closetext
	end

.Door:
	checkevent EVENT_BOULDER_IN_PALEROCK_3B
	iffalse .BrokenWall
	changeblock 8, 8, $cf ; open door
.BrokenWall
	checkevent EVENT_PALEROCK_MOUNTAIN_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock 4, 2, $76
.skip
	return

TrainerGuitaristAnthony:
	trainer GUITARIST, ANTHONY, EVENT_BEAT_GUITARIST_ANTHONY, GuitaristAnthonyText, GuitaristAnthonyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristAnthonyAfterText
	waitbutton
	closetext
	end	
	
PalerockMountain3FBoulder:
	jumpstd strengthboulder
	
GuitaristAnthonyText:
	text "I can sense the"
	line "hope flowing"
	cont "through your"
	cont "veins."
	done
	
GuitaristAnthonyWinText:
	text "Hey dude, that"
	line "wasn't cool!"
	done
	
GuitaristAnthonyAfterText:
	text "No need to be so"
	line "uptight, that was"
	cont "a fun battle!"
	done

Palerock3FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

PalerockMountain3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  13, 11, PALEROCK_MOUNTAIN_2F, 4
	warp_event  13,  3, HEPATICA_TOWN, 5
	warp_event   4, 14, PALEROCK_MOUNTAIN_2F, 5
	warp_event   5,  3, PALEROCK_MOUNTAIN_HIDDEN_CAVE, 1

	db 0 ; coord events
	
	db 0 ; bg events

	db 2 ; object events
	object_event 11, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain3FBoulder, EVENT_BOULDER_IN_PALEROCK_3A
	object_event 10,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristAnthony, -1
