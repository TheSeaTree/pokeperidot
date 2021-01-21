	const_def 2 ; object constants

AcroporaCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerCooltrainerMBruce:
	trainer COOLTRAINERM, BRUCE, EVENT_BEAT_COOLTRAINERM_BRUCE, CooltrainerMBruceText, CooltrainerMBruceWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMBruceAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerFAshley:
	trainer COOLTRAINERF, ASHLEY, EVENT_BEAT_COOLTRAINERF_ASHLEY, CooltrainerFAshleyText, CooltrainerFAshleyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFAshleyAfterText
	waitbutton
	closetext
	end	
	
AcroporaCave1FBoulder:
	jumpstd strengthboulder
	
CooltrainerMBruceText:
	text "Yo, kid!"
	
	para "Let's go!"
	done

CooltrainerMBruceWinText:
	text "Your #MON are"
	line "pretty groovy."
	done

CooltrainerMBruceAfterText:
	text "I'm not going to"
	line "take my loss lying"
	cont "down."
	
	para "I'm going to train"
	line "even more with my"
	cont "#MON!"
	
	para "…Eventually."
	done
	
CooltrainerFAshleyText:
	text "Are you ready to"
	line "battle GRANT?"
	
	para "Let's see."
	done

CooltrainerFAshleyWinText:
	text "I'm showing my age."
	
	para "I would have never"
	line "lost to a kid when"
	cont "I was younger."
	done

CooltrainerFAshleyAfterText:
	text "I was your last"
	line "obstacle on the"
	cont "way to the GYM."
	
	para "You'd better not"
	line "lose to ALAN now,"
	cont "or I'll be upset!"
	done

AcroporaCave1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 13, 19, ACROPORA_CITY, 6
	warp_event 17, 17, ACROPORA_CAVE_2F, 1
	warp_event  3, 13, ACROPORA_CAVE_2F, 2
	warp_event  9, 11, ACROPORA_CAVE_B1F, 1
	warp_event 19,  5, ACROPORA_CAVE_B1F, 2
	warp_event 31, 11, ACROPORA_CITY, 7
	warp_event  5,  5, ROUTE_22_CAVE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 17, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_JASMINE
	object_event 14, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerMBruce, -1
	object_event 27,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerFAshley, -1
	object_event 24,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaCave1FBoulder, -1
