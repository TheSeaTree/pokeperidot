	const_def 2 ; object constants

SeaRoute4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerBlackbeltJun:
	trainer BLACKBELT_T, JUN, EVENT_BEAT_BLACKBELT_JUN, BlackbeltJunText, BlackbeltJunWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackbeltJunAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltTakeo:
	trainer BLACKBELT_T, TAKEO, EVENT_BEAT_BLACKBELT_TAKEO, BlackbeltTakeoText, BlackbeltTakeoWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackbeltTakeoAfterText
	waitbutton
	closetext
	end
	
SeaRoute4CaveGuy:
	jumptextfaceplayer SeaRoute4CaveGuyText
	
SeaRoute4SoftSand:
	itemball SOFT_SAND
	
BlackbeltJunText:
	text "RARGH!"
	
	para "Protect the SOFT"
	line "SAND at all costs!"
	done
	
BlackbeltJunWinText:
	text "I was the last"
	line "line of defense!"
	done
	
BlackbeltJunAfterText:
	text "What do you mean"
	line "there is sand all"
	cont "around us? The"	
	cont "SOFT SAND is"
	cont "precious!"
	done
	
BlackbeltTakeoText:
	text "I can't let you go"
	line "any further. I am"
	cont "here to protect"
	cont "the SOFT SAND."
	
	para "…For some reason."
	done

BlackbeltTakeoWinText:
	text "You won. Now claim"
	line "your prize."
	done
	
BlackbeltTakeoAfterText:
	text "Don't mind my"
	line "friend. He gets"
	cont "really into this."
	done
	
SeaRoute4CaveGuyText:
	text "I need to build up"
	line "my strength."
	
	para "There is a huge"
	line "WATERFALL deep in"
	cont "this cave."
	
	para "Some #MON might"
	line "be able to swim up"
	cont "it, but that's"
	cont "cheating!"
	done

SeaRoute4_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 26,  5, ROUTE_7_CAVE_1F, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 11, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltJun, -1
	object_event  8, 23, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltTakeo, -1
	object_event 24,  8, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeaRoute4CaveGuy, -1
	object_event 13, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeaRoute4SoftSand, EVENT_SEA_ROUTE_4_SOFT_SAND
	object_event 45, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
