	const_def 2 ; object constants

HepaticaCaveB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HepaticaCaveB2FBoulder:
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
	
TMRockSlideEvent:
	itemball TM_ROCK_SLIDE
	
HepaticaCaveB2FRareCandy:
	itemball RARE_CANDY

HepaticaCaveB2FRevive:
	itemball REVIVE

HepaticaCaveB2FSuperPotion:
	itemball SUPER_POTION
	
HepaticaCaveB2FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_CIANWOOD_CAVE_B2F_HIDDEN_ULTRA_BALL
	
BurglarDukeText:
	text "Hehe! We're going"
	line "to make so much"
	cont "money!"
	done

BurglarDukeWinText:
	text "Blown away so"
	line "quickly!"
	done

BurglarDukeAfterText:
	text "There are more im-"
	line "portant things in"
	cont "life than winning."
	
	para "Like money!"
	done

SageCalebText:
	text "End of the line,"
	line "kid!"
	done

SageCalebWinText:
	text "You'll pay for"
	line "that!"
	done

SageCalebAfterText:
	text "Our leader takes"
	line "this stuff pretty"
	cont "seriously, but I"
	cont "only play along"
	cont "because it pays"
	cont "well."
	done

SageLoText:
	text "This path was sup-"
	line "posed to be a"
	cont "secret!"
	
	para "How did you find"
	line "it?"
	done

SageLoWinText:
	text "You are no ordina-"
	line "ry kid!"
	done

SageLoAfterText:
	text "The boss said this"
	line "would be an easy"
	cont "job. Nobody comes"
	cont "up this mountain,"
	cont "he said."
	
	para "Well so much for"
	line "that!"
	done

HepaticaCaveB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  5, HEPATICA_CAVE_B1F, 2
	warp_event 23, 25, HEPATICA_CAVE_B1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 5, 8, BGEVENT_ITEM, HepaticaCaveB2FHiddenUltraBall

	db 10 ; object events
	object_event  11,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaCaveB2FBoulder, -1
	object_event  26, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaCaveB2FBoulder, -1
	object_event  34, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaCaveB2FBoulder, -1
	object_event  36, 29, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBurglarDuke, EVENT_CLEARED_CHURCH
	object_event  22, 28, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageCaleb, EVENT_CLEARED_CHURCH
	object_event  15, 26, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageLo, EVENT_CLEARED_CHURCH
	object_event   6, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, TMRockSlideEvent, EVENT_GOT_TM_ROCK_SLIDE
	object_event  21, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HepaticaCaveB2FRareCandy, EVENT_CIANWOOD_CAVE_B2F_RARE_CANDY
	object_event   5,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HepaticaCaveB2FRevive, EVENT_CIANWOOD_CAVE_B2F_REVIVE
	object_event 22, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HepaticaCaveB2FSuperPotion, EVENT_CIANWOOD_CAVE_B2F_SUPER_POTION
