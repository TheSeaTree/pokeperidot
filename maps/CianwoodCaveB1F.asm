	const_def 2 ; object constants

CianwoodCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerBurglarAvery:
	trainer BURGLAR, AVERY, EVENT_BEAT_BURGLAR_AVERY, BurglarAveryText, BurglarAveryWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarAveryAfterText
	waitbutton
	closetext
	end	

CianwoodCaveHiker:
	jumptextfaceplayer CianwoodCaveHikerText
	
CianwoodCaveB1FBoulder:
	jumpstd strengthboulder
	
CianwoodCaveHikerText:
	text "There are some"
	line "shady guys deeper"
	cont "in this cave."
	
	para "I tried to stop"
	line "them, but there"
	cont "were too many!"
	done
	
BurglarAveryText:
	text "Those idiots let a"
	line "kid all the way up"
	cont "here?"
	
	para "You won't get any"
	line "further!"
	done
	
BurglarAveryWinText:
	text "The boss said this"
	line "was gonna be an"
	cont "easy job."
	done

BurglarAveryAfterText:
	text "This place wasn't"
	line "supposed to have"
	cont "anyone to stop us!"
	done
	
CianwoodCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  3, CIANWOOD_CAVE_1F, 2
	warp_event 15,  5, CIANWOOD_CAVE_B2F, 1
	warp_event 31, 25, CIANWOOD_CAVE_B2F, 2
	warp_event 35,  5, CIANWOOD_CHURCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  19, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCaveB2FBoulder, -1
	object_event  31, 7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBurglarAvery, EVENT_CLEARED_CHURCH
	object_event   4, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodCaveHiker, -1
