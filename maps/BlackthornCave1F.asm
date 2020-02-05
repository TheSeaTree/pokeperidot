	const_def 2 ; object constants

BlackthornCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerCooltrainerMBruce:
	trainer COOLTRAINERM, BRUCE, EVENT_BEAT_COOLTRAINERM_BRUCE, BlackthornCave1FTrainerText, BlackthornCave1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackthornCave1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerFAshley:
	trainer COOLTRAINERF, ASHLEY, EVENT_BEAT_COOLTRAINERF_ASHLEY, BlackthornCave1FTrainerText, BlackthornCave1FTrainerWinText, 0, .Script

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
	warp_event  5,  5, ROUTE_22_CAVE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 17, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_JASMINE
	object_event 14, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerMBruce, -1
	object_event 27,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerFAshley, -1
	object_event 24,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave1FBoulder, -1
