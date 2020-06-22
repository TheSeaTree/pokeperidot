	const_def 2 ; object constants

BlackthornCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerHikerVincent:
	trainer HIKER, VINCENT, EVENT_BEAT_HIKER_VINCENT, BlackthornCave2FTrainerText, BlackthornCave2FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackthornCave2FTrainerAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerZeke:
	trainer HIKER, ZEKE, EVENT_BEAT_HIKER_ZEKE, BlackthornCave2FTrainerText, BlackthornCave2FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackthornCave2FTrainerAfterText
	waitbutton
	closetext
	end	
	
TrainerPokefanMGerald:
	trainer POKEFANM, GERALD, EVENT_BEAT_POKEFANM_GERALD, BlackthornCave2FTrainerText, BlackthornCave2FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackthornCave2FTrainerAfterText
	waitbutton
	closetext
	end
	
BlackthornCave2FBoulder:
	jumpstd strengthboulder
	
BlackthornCave2FTrainerText:
	text "I am a"
	line "#MON trainer!"
	done
	
BlackthornCave2FTrainerWinText:
	text "I lost."
	done
	
BlackthornCave2FTrainerAfterText:
	text "I lost."
	done

BlackthornCave2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 11, BLACKTHORN_CAVE_1F, 2
	warp_event  3,  7, BLACKTHORN_CAVE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerHikerVincent, -1
	object_event 14,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanMGerald, -1
	object_event 11,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerHikerZeke, -1
	object_event 16,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCave2FBoulder, -1
