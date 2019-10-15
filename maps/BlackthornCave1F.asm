	const_def 2 ; object constants

BlackthornCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerHikerZeke:
	trainer HIKER, ZEKE, EVENT_BEAT_HIKER_ZEKE, BlackthornCave1FTrainerText, BlackthornCave1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackthornCave1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerHikerRodger:
	trainer HIKER, RODGER, EVENT_BEAT_HIKER_RODGER, BlackthornCave1FTrainerText, BlackthornCave1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackthornCave1FTrainerAfterText
	waitbutton
	closetext
	end	
	
BlackthornCave1FBoulder:
	jumpstd strengthboulder
	
BlackthornCave1FTrainerText:
	text "I am a"
	line "#MON trainer!"
	done
	
BlackthornCave1FTrainerWinText:
	text "I lost."
	done
	
BlackthornCave1FTrainerAfterText:
	text "I lost."
	done

BlackthornCave1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 13, 19, BLACKTHORN_CITY, 6
	warp_event 17, 17, BLACKTHORN_CAVE_2F, 1
	warp_event  3, 13, BLACKTHORN_CAVE_2F, 2
	warp_event  9, 11, BLACKTHORN_CAVE_B1F, 1
	warp_event 19,  5, BLACKTHORN_CAVE_B1F, 2
	warp_event 31, 11, BLACKTHORN_CITY, 7
	warp_event  5,  5, BLACKTHORN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 17, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerHikerZeke, -1
	object_event 27,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerHikerRodger, -1
	object_event 24,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave1FBoulder, -1
