	const_def 2 ; object constants

Route7_MapScripts:
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
	
SandstormGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_SANDSTORM
	iftrue .Sandstorm
	writetext SandstormGuyText
	buttonsound
	verbosegiveitem TM_SANDSTORM
	setevent EVENT_GOT_TM_SANDSTORM
	
.Sandstorm:
	writetext TMSandstormExplaination
	buttonsound
	closetext
	end
	
Route7SoftSand:
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

SandstormGuyText:
	text "When the wind"
	line "picks up out here,"
	cont "sand will get all"
	cont "over the place."
	
	para "Wanna see what I"
	line "mean? Take this."
	done
	
TMSandstormExplaination:
	text "That TM is for"
	line "SANDSTORM."
	
	para "It will whip sand"
	line "around, and hurt"
	cont "any #MON that"
	cont "aren't GROUND,"
	cont "STEEL, or ROCK."
	
	para "I should catch"
	line "some of those if"
	cont "I'm going to stand"
	cont "around out here"
	cont "all day."
	done

Route7_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 34,  9, ROUTE_7_CAVE_1F, 1
	warp_event 26,  5, ROUTE_7_CAVE_1F, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltJun, -1
	object_event  8, 23, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltTakeo, -1
	object_event 23,  8, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SandstormGuy, -1
	object_event 13, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route7SoftSand, EVENT_ROUTE_7_SOFT_SAND
