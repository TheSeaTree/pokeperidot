	const_def 2 ; object constants

CianwoodCaveB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodCaveB2FBoulder:
	jumpstd strengthboulder
	
TrainerBurglarDuke:
	trainer BURGLAR, DUKE, EVENT_BEAT_BURGLAR_DUKE, BurglarDukeText, BurglarDukeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarDukeAfterText
	waitbutton
	closetext
	end		
	
TrainerSageCaleb:
	trainer SAGE, CALEB, EVENT_BEAT_SAGE_CALEB, SageCalebText, SageCalebWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageCalebAfterText
	waitbutton
	closetext
	end	
	
TrainerSageLo:
	trainer SAGE, LO, EVENT_BEAT_SAGE_LO, SageLoText, SageLoWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageLoAfterText
	waitbutton
	closetext
	end	
	
BurglarDukeText:
	text "Hehe! We're going"
	line "to make so much"
	cont "money!"
	done

BurglarDukeWinText:
	text "?"
	done

BurglarDukeAfterText:
	text "?"
	done

SageCalebText:
	text "?"
	done

SageCalebWinText:
	text "?"
	done

SageCalebAfterText:
	text "?"
	done

SageLoText:
	text "?"
	done

SageLoWinText:
	text "?"
	done

SageLoAfterText:
	text "?"
	done

CianwoodCaveB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  5, CIANWOOD_CAVE_B1F, 2
	warp_event 23, 25, CIANWOOD_CAVE_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  11,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCaveB2FBoulder, -1
	object_event  26, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCaveB2FBoulder, -1
	object_event  34, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCaveB2FBoulder, -1
	object_event  36, 29, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBurglarDuke, EVENT_CLEARED_CHURCH
	object_event  22, 28, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageCaleb, EVENT_CLEARED_CHURCH
	object_event  15, 26, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageLo, EVENT_CLEARED_CHURCH