	const_def 2 ; object constants
	const PALEROCK2F_BOULDER1
	const PALEROCK2F_BOULDER2
	const PALEROCK2F_COOLTRAINERF
	
PalerockMountain2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_TILES, .Stairs

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 6, PALEROCK2F_BOULDER1, .Boulder1
	db -1 ; end
	
.Boulder1:
	clearevent EVENT_BOULDER_IN_PALEROCK_2B
	moveobject PALEROCK2F_BOULDER2, 12, 16
	appear PALEROCK2F_BOULDER2
	jump .Press

.Press:
	earthquake 10
	playsound SFX_STRENGTH
	pause 10
	refreshscreen $86
	changeblock 12, 16, $63 ; open door
	changeblock 16, 10, $61 ; open door
	reloadmappart
	closetext
	opentext
	writetext DoorOpenedText
	waitbutton
	closetext
	setevent EVENT_BOULDER_IN_PALEROCK_2A
	setevent EVENT_BOULDER_IN_PALEROCK_3B
	disappear PALEROCK2F_BOULDER1
	end
	
.Stairs:
	checkevent EVENT_BOULDER_IN_PALEROCK_3B
	iffalse .skip
	changeblock 12, 16, $63 ; open door
	changeblock 16, 10, $61 ; open door
.skip
	return

PalerockMountain2FBoulder:
	jumpstd strengthboulder
	
TrainerBeautyReggie:
	trainer BEAUTY, REGGIE, EVENT_BEAT_BEAUTY_REGGIE, BeautyReggieText, BeautyReggieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyReggieAfterText
	waitbutton
	closetext
	end	
	
BeautyReggieText:
	text "I'm both brawn and"
	line "beauty!"
	done
	
BeautyReggieWinText:
	text "What a workout!"
	done
	
BeautyReggieAfterText:
	text "Cute and strong"
	line "things are my fav-"
	cont "orite."

	para "So you can hang"
	line "around here for a"
	cont "while if you want."
	done
	
DoorOpenedText:
	text "A door opened up!"
	done
	
PalerockMountain2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event   5,  5, PALEROCK_MOUNTAIN_1F, 2
	warp_event   5, 13, PALEROCK_MOUNTAIN_OUTSIDE, 1
	warp_event  21,  9, PALEROCK_MOUNTAIN_OUTSIDE, 2
	warp_event  19,  5, PALEROCK_MOUNTAIN_3F, 1
	warp_event  11,  8, PALEROCK_MOUNTAIN_3F, 3
	warp_event 12, 16, PALEROCK_MOUNTAIN_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  10,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain2FBoulder, EVENT_BOULDER_IN_PALEROCK_2A
	object_event 12, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOULDER_IN_PALEROCK_2B
	object_event  3, 11, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyReggie, -1
	